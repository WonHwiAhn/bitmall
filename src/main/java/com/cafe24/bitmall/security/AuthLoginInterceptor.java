package com.cafe24.bitmall.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.cafe24.bitmall.dto.JSONResult;
import com.cafe24.bitmall.service.CustomerService;
import com.cafe24.bitmall.vo.CustomerVO;
import com.cafe24.mvc.util.WebUtil;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {

	// @Autowired
	// private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
							 HttpServletResponse response,
							 Object handler) throws Exception {
		
		System.out.println("######## Interceptor Login입니다 #########");
		
		String id = WebUtil.checkParameter(request.getParameter("id"), "");
		String adminId = WebUtil.checkParameter(request.getParameter("admin-id"), "");
		String goodsNo = WebUtil.checkParameter(request.getParameter("goodsNo"), "");
		
		String password = request.getParameter("password");
		
		System.out.println("interceptor id ==> " + id);
		System.out.println("interceptor adminId ==> " + adminId);
		System.out.println("interceptor password ==> " + password);
		
		ApplicationContext ac = 
				WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
		
		CustomerService customerService = ac.getBean(CustomerService.class);
		CustomerVO vo = new CustomerVO();
		
		if("".equals(id)) {
			vo.setId(adminId);
		}else {
			vo.setId(id);
		}
		vo.setPassword(password);
		
		CustomerVO authUser = customerService.getCustomer(vo);
		
		System.out.println(authUser);
		
		// 만들어진 서비스에 접근하는 것이 아니라 직접 접근해야할 때 사용 (Autowired를 사용하지 않음)
		/*ApplicationContext ac = 
		WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());*/
		
		// 주입받지않고 RootApplication에 생성되지 않았을 경우에 직접 접근해서 사용
		//userService = ac.getBean(UserService.class);
		
		if(authUser == null) {
			//response.getWriter().write("something");
			if(!"".equals(id) && id != null)
				response.sendRedirect(request.getContextPath() + "/user/member_login_fail");
			else if(!"".equals(adminId) && adminId != null)
				response.sendRedirect(request.getContextPath() + "/admin/member_login_fail");
			//JSONResult.success("good");
			return false;
		}
		
		boolean isAdmin = false;
		
		// admin 아이디가 있다면 관리자
		if(!"".equals(adminId))
			isAdmin = true;
		
		HttpSession session = request.getSession(true);
		session.setAttribute("authUser", authUser);
		
		// 상품번호가 있으면 그 상품 페이지로 이동
		if(!"".equals(goodsNo)) {
			response.sendRedirect(request.getContextPath()+"/product/product_detail?no="+goodsNo);
			return false;
		}
		
		if(authUser.getAuth() == 5)
			response.sendRedirect(request.getContextPath());
		else if(authUser.getAuth() == 1)
			response.sendRedirect(request.getContextPath()+"/admin/product");
		//JSONResult.success("good");
		return false;
		//return super.preHandle(request, response, handler);
	}
	
}
