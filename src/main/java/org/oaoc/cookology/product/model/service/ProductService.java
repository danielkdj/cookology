package org.oaoc.cookology.product.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.client.model.vo.Client;
import org.oaoc.cookology.product.model.vo.Product;

public interface ProductService {

	
	
	//��ǰ ����Ʈ ��ȸ
	ArrayList<Product> selectAll();
	
	
	
	
	
	
	
	//��ǰ������ �˻�
	ArrayList<Product> selectSearchProductName(String keyword);
	
	
	//��ǰ �󼼺��� ��û ó����
	Product selectProduct(int product_no);
	
	Product selectNameProduct(String product_name);
	
	
	//��ǰ����
	int updateProduct(Product product);
	
	
	//��ǰ����
	int deleteProduct(int product_seq_id);
	
	
	//�߰�
	int insertProduct(Product product);	
	
	
	
	//���� ��ǰ ����Ʈ ��ȸ
		ArrayList<Product> selectUserAll();
	
	
	
	
	
	

	//���  �±�
	ArrayList<Product> findByTag(String tag);

	//�˻�
	ArrayList<Product> search(int product_seq_id);
	


	
	
	//����
	int updateSave(Product product);
	



}
