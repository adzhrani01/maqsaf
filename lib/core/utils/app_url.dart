//final  baseUrl ="http://localhost:8080/";
const baseServ = "https://khaledsukkar.pythonanywhere.com/";
const baseUrl = "${baseServ}api/v1/";
   const storageUrl = "${baseServ}storage/";
const user = "user/";
const auth = "auth/";
const students = "students/";
const categories = "categories/";
const ingredients = "ingredients/";
const items = "items/";
const favorites = "favorites/";
const carts = "carts/";
const orders = "orders/";

const services = "services/app/";
const profile = "Profile/";
const account = "Account/";
const attachments = "Attachments/";
const priceOffers = "PriceOffers/";
const vendorPriceOffers = "VendorPriceOffers/";
// const transactions = "Transactions/";
const insuranceInvoices = "InsuranceInvoices/";
const commitments = "Commitments/";
const notifications = "Notification/";
const insuranceCompanies = "InsuranceCompanies/";
const carManufacturers = "CarManufacturers/";


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
  static const getProfilePicture = '${baseUrl}${services}${profile}GetProfilePicture';
  static const updateCurrentUserProfile = '${baseUrl}${services}${profile}UpdateCurrentUserProfile';
  static const uploadPictureToCache = '${baseUrl}${services}${profile}UploadPictureToCache';
  static const updateProfilePicture = '${baseUrl}${services}${profile}UpdateProfilePicture';
  static const getPasswordComplexitySetting = '${baseUrl}${services}${profile}GetPasswordComplexitySetting';
  static const changePassword = '${baseUrl}${services}${profile}ChangePassword';
  static const requestPasswordReset = '${baseUrl}${auth}request-password-reset';
  static const resendRequestPasswordReset = '${baseUrl}${auth}resend-reset-password-code';
  static const resetPassword = '${baseUrl}${auth}reset-password';
  static const verifyPasswordCode = '${baseUrl}${auth}verify-password-code';

  ///------------------------------------------------------------------------------>




  /// Attachments
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const downloadAttachment = '${baseUrl}${services}${attachments}DownloadAttachment';
///------------------------------------------------------------------------------>


  /// PriceOffers
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllPriceOffers = '${baseUrl}${services}${priceOffers}GetAllMobile';
  static const getPriceOfferById = '${baseUrl}${services}${priceOffers}GetPriceOfferForViewMobile';
  ///------------------------------------------------------------------------------>



  /// Transactions
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllInsuranceInvoices = '${baseUrl}${services}${vendorPriceOffers}GetAllInvoices';
  static const getAllInsuranceInvoicesById = '${baseUrl}${services}${insuranceInvoices}GetInsuranceInvoiceForViewMobile';
  // static const getAllTransactions = '${baseUrl}${services}${transactions}GetAllMobile';
  // static const getTransactionById = '${baseUrl}${services}${transactions}GetTransactionForViewMobile';
  ///------------------------------------------------------------------------------>

  /// Commitments
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllCommitments = '${baseUrl}${services}${commitments}GetAllMobile';
  static const getCommitmentById = '${baseUrl}${services}${commitments}GetTransactionForViewMobile';
  ///------------------------------------------------------------------------------>

  /// Notifications
  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  static const getAllNotifications = '${baseUrl}${services}${notifications}GetUserNotifications';
  static const getNotificationById = '${baseUrl}${services}${notifications}GetNotificationForViewMobile';
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
  static const addItemForFavorite = '${baseUrl}${favorites}create/';

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
  static const getAllOrders = '${baseUrl}${orders}';
  static const createOrder= '${baseUrl}${orders}create/';

///------------------------------------------------------------------------------>


  ///*******************************************************************************
  ///<------------------------------------------------------------------------------
  ///------------------------------------------------------------------------------>

}
