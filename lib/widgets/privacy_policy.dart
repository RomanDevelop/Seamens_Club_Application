import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Widget privacyPolicyLinkAndTermsOfService() {
  return Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(10),
    child: Center(
        child: Text.rich(TextSpan(
            text: 'By continuing, you agree to our ',
            style: TextStyle(fontSize: 16, color: Colors.black),
            children: <TextSpan>[
          TextSpan(
              text: 'Terms of Service',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrl(
                      Uri.parse('https://www.mrb-lab.com/privacy-policy'));
                }),
          TextSpan(
              text: ' and ',
              style: TextStyle(fontSize: 18, color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(Uri.parse(
                            'https://www.mrb-lab.com/privacy-policy'));
                      })
              ])
        ]))),
  );
}
