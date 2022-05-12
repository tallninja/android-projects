import 'package:flutter/material.dart';
import 'package:kaizen_app/widgets/social_button.dart';

class SocialButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SocialButton(
                ontap: () => print('Login with Office 365'),
            logo: AssetImage(
              'assets/logos/office-365-logo.png',
            ),
          ),
        ],
      ),
    );
  }
}
