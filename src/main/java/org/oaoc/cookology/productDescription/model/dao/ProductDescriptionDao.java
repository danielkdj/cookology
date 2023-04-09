package org.oaoc.cookology.productDescription.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.common.SearchDate;
import org.oaoc.cookology.common.Searchs;
import org.oaoc.cookology.productDescription.model.vo.ProductDescription;
import org.oaoc.cookology.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("ProductDescriptionDao")  //xml
public class ProductDescriptionDao {
		
	
	
	
	
	
	
		@Autowired  //root-context.xml
		private SqlSessionTemplate session;

		public ProductDescription selectProductDescription(int product_seq_id) {
			return session.selectOne("productDescriptionMapper.selectProductDescription", product_seq_id );
		}

		public int insertProductDescription(ProductDescription productDescription) {
			return session.insert("productDescriptionMapper.insertProductDescription", productDescription);
		}

		public int deleteProductDescription(int product_seq_id) {
			return session.delete("productDescriptionMapper.deleteProductDescription", product_seq_id);
		}  
		
		
	
	
	

}
