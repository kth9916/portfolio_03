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
	 * 1. ��� ���ܴ� redirect ������� error.jsp�� response(����)�Ѵ�.
	 * 2. Client�� ������ command�� return �޾� �´�.
	 * 3. HanlerMapping���� command�� �����Ͽ� ���� Controller ��ü�� ���� �޴´�.
	 * 4. ���� Controller ��ü�� ������� url�� ��ȯ�޴´�.
	 * 5. ���� Controller ��ü�� ����� �� ��ȯ�� ������ �̿���,
	 *    forward ������� ������, redirect ������� ������ ���ǹ��� �̿��� Ȯ�� ��,
	 *    view�� �̵��Ѵ�.
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
