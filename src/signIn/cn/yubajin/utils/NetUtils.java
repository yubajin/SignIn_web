package signIn.cn.yubajin.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Connection;
import org.jsoup.Connection.Method;
import org.jsoup.Connection.Response;


import org.jsoup.Jsoup;

public class NetUtils {
	
	private Connection getConnection(String contentType,String url) {
		Connection con = Jsoup.connect(url);
		Map<String,String> headers = new HashMap<String,String>();
		headers.put("Content-Type", contentType);
		headers.put("User-Agent",
                "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		con.headers(headers);
		return con;
	}
	
	private Connection getConnection(String url) {
		Connection con = Jsoup.connect(url).ignoreContentType(true);
		Map<String,String> headers = new HashMap<String,String>();
		headers.put("User-Agent",
                "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:29.0) Gecko/20100101 Firefox/29.0");
		con.headers(headers);
		return con;
	}
	
	public Response doMyGetRequest(String url) {
		Connection con = getConnection(url);
		Response response = null;
		try {
			//如果请求的数据是json数据,则要设置为ignoreContentType为true
			response = con.ignoreContentType(true).method(Method.GET).execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;
	}
	
	public Response doMyPostRequest(String url,Map<String,String> datas) {
		Connection con = getConnection(url);
		Response response = null;
		try {
			//如果请求的数据是json数据,则要设置为ignoreContentType为true
			response = con.ignoreContentType(true).method(Method.POST).data(datas).execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return response;
	}
	
}
