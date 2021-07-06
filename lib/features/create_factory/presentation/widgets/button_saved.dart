import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/core/ui/widgets/my_button.dart';
import 'package:factories/features/create_factory/presentation/bloc/bloc.dart';

class ButtonSaved extends StatelessWidget {
  const ButtonSaved({Key? key}) : super(key: key);

  void _savedFactory(BuildContext context) {
    final newFactory = CreateFactoryBLoC.of(context).newFactory;
    Navigator.pop<Factory>(context, newFactory);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SafeArea(
        top: false,
        child: BlocBuilder<CreateFactoryBLoC, CreateFactoryState>(
          buildWhen: (previous, current) =>
              previous.formValid != current.formValid,
          builder: (_, state) {
            return MyButton(
              colorButton: state.formValid
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColor.withOpacity(.85),
              textButton: 'Saved',
              onPressed: state.formValid ? () => _savedFactory(context) : null,
              padding: const EdgeInsets.symmetric(vertical: 20),
            );
          },
        ),
      ),
    );
  }
}
