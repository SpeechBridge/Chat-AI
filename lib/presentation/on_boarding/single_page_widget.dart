import 'package:ai_chat_flutter/presentation/on_boarding/on_boarding_page.dart';
import 'package:flutter/material.dart';

class SinglePage extends StatelessWidget {
  const SinglePage({
    Key? key,
    required this.item,
  }) : super(key: key);
  final OnboardingItem item;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 330, maxWidth: 330),
          child: Image.asset(item.image),
        ),
        const Spacer(),
        Text(
          item.headline,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 42,
            height: 0.8,
            letterSpacing: 0.8,
          ),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}
