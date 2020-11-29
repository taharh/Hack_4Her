import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:hack_her/helpers/boardingscreen.dart';
import 'package:hack_her/authentification.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final pages = [
    SkOnboardingModel(
      title: 'التطبيق هذا أمن يظهر في شكل يومية',
      description: 'إنزل على نهار عيد ميلادك في اليومية بش تنجم تحل التطبيق',
      titleColor: Colors.black,
      descripColor: const Color(0xFF929794),
      imagePath: 'images/b1.png',
    ),
    SkOnboardingModel(
        title: 'حاول ديما تخدم مجموعة الأسئلة',
        description:
            'بش نجمو نعاونوك أكثر لازمك تعطي من وقتك و تجاوب عالأسئلة ',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/b2.png'),
    SkOnboardingModel(
        title: 'عندك برشا أسئلة؟',
        description: 'تانيت موجودة بش تجاوبك على تساؤلاتك',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/b3.png'),
    SkOnboardingModel(
        title: 'شكيت و حكيت و ما صدقك حد ؟',
        description: 'لم الدلائل و إحفظهم في أمان',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/b4.png'),
    SkOnboardingModel(
        title: 'في حالة استعجالية',
        description: 'إستعمل الزر المخفي وإطلب الرقم الأخضر',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/b5.png'),
    SkOnboardingModel(
        title: 'تلوج في محامي ولا طبيب ؟',
        description: 'عنا أرقام متع عباد و جمعيات مستعدة بش تعاونك',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'images/b6.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Authentification()));
        },
        getStartedClicked: (value) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Authentification()));
        },
      ),
    );
  }
}
