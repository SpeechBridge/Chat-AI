part of 'search_sign_bloc.dart';

@freezed
class SearchSignEvent with _$SearchSignEvent {
  const factory SearchSignEvent.search(String? word) = _Search;
  const factory SearchSignEvent.refreshed() = _Refreshed;
}
