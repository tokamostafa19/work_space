import 'package:go_router/go_router.dart';
import 'package:workspace/features/routes.dart';
import 'package:workspace/screens/homepage.dart';
import 'package:workspace/screens/onboarding2.dart';
import 'package:workspace/screens/signin.dart';
import 'package:workspace/screens/splashScreen.dart';

import '../screens/onboardingview.dart';
import '../screens/register.dart';



class AppRouter{
  static final GoRouter router =GoRouter(routes:routes,);
  static final List<GoRoute> routes=[
    GoRoute(path: Routes.splashScreen, builder:((context,state)=>SplashScreen())),
    GoRoute(path: Routes.onboardingScreen,builder:((context,state)=>Onboardingview())),
    GoRoute(path: Routes.register, builder:((context,state)=>Register())),
    GoRoute(path: Routes.signIn, builder:((context,state)=>SignIn())),
    GoRoute(path: Routes.homeview,builder:((context,state)=>Homepage())),
    GoRoute(path: Routes.onboarding2,builder:((context,state)=>Onboarding2())),
  ];
}