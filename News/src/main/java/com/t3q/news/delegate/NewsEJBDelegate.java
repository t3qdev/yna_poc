package com.t3q.news.delegate;

import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.t3q.ejb.news.NewsBeanRemote;
import com.t3q.news.dto.NewsDTO;
import com.t3q.zookeeper.ZKClientConnectionForAppClient;

/**
 * 참고 URL :
 * http://stackoverflow.com/questions/20732328/cannot-instantiate-class-
 * org-jnp-interfaces-namingcontextfactory classpath, 사용자 등록 부분 참고 :
 * http://www.mastertheboss.com/jboss-server/jboss-as-7/jboss-as-7-remote-ejb-client-tutorial?showall=
 * 
 * 
 * https://docs.jboss.org/author/display/AS72/EJB+invocations+from+a+remote+client+using+JNDI
 * 
 * @author warmpark
 *
 */
public class NewsEJBDelegate extends ZKClientConnectionForAppClient {
	public final static String ZK_SERVERS = "127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183";

	public final static String ZK_APP_SERVER_GROUP_NAME = "/NewsEJB3";

	final String appName = "NewsEAR";
	final String moduleName = "NewsEJB3"; // ejbjar name
	final String distinctName = "";
	final String beanName = "NewsBean"; // NewsBean
	final String viewClassName = NewsBeanRemote.class.getName(); 
	
	

	String jndiName= appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + viewClassName; //OK
	 


	public static void main(String[] args) {
		NewsEJBDelegate client = new NewsEJBDelegate();
		try {
			client.startZKClient(ZK_SERVERS, ZK_APP_SERVER_GROUP_NAME);
			client.getNewsList();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<NewsDTO> getNewsList() {
		Context context = null;
		List<NewsDTO> newsList = null;
		long startTime = System.currentTimeMillis();
		try {
			context = getContext();
			System.out.println("%%%%%%%%%%%%%%%%% JNDI NAME="+jndiName);
			NewsBeanRemote remote = (NewsBeanRemote) context.lookup(jndiName);
			System.out.println("============== remote interface = "+remote);
			newsList = remote.getNewsLit();
			
			System.out.println("News 데이터 건수="+newsList.size());
			for(int i=0; i<newsList.size(); i++){
				System.out.println(newsList.get(i));
			}
				

		} catch (Exception e) {
			e.printStackTrace();

		}
		long endTime = System.currentTimeMillis();

		System.out.println("총 걸린시간 =" + (endTime - startTime) / 1000 + "초");

		return newsList;

	}

	private NewsBeanRemote lookupRemoteEJB() throws NamingException {
		Context context = getContext();
		NewsBeanRemote remote = (NewsBeanRemote) context.lookup(jndiName);
		context.close();
		return remote; // OK
	}

	private Context getContext() throws NamingException {
		 
		// ref URL : https://docs.jboss.org/author/display/WFLY8/Remote+EJB+invocations+via+JNDI+-+EJB+client+API+or+remote-naming+project
		
		String serverInfo = this.getServer(ZK_APP_SERVER_GROUP_NAME);
		
		System.out.println("SERVER INFO="+serverInfo);
		
		Properties jndiProps = new Properties();  
		jndiProps.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
		jndiProps.setProperty(Context.INITIAL_CONTEXT_FACTORY,"org.jboss.naming.remote.client.InitialContextFactory");
		jndiProps.setProperty(Context.PROVIDER_URL,"remote://"+serverInfo);  
		//jndiProps.setProperty(Context.PROVIDER_URL,"remote://localhost:4447");
		//jndiProps.setProperty(Context.PROVIDER_URL,"http-remoting://"+serverInfo);  
		jndiProps.setProperty("jboss.naming.client.ejb.context","true");
		jndiProps.setProperty(Context.SECURITY_PRINCIPAL, "ejbuser");
		jndiProps.setProperty(Context.SECURITY_CREDENTIALS, "@ejbuser1234#");
	
		
		// create a context passing these properties  Context ctx = new InitialContext(jndiProps);
		Context ctx =null;
		try {
			ctx =  new InitialContext(jndiProps);
			System.out.println(ctx);
		} catch (NamingException e) {
			e.printStackTrace();
		}	

		return ctx;
	}

}
