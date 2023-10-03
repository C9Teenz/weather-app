// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/navbar/navbar_cubit.dart';

class NavbarItem extends StatelessWidget {
  const NavbarItem({
    Key? key,
    required this.name,
    required this.index,
  }) : super(key: key);
  final String name;
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarCubit, int>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(right: 16),
          child: Column(children: [
            Text(
              name,
              style: TextStyle(
                  color: state == index ? Colors.black : Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 50.0,
              height: 3.0,
              color: state == index ? Colors.black : Colors.transparent,
            ),
          ]),
        );
      },
    );
  }
}
