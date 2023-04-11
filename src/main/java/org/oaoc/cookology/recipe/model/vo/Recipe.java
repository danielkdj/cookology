package org.oaoc.cookology.recipe.model.vo;

public class Recipe implements java.io.Serializable {

    private static final long serialVersionUID = 5920902628854033976L;

    // Fields
    private int recipe_seq_id; // 레시피 시퀀스 아이디
    private int category_id; // 카테고리 아이디
    private String thumb_url; // 썸네일 이미지 경로
    private String recipe_title; // 레시피 제목
    private String recipe_description; // 레시피 설명
    private String recipe_content; // 레시피 내용
    private String recipe_ingredient; // 레시피 재료
    private int views; // 조회수
    private String recipe_time; // 조리시간
    private String recipe_level; // 조리난이도
    private String serving_dish; // 요리종류
    private char admin_inspection; // 관리자 검수여부
    private String created_at; // 생성일시
    private String modified_at; // 수정일시

    // Constructor
    public Recipe() {}

    public Recipe(int recipe_seq_id, int category_id, String thumb_url, String recipe_title, String recipe_description, String recipe_content, String recipe_ingredient, int views, String recipe_time, String recipe_level, String serving_dish, char admin_inspection, String created_at, String modified_at) {
        this.recipe_seq_id = recipe_seq_id;
        this.category_id = category_id;
        this.thumb_url = thumb_url;
        this.recipe_title = recipe_title;
        this.recipe_description = recipe_description;
        this.recipe_content = recipe_content;
        this.recipe_ingredient = recipe_ingredient;
        this.views = views;
        this.recipe_time = recipe_time;
        this.recipe_level = recipe_level;
        this.serving_dish = serving_dish;
        this.admin_inspection = admin_inspection;
        this.created_at = created_at;
        this.modified_at = modified_at;
    }
    // Methods
    // getters & setters
    public int getRecipe_seq_id() {
        return recipe_seq_id;
    }

    public void setRecipe_seq_id(int recipe_seq_id) {
        this.recipe_seq_id = recipe_seq_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getThumb_url() {
        return thumb_url;
    }

    public void setThumb_url(String thumb_url) {
        this.thumb_url = thumb_url;
    }

    public String getRecipe_title() {
        return recipe_title;
    }

    public void setRecipe_title(String recipe_title) {
        this.recipe_title = recipe_title;
    }

    public String getRecipe_description() {
        return recipe_description;
    }

    public void setRecipe_description(String recipe_description) {
        this.recipe_description = recipe_description;
    }

    public String getRecipe_content() {
        return recipe_content;
    }

    public void setRecipe_content(String recipe_content) {
        this.recipe_content = recipe_content;
    }

    public String getRecipe_ingredient() {
        return recipe_ingredient;
    }

    public void setRecipe_ingredient(String recipe_ingredient) {
        this.recipe_ingredient = recipe_ingredient;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public String getRecipe_time() {
        return recipe_time;
    }

    public void setRecipe_time(String recipe_time) {
        this.recipe_time = recipe_time;
    }

    public String getRecipe_level() {
        return recipe_level;
    }

    public void setRecipe_level(String recipe_level) {
        this.recipe_level = recipe_level;
    }

    public String getServing_dish() {
        return serving_dish;
    }

    public void setServing_dish(String serving_dish) {
        this.serving_dish = serving_dish;
    }

    public char getAdmin_inspection() {
        return admin_inspection;
    }

    public void setAdmin_inspection(char admin_inspection) {
        this.admin_inspection = admin_inspection;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }

    public String getModified_at() {
        return modified_at;
    }

    public void setModified_at(String modified_at) {
        this.modified_at = modified_at;
    }

    // toString
    @Override
    public String toString() {
        return "Recipe [recipe_seq_id=" + recipe_seq_id + ", category_id=" + category_id + ", thumb_url=" + thumb_url + ", recipe_title=" + recipe_title + ", recipe_description=" + recipe_description + ", recipe_content=" + recipe_content + ", recipe_ingredient=" + recipe_ingredient + ", views=" + views + ", recipe_time=" + recipe_time + ", recipe_level=" + recipe_level + ", serving_dish=" + serving_dish + ", admin_inspection=" + admin_inspection + ", created_at=" + created_at + ", modified_at=" + modified_at + "]";
    }
}