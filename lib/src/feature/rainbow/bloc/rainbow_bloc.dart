import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:solid_software/src/feature/rainbow/data/repository/rainbow_repository.dart';

part 'rainbow_event.dart';

part 'rainbow_state.dart';

part 'rainbow_bloc.freezed.dart';

class RainbowBloc extends Bloc<RainbowEvent, RainbowState> {
  final RainbowRepository _rainbowRepository;
  final Random random = Random();

  RainbowBloc({required RainbowRepository rainbowRepository})
      : _rainbowRepository = rainbowRepository,
        super(
          const RainbowState.current(
            backgroundColor: 0xFF000000,
            textColor: 0xFFFFFFFF,
          ),
        ) {
    on<RainbowEvent>(
      (event, emit) => event.map<Future<void>>(
        fetchColors: (event) => _onFetchColors(event, emit),
        changeColors: (event) => _onChangeColors(event, emit),
      ),
    );
  }

  // Fetch the colors from the repository and emit a new state.
  Future<void> _onFetchColors(
    _FetchColors event,
    Emitter<RainbowState> emit,
  ) async {
    try {
      final backgroundColor = _rainbowRepository.getBackgroundColor();
      final textColor = _rainbowRepository.getTextColor();
      emit(_Current(backgroundColor: backgroundColor, textColor: textColor));
    } on Object catch (_) {
      emit(const _Current(backgroundColor: 0xFF000000, textColor: 0xFFFFFFFF));
    }
  }

  // Generate random colors, update the repository, and emit a new state.
  Future<void> _onChangeColors(
    _ChangeColors event,
    Emitter<RainbowState> emit,
  ) async {
    try {
      const alpha = 255;
      final red = random.nextInt(256);
      final green = random.nextInt(256);
      final blue = random.nextInt(256);

      final newColor = generateColor(alpha, red, green, blue);

      final invertedRed = 255 - red;
      final invertedGreen = 255 - green;
      final invertedBlue = 255 - blue;

      final newTextColor =
          generateColor(alpha, invertedRed, invertedGreen, invertedBlue);

      await _rainbowRepository.setBackgroundColor(newColor);
      await _rainbowRepository.setTextColor(newTextColor);

      emit(_Current(backgroundColor: newColor, textColor: newTextColor));
    } on Object catch (_) {
      emit(const _Current(backgroundColor: 0xFF000000, textColor: 0xFFFFFFFF));
    }
  }

  int generateColor(
          final int alpha, final int red, final int green, final int blue) =>
      (alpha << 24) | (red << 16) | (green << 8) | blue;
}
