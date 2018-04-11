package com.cafe24.mvc.util;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebUtil {
	
	public static int checkParameter(String value, int defaultValue) {
		if(value != null && value != "")
			return Integer.parseInt(value);
		else
			return defaultValue;
	}
	
	public static Long checkParameter(String value, Long defaultValue) {
		if(value != null && value != "")
			return Long.parseLong(value);
		else
			return defaultValue;
	}
	
	public static String checkParameter(String value, String defaultValue) {
		if(value != null && value != "")
			return value;
		else
			return defaultValue;
	}
	
	public static void redirect(
			HttpServletRequest request, 
			HttpServletResponse response,
			String url) throws IOException {
		response.sendRedirect(url);
	}
	
	public static void forward(
			HttpServletRequest request, 
			HttpServletResponse response,
			String path) throws ServletException, IOException {
		// forwarding
		RequestDispatcher rd = request.getRequestDispatcher(path);
		rd.forward(request, response);
	}
}
