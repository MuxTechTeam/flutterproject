import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/bbody.dart';

class BCompleteProfileScreen extends StatelessWidget {
  static String routeName = "/d_complete_profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kSeller),
      ),
      body: BBody(),
    );
  }
}
