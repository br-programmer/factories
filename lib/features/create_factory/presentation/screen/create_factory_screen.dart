import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:factories/core/data/models/factory.dart';
import 'package:factories/features/create_factory/presentation/bloc/bloc.dart';
import 'package:factories/core/helpers/helpers.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/dash_dot_painter.dart';
import 'package:factories/core/ui/widgets/my_button.dart';
import 'package:factories/features/create_factory/presentation/widgets/my_appbar.dart';

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

class OptionsSelectImage extends StatelessWidget {
  const OptionsSelectImage({Key? key, required this.piker, required this.take})
      : super(key: key);
  final VoidCallback piker;
  final VoidCallback take;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(5))),
        color: Colors.white,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  'Chosse an option',
                  style: Helpers.createFactoryStyle,
                ),
              ),
              _Option(
                text: 'Picker an Image',
                onPressed: piker,
              ),
              Divider(height: 1, color: AppColors.grey),
              _Option(
                text: 'Take an Photo',
                onPressed: take,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      pressedOpacity: .9,
      onPressed: onPressed,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: Helpers.loginHeaderInputStyle.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class CreateFactoryLayout extends StatelessWidget {
  const CreateFactoryLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height - kToolbarHeight * 2,
          child: const FormCreateFactory(),
        ),
      ),
    );
  }
}

class FormCreateFactory extends StatelessWidget {
  const FormCreateFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 75.h),
        const HeaderParamsFactory(text: 'Name'),
        const InputFactoryName(),
        SizedBox(height: 20.h),
        const HeaderParamsFactory(text: 'Photography'),
        const AddPhoto(),
        SizedBox(height: 20.h),
        const HeaderParamsFactory(text: 'Description'),
        const InputFactoryDescription(),
        const ButtonSaved(),
      ],
    );
  }
}

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

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: AspectRatio(
        aspectRatio: 16 / 7.5,
        child: const CustomPaint(
          painter: DashDotPainter(),
          child: _SelectPhoto(),
        ),
      ),
    );
  }
}

class _SelectPhoto extends StatelessWidget {
  const _SelectPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: BlocBuilder<CreateFactoryBLoC, CreateFactoryState>(
              buildWhen: (previous, current) => previous.photo != current.photo,
              builder: (_, state) => state.photo == null
                  ? const _FactoryAnimation()
                  : Image.file(state.photo!, fit: BoxFit.cover),
            ),
          ),
          const ButtonSelectImageOptions(),
        ],
      ),
    );
  }
}

class _FactoryAnimation extends StatefulWidget {
  const _FactoryAnimation({Key? key}) : super(key: key);

  @override
  __FactoryAnimationState createState() => __FactoryAnimationState();
}

class __FactoryAnimationState extends State<_FactoryAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.green,
      child: Lottie.asset(
        'assets/animations/factory.json',
        controller: _controller,
        fit: BoxFit.cover,
        onLoaded: (composition) => _controller
          ..duration = composition.duration
          // TODO: CHANGED TO REPEAT
          ..stop(),
      ),
    );
  }
}

class ButtonSelectImageOptions extends StatefulWidget {
  const ButtonSelectImageOptions({Key? key}) : super(key: key);

  @override
  _ButtonSelectImageOptionsState createState() =>
      _ButtonSelectImageOptionsState();
}

class _ButtonSelectImageOptionsState extends State<ButtonSelectImageOptions> {
  late final CreateFactoryBLoC bLoC;

  @override
  void initState() {
    bLoC = CreateFactoryBLoC.of(context);
    super.initState();
  }

  void picker() {
    bLoC.pickerImage();
    Navigator.pop(context);
  }

  void take() {
    bLoC.takePhoto();
    Navigator.pop(context);
  }

  void _showModal() => showCupertinoModalPopup(
        context: context,
        barrierDismissible: false,
        builder: (_) => OptionsSelectImage(piker: picker, take: take),
      );

  @override
  Widget build(BuildContext context) {
    return Align(
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        pressedOpacity: .9,
        onPressed: _showModal,
        child: Container(
          width: 150.r,
          height: 150.r,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 5)
            ],
          ),
          child: Icon(Icons.camera_alt_outlined, color: AppColors.purple),
        ),
      ),
    );
  }
}

class HeaderParamsFactory extends StatelessWidget {
  const HeaderParamsFactory({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: Helpers.createFactoryStyle,
        children: [
          TextSpan(
            text: ' *',
            style: Helpers.createFactoryStyle.copyWith(
              color: AppColors.requiredColor,
            ),
          ),
        ],
      ),
    );
  }
}

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
