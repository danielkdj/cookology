package org.oaoc.cookology.productDescription.model.service;

import java.util.ArrayList;

import org.oaoc.cookology.productDescription.model.vo.ProductDescription;


public interface ProductDescriptionService {
	
	
	
	ProductDescription selectProductDescription(int product_seq_id);

	/* ArrayList<ProductDescription> selectList(); */
	int insertProductDescription(ProductDescription productDescription);
	int deleteProductDescription(int product_seq_id);	
	
	
	
	
	
	
}










