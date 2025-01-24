import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tazkiyah/cubits/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:tazkiyah/screens/details.dart';
import 'package:tazkiyah/screens/settings.dart';
import 'di_container.dart';
import 'screens/home.dart';
HomeCubit _homeCubit = locator<HomeCubit>();

class Routing {
  static late final SharedPreferences prefs;

  static final router = GoRouter(
    initialLocation: '/details',
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
          child: BlocProvider.value(
            value: _homeCubit,
            child: const Home(),
          ),
        ),
      ),
      GoRoute(
        name: 'details',
        path: '/details',
        builder: (context, state) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider.value(
            value: _homeCubit,
            child: const Details(),
          ),
        ),
      ),
      GoRoute(
        name: 'settings',
        path: '/settings',
        builder: (context, state) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider.value(
            value: _homeCubit,
            child:  Settings(),
          ),
        ),
      ),
    ],
  );
}
