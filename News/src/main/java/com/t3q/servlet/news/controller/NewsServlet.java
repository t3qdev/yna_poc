package com.t3q.servlet.news.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.t3q.news.delegate.NewsEJBDelegate;
import com.t3q.news.dto.NewsDTO;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsEJBDelegate client = null;

	@Override
	public void init() throws ServletException {
		super.init();
		try {
			client = new NewsEJBDelegate();
			client.startZKClient(NewsEJBDelegate.ZK_SERVERS,NewsEJBDelegate.ZK_APP_SERVER_GROUP_NAME);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		try {

			// System.out.println("+++++++++++++++++++++++++++++ goPost");
			List<NewsDTO> newsList = client.getNewsList();

			for (int i = 0; i < newsList.size(); i++) {
				// System.out.println(newsList.get(i));
			}

			request.setAttribute("NEWS_LIST", newsList);

			String nextJSP = "/NewsManage.jsp";
			RequestDispatcher dispatcher = getServletContext()
					.getRequestDispatcher(nextJSP);
			dispatcher.forward(request, response);
		} catch (Exception e) {

		}

	}

}
