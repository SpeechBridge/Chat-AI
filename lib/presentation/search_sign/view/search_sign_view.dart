import 'package:ai_chat_flutter/presentation/search_sign/bloc/search_sign_bloc.dart';
import 'package:ai_chat_flutter/presentation/search_sign/widgets/sign_learn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSignView extends StatefulWidget {
  const SearchSignView({super.key});

  @override
  SearchSignViewState createState() => SearchSignViewState();
}

class SearchSignViewState extends State<SearchSignView> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: KeyboardVisibilityBuilder(
        controller: KeyboardVisibilityController(),
        builder: (context, isKeyboardVisible) {
          if (!isKeyboardVisible) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
          return BlocBuilder<SearchSignBloc, SearchSignState>(
            builder: (context, state) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 40.h, left: 30.h, right: 30.h, bottom: 10.h),
                    child: SearchBar(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 10.h),
                      ),
                      controller: _controller,
                      hintText: 'Например: "комета"',
                      trailing: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
                      onTap: () {},
                      onChanged: (value) {
                        context
                            .read<SearchSignBloc>()
                            .add(SearchSignEvent.search(value));
                      },
                    ),
                  ),
                  //над оптимизаией еще работать и работать
                  if (state.status == SearchSignStatus.success)
                    Expanded(
                      child: ListView.builder(
                        //кэш для оптимизации
                        cacheExtent: 15000.0,
                        itemCount: state.data?.signDataList.length ?? 0,
                        itemBuilder: (context, index) {
                          final signData = state.data?.signDataList[index];
                          return Padding(
                            padding: EdgeInsets.only(left: 20.h, right: 20.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(signData?.category ?? '',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    )),
                                SizedBox(height: 4.h),
                                Wrap(
                                  spacing: 8.0, // gap between adjacent chips
                                  runSpacing: 4.0, // gap between lines
                                  children: List.generate(
                                    signData?.signs.length ?? 0,
                                    (index) {
                                      final sign = signData?.signs[index];
                                      return ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignDetailPage(
                                                text: sign!.text,
                                                link: sign.link,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(sign?.text ?? ''),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.h),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  // Вы можете добавить дополнительные виджеты для других состояний
                ],
              );
            },
          );
        },
      ),
    );
  }
}
