package lesson6;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Sample8
 */
@WebServlet("/Sample8")
public class Sample8 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 try{
		 response.setContentType("text/html; charset=utf-8");
		 
		 PrintWriter pw = response.getWriter();
   	     pw.println(
   	    		"<html>\n"+
   			    "<head><title>Authorize</title></head>\n"+
   				"<body><center>\n"+
   			    "<h2>����ǤȤ��������ޤ�</h2>"+
   				"<hr/>\n"+
   	            "�J�^�˳ɹ����ޤ�����<br/>\n"+
				    "���x�Ӥ�������<br/>\n"+
				    "<br/>\n"+
				    "<a href=\"../car1.html\">�\��܇</a><br/>\n"+
				    "<a href=\"../car2.html\">�ȥ�å�</a><br/>\n"+
				    "<a href=\"../car3.html\">���`�ץ󥫩`</a><br/>\n"+
				    "</center></body>\n"+
					"</html>\n"
				    		);
		 	}catch(Exception e) {
		 		e.printStackTrace();
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
