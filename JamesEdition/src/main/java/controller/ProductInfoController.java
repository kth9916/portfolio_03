package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProductDAO;
import dto.Product;

public class ProductInfoController implements Controller {

	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String productId = request.getParameter("productId");
		Product vo = ProductDAO.getInstance().findProductById(productId);
		request.setAttribute("pvo", vo);
		return "product.jsp";
	}

}
