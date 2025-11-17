part of 'maps_cubit.dart';

@immutable
abstract class MapsState {}

/// Initial state before any map-related action occurs.
class MapsInitial extends MapsState {}

/// Generic state indicating that an operation is in progress.
class MapsLoading extends MapsState {}

/// Generic state for any failure during a map-related operation.
class MapsFailure extends MapsState {
  final String message;

  MapsFailure({required this.message});
}

/// State for successfully loaded place suggestions.
class MapsLoadedSuggestionsSuccess extends MapsState {
  final List<PlaceSuggestionModel> placeSuggestionList;

  MapsLoadedSuggestionsSuccess({required this.placeSuggestionList});
}

/// State for successfully loaded location data of a place.
class MapsLoadedLocationSuccess extends MapsState {
  final List<dynamic> placeLocation;

  MapsLoadedLocationSuccess({required this.placeLocation});
}

/// State for successfully loaded directions between locations.
class MapsLoadedDirectionsSuccess extends MapsState {
  final dynamic placeDirections;

  MapsLoadedDirectionsSuccess({required this.placeDirections});
}

/// Generic state for successfully fetched lists, e.g., hospitals.
class MapsLoadedListSuccess<T> extends MapsState {
  final List<T?> items;

  MapsLoadedListSuccess({required this.items});
}
