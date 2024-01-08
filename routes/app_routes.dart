import 'package:YumeBazaar/features/authentication/screens/login/login.dart';
import 'package:YumeBazaar/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/signup/signup.dart';
import '../features/authentication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/setting/settings.dart';
import '../features/shop/screens/cart/cart.dart';
import '../features/shop/screens/checkout/checkout.dart';
import '../features/shop/screens/favourites/favourite.dart';
import '../features/shop/screens/home/home.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/product_reviews/product_reviews.dart';
import '../features/shop/screens/search/search.dart';
import '../features/shop/screens/store/store.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: YbRoutes.home, page: () => const HomeScreen()),
    GetPage(name: YbRoutes.store, page: () => const StoreScreen()),
    GetPage(name: YbRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: YbRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: YbRoutes.search, page: () => SearchScreen()),
    GetPage(name: YbRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: YbRoutes.order, page: () => const OrderScreen()),
    GetPage(name: YbRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: YbRoutes.cart, page: () => const CartScreen()),
    GetPage(name: YbRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: YbRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: YbRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: YbRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: YbRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: YbRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: YbRoutes.onBoarding, page: () => const OnBoardingScreen()),
    // Add more GetPage entries as needed
  ];
}
