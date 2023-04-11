package org.oaoc.cookology.recipe.model.service;

import org.oaoc.cookology.recipe.model.dao.RecipeDao;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service("recipeService")
public class RecipeServiceImpl implements RecipeService {

	// RecipeDao 객체를 자동으로 주입받음
	@Autowired
	RecipeDao recipeDao;

	// 레시피 고유번호로 검색
	@Override
	public Recipe recipeSelectOne(int recipe_seq_id) {
		return recipeDao.recipeSelectOne(recipe_seq_id);
	}

	// 레시피 전체 목록 검색
	@Override
	public ArrayList<Recipe> recipeSelectList() {
		return recipeDao.recipeSelectList();
	}

	// 레시피 목록 출력(Rownum 6개)
	@Override
	public ArrayList<Recipe> recipeSelectListRownum() {
		return recipeDao.recipeSelectListRownum();
	}
	// 레시피 목록 출력(조회수 순 5개)
	@Override
	public ArrayList<Recipe> recipeSelectViewRownum() {
		return recipeDao.recipeSelectViewRownum();
	}
	// 레시피 등록
	@Override
	public Recipe insertRecipe(Recipe recipe) {
		return recipeDao.insertRecipe(recipe);
	}

	// 레시피 수정
	@Override
	public Recipe updateRecipe(Recipe recipe) {
		return recipeDao.updateRecipe(recipe);
	}

	// 레시피 삭제
	@Override
	public int deleteRecipe(Recipe recipe) {
		return recipeDao.deleteRecipe(recipe);
	}

	@Override
	public ArrayList<Recipe> selectSearchList(Recipe recipe) {
		return null;
	}

	// 레시피 조회(레시피 고유번호, 사용자 알러지, 레시피 알러지)
	@Override
	public ArrayList<Recipe> selectSearchKeywordRecipeList(String keyword) {
		return recipeDao.selectSearchKeywordRecipeList(keyword);
	}
}
