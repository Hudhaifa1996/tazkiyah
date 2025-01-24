

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tazkiyah/cubits/home_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<HomeCubit>(() => HomeCubit());
  locator.registerSingleton<TextEditingController>(TextEditingController(text: '1'), instanceName: 'first');
  locator.registerSingleton<TextEditingController>(TextEditingController(text: '30'), instanceName: 'second');

}
