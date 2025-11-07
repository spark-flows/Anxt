import 'package:a_nxt/app/pages/pages.dart';
import 'package:a_nxt/app/pages/profile_screen/profile_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(milliseconds: 300);

  static const initial = _Paths.splashScreen;
  static final pages = <GetPage>[
    GetPage<SplashScreen>(
      name: _Paths.splashScreen,
      transitionDuration: transitionDuration,
      page: SplashScreen.new,
      binding: SplashBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<HomeScreen>(
      name: _Paths.homeScreen,
      transitionDuration: transitionDuration,
      page: HomeScreen.new,
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SalesAnalyticsScreen>(
      name: _Paths.salesAnalyticsScreen,
      transitionDuration: transitionDuration,
      page: SalesAnalyticsScreen.new,
      binding: SalesAnalyticsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AuthScreen>(
      name: _Paths.authScreen,
      transitionDuration: transitionDuration,
      page: AuthScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<RegisterScreen>(
      name: _Paths.registerScreen,
      transitionDuration: transitionDuration,
      page: RegisterScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ForgotScreen>(
      name: _Paths.forgotScreen,
      transitionDuration: transitionDuration,
      page: ForgotScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<ResetPasswordScreen>(
      name: _Paths.resetPasswordScreen,
      transitionDuration: transitionDuration,
      page: ResetPasswordScreen.new,
      binding: AuthBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<SalesAnalyticsDetailsScreen>(
      name: _Paths.salesAnalyticsDetailsScreen,
      transitionDuration: transitionDuration,
      page: SalesAnalyticsDetailsScreen.new,
      binding: SalesAnalyticsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SalesAnalyticsListScreen>(
      name: _Paths.salesAnalyticsListScreen,
      transitionDuration: transitionDuration,
      page: SalesAnalyticsListScreen.new,
      binding: SalesAnalyticsBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<SalesAnalyticsProductScreen>(
      name: _Paths.salesAnalyticsProductScreen,
      transitionDuration: transitionDuration,
      page: SalesAnalyticsProductScreen.new,
      binding: SalesAnalyticsBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage<ProfileScreen>(
      name: _Paths.profileScreen,
      transitionDuration: transitionDuration,
      page: ProfileScreen.new,
      binding: ProfileBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
