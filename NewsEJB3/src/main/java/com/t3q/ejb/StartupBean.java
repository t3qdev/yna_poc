package com.t3q.ejb;


import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.ejb.Singleton;
import javax.ejb.Startup;

import com.t3q.zookeeper.ZKClientConnectionForAppServer;
 
@Startup
@Singleton
public class StartupBean {

	ZKClientConnectionForAppServer zkSvcClient = new ZKClientConnectionForAppServer();
	
    @PostConstruct
    public void startup() {
    	zkSvcClient.startup();
    	System.out.println("ZKClientConnectionForAppServer.startup()============================================");
    }
    
    
 
    @PreDestroy
    public void shutdown() {
    	System.out.println("ZKClientConnectionForAppServer.shutdown()============================================");
    	zkSvcClient.shutdown();
    }
    
} 