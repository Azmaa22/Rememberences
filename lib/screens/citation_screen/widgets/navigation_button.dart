import 'package:flutter/material.dart';

class NumberContainer extends StatelessWidget {
  final String title;
  final bool isLeft;

  const NumberContainer({
    Key? key,
    required this.title,
    required this.isLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: const Color(0xff3F3351),
        borderRadius: BorderRadius.only(
          topLeft: isLeft ? Radius.zero : const Radius.circular(50.0),
          bottomRight: isLeft ? Radius.zero : const Radius.circular(50.0),
          topRight: !isLeft ? Radius.zero : const Radius.circular(50.0),
          bottomLeft: !isLeft ? Radius.zero : const Radius.circular(50.0),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }
}
