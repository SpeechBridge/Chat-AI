part of 'search_sign_bloc.dart';

enum SearchSignStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == SearchSignStatus.initial;
  bool get isLoading => this == SearchSignStatus.loading;
  bool get isSuccess => this == SearchSignStatus.success;
  bool get isFailure => this == SearchSignStatus.failure;
}

@freezed
class SearchSignState with _$SearchSignState {
  const factory SearchSignState({
    @Default(SearchSignStatus.initial) SearchSignStatus status,
    String? word,
    SignDataModel? data,
  }) = _SearchSignState;
}
