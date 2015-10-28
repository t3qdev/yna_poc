package test;

import java.util.List;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.t3q.ejb.news.NewsBeanRemote;
import com.t3q.news.dto.NewsDTO;

public class TestJNDI {
	
	
	public static void main(String[] args) {
		//staticServerEJBCall();
		dynamicServerEJBCall();
	}

	/**
	 *  EJB client API를 이용하는 방
	 * /News/src/jboss-ejb-client.properties (프로퍼티 파일 등록)

		## http://www.mastertheboss.com/jboss-server/jboss-as-7/jboss-as-7-remote-ejb-client-tutorial?showall=
		## https://docs.jboss.org/author/display/AS72/EJB+invocations+from+a+remote+client+using+JNDI
		endpoint.name=client-endpoint
		remote.connectionprovider.create.options.org.xnio.Options.SSL_ENABLED=false
		remote.connections=default
		remote.connection.default.host=localhost
		remote.connection.default.port = 4447
		remote.connection.default.connect.options.org.xnio.Options.SASL_POLICY_NOANONYMOUS=false
	 */
	public static void staticServerEJBCall() {
		Properties jndiProps = new Properties();

		final String appName = "NewsEAR"; //EAR Module Name
		final String moduleName = "NewsEJB3"; //EJB Module Name
		final String distinctName = "";
		final String beanName = "NewsBean"; // Bean Name
		final String viewClassName = NewsBeanRemote.class.getName();
		String jndiName = "ejb:" + appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!"+ viewClassName;
		Context ctx = null;

		try {
			jndiProps.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			while (true) {
				ctx = new InitialContext(jndiProps);
				System.out.println(ctx);
				System.out.println("Looking EJB via JNDI= ");
				System.out.println(jndiName);
	
	
				NewsBeanRemote remote = (NewsBeanRemote) ctx.lookup(jndiName);
				System.out.println(remote);

				List<NewsDTO> list = remote.getNewsLit();
				for (int i = 0; i < list.size(); i++) {
					System.out.println(list.get(i));
				}
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/** 
	 * JBoss Remote Naming Project를 이용하는 방법 
	 *  /News/src/jboss-ejb-client.properties (프로퍼티 파일 등록) 삭제
	 * 	/News/src/jndi.properties (프로퍼티 파일 등록)
	 	## https://docs.jboss.org/author/display/AS72/Remote+EJB+invocations+via+JNDI+-+EJB+client+API+or+remote-naming+project
	 	java.naming.factory.initial=org.jboss.naming.remote.client.InitialContextFactory
		java.naming.provider.url=remote://localhost:4447
		## 프로퍼티 파일 사용해도 되고, 사용 하지 않고 InitialContext의 파라미터로 주어도 상관 없다. 
	 * 
	 * https://docs.jboss.org/author/display/AS71/Remote+EJB+invocations+via+JNDI+-+EJB+client+API+or+remote-naming+project
	 * https://docs.jboss.org/author/display/AS72/Remote+EJB+invocations+via+JNDI+-+EJB+client+API+or+remote-naming+project
	 *  https://docs.jboss.org/author/display/AS72/EJB+invocations+from+a+remote+client+using+JNDI
	 * https://docs.jboss.org/author/display/WFLY8/Remote+EJB+invocations+via+JNDI+-+EJB+client+API+or+remote-naming+project
	 * 
	 * https://docs.jboss.org/author/display/AS72/EJB+invocations+from+a+remote+server+instance
	 */
	public static void dynamicServerEJBCall() {
		Properties jndiProps = new Properties();

		final String appName = "NewsEAR";
		final String moduleName = "NewsEJB3"; // ejbjar name
		final String distinctName = ""; // JBoss Remote Naming Project 이용 시 사용 안함 
		final String beanName = "NewsBean"; // NewsBean
		final String viewClassName = NewsBeanRemote.class.getName();
		Context ctx = null;
		
		//java:jboss/exported/NewsEAR/NewsEJB3/NewsBean!com.t3q.ejb.news.NewsBeanRemote
		//서버에 배포된 객체는 java:jboss/exported 영역에 존재해야 접근 가능하며, 반드시 Serializable(직열화) 해야 하며,
		//클라이언트 단에서 lookup를 위해서 보내지는 JNDI이름에 java:jboss/exported 접두어로 추가되어 찾게 된다. 
		//따라서 java:jboss/exported 는 붙여서 보내지 말아야 한다. 
		
		//String jndiName= "java:" + appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + viewClassName; //OK
		String jndiName=  appName + "/" + moduleName + "/" + distinctName + "/" + beanName + "!" + viewClassName; //OK

		try { 
			//jndiProps.put(Context.URL_PKG_PREFIXES, "org.jboss.ejb.client.naming");
			jndiProps.setProperty(Context.INITIAL_CONTEXT_FACTORY,"org.jboss.naming.remote.client.InitialContextFactory");
			jndiProps.setProperty("jboss.naming.client.ejb.context","true");
			
			//jndiProps.setProperty(Context.PROVIDER_URL,"remote://"+serverInfo);  
			//jndiProps.setProperty(Context.PROVIDER_URL,"http-remoting://"+serverInfo); 
			
			jndiProps.setProperty(Context.PROVIDER_URL,"remote://localhost:4447");
			jndiProps.setProperty(Context.SECURITY_PRINCIPAL, "ejbuser");
			jndiProps.setProperty(Context.SECURITY_CREDENTIALS, "@ejbuser1234#");

			while (true) {
				ctx = new InitialContext(jndiProps);
				System.out.println(ctx);
				System.out.println("Looking EJB via JNDI= ");
				System.out.println(jndiName);
	
	
				NewsBeanRemote remote = (NewsBeanRemote) ctx.lookup(jndiName);
				System.out.println(remote);

				List<NewsDTO> list = remote.getNewsLit();
				for (int i = 0; i < list.size(); i++) {
					System.out.println(list.get(i));
				}
			}

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	

}
