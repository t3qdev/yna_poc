package com.t3q.ejb.news;

import java.util.List;

import javax.ejb.Local;

import com.t3q.news.dto.NewsDTO;

@Local
public interface NewsBeanLocal {
	public void start();

	public List<NewsDTO> getNewsLit();
}
