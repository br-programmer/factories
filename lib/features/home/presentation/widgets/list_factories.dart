import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/ui/navigation/fade_page_route.dart';
import 'package:factories/features/detail/presentation/screen/detail_screen.dart';
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
          previous.search != current.search,
      builder: (context, state) {
        final newList = state.factories
            .where((f) =>
                f.name.toLowerCase().contains(state.search.toLowerCase()))
            .toList();
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => ItemFactory(item: newList[index]),
              childCount: newList.length,
            ),
          ),
        );
      },
    );
  }
}

class ItemFactory extends StatelessWidget {
  const ItemFactory({Key? key, required this.item}) : super(key: key);
  final Factory item;

  Future<void> _goToDetail(BuildContext context) async {
    await Navigator.push(
      context,
      FadePageRoute(screen: DetailScreen.init(item)),
    );
    HomeBLoC.of(context).add(InitialStatus());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () => _goToDetail(context),
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (item.image != null)
                  Hero(
                    tag: item.image!,
                    child: Image.asset(item.image!, fit: BoxFit.cover),
                  )
                else
                  Hero(
                    tag: item.file!,
                    child: Image.file(item.file!, fit: BoxFit.cover),
                  ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Hero(
                      tag: item.name,
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          item.name,
                          style: Helpers.createFactoryStyle
                              .copyWith(color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
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
