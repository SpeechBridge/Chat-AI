// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_chat_flutter/presentation/on_boarding/on_board_colors.dart';
import 'package:ai_chat_flutter/presentation/on_boarding/single_page_widget.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int activePage = 0;
  double currentPageValue = 0.0;
  final PageController _pageController = PageController();

  List<OnboardingItem> onboardingItems = [
    OnboardingItem(
      headline: "Отличный сервис каршеринга",
      image: "assets/images/onboarding1.png",
      color: AppColors.colorful01,
    ),
    OnboardingItem(
      headline: "Общественный транспорт тратит много времени впустую?",
      image: "assets/images/onboarding2.png",
      color: AppColors.colorful02,
    ),
    OnboardingItem(
      headline: "Нужна машина для потрясающих выходных?",
      image: "assets/images/onboarding3.png",
      color: AppColors.colorful03,
    ),
    OnboardingItem(
      headline: "Получите понравившуюся Вам машину",
      image: "assets/images/onboarding4.png",
      color: AppColors.colorful04,
    ),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLastPage = activePage == onboardingItems.length - 1;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      color: onboardingItems[activePage].color,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (value) {
                    setState(() {
                      activePage = value;
                    });
                  },
                  controller: _pageController,
                  itemCount: onboardingItems.length,
                  itemBuilder: (context, index) {
                    final item = onboardingItems[index];
                    if (index == currentPageValue.floor()) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(currentPageValue - index)
                          ..scale(1 - (currentPageValue - index).abs()),
                        alignment: Alignment.centerLeft,
                        child: SinglePage(
                          item: item,
                        ),
                      );
                    } else if (index == currentPageValue.floor() + 1) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(currentPageValue - index)
                          ..scale(1 - (currentPageValue - index).abs()),
                        alignment: Alignment.centerRight,
                        child: SinglePage(
                          item: item,
                        ),
                      );
                    } else {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(currentPageValue - index)
                          ..scale(1 - (currentPageValue - index).abs()),
                        alignment: Alignment.center,
                        child: SinglePage(
                          item: item,
                        ),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                  onboardingItems.length,
                  (index) {
                    return AnimatedContainer(
                      height: 3,
                      margin: const EdgeInsets.only(right: 5.0),
                      width: activePage == index ? 30 : 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color:
                            activePage == index ? AppColors.white : Colors.grey,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
              const SizedBox(height: 14),
              TextButton(
                onPressed: () {
                  if (!isLastPage) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        //тут должен быть переход на страницу регистрации
                        builder: (context) => Container(),
                      ),
                    );
                  }
                },
                child: Center(
                  child: Container(
                    width: 352.0,
                    height: 55.0,
                    padding: const EdgeInsets.only(
                        top: 16.0, right: 26.0, bottom: 16.0, left: 26.0),
                    decoration: BoxDecoration(
                      color: AppColors.buttonColor1,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                    ),
                    child: Center(
                      child: Text(
                        isLastPage ? "Регистрация и вход" : "Далее",
                        style: TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String headline;
  final String image;
  final Color color;
  OnboardingItem({
    required this.headline,
    required this.image,
    required this.color,
  });
}
