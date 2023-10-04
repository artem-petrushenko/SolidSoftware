part of 'rainbow_bloc.dart';

@freezed
class RainbowState with _$RainbowState {
  const RainbowState._();

  const factory RainbowState.current({
    required final int backgroundColor,
    required final int textColor,
  }) = _Current;
}
