import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';

class ListFactories extends StatelessWidget {
  const ListFactories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBLoC, HomeState>(
      buildWhen: (previous, current) =>
          previous.factories != current.factories ||
          previous.loading != current.loading,
      builder: (context, state) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => ItemFactory(item: state.factories[index]),
            childCount: state.factories.length,
          ),
        ),
      ),
    );
  }
}

class ItemFactory extends StatelessWidget {
  const ItemFactory({Key? key, required this.item}) : super(key: key);
  final Factory item;

  @override
  Widget build(BuildContext context) {
    final homeBLoC = HomeBLoC.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: homeBLoC.detailFactory,
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (item.image != null)
                  Image.asset(item.image!, fit: BoxFit.cover)
                else
                  Image.file(item.file!, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      item.name,
                      style:
                          Helpers.loginInputStyle.copyWith(color: Colors.white),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
