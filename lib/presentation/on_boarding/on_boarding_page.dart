// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ai_chat_flutter/presentation/on_boarding/single_page_widget.dart';
import 'package:ai_chat_flutter/presentation/search_sign/bottom_navigation/bottom_navigation_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      headline: "Просто взмахни",
      subline: "Попробуйте новый сервис\nдля распознавания жестов",
      image: "assets/images/onboarding1.png",
    ),
    OnboardingItem(
      headline: "Общайтесь",
      subline: "Попробуйте новый сервис\nдля распознавания жестов",
      image: "assets/images/onboarding2.png",
    ),
    OnboardingItem(
      headline: "Учись",
      subline: "Попробуйте новый сервис\nдля распознавания жестов",
      image: "assets/images/onboarding3.png",
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
      child: Padding(
        padding: EdgeInsets.only(
          top: 123.h,
          bottom: 45.h,
        ),
        child: Column(
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
            SizedBox(height: 39.h),
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
                      color: activePage == index
                          ? Theme.of(context).colorScheme.onSurfaceVariant
                          : Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            SizedBox(height: 39.h),
            FilledButton.tonal(
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
                      builder: (BuildContext context) =>
                          const BottomNavigationWidget(),
                    ),
                  );
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 30.h),
                child: Text(
                  isLastPage ? "Регистрация и вход" : "Заценим!",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String headline;
  final String subline;
  final String image;
  OnboardingItem({
    required this.headline,
    required this.subline,
    required this.image,
  });
}
