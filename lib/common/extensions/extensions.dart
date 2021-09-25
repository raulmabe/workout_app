import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_app/l10n/l10n.dart';

extension IterableExt<T> on Iterable<T> {
  Iterable<T> separateBy(T separator) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return [];

    final _l = [iterator.current];
    while (iterator.moveNext()) {
      _l
        ..add(separator)
        ..add(iterator.current);
    }
    return _l;
  }

  Iterable<T> embrace(T t) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) return [];

    return [t, ...this, t];
  }
}

extension NumberExt on num {
  num get half => this * 1 / 2;
  num get third => this * 1 / 3;
  num get quater => this * 1 / 4;
  num get fifth => this * 1 / 5;
  bool get isZero => this == 0;
}

extension UtilExt on BuildContext {
  R? selectOrNull<T, R>(R Function(T) selector) {
    try {
      return select<T, R>(selector);
    } on ProviderNotFoundException {
      return null;
    }
  }

  T? readOrNull<T>() {
    try {
      return read<T>();
    } on ProviderNotFoundException {
      return null;
    }
  }

  AppLocalizations get l10n => AppLocalizations.of(this);
  NavigatorState get navigator => Navigator.of(this);
  ThemeData get theme => Theme.of(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get screen => mediaQuery.size;
  EdgeInsets get padding => mediaQuery.padding;

  bool get isLandscape => mediaQuery.orientation == Orientation.landscape;
}

extension StringExt on String {
  String get capitalize =>
      isEmpty ? this : this[0].toUpperCase() + substring(1);
}
