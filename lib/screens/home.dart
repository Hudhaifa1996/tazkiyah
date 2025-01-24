import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../constants.dart' as constants;
import '../cubits/home_cubit.dart';
import '../pref.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      Storage.saveCheckedList(context.read<HomeCubit>().checked);
      return PageView.builder(
          controller: PageController(initialPage: context.read<HomeCubit>().pageIndex),
          onPageChanged: (pageIndex) {
            Storage().saveIntegers("pageIndex", pageIndex);
            context.read<HomeCubit>().pageIndex = pageIndex;
          },
          itemCount: 30, // 23 pages
          itemBuilder: (context, pageIndex) {
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(
                      Icons.info_outline,
                      size: 28,
                    ),
                    onPressed: () {
                      context.go('/details');
                    }),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      size: 28,
                    ),
                    onPressed: () {
                      context.go('/settings');
                    },
                  ),
                ],
                title: Text('يوم ${(pageIndex + 1).toString()}', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 28)),
                centerTitle: true,
                backgroundColor: Colors.teal,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // physics: const AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 23,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
                            child: Card(
                              elevation: 4,
                              shadowColor: Colors.tealAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: CheckboxListTile(
                                value: context.read<HomeCubit>().checked[pageIndex][index],
                                onChanged: (newValue) {
                                  context.read<HomeCubit>().checked[pageIndex][index] = newValue!;
                                  context.read<HomeCubit>().check();
                                },
                                title: Text(
                                  constants.titles[index],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                                activeColor: Colors.teal,
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.fromLTRB(60.0, 16.0, 40.0, 16.0),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        border: const Border(
                          top: BorderSide(color: Colors.teal, width: 2),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'النسبة المئوية: ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                          ),
                          Text(
                            "${context.read<HomeCubit>().dailyRate(pageIndex).toStringAsFixed(1).replaceAll(RegExp(r'\.0$'), '')}%",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    });
  }
}
