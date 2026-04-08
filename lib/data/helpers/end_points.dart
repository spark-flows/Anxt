class EndPoints {
  static String postLoginApi = 'api/auth/login';
  static String postRegisterApi = 'api/candidateapplication/create';
  static String postForgotApi = 'api/candidateapplication/forgotpassword';
  static String postResetApi = 'api/candidateapplication/resetpassword';
  static String postAllUsers = 'api/customer';
  static String postSalesList = 'api/sales';
  static String postGetOneUsers = 'api/customer/getone';
  static String postAddCustomer = 'api/customer/create';
  static String postGetProductList = 'api/product';
  static String postCreateCustomer = 'api/customer/create';
  static String postCreateSales = 'api/sales/create';
  static String getProfileApi = 'api/auth/profile';
  static String postGetAllTrips = 'api/trip';
  static String postGetOneTrips = 'api/trip/getone';
  static String getExpenseCategory = 'api/expensecategory';
  static String getGetOneExpense = 'api/expensecategory/getone';
  static String postAllExpense = 'api/expense';
  static String postTripDelete = 'api/trip/delete';
  static String postExpenseCreate = 'api/expense/create';
  static String postCreateTrip = 'api/trip/create';
  static String getAllUser = 'api/users';
  static String postExpenseDelete = 'api/expense/delete';

  static String postAllFolders = 'api/category/all';
  static String postStockCatalogue = 'api/stockcatelogue';
  static String getScan = 'api/stock/scan';

  static String postOrderHistory = 'api/order';
  static String postGetOneOrderHistory = 'api/order/getone';
  static String getInvoice = 'api/order/pdf?orderno=';

  static String getScaneData = 'api/stock/scan?jobno=';

  static String getPriceMasterList = 'api/pricemastername';
  static String postAddToCart = 'api/cart/addtocart';
  static String postRemoveCart = 'api/cart/delete';
  static String postGetOneCart = 'api/cart';
  static String uploadImage = 'api/trip/upload';
  static String uploadExpenseImage = 'api/expense/upload';
  static String postGetPDF = 'api/order/pdf?orderno=';
  static String postCustomerList = 'api/customer';
  static String postCustomerAsssign = 'api/customer/assign';
}
