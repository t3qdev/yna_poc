package com.t3q.zookeeper;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;

import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;

public class ZKClientConnectionForAppClient  implements Watcher {
	CountDownLatch connMonitor = new CountDownLatch(1);
	Object nodeMonitor = new Object();
	List<String> appServerList = new ArrayList<String>(1);
	public ZooKeeper zk;
	private Random rand = new Random();
	AppServerWatcher appServerWatcher;

	public ZKClientConnectionForAppClient() {
		super();
	}
	
	
	public static void main(String[] args) {
		ZKClientConnectionForAppClient client = new ZKClientConnectionForAppClient();
		try {
			client.startZKClient("127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183", "/NewsEJB3");
				
			while(true){
				Thread.sleep(1000*5);
				List<String> servers = client.zk.getChildren("/NewsEJB3",	client);
				System.out.println("======= 현재 /NewsEJB3의 서버 정보="+servers+"입니다. ");
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 
	 * @param zkServers
	 * @param appServerGroupName
	 * @throws Exception
	 */
	public void startZKClient( String zkServers,String appServerGroupName) throws Exception {
		appServerWatcher = new AppServerWatcher(appServerGroupName);
		zk = new ZooKeeper(zkServers, 20*1000, this);
		connMonitor.await();
	
		synchronized (nodeMonitor) {
			loadAppServers(appServerGroupName);
			if (appServerList.size() == 0) {
				nodeMonitor.wait();
			}
		}
	}

	protected void loadAppServers(String appServerGroupName) throws Exception {
		appServerList.clear();
		System.out.println("Load Server: " + appServerGroupName);
		appServerList.addAll(zk.getChildren(appServerGroupName,	appServerWatcher));
		System.out.println("LoadAppServers ============]" + appServerList + "[=============");

		if (appServerList.size() != 0) {
			nodeMonitor.notifyAll();
		}
	}

	

	protected String getServer(String appServerGroupName) {
		String appServer =null;
		
		synchronized (nodeMonitor) {
			if (appServerList.size() == 0) {
				System.out.println("No live server");
				try {
					nodeMonitor.wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			} else if (appServerList.size() == 1) {
				appServer = appServerList.get(0);
			} else {
				appServer = appServerList.get(rand.nextInt(appServerList.size()));
			}
		}			
	
		//String[] serverInfos = appServer.split(":");
		System.out.println("Returned AppServer="+appServer); //HostName:PORT
		
		return  appServer;
	}

	

	
	
	@Override
	public void process(WatchedEvent event) {
		if (event.getType() == Event.EventType.None) {
			if (event.getState() == Event.KeeperState.SyncConnected) {
				System.out.println("======== Zookeeper 연결 OK. ====");
				connMonitor.countDown();
			}
		}
		
	
	}
	
	
	

	class AppServerWatcher implements Watcher {
		private String appServerGroupName;
		
		public AppServerWatcher(String appServerGroupName) {
			this.appServerGroupName = appServerGroupName;
		}

		@Override
		public void process(WatchedEvent event) {
			System.out.println(event.getType().toString() + "======== Zookeeper Node 이벤트 발생  ====");
			synchronized (nodeMonitor) {
				try {
					loadAppServers(appServerGroupName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
}