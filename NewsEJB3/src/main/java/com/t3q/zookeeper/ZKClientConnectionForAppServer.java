package com.t3q.zookeeper;


import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.concurrent.CountDownLatch;

import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.KeeperException;
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooDefs.Ids;
import org.apache.zookeeper.ZooKeeper;

public class ZKClientConnectionForAppServer implements Watcher{
	final static String ZK_SERVERS = "127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183";		
	final static String APP_SERVER_GROUP = "/NewsEJB3";
	public  final static String SVC_SERVER_IP = "127.0.0.1";
	final static String SVC_SERVER_HOST = "localhost";
	final static int SVC_SERVER_PORT = 4447;
	
	//final public static Logger LOGGER = LoggerFactory.getLogger(ZKClientConnectionForAppServer.class.getName());
	protected int zkSessionTimeOut = 20 * 1000;
	protected CountDownLatch connMonitor = new CountDownLatch(1);

	ZooKeeper zk = null;
	
	public static void main(String[] args) {
		new ZKClientConnectionForAppServer().startup();
	}
	
	/**
	 *  ZK접속하여 일을 수행하는 메소드 호출 
	 */
    public void startup() {
    	
    	try {
			System.out.println("########  InetAddress.getByName('"+SVC_SERVER_HOST+"').getHostAddress()="+ InetAddress.getByName(SVC_SERVER_HOST).getHostAddress());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	zkServeConnectionStarted(SVC_SERVER_PORT, ZK_SERVERS, APP_SERVER_GROUP);
    }
 
	/**
	 * ZK에 접속하여 AppServer 그룹을 생성하고 (없으면 생성)
	 * 해당 그룹에 조인할 추가적인 AppServer(IP와 Port)를 등록 
	 * @param svcServerPort
	 * @param zkServers
	 * @param applicationServerGroup
	 */
	public void zkServeConnectionStarted(int svcServerPort,String zkServers, String applicationServerGroup) {
		
		System.out.println("A0.================================");
		try {
			zk = new ZooKeeper(zkServers, zkSessionTimeOut, this);
			System.out.println("A1============================ ZK 서버시작 : ZK 상태 : CONNECTING");
			
			
			//ZK에 접속 상태가 SyncConnected가 될 때 까지 Thread 대기. 
			connMonitor.await();
			createAppServerInfo(svcServerPort, applicationServerGroup);
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (KeeperException e) {
			e.printStackTrace();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	private void createAppServerInfo(int svcServerPort, String applicationServerGroup)
			throws KeeperException, InterruptedException, UnknownHostException {
		System.out.println("A.================================");
		if (zk.exists(applicationServerGroup, false) == null) { //APPSERVER_GROUP
			zk.create(applicationServerGroup, null, Ids.OPEN_ACL_UNSAFE,CreateMode.PERSISTENT);
		}
		System.out.println("B.================================");
		
		//String serverInfo = InetAddress.getLocalHost().getHostAddress() + ":" + svcServerPort;
		String serverInfo = InetAddress.getByName(SVC_SERVER_HOST).getHostAddress()+ ":" + svcServerPort;
		System.out.println("B.HOST=" + serverInfo);
		//String serverInfo = InetAddress.getByName(SVC_SERVER_HOST).getHostAddress()+ ":" + svcServerPort;
		//String serverInfo = SVC_SERVER_IP + ":" + SVC_SERVER_PORT;
		if(zk.exists(applicationServerGroup + "/" + serverInfo, false)== null){
			zk.create(applicationServerGroup + "/" + serverInfo, null,	Ids.OPEN_ACL_UNSAFE, CreateMode.EPHEMERAL);
		}else{
			System.out.println("================ Service Server IP:Port= "+ serverInfo +" is allread used !!");
			//System.exit(0);
		}
		System.out.println("C.================================");
	}


	/**
	 * ZK Event를 받아서 처리하기 위한 메소드. 
	 */
	public void process(WatchedEvent event) {
		System.out.println("D.====================================== WatchedEvent"+event.getType());
	    if(event.getType() == Event.EventType.None) {
	      if(event.getState() == Event.KeeperState.SyncConnected) {
	    	 System.out.println("E.============================ ZK 서버 시작 완료: ZK 서버 상태 : SyncConnected");
	    	 connMonitor.countDown(); 
	      }else if(event.getState() == Event.KeeperState.Expired){
	    	  //본 이벤트가 발생하였다는 것은 ZK 임시노드가 삭제되었다는 것을 의미 하며
	    	  // 어떤 이유로 인해서든 SessionTimeOut이 발생했음을 의미하며,ZK 클라이언트 쪽에서 ZK 서버 쪽으로 heartbeat를 줄 수 없는
	    	  // 상황 (GC 시간이 길어지거나, CPU 한계, 네트워크 단절)이 발생했음을 의미 관련 대상의 모니터링이 필요. 
	    	  // 다만 이 이벤트의 발생은 ZK 클라이언트의  재 접속이 일어난 시점에 발생한다는 점을 잘 알아야 함. 
	    	  zkServeConnectionStarted(SVC_SERVER_PORT, ZK_SERVERS, APP_SERVER_GROUP);
	    	System.out.println("1.============================ "+event.getType().toString());
	      }else {
	    	  System.out.println("1.============================ "+event.getType().toString());
			    	  
	      }
	    }else{
	    	System.out.println("1.============================ "+ event.getType().toString());
	    }
	}

	/**
	 * ZK 접속을 끊는 메소드 호출 
	 * 
	 */
	public void shutdown(){
		zkServeConnectionClose(APP_SERVER_GROUP,SVC_SERVER_PORT);
	}
	
	
	/**
	 * 주어진 applicationServerGrop, svcServerPort에서 ZK 연결을 종료 한다.  
	 * @param applicationServerGroup
	 * @param svcServerPort
	 */
	public void zkServeConnectionClose(String applicationServerGroup, int svcServerPort) {
		try {
			System.out.println("### Zookeeerp.close 호출 !!!!!!");
			zk.close();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} 
	}
} 