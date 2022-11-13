import 'package:flutter/material.dart';

class CitationContainer extends StatelessWidget {
  final String citationText;
  final bool isReference;
  const CitationContainer({
    Key? key,
    required this.citationText,
    required this.isReference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(15.0),
      child: Text(
        citationText,
        style: isReference ? citationReferenceStyle : citationTextStyle,
        textAlign: TextAlign.start,
      ),
    );
  }
}

const TextStyle citationTextStyle = TextStyle(
  fontSize: 25.0,
  height: 1.8,
  wordSpacing: 2,
);
const TextStyle citationReferenceStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.grey,
);
