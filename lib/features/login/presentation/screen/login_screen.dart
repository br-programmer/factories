import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/ui/navigation/fade_page_route.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/home/presentation/screen/home_screen.dart';
import 'package:factories/features/login/presentation/bloc/bloc.dart';
import 'package:factories/features/login/presentation/widgets/widgets.dart'
    show LoginLayout;

class LoginScreen extends StatefulWidget {
  const LoginScreen._({Key? key}) : super(key: key);

  static Widget init() => BlocProvider(
        create: (_) => LoginBLoC(_.read()),
        child: const LoginScreen._(),
      );

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void _listener(BuildContext context, LoginState state) {
    if (state.status == LoginStatus.ok) {
      Navigator.pushReplacement(
        context,
        FadePageRoute(screen: HomeScreen.init()),
      );
    } else if (state.status == LoginStatus.error) {
      final snackBar = SnackBar(
        content: Text(state.error, style: Helpers.loginHeaderInputStyle),
        backgroundColor: Theme.of(context).primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBLoC, LoginState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: _listener,
      child: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: const Scaffold(body: LoginLayout()),
      ),
    );
  }
}
