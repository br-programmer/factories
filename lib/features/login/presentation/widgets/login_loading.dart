import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/ui/widgets/loading.dart';
import 'package:factories/features/login/presentation/bloc/bloc.dart';

class LoginLoading extends StatelessWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBLoC, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (_, state) => state.status == LoginStatus.loading
          ? Container(
              color: Colors.black.withOpacity(.25),
              child: Loading(radius: 125.r, colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor,
              ]),
            )
          : SizedBox.shrink(),
    );
  }
}
