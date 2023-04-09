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
	//���� ��ǰ ����Ʈ �̵� ��
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
		
		
		
		

		
		
//		//���� ��ǰ �󼼺��� ��û ó���� ��
//				//id�� �ش��ϴ� ��ǰ ������ �˻��Ͽ� product �信 �����մϴ�.
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
//								product_seq_id + "�� ��ǰ �󼼺��� ��ȸ ����!");
//						return "common/error";
//					}
//				}
		
		
		
		
	
//��ǰ������ ��ǰ��ü��� ��ȸ ó���� ��
	//��ǰ ����� �𵨿� ��� productList ��� �����մϴ�.
	@RequestMapping("productList.do")
	public String productListMethod(Model model) { //pManagementPage.jsp
		ArrayList<Product> list = productService.selectAll();
		
//		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			return "product/pManagementPage";
//		}else {
//			model.addAttribute("message", 
//					"��ǰ ������ �������� �ʽ��ϴ�.");
//			return "common/error";
//		}
	}
	
	
	
	//��ǰ ����  ��� ��ȸ ó���� 	
		@RequestMapping("productUserList.do")
		public String productUserListMethod(Model model) { //userProduct.jsp
			ArrayList<Product> plist = productService.selectUserAll();
			
			if(plist != null && plist.size() > 0) {
				model.addAttribute("plist", plist);
				return "product/userProduct";
			}else {
				model.addAttribute("message", 
						"��ǰ ������ �������� �ʽ��ϴ�.");
				return "common/error";
			}
		}
		
//		//��ǰ �󼼺��� ��û ó���� ��
//				//id�� �ش��ϴ� ��ǰ ������ �˻��Ͽ� product �信 �����մϴ�.
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
//								product_seq_id + "�� ��ǰ �󼼺��� ��ȸ ����!");
//						return "common/error";
//					}
//				}
//	
	
	
	
	 
	
	
	
//��ǰ�� �˻��� // pManagementPage.jsp ��
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
				keyword + "�� �˻��� ��ǰ ������ �����ϴ�.");
			return "common/error";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//product_seq_id
	
//��ǰ �󼼺��� ��û ó���� ��
		//id�� �ش��ϴ� ��ǰ ������ �˻��Ͽ� product �信 �����մϴ�.
		@RequestMapping("pdetail.do") //pManagementPage.jsp
		public String productDetailMethod(
				@RequestParam("product_no") int product_no, 
				Model model) {
			
			Product product= productService.selectProduct(product_no);				
			
			if(product != null) {
				model.addAttribute("product", product); //jsp ���� ���ڴ�
						
					return "product/productMerchantDetailView";
												
			}else {
				model.addAttribute("message", 
						product_no + "�� ��ǰ �󼼺��� ��ȸ ����!");
				return "common/error";
			}
		}
	
	
	
	
//		
//		//��ǰ �̸� ��������
//				//id�� �ش��ϴ� ��ǰ ������ �˻��Ͽ� product �信 �����մϴ�.
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
//								product_seq_id + "�� ��ǰ �󼼺��� ��ȸ ����!");
//						return "common/error";
//					}
//				}
//			
	
	
			
			
		
			
		
		
		
		
//��ǰ ������������ �̵� ��û ó���� ��
		@RequestMapping("pmoveup.do") //productMerchantDetailView.jsp
		public String moveUpdatePage(
				@RequestParam("product_no") int product_no, 
				Model model) {
			//��ǰ�������� ����� �ش� ��ǰ���� �ٽ� ��ȸ��
			Product product = productService.selectProduct(product_no);
			
			if(product != null) {
				model.addAttribute("product", product);
				return "product/productUpdateForm";
			}else {
				model.addAttribute("message", 
						product_no + "�� ������ ������������ �̵� ����!");
				return "common/error";
			}
		}
	
	
	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//��ǰ ���� ��û ó���� (���� ���ε� ��� ���) - �����
		@RequestMapping(value="pupdate.do", method= {RequestMethod.GET, RequestMethod.POST}) //productUpdateForm.jsp
		public String productUpdateMethod(
				Product product, Model model, HttpServletRequest request,
				@RequestParam(name="delflag", required=false) String delFlag,
				@RequestParam(name="upfile", required=false) MultipartFile mfile) {
			logger.info(delFlag);
			//��ǰ �̹��� ���� ���� ���
			String savePath = request.getSession()
					.getServletContext().getRealPath(
						"resources/img/product-img");
			
			logger.info(savePath);
			if(product.getOriginal_filepath() != null 
					&& delFlag != null && delFlag.equals("yes")) {
				//���� ������ �ִ� ������ ������
				new File(savePath + "\\" + product.getRename_filepath()).delete();
				//���� ������ ������
				product.setOriginal_filepath(null);
				product.setRename_filepath(null);
			}			

			//���ο� ÷�������� ������
			if(!mfile.isEmpty()) {
				
				if(product.getOriginal_filepath() != null) {
					//���� ������ �ִ� ���� ������ ����
					new File(savePath + "\\" 
							+ product.getRename_filepath()).delete();
					//���� ���� ������ ������
					product.setOriginal_filepath(null);
					product.setRename_filepath(null);
				}		
				//���ۿ� �����̸� ������
				String fileName = mfile.getOriginalFilename();
				logger.info(fileName);
				//���� ���ϸ� : ����Ͻú���.Ȯ����
				if(fileName != null && fileName.length() > 0) {			
					String renameFileName = FileNameChange.change(
							fileName, "yyyyMMddHHmmss");			
					logger.info("÷�� ���ϸ� Ȯ�� : " + fileName 
									+ ", " + renameFileName);								
					//������ ���� ó��
					try {
						mfile.transferTo(new File(
								savePath + "\\" + renameFileName));
					} catch (Exception e) {					
						e.printStackTrace();
						model.addAttribute("message", 
								"÷������ ���� ����!");
						return "common/error";
					} 				
					//product ��ü�� ÷������ ���� ��� ����
					product.setOriginal_filepath(fileName);
					product.setRename_filepath(renameFileName);					
				} //�̸��ٲٱ�			
			}  //���ο� ÷�������� ���� ��				
			if(productService.updateProduct(product) > 0) {
				//��ǰ ���� ������ ��� ���� �������� �̵�
				return "redirect:productList.do";			
			}else {
				model.addAttribute("message", 
						product.getProduct_no() + "�� ���� ���� ����!");
				return "common/error";
			}
		}
		
		
		
		
		
		
		
		
		
		
		
	
		
		
		
		
		
		
		
		




		
		
		//��ǰ ���� ��û ó���� //+����ϸ��� ��ǰ����÷�����ϵ鵵 ���� �����ϴ� �ڵ带 �ۼ��ؾߵȴ�
		@RequestMapping("pdel.do")
		public String productDeleteMethod( //productMerchantDetailView.jsp
				@RequestParam("product_seq_id") int product_seq_id,
				@RequestParam(name="rfile", required=false) String renameFileName,
				Model model, HttpServletRequest request) {
			
			if(productService.deleteProduct(product_seq_id) > 0) {
				//����� �ִ� ��ǰ�϶� ���� ������ �ִ� ÷������(�̹���)�� ����
				if(renameFileName != null) {
					//��ǰ ÷������(�̹���) ���� ���� ��� ����
					String savePath = request.getSession()
							.getServletContext().getRealPath(
								"resources/img/product-img");
					
					new File(savePath + "\\" + renameFileName).delete();
				}
				
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", 
						product_seq_id + "�� ��ǰ ���� ����!");
				return "common/error";
			}
		}
		
		
		
	
		
		
		
		
		
		
		
		
		
		
		//�� ��ǰ ��� �������� �̵� ó����
		@RequestMapping("moveProductWrite.do")
		public String moveWritePage() {
			
			return "product/productWriteForm";
			
		}
		
		
		
		
		//���
		@RequestMapping(value="pinsert.do", method=RequestMethod.POST)
		public String productInsertMethod(
				Product product, Model model, 
				HttpServletRequest request,	
				@RequestParam(name="upfile", required=false) MultipartFile mfile){		
			
			
			//��ǰ ÷������(�̹���) ���� ���� ���
			String savePath = request.getSession()
					.getServletContext().getRealPath("resources/img/product-img");	
			
			logger.info(savePath);
			
			//÷�������� ������
			if(!mfile.isEmpty()) {
				//���ۿ� �����̸� ������
				String fileName = mfile.getOriginalFilename();

				logger.info(fileName);
				if(fileName != null && fileName.length() > 0) {
					//�ٲ� ���ϸ� ���� ���ڿ� �����				
					String renameFileName = FileNameChange.change(
							fileName, "yyyyMMddHHmmss");
					
					logger.info("÷�� ���ϸ� Ȯ�� : " + fileName 
									+ ", " + renameFileName);			
						
					//������ ���� ó��
					try {
						mfile.transferTo(new File(
								savePath + "\\" + renameFileName));
					} catch (Exception e) {					
						e.printStackTrace();
						model.addAttribute("message", 
								"÷������ ���� ����!");
						return "common/error";
					} 
					
					//product ��ü�� ÷������ ���� ��� ����
					product.setOriginal_filepath(fileName);
					product.setRename_filepath(renameFileName);
				} //�̸��ٲٱ�
			}  //���ο� ÷�������� ���� ��		
			
			if(productService.insertProduct(product) > 0) {
				
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", "��ǰ ��� ����!");
				return "common/error";
			}
		}
		
		
		
		
		
/*	
	
		//��ǰ ��� ��û ó���� (���� ���ε� ��� ���)
		@RequestMapping(value="pinsert.do", method=RequestMethod.POST)
		public String productInsertMethod(
				Product product, Model model, 
				HttpServletRequest request,	
//				@RequestParam(name="upfile", required=false) MultipartFile mfile,
				@RequestParam(name="upfiles[]", required=false) List<MultipartFile> mfiles,
				@RequestParam(name="content[]", required=false) List<String> content){
			
			//��ǰ ÷������(�̹���) ���� ���� ���
			String savePath = request.getSession()
					.getServletContext().getRealPath(
						"resources/img/product-img");		
			
			//÷�������� ������
			if(mfiles != null && mfiles.size() > 0) {
				List<String> originalFileNames = new ArrayList<String>();
				List<String> renameFileNames = new ArrayList<String>();
				
				//���ۿ� ���ϵ��� ��� ó����
				for(MultipartFile mfile : mfiles) {
					//���ۿ� �����̸� ������
					String fileName = mfile.getOriginalFilename();
					
					if(fileName != null && fileName.length() > 0) {
						//�ٲ� ���ϸ� ���� ���ڿ� �����				
						String renameFileName = FileNameChange.change(
								fileName, "yyyyMMddHHmmss");
						
						logger.info("÷�� ���ϸ� Ȯ�� : " + fileName 
										+ ", " + renameFileName);			
							
						//������ ���� ó��
						try {
							mfile.transferTo(new File(
									savePath + "\\" + renameFileName));
						} catch (Exception e) {					
							e.printStackTrace();
							model.addAttribute("message", 
									"÷������ ���� ����!");
							return "common/error";
						} 
						
						originalFileNames.add(fileName);
						renameFileNames.add(renameFileName);
					} //�̸��ٲٱ�
				}  //���ο� ÷�������� ���� ��	
				
				//product ��ü�� ÷������ ���� ��� ����
				product.setOriginal_filepath(String.join(",", originalFileNames));
				product.setRename_filepath(String.join(",", renameFileNames));
			}
		//?	
			if(productService.insertProduct(product) > 0) {
				//��� ������ ��� ���� �������� �̵�
				return "redirect:productList.do";
			}else {
				model.addAttribute("message", "�� ��ǰ ��� ����!");
				return "common/error";
			}
		}

*/
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//		  // ��ǰ�� �߰��ϴ� �޼ҵ�
//		  @RequestMapping(value = "pinsert.do", method = RequestMethod.POST)
//		  public String addProduct(Product product, @RequestParam("file_0") MultipartFile thumbnail,
//		                            HttpServletRequest request) {
//		    // ����� �� �ٸ� ÷�� ���� ����
//		    String thumbnailUrl = saveFile(thumbnail, request);
//		    product.setThumb_url(thumbnailUrl);
//
//		    // �ٸ� ÷������ ó��
//		    for (int i = 1; i < Integer.MAX_VALUE; i++) {
//		      MultipartFile file = request.getFile("file_" + i);
//		      if (file == null) {
//		        break;
//		      }
//
//		      // ���� ������ �����ϰ� ��ǰ ��ü�� URL ����
//		      String fileUrl = saveFile(file, request);
//		      // ��ǰ ��ü�� ���� URL�� ������ �� �ֽ��ϴ�
//		    }
//
//		    productService.addProduct(product); // ��ǰ�� �����ͺ��̽��� ����
//		    return "redirect:/products"; // ��ǰ ��� �������� �����̷�Ʈ
//		  }


	
	
}
