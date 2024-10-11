import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karz/core/constants/colors.dart';
import 'package:karz/core/widgets/on_boarding_widget.dart';
import 'package:karz/features/authentification/presentation/vues/how_app_is_used_view.dart';

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
      image: 'asset/images/Welcome.png', 
      title: 'Bienvenue', 
      description: "Nous sommes ravis de vous accueillir dans notre communauté dédiée à simplifier votre expérience de stationnement !"
    ),
    OnBoardingWidget(
      image: 'asset/images/location.png', 
      title: 'Préférences de stationnement', 
      description: "Définissez vos préférences en matière de stationnement. Que vous recherchiez un parking couvert, sécurisé ou à tarif réduit, nous avons ce qu'il vous faut. Personnalisez votre recherche pour trouver la place idéale qui correspond à vos besoins."
    ),
    OnBoardingWidget(
      image: 'asset/images/reservation.png', 
      title: 'Options de réservation', 
      description: "Explorez nos différentes options de réservation. Que vous souhaitiez réserver une place pour quelques heures, une journée entière ou même de façon régulière, nous avons des solutions flexibles pour répondre à vos besoins de stationnement."
    ),
    OnBoardingWidget(
      image: 'asset/images/illustration4.png', 
      title: ' Profitez de votre place réservée', 
      description: "Une fois votre réservation confirmée, dirigez-vous vers votre place de parking réservée en toute sérénité. Plus besoin de tourner en rond à la recherche d'un stationnement libre, votre place vous attend !"
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
