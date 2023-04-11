package org.oaoc.cookology.recipe.model.service;

import org.oaoc.cookology.recipe.model.vo.Recipe;

import java.util.ArrayList;

// 스프링에서는 모델의 서비스 클래스는 인터페이스로 만들도록 정해져 있음
public interface RecipeService {

	// 레시피 고유번호로 검색
	Recipe recipeSelectOne(int recipe_seq_id);

	// 레시피 전체 목록 검색
	ArrayList<Recipe> recipeSelectList();

	// 레시피 목록 검색(Rownum 6개)
	ArrayList<Recipe> recipeSelectListRownum();
	// 레시피 목록 출력(조회수 순 5개)
	ArrayList<Recipe> recipeSelectViewRownum();
	// 레시피 등록
	Recipe insertRecipe(Recipe recipe);

	// 레시피 수정
	Recipe updateRecipe(Recipe recipe);

	// 레시피 삭제
	int deleteRecipe(Recipe recipe);

	// 레시피 조회(서치바 입력값 키워드 검색)
	ArrayList<Recipe> selectSearchKeywordRecipeList(String keyword);

	// 레시피 조회(레시피 고유번호, 사용자 알러지, 레시피 알러지)
	ArrayList<Recipe> selectSearchList(Recipe recipe);
}










