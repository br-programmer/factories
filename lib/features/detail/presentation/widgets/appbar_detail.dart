import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/detail/presentation/bloc/detail_bloc.dart';

class AppBarDetail extends StatelessWidget {
  const AppBarDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBLoC, Factory>(
      builder: (context, state) => SliverAppBar(
        pinned: true,
        expandedHeight: 600.h,
        title: Hero(
          tag: state.name,
          child: Material(
            color: Colors.transparent,
            child: Text(
              state.name,
              style: Helpers.createFactoryStyle.copyWith(color: Colors.black),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        brightness: Brightness.light,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: [
            StretchMode.zoomBackground,
            StretchMode.blurBackground,
            StretchMode.fadeTitle,
          ],
          background: state.image != null
              ? Hero(
                  tag: state.image!,
                  child: Image.asset(state.image!, fit: BoxFit.cover),
                )
              : Hero(
                  tag: state.file!,
                  child: Image.file(state.file!, fit: BoxFit.cover),
                ),
        ),
      ),
    );
  }
}
