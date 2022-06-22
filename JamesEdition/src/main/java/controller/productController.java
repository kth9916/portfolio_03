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
		
		if(mr == null) {	// 객체 생성 실패 (1MB 이상 용량 파일 전송시)
			JSFunction.alertLocation(resp, "첨부 용량이 초과 되었습니다", "../controller/pwrite.do");
			
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
		if(fileName1 != null) {		// 첨부 파일이 비어 있지 않다면
			
			//새로운 파일이름으로 변경해서 서버에 저장함.  (서버에 해당 파일이름이 존재할 경우가 있으므로)
			String now1 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//확장자만 잘라서 저장
			String ext1 = fileName1.substring(fileName1.lastIndexOf("."));
			
			//서버에 저장할 파일이름 생성
			String newFileName1 = now1 + ext1;
			
			// 파일명 변경				
			File oldFile1 = new File(saveDirectory + File.separator + fileName1);
			File newFile1 = new File(saveDirectory + File.separator + newFileName1);
			
			oldFile1.renameTo(newFile1);
			
			//DTO에 Setter 주입 (조건 : 파일을 업로드 한경우 에만 )
			String realpath1 = saveDirectory + "\\"+newFileName1;
			System.out.println(realpath1);
			
			dto.setRealpath1(realpath1);
			
			dto.setOfile1(newFileName1); // 서버에 저장될  파윌이름
			
			// 2번
			//새로운 파일이름으로 변경해서 서버에 저장함.  (서버에 해당 파일이름이 존재할 경우가 있으므로)
			String now2 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//확장자만 잘라서 저장
			String ext2 = fileName2.substring(fileName2.lastIndexOf("."));
			
			//서버에 저장할 파일이름 생성
			String newFileName2 = now2 + ext2;
			
			// 파일명 변경				
			File oldFile2 = new File(saveDirectory + File.separator + fileName2);
			File newFile2 = new File(saveDirectory + File.separator + newFileName2);
			
			oldFile2.renameTo(newFile2);
			
			//DTO에 Setter 주입 (조건 : 파일을 업로드 한경우 에만 )

			String realpath2 = saveDirectory + "\\"+newFileName2;
			System.out.println(realpath2);
			
			dto.setRealpath2(realpath2);
			
			dto.setOfile2(newFileName2); // 서버에 저장될  파윌이름
			
			// 3번
			//새로운 파일이름으로 변경해서 서버에 저장함.  (서버에 해당 파일이름이 존재할 경우가 있으므로)
			String now3 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//확장자만 잘라서 저장
			String ext3 = fileName3.substring(fileName3.lastIndexOf("."));
			
			//서버에 저장할 파일이름 생성
			String newFileName3 = now3 + ext3;
			
			// 파일명 변경				
			File oldFile3 = new File(saveDirectory + File.separator + fileName3);
			File newFile3 = new File(saveDirectory + File.separator + newFileName3);
			
			oldFile3.renameTo(newFile3);
			
			//DTO에 Settor 주입 (조건 : 파일을 업로드 한 경우에만)
			String realpath3 = saveDirectory + "\\"+newFileName3;
			System.out.println(realpath3);
			
			dto.setRealpath3(realpath3);
			
			dto.setOfile3(newFileName3); // 서버에 저장될  파윌이름
			
			// 4번
			//새로운 파일이름으로 변경해서 서버에 저장함.  (서버에 해당 파일이름이 존재할 경우가 있으므로)
			String now4 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//확장자만 잘라서 저장
			String ext4 = fileName4.substring(fileName4.lastIndexOf("."));
			
			//서버에 저장할 파일이름 생성
			String newFileName4 = now4 + ext4;
			
			// 파일명 변경				
			File oldFile4 = new File(saveDirectory + File.separator + fileName4);
			File newFile4 = new File(saveDirectory + File.separator + newFileName4);
			
			oldFile4.renameTo(newFile4);
			
			//DTO에 Settor 주입 (조건 : 파일을 업로드 한 경우에만)
			String realpath4 = saveDirectory + "\\"+newFileName4;
			System.out.println(realpath4);
			
			dto.setRealpath4(realpath4);
			
			dto.setOfile4(newFileName4); // 서버에 저장될  파윌이름
			
			// 5번
			//새로운 파일이름으로 변경해서 서버에 저장함.  (서버에 해당 파일이름이 존재할 경우가 있으므로)
			String now5 = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			
			//확장자만 잘라서 저장
			String ext5 = fileName5.substring(fileName5.lastIndexOf("."));
			
			//서버에 저장할 파일이름 생성
			String newFileName5 = now5 + ext5;
			
			// 파일명 변경				
			File oldFile5 = new File(saveDirectory + File.separator + fileName5);
			File newFile5 = new File(saveDirectory + File.separator + newFileName5);
			
			oldFile5.renameTo(newFile5);
			
			//DTO에 Settor 주입 (조건 : 파일을 업로드 한 경우에만)
			String realpath5 = saveDirectory + "\\"+newFileName5;
			System.out.println(realpath5);
			
			dto.setRealpath5(realpath5);
			
			dto.setOfile5(newFileName5); // 서버에 저장될  파윌이름
		}
		// DTO에 객체를 DAO의 insert 메소드를 호출해서 DB에 저장
		ProductDAO pDAO = new ProductDAO();
		
		int result = pDAO.register(dto);
		
		// 객체 종료 메소드 호출 (rs, stmt, pstmt, conn 모두 종료)
		pDAO.close();
		
		// 글쓰기 성공일 때 이동할 페이지
		if(result == 1) {
			resp.sendRedirect("register-form.jsp");
		}
		
		// 글쓰기 실패일 때 이동할 페이지
		if(result == 0) {
			resp.sendRedirect("register-form.jsp");
		}
		
		
		
	}

	
}
