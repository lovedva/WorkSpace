package lesson6;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Sample1
 */
@WebServlet("/Sample1")
public class Sample1 extends HttpServlet {


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			//����ƥ�ĥ����פ��O��
			response.setContentType("text/html; charset=Shift_JIS");
			
			Date dt =new Date();
		    PrintWriter pw=response.getWriter();
		    pw.println("<html>\n"+"<head><title>����ץ�</title></head>\n"+
		    "<body><center>\n"+
		    "<h2>�褦����</h2>"+
		    "<hr/>\n"+
		    "��"+dt+"�Ǥ���<br/>\n"+
		    "���x�Ӥ�������<br/>\n"+
		    "<br/>\n"+
		    "<a href=\"..car1.html\">�\��܇</a><br/>\n"+
		    "<a href=\"..car2.html\">�ȥ�å�</a><br/>\n"+
		    "<a href=\"..car3.html\">���`�ץ󥫩`</a><br/>\n"+
		    "</center></body>\n"+
		    "</html>\n"
		    		);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
