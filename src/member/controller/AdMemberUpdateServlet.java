package member.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class memberUpdateServlet
 */
@WebServlet("/mup.ad")
public class AdMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 회원 정보 수정용
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) { 
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "enctype으로 변경하여 폼 전송해야 합니다.");
			view.forward(request, response);
		}
		
		int maxSize = 1024 * 1024 * 10;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/member_upfiles");
		
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		Member m = new Member();
		
		m.setUserId(mrequest.getParameter("userid"));
		m.setTypeNumber(Integer.parseInt(mrequest.getParameter("typenumber")));
		m.setUserPwd(mrequest.getParameter("userpwd"));
		m.setPhone(mrequest.getParameter("phone"));
		m.setEmail(mrequest.getParameter("email"));
		
		String ofile = mrequest.getParameter("ofile");
		String rfile = mrequest.getParameter("rfile");
		
		String originalFileName = mrequest.getFilesystemName("mupfile");	//첨부파일 없으면 null로 들어감
		
		if( originalFileName != null) {	// 파일이 있다면
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

			File originFile = new File(savePath + "\\" + originalFileName); 
			File renameFile = new File(savePath + "\\" + renameFileName); 

			if(!originFile.renameTo(renameFile)) {
				int read = -1;	
				byte[] buf = new byte[1024]; 
				
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
					}	
					
				fin.close();
				fout.close();
					
				originFile.delete();
				
				new File(savePath + "\\" + rfile).delete();	
			} 
			
			// 첨부파일이 있을 때(Member객체에 저장)
			m.setUserOfile(originalFileName);
			m.setUserRfile(renameFileName);
		} else {
			// 새로운 첨부파일이 없다면, 원래 파일명 필드에 기록
			m.setUserOfile(ofile);
			m.setUserRfile(rfile);
		}
		
		System.out.println(m);
		
		int result = new MemberService().updateMemberAdmin(m);
		
		if(result > 0) {
			response.sendRedirect("/sori/mdetail.ad?userid=" + m.getUserId());
		} else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "회원정보수정 실패!");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
