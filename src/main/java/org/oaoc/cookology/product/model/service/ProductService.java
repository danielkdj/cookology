package org.oaoc.cookology.product.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.product.model.vo.Product;

public interface ProductService {

	
	
	//상품 리스트 조회
	ArrayList<Product> selectAll();
	
	
	
	
	
	
	
	//상품명으로 검색
	ArrayList<Product> selectSearchProductName(String keyword);
	
	
	//상품 상세보기 요청 처리용
	Product selectProduct(int product_no);
	
	Product selectNameProduct(String product_name);
	
	
	//상품수정
	int updateProduct(Product product);
	
	
	//상품삭제
	int deleteProduct(int product_seq_id);
	
	
	//추가
	int insertProduct(Product product);	
	
	
	
	//유저 상품 리스트 조회
		ArrayList<Product> selectUserAll();
	
	
	
	
	
	

	//모든  태그
	ArrayList<Product> findByTag(String tag);

	//검색
	ArrayList<Product> search(int product_seq_id);
	


	
	
	//저장
	int updateSave(Product product);
	



}
