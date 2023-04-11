package org.oaoc.cookology.recipe.controller;

import org.oaoc.cookology.recipe.model.service.RecipeService;
import org.oaoc.cookology.recipe.model.vo.Recipe;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
	public class RecipeController {
	// 이 컨트롤러 안의 메소드들이 구동되었는지 확인하는 로그를 출력하기 위한 로그 객체를 생성
	private static final Logger logger = LoggerFactory.getLogger(RecipeController.class);

	@Autowired  // 자동 의존성 주입(DI) : 자동 객체 생성됨
	private RecipeService recipeService;

	// 레시피 페이지 이동 메소드 (레시피 최근 목록순, 레시피 조회수별 목록 출력)
	@RequestMapping(value = "rpage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView MoveRecipePage() {
		ModelAndView modelAndView = new ModelAndView("recipe/recipePage");

		List<Recipe> recipe = recipeService.recipeSelectList();
		List<Recipe> mvrecipe = recipeService.recipeSelectViewRownum();
		logger.info("레시피 페이지로 이동합니다.");

		if (recipe == null || recipe.isEmpty()) {
			modelAndView.addObject("recipeerror", "최근순 목록 불러오기 실패");
			logger.info("최근순 목록 불러오기 실패");
		} else {
			modelAndView.addObject("recipe", recipe);
			logger.info("최근순 목록 불러오기 성공");
		}

		if (mvrecipe == null || mvrecipe.isEmpty()) {
			modelAndView.addObject("mostViewedRecipesError", "조회수 순 목록 불러오기 실패");
			logger.info("조회수 순 목록 불러오기 실패");
		} else {
			modelAndView.addObject("mvrecipe", mvrecipe);
			logger.info("조회수 순 목록 불러오기 성공");
		}
		return modelAndView;
	}

	// 레시피 상세 페이지 이동 메소드
	@RequestMapping(value="rlistpage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveRecipeListPage() {
		logger.info("레시피 목록 페이지로 이동합니다.");
		return "recipe/recipeListPage";
	}
	// MY레시피 페이지 이동 메소드
	@RequestMapping(value="myrpage.do", method={ RequestMethod.GET, RequestMethod.POST })
	public String moveMyRecipePage() {
		logger.info("마이 레시피 페이지로 이동합니다.");
		return "recipe/myRecipePage";
	}

	// 레시피 조회 메소드(매개변수로 사용자 검색창 입력값을 받아옴)

	@RequestMapping(value = "rsearchlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectSearchKeywordRecipeListMethod(@RequestParam("keyword") String keyword) {
		ModelAndView modelAndView = new ModelAndView("recipe/recipePage");

		List<Recipe> searchresult = recipeService.selectSearchKeywordRecipeList(keyword);
		List<Recipe> mvrecipe = recipeService.recipeSelectViewRownum();

		if (searchresult == null || searchresult.isEmpty()) {
			modelAndView.addObject("searchresultserror", "검색 결과가 없습니다.");
			logger.info("검색 결과가 없습니다.");
		} else {
			modelAndView.addObject("searchresult", searchresult);
			logger.info("검색 성공.");
		}

		if (mvrecipe == null || mvrecipe.isEmpty()) {
			modelAndView.addObject("mostviewrecipeerror", "조회수 순 목록 불러오기 실패");
			logger.info("조회수 순 목록 불러오기 실패");
		} else {
			modelAndView.addObject("mvrecipe", mvrecipe);
			logger.info("조회수 순 목록 불러오기 성공");
		}
		return modelAndView;
	}

	// 레시피 검색 메소드(레시피 고유번호)
	@RequestMapping(value="recipeid.do", method={ RequestMethod.GET, RequestMethod.POST })
	public Recipe recipeSelectOne(@RequestParam("recipe_seq_id") int recipe_seq_id) {
		return recipeService.recipeSelectOne(recipe_seq_id);
	}

/*	// 레시피 등록 메소드(등록페이지)
	@RequestMapping("rinsert.do")
	public Recipe insertRecipe(@RequestBody Recipe recipe) {
		return recipeService.insertRecipe(recipe);
	}*/

/*	// 레시피 수정 메소드(등록페이지)
	@RequestMapping("rupdate.do")
	public Recipe updateRecipe(@RequestBody Recipe recipe) {
		return recipeService.updateRecipe(recipe);
	}*/

/*	// 레시피 삭제 메소드(등록페이지)
	@RequestMapping("rdelete.do")
	public int deleteRecipe(@RequestBody Recipe recipe) {
		return recipeService.deleteRecipe(recipe);
	}*/
}