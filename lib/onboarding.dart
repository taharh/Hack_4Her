import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';
import 'package:hack_her/authentification.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  final pages = [
    SkOnboardingModel(
        title: 'أختار شهر و نهار الي تحب عليه',
        description:
            'التطبيق هذا أمن على خاطر يظهر في شكل يومية',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/icon.png'),
    SkOnboardingModel(
        title: 'عمر الفورميلار',
        description:
            'بش نجمو نعاونوك أكثر لازمك تعمر الفورميلار',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/icon.png'),
    SkOnboardingModel(
        title: 'ماكش وحدك',
        description: 'عبر على مشاعرك الجياشة',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/icon.png'),
    SkOnboardingModel(
        title: 'لم الشهود و إشكي بالقنفود',
        description: 'تنجم تصورو و تفضحو كيف عم محمد',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/icon.png'),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.red[50],
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Authentification()));
        },
        getStartedClicked: (value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Authentification()));
        },
      ),
    );
  }
}