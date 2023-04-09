package org.oaoc.cookology.product.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MapController {
	private static final Logger logger = 
			LoggerFactory.getLogger(MapController.class);
	
	
	
	
	
	//īī�� ���� �������� �̵�
	@RequestMapping(value="moveMap.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveKakaoMapView() {
		
		return "test/kakaoMapView";
	}
	
	
	//īī�� ���� ��� ����1 ��� �̵�
	@RequestMapping(value="map1.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String moveMap1View() {
		
		return "test/mapExample1";
	}
	
	
	
	
	
}
