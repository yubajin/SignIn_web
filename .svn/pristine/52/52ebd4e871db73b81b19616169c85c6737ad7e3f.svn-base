package signIn.cn.yubajin.handler;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/preLogin")
public class GetAddr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetAddr() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ip = request.getRemoteAddr();
		
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
			
			String ip_date = new Date().toString();
			
			String format_ip = String.format("%-10s", ip);
			String ip_format_date = String.format("%-20s", ip_date);
			
			writer.write("----------------------------------访问的ip和时间----------------------------------");
			writer.newLine();
			writer.write(format_ip);
			writer.newLine();
			writer.write(ip_format_date);
			writer.newLine();
			writer.write("----------------------------------访问的ip和时间----------------------------------");
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
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
