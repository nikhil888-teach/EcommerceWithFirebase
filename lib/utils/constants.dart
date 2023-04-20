import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Constants {
  static const APP_NAME = "E-Commerce";

  //MAIN_PAGE
  static const HOME = "Home";
  static const shop = "Shop";
  static const bag = "Bag";
  static const Profile = "Profile";

  //LOGIN_PAGE
  static const LOGIN = "Login";
  static const LOGIN_OUT = "LogOut";
  static const EMAIL = "Email";
  static const PASSWORD = "Password";
  static const FORGOT_PASSWORD = "Forgot password?";
  static const FORGOT_PASSWORD2 = "Forgot password";
  static const OR_SIGN_WITH_SOCIAL = "Or sign up with Social account";
  static const SEND_REQUEST = "Send Request";

  //SINGUP_PAGE
  static const SIGNUP = "Sign up";
  static const NAME = "Name";
  static const ALREADY_ACCOUNT = "Already have an account?";
  static const NO_ACCOUNT = "I don't have an account? Register";

  //HOME_PAGE
  static const FASHION = "Fashion";
  static const SALE = "Sale";
  static const CHECK = "Check";
  static const NEW = "New";
  static const BEST = "Best";

  static const bestSeller = "Bestsellers";
  static const you_never_before = "You've never seen it before";

  //FAVORITE_PAGE
  static const Favorites = "Favorites";
  static const Price = "Price";

  //BAG_PAGE
  static const My_Bag = "My Bag";
  static const ADD_FAVORITE = "Add to favorities";
  static const delete_list = "Delete from the list";
  static const color = "Color: ";
  static const size = "Size: ";
  static const total_amount = "Total Amount: ";
  static const check_out = "CHECK OUT";
  static const add_cart = "ADD TO CART";

  //SHOPE_PAGE
  static const Categories = "Categories";
  static const women = "Women";
  static const Men = "Men";
  static const kides = "Kids";

  //PROFILE_PAGE
  static const my_profile = "My profile";

  //add address
  static const full_name = "Full name";
  static const address = "Address";
  static const city = "City";
  static const state = "State/Province/Region";
  static const code = "Zip Code (Postal Code)";
  static const country = "Country";
  static const save_address = "SAVE ADDRESS";
  static const change = "Change";
  static const payment = "Payment";
  static const update_address = "UPDATE ADDRESS";

  //checkout page
  static const shipping_address = "Shipping address";
  static const delivery_method = "Delivery method";
  static const order = "Order:";
  static const delivery = "Delivery:";
  static const summary = "Summary";
  static const submit = "SUBMIT ORDER";

  //Success! page
  static const success = "Success!";
  static const succ_text =
      "Your order will be delivered soon.Thank you for choosing our app!";
  static const conti_shop = "CONTINUE SHOPPING";
  static const check_invoice = "CHECK INVOICE";
  static const use_add = "Use as the shipping address";

  //No Internet page
  static const noInternet = "Ooops!";
  static const noInternetMsg =
      "No Internet Connection Found Check your connection";

  //failed page
  static const failed = "Failed!";
  static const fail_msg =
      "Your transaction has failed due to some technical error!";
  static const try_again = "Try Again";

  //all address
  static const edit = "Edit";

  //SETTING PAGE
  static const pers_info = "Personal Information";
  static const curr_password = "";
  static const pass_change = "Password Change";
  static const old_pass = "Old Password";
  static const new_pass = "New Password";
  static const repeat_pass = "Repeat New Password";
  static const save_pass = "SAVE PASSWORD";
  static const notification = "Notifications";
  static const sales = "Sales";
  static const new_arr = "New arrivals";
  static const delivery_status = "Delivery status changes";
  static const darktheme = "Dark Theme";

  //orderdetail page
  static const delivered = "Delivered";
  static const processing = "Processing";
  static const cancelled = "Cancelled";

  //devivered tabs
  static const orderNo = "Order No: ";
  static const trackingNo = "Tracking number: ";
  static const quantity = "Quantity: ";
  static const total_amt = "Total Amount: ";
  static const detail = "Details";
  static const unit = "Units: ";

  //delivered product detail page
  static const item = " item";
  static const ord_info = "Order information";
  static const shipp_add = "Shipping Address: ";
  static const pay_meth = "Payment method: ";
  static const del_method = "Delivery method: ";
  static const discount = "Discount: ";
  static const tot_amt = "Total Amount: ";
  static const reorder = "Reorder";
  static const lea_feed = "Leave feedback";

  static const dSubCategoryImage = "subcgimage";
  static const dSubCategoryName = "subcgName";
  static const dProducts = "Products";
  static const dMale = "Male";
  static const dFemale = "Female";
  static const dKids = "Kids";

  // products

  static const dimages = "images";
  static const dPname = "Pname";
  static const dSPrice = "Price";
  static const ddPrice = "DisPrice";
  static const dBrand = "Brand";
  static const dDesc = "Description";
  static const dcategory = "Category";
  static const dsubCategory = "SubCategory";
  static const dType = "Type";
  static const dGender = "Gender";
  static const dDate = "Date";
  static const dId = "ID";
  static const dUser = "User";
  static const dColor = "Color";
  static const dSize = "Size";
  static const dCartId = "CarTId";
  static const dOrderCount = "OrderCount";
  static const dColorLists = "ColorLists";

  //add to cart
  static const dAddToCart = "AddToCart";
  static const dPid = "ProductId";
  static const dQuantity = "Quantity";
  static const dtotamt = "Total";

  //user
  static const duname = "Name";
  static const dProimage = "ProfileIamge";
  static const demail = "Email";
  static const dAddress = "FullAddress";
  static const dfname = "FullName";
  static const dSAddress = "Address";
  static const dCity = "City";
  static const dState = "State";
  static const dZcode = "ZipCode";
  static const dCountry = "Country";
  static const daddressId = "AddressID";

  //FAVORITE
  static const dFavorite = "Favorite";
  static const dFavId = "FavId";
  static const dFavDate = "FavDate";

  //orders
  static const dcheckId = "CheckoutId";
  static const dorder = "Orders";
  static const dorderno = "OrderNo";
  static const dtrackNum = "TrackNo";
  static const dtotal = "Total";
  static const dodate = "Date";
  static const dShipAddress = "ShippingAddress";
  static const dPayment = "Payment";
  static const dDelMethod = "Delivery";
  static const dstatus = "Status";
  static const dAccepted = "Accepted";
  static const dProcessing = "Processing";
  static const dCancelled = "Cancelled";
  static const dUserid = "UserId";
  static const dokey = "OrderKey";
  static const dTotalProduct = "TotalProducts";

  //Rating
  static const dRating = "Rating";
  static const dUserRate = "Rate";
  static const dComment = "Comment";
  static const dRatingId = "RatingID";
  static const dTotalRating = "TotalRating";

  //COLOR
  static const red_text = 0xffDB3022;
  static const white_text = 0xffFFFFFF;
  static const black_text = 0xff222222;
  static const grey_text = 0xff9B9B9B;
  static const green_text = 0xff2AA952;
}

class AppColor {
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const textPrimaryColor = Color.fromARGB(255, 255, 255, 255);
  static const textSecondaryColor = Color.fromARGB(255, 255, 255, 255);
  static const darkBlueColor = Color(0xFF2D008D);
  static const pinkColor = Color(0xFFED617B);
  static const textBorderColor = Color.fromARGB(255, 0, 0, 0);
  static const backgroundOutlineColor = Color.fromARGB(255, 216, 216, 216);
  static const greyTextColor = Color.fromARGB(255, 255, 255, 255);
  static const backgroundColor = Color.fromARGB(255, 255, 240, 240);
  static const greenColor = Color.fromARGB(255, 36, 202, 31);
  static const textColor = Color(0xFFFFFFFF);
  static const backgroundPrimary = Color.fromARGB(255, 156, 25, 2);
  static const senderbackground = Color.fromARGB(248, 243, 62, 45);
  static const reciverbackground = Color.fromARGB(255, 156, 25, 2);

  static const tranparent = Colors.transparent;
}

class AssetsPath {
  static const String icProfile = "assets/icons/ic_profile.png";
  static const String icSend = "assets/icons/ic_send.png";
}

String curruntTime() {
  var now = DateTime.now();
  DateFormat dateFormat = DateFormat('hh:mm:a');
  String currunttime = dateFormat.format(now);
  return currunttime;
}
