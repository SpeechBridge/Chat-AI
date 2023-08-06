part of 'search_sign_bloc.dart';

@freezed
class SearchSignEvent with _$SearchSignEvent {
  const factory SearchSignEvent.started(String? word) = _Started;
  const factory SearchSignEvent.refreshed() = _Refreshed;
}
