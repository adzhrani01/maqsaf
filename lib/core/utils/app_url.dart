//final  baseUrl ="http://localhost:8080/";
const baseServ = "https://khaledsukkar.pythonanywhere.com/";
const baseUrl = "${baseServ}api/v1/";
const storageUrl = "https://khaledsukkar.pythonanywhere.com";
const user = "user/";
const auth = "auth/";
const students = "students/";
const categories = "categories/";
const ingredients = "ingredients/";
const items = "items/";
const favorites = "favorites/";
const paymentCarts = "paymentcarts/";
const carts = "carts/";
const orders = "orders/";
const profiles = "profiles/";


const notifications = "notifications/";



class AppUrl {

  /// User
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  // static final getUser = "${baseUrl}";
  static const login = "${baseUrl}${auth}login/";
  static const refreshToken = "${baseUrl}${auth}token/refresh/";
  // static const register = "${baseUrl}${tokenAuth}register";
  static const logout = "${baseUrl}${auth}logout/";
  static const getProfile = '${baseUrl}${students}profiles/';
  static const updateCurrentUserProfile = '${baseUrl}${students}${profiles}update/';
  static const requestPasswordReset = '${baseUrl}${auth}request-password-reset';
  static const resendRequestPasswordReset = '${baseUrl}${auth}resend-reset-password-code';
  static const resetPassword = '${baseUrl}${auth}reset-password';
  static const verifyPasswordCode = '${baseUrl}${auth}verify-password-code';

  ///------------------------------------------------------------------------------>









  /// Notifications
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllNotifications = '${baseUrl}${notifications}';
  static const getNotificationById = '${baseUrl}${notifications}GetNotificationForViewMobile';
  ///------------------------------------------------------------------------------>

  /// Categories
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllCategories= '${baseUrl}${categories}';

  ///------------------------------------------------------------------------------>

  /// Categories
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllIngredients= '${baseUrl}${ingredients}';

  ///------------------------------------------------------------------------------>

  ///
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllItems = '${baseUrl}${items}';

  ///------------------------------------------------------------------------------>

  ///Favorites
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllFavorites = '${baseUrl}${favorites}';
  static const addItemForFavorite = '${baseUrl}favorite-items/create/';
  static const deleteItemForFavorite = '${baseUrl}${students}';

  ///------------------------------------------------------------------------------>


  ///PaymentCarts
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllPaymentCarts = '${baseUrl}${paymentCarts}';
  static const createPaymentCart = '${baseUrl}${paymentCarts}create/';

  ///------------------------------------------------------------------------------>


  ///------------------------------------------------------------------------------>

  ///Carts
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllCarts = '${baseUrl}${carts}';
  static const createItemCart = '${baseUrl}${carts}create/';

  ///------------------------------------------------------------------------------>

  ///Orders
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllOrders = '${baseUrl}${orders}history/';
  static const createOrder= '${baseUrl}${orders}scheduled/create/';
  static const scheduledOrder= '${baseUrl}${orders}scheduled/';

///------------------------------------------------------------------------------>


///*******************************************************************************
///<------------------------------------------------------------------------------
///------------------------------------------------------------------------------>

}
