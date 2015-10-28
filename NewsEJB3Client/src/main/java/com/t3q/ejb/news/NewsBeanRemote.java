package com.t3q.ejb.news;

import java.util.List;

import javax.ejb.Remote;

import com.t3q.news.dto.NewsDTO;

@Remote
public interface NewsBeanRemote {
	public void start();
	public List<NewsDTO> getNewsLit();
}
