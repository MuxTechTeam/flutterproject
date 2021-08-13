import 'package:flutter/material.dart';

import '../../size_config.dart';
import 'components/body.dart';

class SignInSelectionScreen extends StatelessWidget {
  static String routeName = "/sign_in_selection";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In as"),
      ),
      body: Body(),
    );
  }
}
