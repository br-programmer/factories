import 'package:flutter/material.dart';
import 'package:factories/core/helpers/helpers.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Text(
          'Need to hire a factory?',
          style: Helpers.homeStyle,
        ),
      ),
    );
  }
}
