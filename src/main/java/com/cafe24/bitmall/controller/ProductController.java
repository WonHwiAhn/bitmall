package com.cafe24.bitmall.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cafe24.bitmall.service.AdminService;
import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.service.IconService;
import com.cafe24.bitmall.service.ImageService;
import com.cafe24.bitmall.vo.GoodsVO;
import com.cafe24.bitmall.vo.IconVO;
import com.cafe24.bitmall.vo.ImageVO;
import com.cafe24.bitmall.vo.OptionVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private IconService iconService;
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/product_detail")
	public String productDetail(@RequestParam(value="no", required=true) Long no,
							    Model model) {
		System.out.println("/product_detail no ==> " + no);
		
		// 상품 기본 정보 가져오기
		GoodsVO goodsVO = goodsService.getInfo(no);
		System.out.println("/product_detail goods ==> " + goodsVO);
		
		// 이미지 정보 가져오기
		ImageVO imageVO = imageService.getImageList(no);
		System.out.println("/product_detail image List ==> " + imageVO);
		
		// 아이콘 정보 가져오기
		List<IconVO> iconVO = iconService.getList();
		System.out.println("/product_detail iconInfo ==> " + iconVO);
		
		// 옵션 정보 가져오기
		List<OptionVO> optionVO = adminService.getOptionInfo(goodsVO.getOptionNo());
		System.out.println("/product_detail optionList ==> " + optionVO);

		String[] urlData = imageVO.getSrc().split("\\*");
		
		model.addAttribute("vo", goodsVO);
		model.addAttribute("represent", urlData[0]);
		model.addAttribute("images", urlData);
		model.addAttribute("iconList", iconVO);
		model.addAttribute("optionList", optionVO);
		
		return "/product/product_detail";
	}
}
