import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/detail/presentation/bloc/detail_bloc.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailBLoC, Factory>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          sliver: SliverFillRemaining(
            hasScrollBody: false,
            child: Text(
              state.description,
              textAlign: TextAlign.justify,
              style: Helpers.loginHeaderInputStyle,
            ),
          ),
        );
      },
    );
  }
}
