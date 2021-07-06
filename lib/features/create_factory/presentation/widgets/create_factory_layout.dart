import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:factories/features/create_factory/presentation/widgets/widgets.dart'
    show
        HeaderParamsFactory,
        InputFactoryName,
        InputFactoryDescription,
        AddPhoto,
        ButtonSaved;

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
