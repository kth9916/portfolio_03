package controller;

import dto.Product;
import dto.ProductDAO;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductListController implements Controller {

	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<Product> list = new ArrayList<Product>();
		list = ProductDAO.getInstance().getAllProductList();
		request.setAttribute("list", list);
		
		return "product-list.jsp";
	}
}
