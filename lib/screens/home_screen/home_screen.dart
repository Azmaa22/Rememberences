import 'package:flutter/material.dart';
import 'package:flutter_apps/screens/citation_screen/citation_screen.dart';
import 'package:flutter_apps/screens/home_screen/widgets/citation_button.dart';
import 'package:flutter_apps/utilities/constants/app_assets.dart';
import 'package:flutter_apps/utilities/constants/app_strings.dart';
import 'package:flutter_apps/utilities/service/media_query_values.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void goToCitationScreen(
      {required BuildContext context, required String citationCategory}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CitationScreen(
          currentCitation: citationCategory,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.homeBackground,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: context.height * 0.3,
                right: 20,
                child: CitationButton(
                  title: AppStrings.morningTitle,
                  onPress: () {
                    goToCitationScreen(
                      context: context,
                      citationCategory: AppStrings.morningTxt,
                    );
                  },
                ),
              ),
              Positioned(
                top: context.height * 0.6,
                left: 20,
                child: CitationButton(
                  title: AppStrings.eveningTitle,
                  onPress: () {
                    goToCitationScreen(
                      context: context,
                      citationCategory: AppStrings.eveningTxt,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
