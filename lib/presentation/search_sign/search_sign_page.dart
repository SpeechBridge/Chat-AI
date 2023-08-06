import 'package:ai_chat_flutter/data/remote/sign_service.dart';
import 'package:ai_chat_flutter/presentation/search_sign/bloc/search_sign_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSignPage extends StatelessWidget {
  const SearchSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchSignBloc(SignService()),
      child: const SearchSignView(),
    );
  }
}

class SearchSignView extends StatelessWidget {
  const SearchSignView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
