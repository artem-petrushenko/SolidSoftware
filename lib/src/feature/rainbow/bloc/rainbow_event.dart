part of 'rainbow_bloc.dart';

// Use the `freezed` package to create a sealed class for RainbowEvent.
@freezed
class RainbowEvent with _$RainbowEvent {
  const RainbowEvent._(); // Private constructor for the base class.

  // Define a factory constructor for the 'fetchColors' event.
  const factory RainbowEvent.fetchColors() = _FetchColors;

  // Define a factory constructor for the 'changeColors' event.
  const factory RainbowEvent.changeColors() = _ChangeColors;
}
