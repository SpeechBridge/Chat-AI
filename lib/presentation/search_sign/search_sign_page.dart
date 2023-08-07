import 'package:ai_chat_flutter/presentation/search_sign/bloc/search_sign_bloc.dart';
import 'package:ai_chat_flutter/presentation/search_sign/view/search_sign_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSignPage extends StatelessWidget {
  const SearchSignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchSignBloc>(
      create: (context) => SearchSignBloc(),
      child: const SearchSignView(),
    );
  }
}
