package org.oaoc.cookology.notificion.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import org.oaoc.cookology.common.FileNameChange;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.notificion.model.service.NotificionService;
import org.oaoc.cookology.notificion.model.vo.Notificion;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NotificionController {
	
	@Autowired
	private NotificionService notificionService;



	@RequestMapping(value="ntop5.do", method=RequestMethod.POST)
	@ResponseBody
	public String notificionNewTop5Method() 
			throws UnsupportedEncodingException {
		//ajax로 요청시, 리턴 방법은 여러가지가 있음
		//response 객체 이용시
		//1. 출력스트림으로 응답하는 방법 (아이디 중복 체크 예)
		//2. 뷰리졸버로 리턴하는 방법 : response body 에 값을 저장함
	
		//최근 공지글 5개 조회해 옴
		ArrayList<Notificion> list = notificionService.selectNewTop5();
	
		//전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		//리스트 저장할 json 배열 객체 준비
		JSONArray jarr = new JSONArray();
		
		//list 를 jarr 에 옮기기 (복사)
		for(Notificion notificion : list) {
			//notificion 의 각 필드값 저장할 json 객체 생성함
			JSONObject job = new JSONObject();
			
			job.put("Notifition_seq_id", notificion.getNotifition_seq_id());
			//한글에 대해서는 인코딩해서 json에 담도록 함
			//한글깨짐 방지
			job.put("Notifition_title", URLEncoder.encode(
					notificion.getNotifition_title(), "utf-8"));
			//날짜는 반드시 toString() 으로 문자열로 바꿔서
			//json 에 담아야 함
			job.put("Created_at", notificion.getCreated_at().toString());
			
			jarr.add(job);  //job 를 jarr 에 추가함
		}
		
		//전송용 객체에 jarr 을 담음
		sendJson.put("list", jarr);
		
		//json을 json string 타입으로 바꿔서 전송되게 함
		return sendJson.toJSONString();  //뷰리졸버로 리턴함
		//servlet-context.xml 에 json string 내보내는 
		//JsonView 라는 뷰리졸버 추가 등록해야 함
	}

	@RequestMapping("noticePage.do")
	public String moveNoticePagePage(Model model) {

		return "userService/noticePage";

	}

	//공지사항 전체 목록보기 요청 처리용
	@RequestMapping("nlist.do")
	public String notificionListMethod(Model model) {
		ArrayList<Notificion> list = notificionService.selectAll();
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notificion/notificionListView";
		}else {
			model.addAttribute("message", 
					"등록된 공지사항 정보가 없습니다.");
			return "common/error";
		}
	}
	
	//공지글 제목 검색용
	@RequestMapping(value="nsearchTitle.do", method=RequestMethod.POST)
	public String notificionSearchTitleMethod(
			@RequestParam("keyword") String keyword, 
			Model model) {
		
		ArrayList<Notificion> list = 
				notificionService.selectSearchTitle(keyword);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notificion/notificionListView";
		}else {
			model.addAttribute("message", 
				keyword + "로 검색된 공지글 정보가 없습니다.");
			return "common/error";
		}
	}
	
	//공지글 작성자 검색용
	@RequestMapping(value="nsearchWriter.do", method=RequestMethod.POST)
	public String notificionSearchWriterMethod(
			@RequestParam("keyword") String keyword, 
			Model model) {
		
		ArrayList<Notificion> list = 
				notificionService.selectSearchWriter(keyword);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notificion/notificionListView";
		}else {
			model.addAttribute("message", 
				keyword + "로 검색된 공지글 정보가 없습니다.");
			return "common/error";
		}
	}
	
	//공지글 등록날짜 검색용
	@RequestMapping(value="nsearchDate.do", method=RequestMethod.POST)
	public String notificionSearchDateMethod(
			SearchDate date, Model model) {
		
		ArrayList<Notificion> list = 
				notificionService.selectSearchDate(date);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "notificion/notificionListView";
		}else {
			model.addAttribute("message", 
				"해당 날짜로 등록된 공지글 정보가 없습니다.");
			return "common/error";
		}
	}
	
	//공지글 상세보기 요청 처리용
	@RequestMapping("ndetail.do")
	public String notificionDetailMethod(
			@RequestParam("notificionno") int notificionno, 
			Model model, HttpSession session) {
		//관리자용 상세보기 페이지와 일반 회원|비회원 상세보기 페이지 구분함
		//HttpSession 을 매개변수에 추가함
		
		Notificion notificion = notificionService.selectnotificion(notificionno);
		
		if(notificion != null) {
			model.addAttribute("notificion", notificion);
			
			Users loginMember = 
				(Users)session.getAttribute("loginMember");
			if(loginMember != null && 
					loginMember.getadmin_ok().equals("Y")) {
				//로그인한 관리자가 요청했다면
				return "notificion/notificionAdminDetailView";
			}else {
				//관리자가 아닌 | 로그인 안 한 상태에서의 요청이라면
				return "notificion/notificionDetailView";
			}
		}else {
			model.addAttribute("message", 
					notificionno + "번 공지글 상세보기 조회 실패!");
			return "common/error";
		}
	}
	
	//첨부파일 다운로드 요청 처리용
	@RequestMapping("nfdown.do")
	public ModelAndView fileDownMethod(
			ModelAndView mv, HttpServletRequest request,
			@RequestParam("ofile") String originalFileName,
			@RequestParam("rfile") String renameFileName) {
		//공지사항 첨부파일 저장폴더에 대한 경로(path) 지정
		String savePath = request.getSession()
				.getServletContext().getRealPath(
						"resources/notificion_upfiles");
		
		//저장 폴더에서 읽을 파일에 대한 파일 객체 생성함
		File renameFile = new File(savePath + "\\" + renameFileName);
		//파일 다운시 내보낼 원래 이름의 파일 객체 생성함
		File originFile = new File(originalFileName);
		
		//파일 다운로드 뷰로 전달할 정보 저장
		mv.setViewName("filedown");  //등록된 파일다운로드 뷰의 id명
		mv.addObject("renameFile", renameFile);
		mv.addObject("originFile", originFile);
		
		return mv;
	}
	
	//공지글 수정페이지로 이동 요청 처리용
	@RequestMapping("nmoveup.do")
	public String moveUpdatePage(
			@RequestParam("notificionno") int notificionno, 
			Model model) {
		//수정페이지에 출력할 해당 공지글 다시 조회함
		Notificion notificion = notificionService.selectnotificion(notificionno);
		
		if(notificion != null) {
			model.addAttribute("notificion", notificion);
			return "notificion/notificionUpdateForm";
		}else {
			model.addAttribute("message", 
					notificionno + "번 공지글 수정페이지로 이동 실패!");
			return "common/error";
		}
	}
	
	//공지글 수정 요청 처리용 (파일 업로드 기능 사용)
	@RequestMapping(value="nupdate.do", method=RequestMethod.POST)
	public String notificionUpdateMethod(
			Notificion notificion, Model model, HttpServletRequest request,
			@RequestParam(name="delflag", required=false) String delFlag,
			@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		
		//공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession()
				.getServletContext().getRealPath(
					"resources/notificion_upfiles");
		
		//첨부파일이 수정 처리된 경우 ---------------------------
		//1. 원래 첨부파일이 있는데 '파일삭제'를 선택한 경우
		if(notificion.getOriginal_filepath() != null 
				&& delFlag != null && delFlag.equals("yes")) {
			//저장 폴더에 있는 파일을 삭제함
			new File(savePath + "\\" + notificion.getRename_filepath()).delete();
			//notificion 의 파일 정보도 제거함
			notificion.setOriginal_filepath(null);
			notificion.setRename_filepath(null);
		}
		
		//2. 공지글 첨부파일은 1개만 가능한 경우
		//새로운 첨부파일이 있을때
		if(!mfile.isEmpty()) {
			//2-1. 이전 첨부파일이 있을 때
			if(notificion.getOriginal_filepath() != null) {
				//저장 폴더에 있는 이전 파일을 삭제함
				new File(savePath + "\\" 
						+ notificion.getRename_filepath()).delete();
				//notificion 의 이전 파일 정보도 제거함
				notificion.setOriginal_filepath(null);
				notificion.setRename_filepath(null);
			}
			
			//2-2. 이전 첨부파일이 없을 때
			//전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();
			
			//다른 공지글의 첨부파일과 파일명이 중복되어서
			//덮어쓰기 되는것을 막기 위해, 파일명을 변경해서 
			//폴더에 저장하는 방식을 사용할 수 있음
			//변경 파일명 : 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				
				String renameFileName = FileNameChange.change(
						fileName, "yyyyMMddHHmmss");
				
						
				//파일 객체 만들기
				File renameFile = new File(
						savePath + "\\" + renameFileName);
				
				//폴더에 저장 처리
				try {
					mfile.transferTo(renameFile);
				} catch (Exception e) {					
					e.printStackTrace();
					model.addAttribute("message", 
							"첨부파일 저장 실패!");
					return "common/error";
				} 
				
				//notificion 객체에 첨부파일 정보 기록 저장
				notificion.setOriginal_filepath(fileName);
				notificion.setRename_filepath(renameFileName);
			} //이름바꾸기
		}  //새로운 첨부파일이 있을 때		
		
		if(notificionService.updatenotificion(notificion) > 0) {
			//공지글 수정 성공시 목록 보기 페이지로 이동
			return "redirect:nlist.do";
		}else {
			model.addAttribute("message", 
					notificion.getNotifition_seq_id() + "번 공지 수정 실패!");
			return "common/error";
		}
	}
	
	//공지글 삭제 요청 처리용
	@RequestMapping("ndel.do")
	public String notificionDeleteMethod(
			@RequestParam("notificionno") int notificionno,
			@RequestParam(name="rfile", required=false) String renameFileName,
			Model model, HttpServletRequest request) {
		
		if(notificionService.deletenotificion(notificionno) > 0) {
			//첨부된 파일이 있는 공지일 때는 저장 폴더에 있는
			//첨부파일도 삭제함
			if(renameFileName != null) {
				//공지사항 첨부파일 저장 폴더 경로 지정
				String savePath = request.getSession()
						.getServletContext().getRealPath(
							"resources/notificion_upfiles");
				
				new File(savePath + "\\" + renameFileName).delete();
			}
			
			return "redirect:nlist.do";
		}else {
			model.addAttribute("message", 
					notificionno + "번 공지 삭제 실패!");
			return "common/error";
		}
	}
	
	//새 공지글 등록 페이지로 이동 처리용
	@RequestMapping("movewrite.do")
	public String moveWritePage() {
		return "notificion/notificionWriteForm";
	}
	
	//공지글 등록 요청 처리용 (파일 업로드 기능 사용)
	@RequestMapping(value="ninsert.do", method=RequestMethod.POST)
	public String notificionInsertMethod(
			Notificion notificion, Model model, 
			HttpServletRequest request,			
			@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		
		//공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession()
				.getServletContext().getRealPath(
					"resources/notificion_upfiles");
				
		//첨부파일이 있을때
		if(!mfile.isEmpty()) {
			
			//전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();
			
			//다른 공지글의 첨부파일과 파일명이 중복되어서
			//덮어쓰기 되는것을 막기 위해, 파일명을 변경해서 
			//폴더에 저장하는 방식을 사용할 수 있음
			//변경 파일명 : 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀 파일명에 대한 문자열 만들기
				
				String renameFileName = FileNameChange.change(
						fileName, "yyyyMMddHHmmss");
				

				//파일 객체 만들기
				File renameFile = new File(
						savePath + "\\" + renameFileName);
				
				//폴더에 저장 처리
				try {
					mfile.transferTo(renameFile);
				} catch (Exception e) {					
					e.printStackTrace();
					model.addAttribute("message", 
							"첨부파일 저장 실패!");
					return "common/error";
				} 
				
				//notificion 객체에 첨부파일 정보 기록 저장
				notificion.setOriginal_filepath(fileName);
				notificion.setRename_filepath(renameFileName);
			} //이름바꾸기
		}  //새로운 첨부파일이 있을 때		
		
		if(notificionService.insertnotificion(notificion) > 0) {
			//공지글 수정 성공시 목록 보기 페이지로 이동
			return "redirect:nlist.do";
		}else {
			model.addAttribute("message", "새 공지 등록 실패!");
			return "common/error";
		}
	}
	
}  //Controller













