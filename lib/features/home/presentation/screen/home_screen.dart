import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/ui/navigation/fade_page_route.dart';
import 'package:factories/features/create_factory/presentation/screen/create_factory_screen.dart';
import 'package:factories/features/home/presentation/widgets/widgets.dart'
    show HomeLayout;
import 'package:factories/features/home/presentation/bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen._({Key? key}) : super(key: key);

  static Widget init() => BlocProvider(
        create: (_) => HomeBLoC(_.read())
          ..init()
          ..loadFactory(),
        child: const HomeScreen._(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _listener(_, HomeState state) async {
    if (state.status == HomeStatus.create) {
      final newFactory = await Navigator.push(
        context,
        FadePageRoute(screen: CreateFactoryScreen.init()),
      );
      if (newFactory is Factory)
        HomeBLoC.of(context).creatingFactory(newFactory);
      else
        HomeBLoC.of(context).add(InitialStatus());
    } else if (state.status == HomeStatus.ok) {
      final snackBar = SnackBar(
        content: Text('Factory create', style: Helpers.loginHeaderInputStyle),
        backgroundColor: Theme.of(context).primaryColor,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
