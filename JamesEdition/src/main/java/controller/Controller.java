package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	//String type으로 url을 반환
		public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception;
}
