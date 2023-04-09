package org.oaoc.cookology.product.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;




@Repository("productDao")
public class ProductDao {
	


			@Autowired
			private SqlSessionTemplate session;

			
			
			public ArrayList<Product> selectAll() {
				List<Product> list = session.selectList("productMapper.selectAll");
				return (ArrayList<Product>)list;

			}

			
			public ArrayList<Product> selectSearchProductName(String keyword) {
				List<Product> list = session.selectList("productMapper.selectSearchProductName", keyword);
				return (ArrayList<Product>)list;
			}
		
			public Product selectProduct(int product_no) {
				return session.selectOne("productMapper.selectProduct", product_no);
			}
			
			
			public Product selectNameProduct(String product_name) {
				return session.selectOne("productMapper.selectNameProduct", product_name);
			}

			
			
			public int updateProduct(Product product) {
				
				return session.update("productMapper.updateProduct", product);
			}
			
			
			
			public int deleteProduct(int product_seq_id) {
				
				return session.delete("productMapper.deleteProduct", product_seq_id);
			}
			
			
			
			public ArrayList<Product> selectUserAll() {
				List<Product> plist = session.selectList("productMapper.selectUserAll");
				return (ArrayList<Product>)plist;
			}

			
			
			
			
			
			
			
			
			
			
			public Product findById(Long id) {
				return null;

			}

			
			public Product save(Product product) {
				
				return product;
				
			}

			
			public Product update(Long id, Product product) {
				return product;

			}

			
			public void delete(Long id) {

			}

			
			public ArrayList<Product> findByCategory(String category) {
				return null;

			}

			
			public ArrayList<Product> search(String keyword) {
				return null;

			}

			
			public int insertProduct(Product product) {
				return session.insert("productMapper.insertProduct", product);
			}


			
			
			

			
			


			
}
