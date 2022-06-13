package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Product;
import dto.ProductDAO;
import dto.Product;

public class RegisterProductController implements Controller {
	
	public String execute(HttpServletRequest request, HttpServletResponse response) 
			throws Exception {
		
		Product vo = new Product();
		
		vo.setProductId(request.getParameter("productId"));
		vo.setPname(request.getParameter("pname"));
		vo.setUnitPrice(Integer.parseInt(request.getParameter("unitPrice")));
		vo.setDescription(request.getParameter("description"));
		vo.setManufacturer(request.getParameter("manufacturer"));
		vo.setCategory(request.getParameter("category"));
		vo.setFilename(request.getParameter("filename"));
		vo.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		
		ProductDAO.getInstance().register(vo);
		
		return "redirect:register-result.jsp";
	}
}
