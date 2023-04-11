package org.oaoc.cookology.recipe.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository("RecipeDao")  // xml 에 자동 등록됨
public class RecipeDao {

    // MyBatis 사용을 위한 SqlSessionTemplate 객체를 자동으로 주입받음
    @Autowired
    private SqlSessionTemplate sqlSession;

    // 레시피 고유번호로 검색
    public Recipe recipeSelectOne(int recipe_seq_id) {
        return sqlSession.selectOne("RecipeMapper.recipeSelectOne", recipe_seq_id);
    }

    // 고유번호로 레시피리스트 출력
    public ArrayList<Recipe> recipeSelectSeqId() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectSeqId");
        return (ArrayList<Recipe>) list;
    }

    // 레시피 전체 목록 검색
    public ArrayList<Recipe> recipeSelectListRownum() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectListRownum");
        return (ArrayList<Recipe>) list;
    }
    // 레시피 전체 목록 검색(조회수 순)
    public ArrayList<Recipe> recipeSelectViewRownum() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectViewRownum");
        return (ArrayList<Recipe>) list;
    }
    // 레시피 전체 목록 검색
    public ArrayList<Recipe> recipeSelectList() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectList");
        return (ArrayList<Recipe>) list;
    }

    // 제목으로 레시피리스트 검색
    public ArrayList<Recipe> recipeSelectTitle() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectTitle");
        return (ArrayList<Recipe>) list;
    }

    // 설명으로 레시피리스트 검색
    public ArrayList<Recipe> recipeSelectDiscription() {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.recipeSelectDiscription");
        return (ArrayList<Recipe>) list;
    }

    // 레시피 조회(레시피 고유번호, 사용자 알러지, 레시피 알러지)
    public ArrayList<Recipe> selectSearchKeywordRecipeList(String recipe) {
        List<Recipe> list = sqlSession.selectList("RecipeMapper.selectSearchKeywordRecipeList", recipe);
        return (ArrayList<Recipe>) list;
    }

    // 레시피 등록
    public Recipe insertRecipe(Recipe recipe) {
        sqlSession.insert("RecipeMapper.insertRecipe", recipe);
        return recipe;
    }

    // 레시피 수정
    public Recipe updateRecipe(Recipe recipe) {
        sqlSession.update("RecipeMapper.updateRecipe", recipe);
        return recipe;
    }

    // 레시피 삭제
    public int deleteRecipe(Recipe recipe) {
        return sqlSession.delete("RecipeMapper.deleteRecipe", recipe);
    }
}
