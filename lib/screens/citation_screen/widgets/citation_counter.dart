import 'package:flutter/material.dart';

class CitationCounter extends StatelessWidget {
  final String count;
  final Function onPress;
  const CitationCounter({
    Key? key,
    required this.count,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        width: size.width * 0.25,
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color(0xff3F3351),
            width: 5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        child: Center(
          child: Text(
            count,
            style: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
