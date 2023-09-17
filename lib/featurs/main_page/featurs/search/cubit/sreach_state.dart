part of 'sreach_cubit.dart';

@immutable
sealed class SearchState {}

final class SreachInitial extends SearchState {}

class SearchingState extends SearchState {}

class OpenDrawerState extends SearchState {}

class SearchResults extends SearchState {
  final List<Map<String, dynamic>> searchResult;
  SearchResults({required this.searchResult});
}

class SearchHistory extends SearchState {
  final List<Map<String, dynamic>> searchHistory;
  SearchHistory({required this.searchHistory});
}

class ChangeValueOfFiltersPrice extends SearchState {}

class FilterRatringState extends SearchState {}

class FilterDiscountState extends SearchState {}

class ResetFilter extends SearchState {}
