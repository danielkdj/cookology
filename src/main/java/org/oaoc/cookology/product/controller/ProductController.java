package org.oaoc.cookology.product.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.oaoc.cookology.common.FileNameChange;
import org.oaoc.cookology.product.model.service.ProductService;
import org.oaoc.cookology.product.model.vo.Product;
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
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	
	@Autowired //DI
	private ProductService productService;
	
	
	
	
	//------------------------------------product----------------------------------------------

	/*
	//점주 상품 리스트 이동 ㅇ
	@RequestMapping("moveproduct.do")
	public String movepdMethod() {
		return "product/pManagementPage";
	}
	*/
	
	
	
	
	
	//userProducstList
		@RequestMapping("movetest.do")
		public String moveTestMethod() {
			return "product/userProduct";
		}
		
		
		
		

		
		
//		//유저 상품 상세보기 요청 처리용 ㅇ
//				//id에 해당하는 상품 정보를 검색하여 product 뷰에 전달합니다.
//				@RequestMapping("userProductDetail.do") //userDetailProduct.jsp
//				public String userProductDetailMethod(
//						@RequestParam("product_seq_id") int product_seq_id, 
//						Model model) {
//					
//					Product product= productService.selectProduct(product_seq_id);				
//					
//					if(product != null) {
//						model.addAttribute("product", product);
//								
//							return "product/productMerchantDetailView";
//														
//					}else {
//						model.addAttribute("message", 
//								product_seq_id + "번 상품 상세보기 조회 실패!");
//						return "common/error";
//					}
//				}
		
		
		
		
	
//상품관리용 상품전체목록 조회 처리용 ㅇ
	//상품 목록을 모델에 담아 productList 뷰로 전달합니다.
	@RequestMapping("productList.do")
	public String productListMethod(Model model) { //pManagementPage.jsp
		ArrayList<Product> list = productService.selectAll();
		
//		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "product/pManagementPage";
//		}else {
//			model.addAttribute("message", 
//					"상품 정보가 존재하지 않습니다.");
//			return "common/error";
//		}
	}
	
	
	
	//상품 유저  목록 조회 처리용 	
		@RequestMapping("productUserList.do")
		public String productUserListMethod(Model model) { //userProduct.jsp
			ArrayList<Product> plist = productService.selectUserAll();
			
			if(plist != null && plist.size() > 0) {
				model.addAttribute("plist", plist);
				return "product/userProduct";
			}else {
				model.addAttribute("message", 
						"상품 정보가 존재하지 않습니다.");
				return "common/error";
			}
		}
		
//		//상품 상세보기 요청 처리용 ㅇ
//				//id에 해당하는 상품 정보를 검색하여 product 뷰에 전달합니다.
//				@RequestMapping("pdetail.do") //pManagementPage.jsp
//				public String productDetailMethod(
//						@RequestParam("product_seq_id") int product_seq_id, 
//						Model model) {
//					
//					Product product= productService.selectProduct(product_seq_id);				
//					
//					if(product != null) {
//						model.addAttribute("product", product);
//								
//							return "product/productMerchantDetailView";
//														
//					}else {
//						model.addAttribute("message", 
//								product_seq_id + "번 상품 상세보기 조회 실패!");
//						return "common/error";
//					}
//				}
//	
	
	
	
	 
	
	
	
//상품명 검색용 // pManagementPage.jsp ㅇ
	@RequestMapping(value="psearchProductName.do", method= {RequestMethod.POST, RequestMethod.GET})  //pManagementPage.jsp
	public String productSearchNameMethod(
			@RequestParam("keyword") String keyword, 
			Model model) {
		
		ArrayList<Product> list = 
				productService.selectSearchProductName(keyword);
		
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "product/pManagementPage";
		}else {
			model.addAttribute("message", 
				keyword + "로 검색된 상품 정보가 없습니다.");
			return "common/error";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//product_seq_id
	
//상품 상세보기 요청 처리용 ㅇ
		//id에 해당하는 상품 정보를 검색하여 product 뷰에 전달합니다.
		@RequestMapping("pdetail.do") //pManagementPage.jsp
		public String productDetailMethod(
				@RequestParam("product_no") int product_no, 
				Model model) {
			
			Product product= productService.selectProduct(product_no);				
			
			if(product != null) {
				model.addAttribute("product", product); //jsp 에서 쓰겠다
						
					return "product/productMerchantDetailView";
												
			}else {
				model.addAttribute("message", 
						product_no + "번 상품 상세보기 조회 실패!");
				return "common/error";
			}
		}
	
	
	
	
//		
//		//상품 이름 가져오기
//				//id에 해당하는 상품 정보를 검색하여 product 뷰에 전달합니다.
//				@RequestMapping("pdetail.do") //userProduct.jsp
//				public String userProductMethod(
//						@RequestParam("product_seq_id") int product_seq_id, 
//						Model model) {
//					
//					Product product= productService.selectProduct(product_seq_id);				
//					
//					if(product != null) {
//						model.addAttribute("product", product);
//								
//							return "product/userProduct";
//														
//					}else {
//						model.addAttribute("message", 
//								product_seq_id + "번 상품 상세보기 조회 실패!");
//						return "common/error";
//					}
//				}
//			
	
	
			
			
		
			
		
		
		
		
//상품 수정페이지로 이동 요청 처리용 ㅇ
		@RequestMapping("pmoveup.do") //productMerchantDetailView.jsp
		public String moveUpdatePage(
				@RequestParam("product_no") int product_no, 
				Model model) {
			//상품페이지에 출력할 해당 상품정보 다시 조회함
			Product product = productService.selectProduct(product_no);
			
			if(product != null) {
				model.addAttribute("product", product);
				return "product/productUpdateForm";
			}else {
				model.addAttribute("message", 
						product_no + "번 공지글 수정페이지로 이동 실패!");
				return "common/error";
			}
		}
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//상품 수정 요청 처리용 (파일 업로드 기능 사용) - 썸네일
		@RequestMapping(value="pupdate.do", method= {RequestMethod.GET, RequestMethod.POST}) //productUpdateForm.jsp
		public String productUpdateMethod(
				Product product, Model model, HttpServletRequest request,
				@RequestParam(name="delflag", required=false) String delFlag,
				@RequestParam(name="upfile", required=false) MultipartFile mfile) {
			logger.info(delFlag);
			//상품 이미지 저장 폴더 경로
			String savePath = request.getSession()
					.getServletContext().getRealPath(
						"resources/img/product-img");
			
			logger.info(savePath);
			if(product.getOriginal_filepath() != null 
					&& delFlag != null && delFlag.equals("yes")) {
				//저장 폴더에 있는 파일을 삭제함
				new File(savePath + "\\" + product.getRename_filepath()).delete();
				//파일 정보도 제거함
				product.setOriginal_filepath(null);
				product.setRename_filepath(null);
			}			

			//새로운 첨부파일이 있을때
			if(!mfile.isEmpty()) {
				
				if(product.getOriginal_filepath() != null) {
					//저장 폴더에 있는 이전 파일을 삭제
					new File(savePath + "\\" 
							+ product.getRename_filepath()).delete();
					//이전 파일 정보도 제거함
					product.setOriginal_filepath(null);
					product.setRename_filepath(null);
				}		
				//전송온 파일이름 추출함
				String fileName = mfile.getOriginalFilename();
				logger.info(fileName);
				//변경 파일명 : 년월일시분초.확장자
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
						model.addAttribute("message", 
								"첨부파일 저장 실패!");
						return "common/error";
					} 				
					//product 객체에 첨부파일 정보 기록 저장
					product.setOriginal_filepath(fileName);
					product.setRename_filepath(renameFileName);					
				} //이름바꾸기			
			}  //새로운 첨부파일이 있을 때				
			if(productService.updateProduct(product) > 0) {
				//상품 수정 성공시 목록 보기 페이지로 이동
				return "redirect:productList.do";			
			}else {
				model.addAttribute("message", 
						product.getProduct_no() + "번 공지 수정 실패!");
				return "common/error";
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		




		
		
		//상품 삭제 요청 처리용 //+썸네일말고도 상품내용첨부파일들도 같이 삭제하는 코드를 작성해야된다
		@RequestMapping("pdel.do")
		public String productDeleteMethod( //productMerchantDetailView.jsp
				@RequestParam("product_seq_id") int product_seq_id,
				@RequestParam(name="rfile", required=false) String renameFileName,
				Model model, HttpServletRequest request) {
			
			if(productService.deleteProduct(product_seq_id) > 0) {
				//썸네일 있는 상품일때 저장 폴더에 있는 첨부파일(이미지)도 삭제
				if(renameFileName != null) {
					//상품 첨부파일(이미지) 저장 폴더 경로 지정
					String savePath = request.getSession()
							.getServletContext().getRealPath(
								"resources/img/product-img");
					
					new File(savePath + "\\" + renameFileName).delete();
				}
				
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", 
						product_seq_id + "번 상품 삭제 실패!");
				return "common/error";
			}
		}
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		//새 상품 등록 페이지로 이동 처리용
		@RequestMapping("moveProductWrite.do")
		public String moveWritePage() {
			
			return "product/productWriteForm";
			
		}
		
		
		
		
		//등록
		@RequestMapping(value="pinsert.do", method=RequestMethod.POST)
		public String productInsertMethod(
				Product product, Model model, 
				HttpServletRequest request,	
				@RequestParam(name="upfile", required=false) MultipartFile mfile){		
			
			
			//상품 첨부파일(이미지) 저장 폴더 경로
			String savePath = request.getSession()
					.getServletContext().getRealPath("resources/img/product-img");	
			
			logger.info(savePath);
			
			//첨부파일이 있을때
			if(!mfile.isEmpty()) {
				//전송온 파일이름 추출함
				String fileName = mfile.getOriginalFilename();

				logger.info(fileName);
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
					
					//product 객체에 첨부파일 정보 기록 저장
					product.setOriginal_filepath(fileName);
					product.setRename_filepath(renameFileName);
				} //이름바꾸기
			}  //새로운 첨부파일이 있을 때		
			
			if(productService.insertProduct(product) > 0) {
				
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", "상품 등록 실패!");
				return "common/error";
			}
		}
		
		
		
		
		
/*	
	
		//상품 등록 요청 처리용 (파일 업로드 기능 사용)
		@RequestMapping(value="pinsert.do", method=RequestMethod.POST)
		public String productInsertMethod(
				Product product, Model model, 
				HttpServletRequest request,	
//				@RequestParam(name="upfile", required=false) MultipartFile mfile,
				@RequestParam(name="upfiles[]", required=false) List<MultipartFile> mfiles,
				@RequestParam(name="content[]", required=false) List<String> content){
			
			//상품 첨부파일(이미지) 저장 폴더 경로
			String savePath = request.getSession()
					.getServletContext().getRealPath(
						"resources/img/product-img");		
			
			//첨부파일이 있을때
			if(mfiles != null && mfiles.size() > 0) {
				List<String> originalFileNames = new ArrayList<String>();
				List<String> renameFileNames = new ArrayList<String>();
				
				//전송온 파일들을 모두 처리함
				for(MultipartFile mfile : mfiles) {
					//전송온 파일이름 추출함
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
						
						originalFileNames.add(fileName);
						renameFileNames.add(renameFileName);
					} //이름바꾸기
				}  //새로운 첨부파일이 있을 때	
				
				//product 객체에 첨부파일 정보 기록 저장
				product.setOriginal_filepath(String.join(",", originalFileNames));
				product.setRename_filepath(String.join(",", renameFileNames));
			}
		//?	
			if(productService.insertProduct(product) > 0) {
				//등록 성공시 목록 보기 페이지로 이동
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", "새 상품 등록 실패!");
				return "common/error";
			}
		}

*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		  // 상품을 추가하는 메소드
//		  @RequestMapping(value = "pinsert.do", method = RequestMethod.POST)
//		  public String addProduct(Product product, @RequestParam("file_0") MultipartFile thumbnail,
//		                            HttpServletRequest request) {
//		    // 썸네일 및 다른 첨부 파일 저장
//		    String thumbnailUrl = saveFile(thumbnail, request);
//		    product.setThumb_url(thumbnailUrl);
//
//		    // 다른 첨부파일 처리
//		    for (int i = 1; i < Integer.MAX_VALUE; i++) {
//		      MultipartFile file = request.getFile("file_" + i);
//		      if (file == null) {
//		        break;
//		      }
//
//		      // 현재 파일을 저장하고 상품 객체에 URL 설정
//		      String fileUrl = saveFile(file, request);
//		      // 상품 객체에 파일 URL을 설정할 수 있습니다
//		    }
//
//		    productService.addProduct(product); // 상품을 데이터베이스에 저장
//		    return "redirect:/products"; // 상품 목록 페이지로 리다이렉트
//		  }


	
	
}
