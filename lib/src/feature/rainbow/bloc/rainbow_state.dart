part of 'rainbow_bloc.dart';

// Use the `freezed` package to create a sealed class for RainbowState.
@freezed
class RainbowState with _$RainbowState {
  const RainbowState._(); // Private constructor for the base class.

  // Define a factory constructor for the 'current' state with required parameters.
  const factory RainbowState.current({
    required final int backgroundColor,
    required final int textColor,
  }) = _Current;
}
