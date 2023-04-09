package org.oaoc.cookology.productDescription.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.oaoc.cookology.common.FileNameChange;
import org.oaoc.cookology.product.model.service.ProductService;
import org.oaoc.cookology.product.model.vo.Product;
import org.oaoc.cookology.productDescription.model.service.ProductDescriptionService;
import org.oaoc.cookology.productDescription.model.vo.ProductDescription;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProductDescriptionController {
	
	
	
// Fields 
	@Autowired
	private ProductDescriptionService productDescriptionService;
	
	@Autowired
	private ProductService productService;
	
	
	
	private Logger logger = LoggerFactory.getLogger(ProductDescription.class);
	
	//product_img
	//description
	//product_seq_id
	
	
	/*
	
	//새 상품 등록 페이지로 이동 처리용
	@RequestMapping("pdescript.do")
	public String moveDWritePage(
			@RequestParam("product_seq_id") int product_seq_id, 
			Model model) {		
		//ProductDescription productDescription = productDescriptionService.selectProductDescription();
			
		
		try {
			model.addAttribute("product_seq_id", product_seq_id); 
			return "product/pDescriptionForm";
		} catch (Exception e) {
			model.addAttribute("message", 
					product_seq_id + "번 상품 상세보기 조회 실패!");
			return "common/error";
		}
		
		
	}
	
	*/
	
	

	  
	  

	  //새 상품 등록 페이지로 이동 처리용
	  
	  @RequestMapping("pdescript.do") 
	  public String moveDWritePage(
			  @RequestParam("product_no") int product_no, Model model) {
	
	  Product product= productService.selectProduct(product_no); 
	  
	  if(product !=null) { 
		  model.addAttribute("product_no", product_no);
	  
		  return "product/pDescriptionForm";
	  
	  		}else { 
	  			model.addAttribute("message", product_no + " 상품 상세보기 조회 실패!");
	  			return "common/error"; 
	  			} 
	  }
	 
	  
	  
	  
	  
	  
	  
//	  
//	
//	CREATE TABLE PRODUCT_DESCRIPTION
//	(
//	 product_seq_id NUMBER NOT NULL,
//	 original_img VARCHAR2(1000),
//	 rename_img VARCHAR2(1000),
//	 description VARCHAR2(255)
//	);
//
//	ALTER TABLE PRODUCT_DESCRIPTION
//	ADD CONSTRAINT FK_PRODUCT_DESCRIPTION_PRODUCT_SEQ_ID
//	FOREIGN KEY (product_seq_id)
//	REFERENCES PRODUCT (product_seq_id);
//	
//	
//	
	
	

	//등록		
				@RequestMapping(value="ppinsert.do", method=RequestMethod.POST)
				public String productDescriptionInsertMethod(
						ProductDescription productDescription, Model model, 
						HttpServletRequest request,	
						@RequestParam(name="dupfile", required=false) MultipartFile mfile){	//바꿔야될수도있음	       	
							
					//상품 첨부파일(이미지) 저장 폴더 경로            
					String savePath = request.getSession()
							.getServletContext().getRealPath("resources/img/p-description-img");	
					
					logger.info(savePath);
					
					//첨부파일이 있을때              
					if(!mfile.isEmpty()) {
						      
						String fileName = mfile.getOriginalFilename();

						logger.info(fileName);
						if(fileName != null && fileName.length() > 0) {
							String renameFileName = FileNameChange.change(
									fileName, "yyyyMMddHHmmss");			
							logger.info("첨부 파일명 확인 : " + fileName 
											+ ", " + renameFileName);									
							//폴더에 저장 처리
							try {
								mfile.transferTo(new File(
										savePath + "\\" + renameFileName));
							} catch (Exception e) {					
								e.printStackTrace();
								model.addAttribute("message", "첨부파일 저장 실패!");
								return "common/error";
							} 					
							                
							productDescription.setOriginal_img(fileName);
							productDescription.setRename_img(renameFileName);
						}
					}                  		
					
					if(productDescriptionService.insertProductDescription(productDescription) > 0) {
						
						return "redirect:productList.do";
					}else {
						model.addAttribute("message", "상품 등록 실패!");
						return "common/error";
					}
				}
				


			
	
	
	
	//삭제 
			
			
			
			
			
	
	
	
	
	//리스트로 
	
//
////userDetailProduct 유저 상품 클릭시 상품 상세 보기
//@RequestMapping("userProductDetail.do")
//public String userProductDetailMethod(
//	@RequestParam("product_seq_id") int product_seq_id, 
//	Model model){		
//	ProductDescription productDescription= productDescriptionService.selectProductDescription(product_seq_id);			
//	if(productDescription != null) {
//		model.addAttribute("productDescription", productDescription);	
//			return "product/userDetailProduct";		
//	}else {
//		model.addAttribute("message", 
//				product_seq_id + "번 상품 상세보기  실패!");
//		return "common/error";
//	}
//	//selectOne 인데 where 시퀀스 아이디?로
//}
//
//}
//	
}
	








	/*
	//insert
	//공지글 등록 요청 처리용 (파일 업로드 기능 사용)
		@RequestMapping(value="ppinsert.do", method=RequestMethod.POST)
		public String descriptionInsertMethod(
				ProductDescription productDescription, Model model, 
				HttpServletRequest request,			
				@RequestParam(name="upfile", required=false) MultipartFile mfile) {
			
			//공지사항 첨부파일 저장 폴더 경로 지정
			String savePath = request.getSession()
					.getServletContext().getRealPath(
						"resources/img/p-description-img");
					

			if(!mfile.isEmpty()) {

				String fileName = mfile.getOriginalFilename();

				if(fileName != null && fileName.length() > 0) {
					//바꿀 파일명에 대한 문자열 만들기				
					String renameFileName = FileNameChange.change(
							fileName, "yyyyMMddHHmmss");
					
					logger.info("첨부 파일명 확인 : " + fileName 
									+ ", " + renameFileName);			
						
					//폴더에 저장 처리
					try {
						mfile.transferTo(new File(
								savePath + "\\" + renameFileName));
					} catch (Exception e) {					
						e.printStackTrace();
						model.addAttribute("message", 
								"첨부파일 저장 실패!");
						return "common/error";
					} 
					
				
					productDescription.setOriginal_filepath(fileName);
					productDescription.setRename_filepath(renameFileName);
				} //이름바꾸기
			}  //새로운 첨부파일이 있을 때		
			
			if(productDescriptionService.insertProductDescription(productDescription) > 0) {
				//공지글 수정 성공시 목록 보기 페이지로 이동
				return "redirect:nlist.do";
			}else {
				model.addAttribute("message", "새 공지 등록 실패!");
				return "common/error";
			}
		}
		
	}  //Controller
	
	
	
	//delete
	
	//select
	
	
*/









