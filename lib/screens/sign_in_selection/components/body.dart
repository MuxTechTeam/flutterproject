import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '../../../components/default_button.dart';
import '../../../methods/firebase_methods.dart';
import '../../../screens/complete_profile/bcomplete_profile_screen.dart';
import '../../../screens/complete_profile/vcomplete_profile_screen.dart';
import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int radioValue;
  String variable;

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      if (radioValue == 0)
        variable = "Customer";
      else
        variable = "Lawyer";
      // print(variable);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
          
        Text('Are you a Customer or Lawyer?'),
        SizedBox(height: getProportionateScreenHeight(3)),
        Text('Please select one!'),
        SizedBox(height: getProportionateScreenHeight(8)),
        Center(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[ 
               ListTile(  
                  title: const Text('Lawyer'),  
                  leading: Radio(  
                    value: 1,  
                    groupValue: radioValue,  
                    onChanged: handleRadioValueChanged,  
                  ),  
                ),
                ListTile(  
                  title: const Text('Admin'),  
                  leading: Radio(  
                    value: 1,  
                    groupValue: radioValue,  
                    onChanged: handleRadioValueChanged,  
                  ),  
                ),
                  
                ListTile(  
                  title: const Text('Customer'),  
                  leading: Radio(  
                    value: 1,  
                    groupValue: radioValue,  
                    onChanged: handleRadioValueChanged,  
                  ),  
                ) , 
            ],
          ),
          
        ),
        
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Next",
            press: () async {
              // Navigator.pushNamed(context, HomeScreen.routeName);
              if (variable == 'Customer')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => VCompleteProfileScreen()));
              else if (variable == 'Lawyer')
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BCompleteProfileScreen()));
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(auth.currentUser.email)
                  .update({
                'Role': variable,
              });
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
