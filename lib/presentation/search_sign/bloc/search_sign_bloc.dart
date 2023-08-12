import 'package:ai_chat_flutter/data/remote/sign_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ai_chat_flutter/data/model/sign_data_model/sign_data_model.dart';
part 'search_sign_event.dart';
part 'search_sign_state.dart';
part 'search_sign_bloc.freezed.dart';

class SearchSignBloc extends Bloc<SearchSignEvent, SearchSignState> {
  SearchSignBloc() : super(const SearchSignState()) {
    on<_Search>(_onSearch);
  }

  final SignService _signService = SignService();

  Future<void> _onSearch(_Search event, Emitter<SearchSignState> emit) async {
    if (event.word == '' || event.word!.isEmpty) {
      if (state.status == SearchSignStatus.success) {
        emit(state.copyWith(status: SearchSignStatus.initial));
      }
      return;
    }
    final word = event.word;
    emit(state.copyWith(status: SearchSignStatus.loading, word: word));
    try {
      final data = await _signService.searchSigns(event.word!);
      // Проверяем, соответствует ли текущее слово слову, по которому был выполнен поиск
      if (state.word == word) {
        emit(state.copyWith(
            status: SearchSignStatus.success, data: data, word: word));
      }
    } catch (_) {
      emit(state.copyWith(status: SearchSignStatus.failure));
    }
  }
}
