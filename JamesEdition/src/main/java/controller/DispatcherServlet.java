package controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/front")
public class DispatcherServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HandleRequest(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HandleRequest(request, response);
	}

	/* handleRequest method()
	 * 1. 모든 예외는 redirect 방식으로 error.jsp로 response(응답)한다.
	 * 2. Client가 전송한 command를 return 받아 온다.
	 * 3. HanlerMapping에게 command를 전달하여 개별 Controller 객체를 리턴 받는다.
	 * 4. 개별 Controller 객체를 실행시켜 url을 반환받는다.
	 * 5. 개별 Controller 객체가 실행된 후 반환한 정보를 이용해,
	 *    forward 방식으로 보낼지, redirect 방식으로 보낼지 조건문을 이용해 확인 후,
	 *    view로 이동한다.
	 */
	public void HandleRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String command = request.getParameter("command");
			Controller controller = HandlerMapping.getInstance().create(command);
			String url = controller.execute(request, response);
			if (url.startsWith("redirect:"))
				response.sendRedirect(url.substring(9));
			else
				request.getRequestDispatcher(url).forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
