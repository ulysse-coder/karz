import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ulysse_app/core/constants/colors.dart';
import 'package:ulysse_app/core/widgets/on_boarding_widget.dart';
import 'package:ulysse_app/features/authentification/presentation/vues/how_app_is_used_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final RxInt _currentPageIndex = 0.obs;
  final List<Widget> _pages = const [
    OnBoardingWidget(
      image: 'assets/image/deliverer.png', 
      title: 'Bienvenue', 
      description: "Prêt à révolutionner la manière dont vous commandez et livrez de la nourriture ? Suivez-nous pour une expérience culinaire sans précédent !"
    ),
    OnBoardingWidget(
      image: 'assets/image/fast-food.png', 
      title: 'Découvrez une nouvelle ère de gourmandise !', 
      description: "Kally vous connecte avec les meilleurs restaurants de votre région et les livreurs les plus fiables. Votre prochaine expérience gastronomique n'attend que vous !"
    ),
    OnBoardingWidget(
      image: 'assets/image/client.png', 
      title: 'Prêt à simplifier votre vie ?', 
      description: "Avec Kaaly, commandez vos plats préférés en un clin d'œil, de la cuisine du restaurant à votre porte. Prêt à commencer l'aventure ?"
    ),
    HowAppIsUsedView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                _currentPageIndex.value = index;
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return _pages[index];
              }),
          Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Obx(() => DotsIndicator(
                dotsCount: _pages.length,
                position: _currentPageIndex.value,
                decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeColor: secondary,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ))
          ),
        ],
      ),
    );
  }
}
