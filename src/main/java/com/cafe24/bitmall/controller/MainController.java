	package com.cafe24.bitmall.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cafe24.bitmall.service.GoodsService;
import com.cafe24.bitmall.service.IconService;
import com.cafe24.bitmall.service.ImageService;
import com.cafe24.bitmall.vo.GoodsVO;
import com.cafe24.bitmall.vo.IconVO;
import com.cafe24.bitmall.vo.ImageVO;

@Controller
public class MainController {
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private ImageService imageService;
	@Autowired
	private IconService iconService;
	
	@RequestMapping(value = {"", "/", "/main"})
	public String index(Model model) {
		
		// 상품 리스트
		List<GoodsVO> list = goodsService.getList();
		System.out.println("/main list  ==> " + list);
		
		// 이미지 리스트
		List<ImageVO> imageList = imageService.getImageList();
		System.out.println("/main imageList  ==> " + imageList);
		
		// 아이콘 리스트
		List<IconVO> iconList = iconService.getList();
		System.out.println("/main iconList ==> " + iconList);
		
	/*	HashMap<String, String> map = new HashMap<String, String>();
		
		for(int i=0; i<list.size(); i++) {
			for(int j=0; j<imageList.size(); j++) {
				if(list.get(i).getNo() == imageList.get(j).getGoodsNo()) {
					map.put(list.get(i).getNo().toString(), imageList.get(j).getSrc());
				}
			}
		}*/
		
		//System.out.println("map ===> " + map);
		
		model.addAttribute("list", list);
		model.addAttribute("imageList", imageList);
		model.addAttribute("iconList", iconList);
		model.addAttribute("firstForEnd", list.size());
		model.addAttribute("secondForEnd", list.size()%5);
		
		return "main/index";
	}
}
