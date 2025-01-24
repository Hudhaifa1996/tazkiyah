import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// import '../constants.dart' as constants;
import '../cubits/home_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                ),
                onPressed: () {
                  context.go('/home');
                }),
            title: const Text('الاعدادات', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28)),
            centerTitle: true,
            backgroundColor: Colors.teal,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text('حساب النسب المئوية الكلية للصفحات', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "من",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      onTap: () {},
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      controller: context.read<HomeCubit>().firstController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        context.read<HomeCubit>().validateInput();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) {
                            int newValueInt = int.tryParse(newValue.text) ?? 0;
                            if (newValueInt < 1 || newValueInt > 30) {
                              return oldValue;
                            }
                            return newValue;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "الى",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      onTap: () {},
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                      controller: context.read<HomeCubit>().secondController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        context.read<HomeCubit>().validateInput();
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TextInputFormatter.withFunction(
                          (oldValue, newValue) {
                            int newValueInt = int.tryParse(newValue.text) ?? 0;
                            if (newValueInt < 1 || newValueInt > 30) {
                              return oldValue;
                            }
                            return newValue;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<HomeCubit>().reset();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                ),
                label: const Text('تصفير كل البيانات المخزونة', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
              ),
            ],
          ));
    });
  }
}
