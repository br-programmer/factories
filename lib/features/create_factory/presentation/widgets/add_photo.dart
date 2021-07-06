import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/core/ui/app_colors.dart';
import 'package:factories/core/ui/widgets/dash_dot_painter.dart';
import 'package:factories/features/create_factory/presentation/bloc/bloc.dart';
import 'package:factories/features/create_factory/presentation/widgets/widgets.dart'
    show OptionsSelectImage;

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
          ..repeat(),
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
