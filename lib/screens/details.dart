import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../constants.dart' as constants;
import '../cubits/home_cubit.dart';

class Details extends StatelessWidget {
  const Details({super.key});

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
          title: const Text('النسب المئوية الكلية',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28)),
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
                    return Container(
                        color: Colors.teal.shade50,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                constants.titles[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                              Text(
                                "100%",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                            ],
                          ),
                        ));
                  }),
              const SizedBox(height: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  border: const Border(
                    top: BorderSide(color: Colors.teal, width: 2),
                  ),
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'النسبة المئوية الكلية: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                      Text(
                        "100%",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
