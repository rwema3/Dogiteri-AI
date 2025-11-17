import 'package:bloc/bloc.dart';
import 'package:url_launcher/url_launcher.dart';

/// Base state for URI launch operations.
abstract class LaunchUriState {}

/// Initial state before any URI launch attempt.
class LaunchUriInitial extends LaunchUriState {}

/// State indicating a successful URI launch.
class LaunchUriSuccess extends LaunchUriState {}

/// State indicating a failure during URI launch.
class LaunchUriFailure extends LaunchUriState {
  final String errorMessage;

  LaunchUriFailure({required this.errorMessage});
}

/// Cubit to handle launching URIs (e.g., phone dialer, contacts app).
class LaunchUriCubit extends Cubit<LaunchUriState> {
  LaunchUriCubit() : super(LaunchUriInitial());

  /// Opens the contacts app or dialer with the given [phoneNumber].
  /// Optional [scheme] can be provided (default is 'tel').
  Future<void> openContactsApp({
    required String phoneNumber,
    String? scheme,
  }) async {
    try {
      final Uri launchUri = Uri(
        scheme: scheme ?? 'tel',
        path: phoneNumber,
      );

      await launchUrl(launchUri);
      emit(LaunchUriSuccess());
    } catch (err) {
      emit(LaunchUriFailure(errorMessage: "Failed to open contacts app: $err"));
    }
  }
}
