package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.dto.JumunDTO;
import com.cafe24.bitmall.security.Auth;
import com.cafe24.bitmall.security.AuthUser;
import com.cafe24.bitmall.security.Auth.Role;
import com.cafe24.bitmall.service.JumunService;
import com.cafe24.bitmall.vo.CustomerVO;

@Controller
@Auth(role=Role.USER)
@RequestMapping("/jumun")
public class JumunController {
	@Autowired
	private JumunService jumunService;
	
	@RequestMapping(value= {"/", "", "/main"})
	public String index(@AuthUser CustomerVO vo,
						Model model) {
		System.out.println("/jumun index no ==> " + vo.getNo());
		List<JumunDTO> jumunList = jumunService.getList((long)vo.getNo());
		System.out.println("/jumun index jumunList ==> " + jumunList);
		
		model.addAttribute("jumunList", jumunList);
		
		return "jumun/jumun";
	}
}
