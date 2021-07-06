import 'package:flutter/material.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';
import 'package:factories/features/home/presentation/widgets/widgets.dart'
    show Header, Search, ListFactories;

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: HomeBLoC.of(context).controller,
        physics: BouncingScrollPhysics(),
        slivers: [Header(), Search(), ListFactories()],
      ),
    );
  }
}
