import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/features/create_factory/presentation/bloc/bloc.dart';

class InputFactoryDescription extends StatelessWidget {
  const InputFactoryDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CreateFactoryBLoC.of(context);
    return Expanded(
      child: Align(
        alignment: Alignment.topCenter,
        child: InputCreateFactory(
          placeHolder: 'Enter a description',
          maxLines: 8,
          onChanged: bloc.changedDescription,
        ),
      ),
    );
  }
}

class InputFactoryName extends StatelessWidget {
  const InputFactoryName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = CreateFactoryBLoC.of(context);
    return InputCreateFactory(
      placeHolder: 'Enter factory name',
      onChanged: bloc.changedName,
    );
  }
}

class InputCreateFactory extends StatelessWidget {
  const InputCreateFactory({
    Key? key,
    required this.placeHolder,
    this.maxLines = 1,
    this.onChanged,
  }) : super(key: key);
  final String placeHolder;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      decoration: BoxDecoration(),
      placeholder: placeHolder,
      style: Helpers.searchStyle,
      placeholderStyle: Helpers.searchStyle.copyWith(color: AppColors.grey),
      padding: EdgeInsets.symmetric(vertical: 10),
      maxLines: maxLines,
      onChanged: onChanged,
    );
  }
}
