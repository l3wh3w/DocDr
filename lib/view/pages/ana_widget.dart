import 'package:docdr/product/custom_widget/provider.dart';
import 'package:docdr/core/constant/static/makaleler.dart';
import 'package:docdr/core/constant/static/sayfa_listesi.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AnaWidget extends StatefulWidget {
  const AnaWidget({super.key});

  @override
  State<AnaWidget> createState() => _AnaWidget();
}

class _AnaWidget extends State<AnaWidget> {
  final HesaplamaProvider hesaplamaProvider = HesaplamaProvider();

  late final PageController _pageController;
  TextEditingController sayiController = TextEditingController();
  var _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double dynamicSize = MediaQuery.of(context).size.width * 0.01;
    return ChangeNotifierProvider<HesaplamaProvider>(
        create: (context) => hesaplamaProvider,
        child: Scaffold(
          appBar: AppBar(
            leading: _currPageValue == 0
                ? IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : const SizedBox(
                    width: 48,
                  ),
            title: Text(Basliklar.basliklarList[_currPageValue.toInt()]),
            centerTitle: true,
          ),
          bottomNavigationBar: BottomAppBar(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Opacity(
                  opacity: _currPageValue != 0 ? 1.0 : 0.0,
                  child: IconButton(
                    icon: const Icon(Icons.navigate_before),
                    onPressed: _currPageValue != 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                  ),
                ),
                DotsIndicator(
                  mainAxisAlignment: MainAxisAlignment.center,
                  onTap: (position) {
                    _pageController.animateToPage(
                      position.toInt(),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  dotsCount: SayfaListesi.stringSayfa.length,
                  position: _currPageValue,
                  decorator: DotsDecorator(
                      color: const Color.fromARGB(179, 99, 104, 158),
                      activeColor: const Color.fromARGB(179, 81, 72, 140),
                      size: Size.square(dynamicSize * 1.7),
                      activeSize: Size(dynamicSize * 5, dynamicSize * 2),
                      activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      spacing: EdgeInsets.all(dynamicSize * 1.4)),
                ),
                Opacity(
                    opacity: _currPageValue != SayfaListesi.stringSayfa.length - 1 ? 1.0 : 0.0,
                    child: IconButton(
                      icon: const Icon(Icons.navigate_next),
                      onPressed: _currPageValue != SayfaListesi.stringSayfa.length - 1
                          ? () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          : null,
                    ))
              ],
            ),
          ),
          body: PageView(
            controller: _pageController,
            children: SayfaListesi.widgetSayfa,
          ),
        ));
  }
}
