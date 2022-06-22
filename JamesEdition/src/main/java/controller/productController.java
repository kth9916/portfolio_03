package controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import dto.Product;
import dto.ProductDAO;
import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/pwrite.do")
public class productController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/register-form.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String saveDirectory = req.getServletContext().getRealPath("/uploads");
		System.out.println(saveDirectory);
		ServletContext application = getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if(mr == null) {	// ��ü ���� ���� (1MB �̻� �뷮 ���� ���۽�)
			JSFunction.alertLocation(resp, "÷�� �뷮�� �ʰ� �Ǿ����ϴ�", "../controller/pwrite.do");
			
			return;			
		}
		Product dto = new Product();
		dto.setPname(mr.getParameter("pname"));
		dto.setUnitPrice(Integer.parseInt(mr.getParameter("unitPrice")));
		dto.setDescription(mr.getParameter("description"));
		dto.setManufacturer(mr.getParameter("manufacturer"));
		dto.setCategory(mr.getParameter("category"));
		dto.setQuantity(Integer.parseInt(mr.getParameter("quantity")));
		
		String fileName1 = mr.getFilesystemName("ofile1");
		String fileName2 = mr.getFilesystemName("ofile2");
		String fileName3 = mr.getFilesystemName("ofile3");
		String fileName4 = mr.getFilesystemName("ofile4");
		String fileName5 = mr.getFilesystemName("ofile5");
		System.out.println(fileName1);
		System.out.println(fileName2);
		System.out.println(fileName3);
		System.out.println(fileName4);
		System.out.println(fileName5);
		if(fileName1 != null) {		// ÷�� ������ ��� ���� �ʴٸ�
			
			//���ο� �����̸����� �����ؼ� ������ ������.  (������ �ش� �����̸��� ������ ��찡 �����Ƿ�)
			String now1 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//Ȯ���ڸ� �߶� ����
			String ext1 = fileName1.substring(fileName1.lastIndexOf("."));
			
			//������ ������ �����̸� ����
			String newFileName1 = now1 + ext1;
			
			// ���ϸ� ����				
			File oldFile1 = new File(saveDirectory + File.separator + fileName1);
			File newFile1 = new File(saveDirectory + File.separator + newFileName1);
			
			oldFile1.renameTo(newFile1);
			
			//DTO�� Setter ���� (���� : ������ ���ε� �Ѱ�� ���� )
			String realpath1 = saveDirectory + "\\"+newFileName1;
			System.out.println(realpath1);
			
			dto.setRealpath1(realpath1);
			
			dto.setOfile1(newFileName1); // ������ �����  �����̸�
			
			// 2��
			//���ο� �����̸����� �����ؼ� ������ ������.  (������ �ش� �����̸��� ������ ��찡 �����Ƿ�)
			String now2 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//Ȯ���ڸ� �߶� ����
			String ext2 = fileName2.substring(fileName2.lastIndexOf("."));
			
			//������ ������ �����̸� ����
			String newFileName2 = now2 + ext2;
			
			// ���ϸ� ����				
			File oldFile2 = new File(saveDirectory + File.separator + fileName2);
			File newFile2 = new File(saveDirectory + File.separator + newFileName2);
			
			oldFile2.renameTo(newFile2);
			
			//DTO�� Setter ���� (���� : ������ ���ε� �Ѱ�� ���� )

			String realpath2 = saveDirectory + "\\"+newFileName2;
			System.out.println(realpath2);
			
			dto.setRealpath2(realpath2);
			
			dto.setOfile2(newFileName2); // ������ �����  �����̸�
			
			// 3��
			//���ο� �����̸����� �����ؼ� ������ ������.  (������ �ش� �����̸��� ������ ��찡 �����Ƿ�)
			String now3 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//Ȯ���ڸ� �߶� ����
			String ext3 = fileName3.substring(fileName3.lastIndexOf("."));
			
			//������ ������ �����̸� ����
			String newFileName3 = now3 + ext3;
			
			// ���ϸ� ����				
			File oldFile3 = new File(saveDirectory + File.separator + fileName3);
			File newFile3 = new File(saveDirectory + File.separator + newFileName3);
			
			oldFile3.renameTo(newFile3);
			
			//DTO�� Settor ���� (���� : ������ ���ε� �� ��쿡��)
			String realpath3 = saveDirectory + "\\"+newFileName3;
			System.out.println(realpath3);
			
			dto.setRealpath3(realpath3);
			
			dto.setOfile3(newFileName3); // ������ �����  �����̸�
			
			// 4��
			//���ο� �����̸����� �����ؼ� ������ ������.  (������ �ش� �����̸��� ������ ��찡 �����Ƿ�)
			String now4 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//Ȯ���ڸ� �߶� ����
			String ext4 = fileName4.substring(fileName4.lastIndexOf("."));
			
			//������ ������ �����̸� ����
			String newFileName4 = now4 + ext4;
			
			// ���ϸ� ����				
			File oldFile4 = new File(saveDirectory + File.separator + fileName4);
			File newFile4 = new File(saveDirectory + File.separator + newFileName4);
			
			oldFile4.renameTo(newFile4);
			
			//DTO�� Settor ���� (���� : ������ ���ε� �� ��쿡��)
			String realpath4 = saveDirectory + "\\"+newFileName4;
			System.out.println(realpath4);
			
			dto.setRealpath4(realpath4);
			
			dto.setOfile4(newFileName4); // ������ �����  �����̸�
			
			// 5��
			//���ο� �����̸����� �����ؼ� ������ ������.  (������ �ش� �����̸��� ������ ��찡 �����Ƿ�)
			String now5 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//Ȯ���ڸ� �߶� ����
			String ext5 = fileName5.substring(fileName5.lastIndexOf("."));
			
			//������ ������ �����̸� ����
			String newFileName5 = now5 + ext5;
			
			// ���ϸ� ����				
			File oldFile5 = new File(saveDirectory + File.separator + fileName5);
			File newFile5 = new File(saveDirectory + File.separator + newFileName5);
			
			oldFile5.renameTo(newFile5);
			
			//DTO�� Settor ���� (���� : ������ ���ε� �� ��쿡��)
			String realpath5 = saveDirectory + "\\"+newFileName5;
			System.out.println(realpath5);
			
			dto.setRealpath5(realpath5);
			
			dto.setOfile5(newFileName5); // ������ �����  �����̸�
		}
		// DTO�� ��ü�� DAO�� insert �޼ҵ带 ȣ���ؼ� DB�� ����
		ProductDAO pDAO = new ProductDAO();
		
		int result = pDAO.register(dto);
		
		// ��ü ���� �޼ҵ� ȣ�� (rs, stmt, pstmt, conn ��� ����)
		pDAO.close();
		
		// �۾��� ������ �� �̵��� ������
		if(result == 1) {
			resp.sendRedirect("register-form.jsp");
		}
		
		// �۾��� ������ �� �̵��� ������
		if(result == 0) {
			resp.sendRedirect("register-form.jsp");
		}
		
		
		
	}

	
}
