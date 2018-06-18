package signIn.cn.yubajin.handler;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Connection.Response;

import signIn.cn.yubajin.utils.NetUtils;

@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String baseUrl = "https://sign.jxufe.cn/course_consumer//jxcjdx//sign/signCourse";
       
    public SignIn() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
		
		NetUtils utils = new NetUtils();
		
//		signIn(id, name,week,signStatusId,a)
		String courseScheduleArrangeId = request.getParameter("id");
		String courseName = request.getParameter("name");
		String weeks = request.getParameter("week");
		String signStatusId = request.getParameter("signStatusId");

		ServletContext servletContext = request.getServletContext();
		String studentNo = (String) servletContext.getAttribute("stuNo");
		String queryCourse = (String) servletContext.getAttribute("queryCourse");
		System.out.println("signIn queryCourse:" + queryCourse);
		
		JSONArray jsonArr = new JSONArray(queryCourse);
		JSONObject jsonObj = (JSONObject) jsonArr.get(0);
		
		
		JSONArray scheduleArr = (JSONArray) jsonObj.get("scheduleArrangeParam");
		JSONObject scheduleObj = (JSONObject) scheduleArr.get(0);
		String colleageId = scheduleObj.get("colleageId").toString();
		
		String formId = "1525862427437";
		String page = "pages%2Fwisdom%2Fstudent%2Fsign%2Fview";
		
		Response signIn = signIn(utils,studentNo,courseScheduleArrangeId,courseName,
				colleageId,signStatusId,weeks,formId,page);
		
		System.out.println("sign in:" + signIn.body());
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.write(signIn.body());
	}
	
	private static Response signIn(NetUtils utils,String studentNo,String courseScheduleArrangeId,String courseName,
			String colleageId,String signStatusId,String weeks,String formId,String page) {
//		String studentNo = "2201504021";
//		String studentNo = "2201304686";
//		String studentNo = "2201403938";
//		String studentNo = "2201503984";
//		String studentNo = "2201403730";

		String url = baseUrl + "?username="+ studentNo + "&courseScheduleArrangeId=" + courseScheduleArrangeId +"&courseName="+courseName
				   + "&colleageId="+ colleageId + "&signStatusId=" + signStatusId +"&weeks="+weeks
				   +"&formId="+formId+"&page="+page;
		System.out.println("sign url: " + url);
		Response response = utils.doMyGetRequest(url);

		return response;
	}

}
