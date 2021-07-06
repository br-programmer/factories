import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/ui/widgets/loading.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBLoC, HomeState>(
      buildWhen: (previous, current) => previous.loading != current.loading,
      builder: (_, state) => state.loading
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
