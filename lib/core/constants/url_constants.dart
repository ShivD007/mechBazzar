

// All urls used in the app
//==========================================================
// String URL_LOGIN = BASE_URL + "/login/";
// String URL_SIGNUP = BASE_URL + "/signup/";
//==========================================================

  String CATEGORY_URL({int? perpage=10, int? page})=>"/wp/v2/categories?per_page=$perpage&page=${page??1}";
  String CATEGORY_POST_URL(String? categoryId, int page, int perPage,String? search)=>"/wp/v2/posts?${categoryId==null?"":"categories=$categoryId&"}per_page=$perPage&page=$page${search==null?"":"&search=$search"}";
