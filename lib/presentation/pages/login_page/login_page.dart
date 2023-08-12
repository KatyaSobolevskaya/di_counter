import 'package:di_counter/presentation/app/localisation/strings_consts.dart';
import 'package:di_counter/presentation/theme/theme_extension.dart';
import 'package:di_counter/presentation/utils/consts/di_counter_dimensions.dart';
import 'package:di_counter/presentation/widgets/di_counter_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DiCounterButton(
              onPressed: () {},
              child: Text(StringsConsts.logIn.tr),
            ),
            const SizedBox(height: Dimensions.averageHeight),
            DiCounterButton(
              onPressed: () {},
              child: Text(StringsConsts.signUp.tr),
            ),
          ],
        ),
      ),
    );
  }
}
