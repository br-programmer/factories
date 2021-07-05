import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/my_button.dart';
import 'package:factories/core/ui/widgets/sliver_header_delegate.dart';
import 'package:factories/features/home/presentation/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._({Key? key}) : super(key: key);

  static Widget init() => BlocProvider(
        create: (_) => HomeBLoC()..init(),
        child: const HomeScreen._(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _listener(_, HomeState state) async {
    if (state.status == HomeStatus.create) {
      // TODO: GO TO CREATE FACTORY SCREEN
    } else if (state.status == HomeStatus.detail) {
      // TODO: GO TO DETAIL SCREEN
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: BlocListener<HomeBLoC, HomeState>(
        listenWhen: (previous, current) => previous.status != current.status,
        listener: _listener,
        child: const Scaffold(
          resizeToAvoidBottomInset: false,
          body: HomeLayout(),
        ),
      ),
    );
  }
}

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: const [HomeBody(), ButtonAddFactory()]);
  }
}

class ButtonAddFactory extends StatelessWidget {
  const ButtonAddFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBLoC = HomeBLoC.of(context);
    return BlocBuilder<HomeBLoC, HomeState>(
      buildWhen: (previous, current) =>
          previous.showButton != current.showButton,
      builder: (_, state) => AnimatedPositioned(
        duration: const Duration(milliseconds: 300),
        bottom:
            state.showButton ? kToolbarHeight / 2.5 : -kToolbarHeight * 1.25,
        curve: Curves.fastLinearToSlowEaseIn,
        left: 25,
        right: 25,
        child: Align(
          child: MyButton(
            colorButton: AppColors.green,
            opacity: .9,
            textButton: 'Create a factory',
            padding: const EdgeInsets.symmetric(vertical: 20),
            onPressed: homeBLoC.createFactory,
          ),
        ),
      ),
    );
  }
}

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

class ListFactories extends StatelessWidget {
  const ListFactories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (_, index) => ItemFactory(index: index),
          childCount: 20,
        ),
      ),
    );
  }
}

class ItemFactory extends StatelessWidget {
  const ItemFactory({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final homeBLoC = HomeBLoC.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: homeBLoC.detailFactory,
        child: AspectRatio(
          aspectRatio: 16 / 8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // TODO: ADD IMAGE AND CHANGE NAME FACTORY
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'The Fabril',
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

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      sliver: SliverPersistentHeader(
        pinned: true,
        delegate: SliverCustomHeaderDelegate(
          height: 200.h,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            alignment: Alignment.center,
            child: CupertinoTextField(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.grey.withOpacity(.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              placeholder: 'Search Factories',
              placeholderStyle:
                  Helpers.searchStyle.copyWith(color: AppColors.grey),
              style: Helpers.searchStyle,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              prefix: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Icon(Icons.search, color: AppColors.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Text(
          'Need to hire a factory?',
          style: Helpers.homeStyle,
        ),
      ),
    );
  }
}
