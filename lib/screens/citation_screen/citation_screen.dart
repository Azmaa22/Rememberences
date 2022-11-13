import 'package:flutter/material.dart';
import 'package:flutter_apps/data/models/citation_model.dart';
import 'package:flutter_apps/data/repos/citation_repo.dart';
import 'package:flutter_apps/screens/citation_screen/widgets/app_bar_container.dart';
import 'package:flutter_apps/screens/citation_screen/widgets/citation_container.dart';
import 'package:flutter_apps/screens/citation_screen/widgets/citation_counter.dart';
import 'package:flutter_apps/screens/citation_screen/widgets/number_container.dart';
import 'package:flutter_apps/utilities/constants/app_assets.dart';
import 'package:flutter_apps/utilities/constants/app_colors.dart';
import 'package:flutter_apps/utilities/constants/app_strings.dart';
import 'package:flutter_apps/utilities/service/media_query_values.dart';

class CitationScreen extends StatefulWidget {
  final String currentCitation;
  const CitationScreen({Key? key, required this.currentCitation})
      : super(key: key);

  @override
  State<CitationScreen> createState() => _CitationScreenState();
}

class _CitationScreenState extends State<CitationScreen> {
  List<Citation> citations = [];
  List<int> completeCitations = [];
  int citationNumber = 0;
  int completeNumber = 0;

  @override
  void initState() {
    super.initState();
    completeNumber = 0;
    getCitations().then(
      (value) {
        setState(() {
          citations = value;
        });
        completeCitations = List.filled(value.length, 0);
      },
    );
  }

  Future<List<Citation>> getCitations() async {
    List<Citation> tempCitations =
        await getCurrentCitation(citation: widget.currentCitation);

    return tempCitations;
  }

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(completeCitations.length);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: AppBarContainer(
            title: citations.isNotEmpty ? citations[0].category : '',
          ),
        ),
        body: RotatedBox(
          quarterTurns: 4,
          child: Container(
            height: context.height,
            width: context.width,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(
                  AppAssets.zekrBackground,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: citations.isNotEmpty
                ? PageView.builder(
                    controller: _pageController,
                    itemCount: citations.length,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      citationNumber = index;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CitationContainer(
                            citationText: AppStrings.referenceTitle +
                                ' : ' +
                                citations[citationNumber].reference,
                            isReference: true,
                          ),
                          Expanded(
                            flex: 4,
                            child: SingleChildScrollView(
                              child: CitationContainer(
                                citationText: citations[index].zekr,
                                isReference: false,
                              ),
                            ),
                          ),
                          const Divider(
                            height: 5,
                            color: kPrimaryColor,
                            indent: 10,
                            endIndent: 10,
                            thickness: 2,
                          ),
                          CitationContainer(
                            citationText: citations[citationNumber].description,
                            isReference: true,
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    NumberContainer(
                                      title: AppStrings.numberOfTimes,
                                      value:
                                          '${citations[citationNumber].count}',
                                      isLeft: false,
                                    ),
                                    CitationCounter(
                                      count: completeCitations[citationNumber]
                                          .toString(),
                                      onPress: () {
                                        print(
                                            completeCitations[citationNumber]);
                                        setState(() {
                                          completeCitations[citationNumber] +=
                                              1;
                                          if (completeCitations[
                                                  citationNumber] ==
                                              citations[citationNumber].count) {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 400),
                                              curve: Curves.easeInOut,
                                            );
                                            completeNumber = 0;
                                          }
                                        });
                                      },
                                    ),
                                    NumberContainer(
                                      isLeft: true,
                                      title: AppStrings.numberOfRemembrances,
                                      value:
                                          '${citationNumber + 1} / ${citations.length} ',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : const CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
