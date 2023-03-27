package org.oaoc.cookology;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
/*
	home Controller 에서는 Method 를 하나 추가할거임. index.jsp 가 Welcome 될 때, forwading 된 요청을 받아서 
	모든 서비스에 공통으로 사용될 main.jsp (common/main.jsp) 를 내보내기 위해 리턴하는 Method 를 하나 준비.  

	어떤 페이지(view) 가 보여져라~ 라는 요청을 이제 .do 를 통해 ViewResolver 가 보여준다.

	Return 은 view파일명 만 리턴할것임.	--> So return type = String
	return 하면 그 파일명을 어디가서 찾냐? --> WEB-INF/views
	그러면 views 폴더 아래에 다른 폴더에 가고싶으면 어떡하냐? --> views 이후부터 풀네임으로 리턴해주면 된다.
	 
		Ex) 	WEB-INF/views/common/main.jsp		 -->		 return "common/main.jsp";
 */
	@RequestMapping(value="main.do" , method= { RequestMethod.GET , RequestMethod.POST })
	public String forwardMainView() {
		
		return "common/main";	// 내보낼 View파일명 을 return
/* 
	이 메소드. 이 기능도 하나의 서블릿이라고생각하면 URL Mapping 을 해줘야한다. (메소드 위에 annotation 사용)
	get방식으로 왔을 땐 RequestMethod 만 쓰면 된다. ( 자동으로 되는거라 그냥 기본 )
	그게 아니면 Method 위에 @RequestMapping("URL") 을 어노테이션으로 써줘야한다.
	main.do 라고 하면 이 Method 가 작동한다! 라는 의미. 
 	요청에 사용되는 가짜 이름.
*/
	}
	
	
	
	
	
	
	
	
}
