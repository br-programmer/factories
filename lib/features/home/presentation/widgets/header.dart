import 'package:flutter/material.dart';
import 'package:factories/core/ui/navigation/fade_page_route.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';
import 'package:factories/features/login/presentation/screen/login_screen.dart';
import 'package:factories/core/helpers/helpers.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  Future<void> _onPressed(BuildContext context) async {
    await HomeBLoC.of(context).logout();
    Navigator.pushReplacement(
      context,
      FadePageRoute(screen: LoginScreen.init()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'Need to hire a factory?',
                style: Helpers.homeStyle,
              ),
            ),
            GestureDetector(
              onTap: () => _onPressed(context),
              child: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
