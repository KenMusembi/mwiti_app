// ignore_for_file: prefer_const_constructors
import 'package:get/get.dart';
import 'package:mwiti_app/pages/authentication/client_registration_screen.dart';
import 'package:mwiti_app/pages/authentication/sign_In_screen.dart';
import 'package:mwiti_app/pages/client_home.dart';
import 'package:mwiti_app/pages/onboarding_screen.dart';

final allRoutes = [
  GetPage(name: "/", page: () => OnboardingPage()),
  GetPage(name: "/client_home", page: () => ClientHomeScreen()),
  GetPage(name: "/login", page: () => SignInScreen()),
  // GetPage(
  //     name: "/register",
  //     page: () => RegisterScreen(
  //           user: 'kenmusembi22@gmail.com',
  //         )),
  GetPage(name: "/client_registration", page: () => ClientRegistrationScreen()),
  // GetPage(
  //     name: "/provider_registration",
  //     page: () => ServiceProviderRegistrationScreen()),
  // GetPage(name: "/otp", page: () => OTPScreen()),
  // GetPage(name: "/provider_home", page: () => ProviderHomeScreen()),
  // GetPage(name: "/account", page: () => AccountScreen()),
  // GetPage(name: "/wallet", page: () => WalletScreen()),

  //GetPage(name: "/checkregistration", page: () => CheckRegistrationScreen()),
  //GetPage(name: "/profile", page: () => UserInfoScreen(user: )),
  // GetPage(name: "/editprofile", page: () => ProfileEditScreen()),
  // GetPage(name: "/CPD", page: () => CpdPage()),
  // GetPage(name: "/selfreport", page: () => CpdSelfReportPage()),
  // GetPage(name: "/internships", page: () => InternshipScreen()),
  // GetPage(name: "/licences", page: () => LicencesPage()),
  // GetPage(name: "/faq", page: () => FAQPage()),
  // GetPage(name: "/articles", page: () => ArticlesPage()),
  // GetPage(name: "/article", page: () => ArticlePage()),
  // GetPage(name: "/exam", page: () => ExamsPage()),
  // GetPage(name: "/registration", page: () => RegistrationPage()),
  // GetPage(name: "/registration_screen", page: () => RegistrationScreen()),
];
