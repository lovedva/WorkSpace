package lesson6_2;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class Sample7
 */
//@WebServlet("/Sample7")
public class Sample7 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
          try {
			//����ƥ�ĥ����פ��O��
        	  response.setContentType("text/html; charset=utf-8");
        	  
        	  PrintWriter pw = response.getWriter();
        	  pw.println(
					    "���x�Ӥ�������<br/>\n"+
					    "<br/>\n"+
					    "<a href=\"../car1.html\">�\��܇</a><br/>\n"+
					    "<a href=\"../car2.html\">�ȥ�å�</a><br/>\n"+
					    "<a href=\"../car3.html\">���`�ץ󥫩`</a><br/>\n"
					    		);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
