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
