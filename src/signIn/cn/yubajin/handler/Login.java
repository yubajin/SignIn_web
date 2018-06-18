package signIn.cn.yubajin.handler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 2201402469
 * 2201503984
 * @author Administrator
 *
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");

		String studentNo = request.getParameter("stuNo");
		
		String logDirStr = getServletContext().getRealPath("/") + "logfile" ;		
		File logDir = new File(logDirStr);
		if(!logDir.exists()){
			logDir.mkdir();
		}
		File logfile = new File(logDir.getAbsolutePath()+"/log.txt");
		System.out.println("logfile dir: " + logfile.toString());
		
		FileWriter fw = null;
		BufferedWriter writer = null;
		
		try {
			fw = new FileWriter(logfile,true);
			writer = new BufferedWriter(fw);
			
			String studentNo_date = new Date().toString();
			
			String format_studentNo = String.format("%-10s", studentNo);
			String studentNo_format_date = String.format("%-20s", studentNo_date);
			
			writer.write("----------------------------------查课的学号和时间----------------------------------");
			writer.newLine();
			writer.write(studentNo_format_date);
			writer.newLine();
			writer.write(format_studentNo);
			writer.newLine();
			writer.write("----------------------------------查课的学号和时间----------------------------------");
			writer.newLine();
			writer.newLine();
			writer.flush();
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				writer.close();
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
//		RequestDispatcher rd = servletContext.getRequestDispatcher("/signPage.jsp");		
//		rd.forward(request, response);
//		response.sendRedirect("signPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	
}
