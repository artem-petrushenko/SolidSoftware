part of 'rainbow_bloc.dart';

@freezed
class RainbowEvent with _$RainbowEvent {
  const RainbowEvent._();

  const factory RainbowEvent.fetchColors() = _FetchColors;

  const factory RainbowEvent.changeColors() = _ChangeColors;
}
