import 'package:flutter/material.dart' hide Form;
import 'package:factories/core/ui/widgets/background.dart';
import 'package:factories/features/login/presentation/widgets/widgets.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    final size = query.size;
    final padding = query.padding;
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height - padding.top,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                Background(),
                Form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
