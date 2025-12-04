import 'package:a_nxt/app/pages/document_screen/document_bindings.dart';
import 'package:a_nxt/app/pages/document_screen/document_detail_screen.dart';
import 'package:a_nxt/app/pages/document_screen/document_screen.dart';
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
    GetPage<TripScreen>(
      name: _Paths.tripscreen,
      transitionDuration: transitionDuration,
      page: TripScreen.new,
      binding: TripBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<TripDetailsScreen>(
      name: _Paths.tripDetailsScreen,
      transitionDuration: transitionDuration,
      page: TripDetailsScreen.new,
      binding: TripBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AddExpenseTripScreen>(
      name: _Paths.addExpenseTripScreen,
      transitionDuration: transitionDuration,
      page: AddExpenseTripScreen.new,
      binding: TripBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<AddTripScreen>(
      name: _Paths.addTripScreen,
      transitionDuration: transitionDuration,
      page: AddTripScreen.new,
      binding: TripBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage<DocumentScreen>(
      name: _Paths.documentScreen,
      transitionDuration: transitionDuration,
      page: DocumentScreen.new,
      binding: DocumentBindings(),
      transition: Transition.fadeIn,
    ),
    GetPage<DocumentDetailScreen>(
      name: _Paths.documentDetailScreen,
      transitionDuration: transitionDuration,
      page: DocumentDetailScreen.new,
      binding: DocumentBindings(),
      transition: Transition.fadeIn,
    ),
  ];
}
