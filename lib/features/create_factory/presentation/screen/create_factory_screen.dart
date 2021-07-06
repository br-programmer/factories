import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/features/create_factory/presentation/bloc/bloc.dart';
import 'package:factories/features/create_factory/presentation/widgets/widgets.dart';

class CreateFactoryScreen extends StatefulWidget {
  const CreateFactoryScreen._({Key? key}) : super(key: key);

  static Widget init() => BlocProvider(
        create: (_) => CreateFactoryBLoC(_.read()),
        child: const CreateFactoryScreen._(),
      );

  @override
  _CreateFactoryScreenState createState() => _CreateFactoryScreenState();
}

class _CreateFactoryScreenState extends State<CreateFactoryScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: MyAppBar(),
        body: const CreateFactoryLayout(),
      ),
    );
  }
}
