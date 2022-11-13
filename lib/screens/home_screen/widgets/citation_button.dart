import 'package:flutter/material.dart';
import 'package:flutter_apps/utilities/service/media_query_values.dart';

class CitationButton extends StatelessWidget {
  final String title;
  final Function onPress;
  const CitationButton({
    Key? key,
    required this.title,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: context.height * 0.25,
        width: context.height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(150.0),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              color: Color(0xffF7ECDE),
            ),
          ),
        ),
      ),
    );
  }
}
