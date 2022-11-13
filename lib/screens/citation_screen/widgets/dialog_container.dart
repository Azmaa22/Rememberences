import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/home_screen/home_screen.dart';
import 'package:flutter_apps/utilities/constants/app_colors.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'لقد أنهيت قرأة الاذكار',
        style: TextStyle(
          fontSize: 25.0,
        ),
        textDirection: TextDirection.rtl,
      ),
      content: const Image(
        width: 120,
        height: 100,
        image: AssetImage(
          'assets/images/clapping.gif',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: const Text(
            'العودة للصفحة الرئيسية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
