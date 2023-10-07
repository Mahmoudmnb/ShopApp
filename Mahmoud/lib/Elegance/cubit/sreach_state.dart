part of 'sreach_cubit.dart';

@immutable
sealed class SearchState {}

final class SreachInitial extends SearchState {}
class SearchingState extends SearchState{}
class OpenDrawerState extends SearchState{}
class changeValueOfFiltersPrice extends SearchState{}
class FilterRatringState extends SearchState{}
class FilterDiscountState extends SearchState{}