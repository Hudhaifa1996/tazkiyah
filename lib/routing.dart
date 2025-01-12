import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tazkiyah/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'home.dart';
class Routing {
  static late final SharedPreferences prefs;

// GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      // GoRoute(
      //   name: 'splash',
      //   path: '/',
      //   // builder: (context, state) => const SplashScreen(),
      // ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (context) => HomeCubit(),
            child: const Home(),
          ),
        ),
      ),
    ],
  );
}
