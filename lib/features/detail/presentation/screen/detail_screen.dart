import 'package:factories/core/data/models/factory.dart';
import 'package:factories/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen._({Key? key}) : super(key: key);

  static Widget init(Factory f) => BlocProvider(
        create: (_) => DetailBLoC(f),
        child: const DetailScreen._(),
      );

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Detail Screen'),
      ),
    );
  }
}
