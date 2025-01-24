import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tazkiyah/cubits/home_cubit.dart';
import 'package:go_router/go_router.dart';
import '../pref.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Future.wait([Storage.loadCheckedList(), Storage().loadIntegers("pageIndex")]),
          initialData: 'wait',
          builder: (context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<HomeCubit>().checked = snapshot.data[0];
                context.read<HomeCubit>().pageIndex = snapshot.data[1];
                context.go('/home');
              });
            }
            return const Center(
                child: SpinKitPouringHourGlassRefined(
              color: Colors.teal,
              size: 300.0,
            ));
          }),
    );
  }
}
