package org.oaoc.cookology.product.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.product.model.dao.ProductDao;
import org.oaoc.cookology.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;

	
	@Override
	public ArrayList<Product> selectAll() {
		
		return productDao.selectAll();

	}

	

	@Override
	public ArrayList<Product> selectSearchProductName(String keyword) {
		
		return productDao.selectSearchProductName(keyword);
	}
	
	


	@Override
	public Product selectProduct(int product_no) {
		return productDao.selectProduct(product_no);
	}
	
	
	@Override
	public Product selectNameProduct(String product_name) {
		return productDao.selectNameProduct(product_name);
	}





	@Override
	public int updateProduct(Product product) {
		
		return productDao.updateProduct(product);
	}
	
	
	

	@Override
	public int deleteProduct(int product_seq_id) {
		
		return productDao.deleteProduct(product_seq_id);
	}
	
	
	


	@Override
	public ArrayList<Product> selectUserAll() {
		return productDao.selectUserAll();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	@Override
	public int insertProduct(Product product) {
		return productDao.insertProduct(product);
	}



	
	

	@Override
	public ArrayList<Product> findByTag(String tag) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Product> search(int product_seq_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateSave(Product product) {
		// TODO Auto-generated method stub
		return 0;
	}



	


//
//	@Override
//	public ArrayList<Product> selectSearchDate(SearchDate searchDate) {
//		// TODO Auto-generated method stub
//		return null;
//	}




}
