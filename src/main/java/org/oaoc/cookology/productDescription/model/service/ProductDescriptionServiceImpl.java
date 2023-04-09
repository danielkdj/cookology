package org.oaoc.cookology.productDescription.model.service;

import java.util.ArrayList;
import java.util.List;

import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.productDescription.model.dao.ProductDescriptionDao;
import org.oaoc.cookology.productDescription.model.vo.ProductDescription;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productDescriptionService") 
public class ProductDescriptionServiceImpl implements ProductDescriptionService {

// Field
	@Autowired  
	ProductDescriptionDao productDescriptionDao;

	@Override
	public ProductDescription selectProductDescription(int product_seq_id) {
		
		return productDescriptionDao.selectProductDescription(product_seq_id);
	}

	
	
	
/*	@Override
	public ArrayList<ProductDescription> selectList() {
		return productDescriptionDao.selectList();
	}*/

	
	
	
	
	@Override
	public int insertProductDescription(ProductDescription productDescription) {
		
		return productDescriptionDao.insertProductDescription(productDescription);
	}

	
	
	
	
	@Override
	public int deleteProductDescription(int product_seq_id) {
		return productDescriptionDao.deleteProductDescription(product_seq_id);
	}


	
	
	


	

//	@Override
//	public int updateUsers(Users users) {
//		return usersDao.updateUsers(users);
//	}



	

}
