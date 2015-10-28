package com.t3q.ejb.news;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;

import com.t3q.news.dto.NewsDTO;
import com.t3q.zookeeper.ZKClientConnectionForAppServer;

/**
 * Session Bean implementation class NewsBean
 */
@Stateless
public class NewsBean implements NewsBeanRemote, NewsBeanLocal {
	
	static int id = 1000;
	static List<NewsDTO> newsList = new ArrayList<NewsDTO>();

    /**
     * Default constructor. 
     */
    public NewsBean() {

    }

	@Override
	public void start() {
		System.out.println("START EJB Method Called!!!!!! ");
	}

	@Override
	public List<NewsDTO> getNewsLit() {
		
		Date dNow = new Date( );
	    SimpleDateFormat ft =  new SimpleDateFormat("yyyy.MM.dd hh:mm:ss");

	    System.out.println("Current Date: " + ft.format(dNow));
	      
		newsList.add( new NewsDTO(Integer.toString(++id) , "동급생 폭행 혐의 대학생 1명 '메르스' 의심 증세...", ft.format(dNow), ZKClientConnectionForAppServer.SVC_SERVER_IP ));
		//newsList.add(new NewsDTO(Integer.toString(id++), "합석거절여성과 닮은 행인'묻지마 폭행'…징역 15년...", "2015.06.25  13:57:23", "사회부" ));

		return newsList;
	}

}
