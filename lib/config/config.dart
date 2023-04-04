import 'package:flutter/material.dart';

class Config {
  final String appName = 'Seamens Club';
  final String splashIcon = 'assets/images/splash.png';
  final String supportEmail = 'tech.seamens.club@gmail.com';
  final String privacyPolicyUrl = 'https://www.mrb-lab.com/privacy-policy';
  final String ourWebsiteUrl = 'https://www.facebook.com/seamensclubltd';
  final String iOSAppId = '000000';

  //social links
  static const String facebookPageUrl =
      'https://www.facebook.com/seamensclubltd';
  static const String youtubeChannelUrl =
      'https://www.youtube.com/channel/UCWVwRo7yJx0Ak-w6VzRnDdA';
  static const String twitterUrl = 'https://twitter.com/SeamensClubNews';

  //app theme color
  final Color appColor = Colors.deepPurpleAccent;

  //Intro images
  final String introImage1 = 'assets/images/news1.png';
  final String introImage2 = 'assets/images/news6.png';
  final String introImage3 = 'assets/images/news7.png';

  //animation files
  final String doneAsset = 'assets/animation_files/done.json';

  //Language Setup
  final List<String> languages = ['English', 'Spanish', 'Arabic'];

  //initial categories - 4 only (Hard Coded : which are added already on your admin panel)
  final List initialCategories = [
    'Your Guidebook',
    'Seamens Club Blog',
    'Crewing Agency',
    'Ukraine Story',
  ];
}
