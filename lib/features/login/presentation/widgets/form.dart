import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/my_input.dart';
import 'package:factories/core/ui/widgets/my_button.dart';
import 'package:factories/features/login/presentation/bloc/bloc.dart';

class Form extends StatelessWidget {
  const Form({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 150.h),
          Text('SIGN IN', style: Helpers.loginInputStyle),
          SizedBox(height: 80.h),
          Text('User', style: Helpers.loginHeaderInputStyle),
          SizedBox(height: 25.h),
          const UserInput(),
          SizedBox(height: 55.h),
          Text('Password', style: Helpers.loginHeaderInputStyle),
          SizedBox(height: 25.h),
          const PasswordInput(),
          SizedBox(height: 80.h),
          const ButtonLogin(),
          SizedBox(height: 40.h),
          const Register(),
        ],
      ),
    );
  }
}

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "If you don't have an account ",
        style: Helpers.loginHeaderInputStyle.copyWith(color: Colors.black),
        children: [
          TextSpan(
            text: '/ Register',
            style:
                Helpers.loginHeaderInputStyle.copyWith(color: AppColors.green),
          ),
        ],
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBLoC, LoginState>(
      buildWhen: (previous, current) => current.formValid != previous.formValid,
      builder: (_, state) {
        return MyButton(
          colorButton: state.formValid
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColor.withOpacity(.7),
          textButton: 'Login',
          onPressed: state.formValid ? LoginBLoC.of(context).login : null,
        );
      },
    );
  }
}

class UserInput extends StatelessWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBLoC = LoginBLoC.of(context);
    return BlocBuilder<LoginBLoC, LoginState>(
      buildWhen: (previous, current) => previous.userValid != current.userValid,
      builder: (_, state) => MyInput(
        borderColor: state.userValid ? AppColors.grey : Colors.red,
        placeHolder: 'Enter your user',
        onChanged: loginBLoC.onChangedUser,
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBLoC = LoginBLoC.of(context);
    return BlocBuilder<LoginBLoC, LoginState>(
      buildWhen: (previous, current) =>
          previous.showPassword != current.showPassword ||
          previous.passwordValid != current.passwordValid,
      builder: (_, state) => MyInput(
        placeHolder: 'Enter your password',
        obscureText: !state.showPassword,
        suffix: state.showPassword ? Icons.visibility_off : Icons.visibility,
        borderColor: state.passwordValid ? AppColors.grey : Colors.red,
        onTap: loginBLoC.changedShowPassword,
        onChanged: loginBLoC.onChangedPassword,
      ),
    );
  }
}
