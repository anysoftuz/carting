import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

class AppScope extends Equatable {
  const AppScope({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  /// Returns a [SystemUiOverlayStyle] based on the [ThemeMode] setting.
  /// In other words, if the theme is dark, returns light; if the theme is
  /// light, returns dark.
  SystemUiOverlayStyle resolvedSystemUiOverlayStyle() {
    Brightness brightness;
    switch (themeMode) {
      case ThemeMode.light:
        brightness = Brightness.light;
      case ThemeMode.dark:
        brightness = Brightness.dark;
      default:
        brightness = Brightness.dark;
    }

    final overlayStyle = brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return overlayStyle;
  }

  AppScope copyWith({
    ThemeMode? themeMode,
  }) =>
      AppScope(
        themeMode: themeMode ?? this.themeMode,
      );

  static AppScope of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;
    return scope.modelBindingState.currentModel;
  }

  static Future<void> update(BuildContext context, AppScope newModel) async {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_ModelBindingScope>()!;

    scope.modelBindingState.updateModel(newModel);
    // Save Storage
    await saveStorage(newModel);
  }

  static Future<void> saveStorage(AppScope newModel) async {
    final mode = themeModeSw(newModel.themeMode);

    await StorageRepository.putString(
      StorageKeys.MODE,
      mode,
    );
  }

  @override
  List<Object> get props => [themeMode];
}

String themeModeSw(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.dark:
      return 'dark';
    case ThemeMode.light:
      return 'light';
    default:
      return 'system';
  }
}

class _ModelBindingScope extends InheritedWidget {
  const _ModelBindingScope({
    required this.modelBindingState,
    required super.child,
  });

  final _DependencyScopeState modelBindingState;

  @override
  bool updateShouldNotify(_ModelBindingScope oldWidget) => true;
}

class DependencyScope extends StatefulWidget {
  const DependencyScope({
    required this.initialModel,
    required this.child,
    super.key,
  });

  final AppScope initialModel;
  final Widget child;

  @override
  State<DependencyScope> createState() => _DependencyScopeState();
}

class _DependencyScopeState extends State<DependencyScope> {
  late AppScope currentModel;

  @override
  void initState() {
    super.initState();
    currentModel = widget.initialModel;
  }

  void updateModel(AppScope newModel) {
    if (newModel != currentModel) {
      setState(() {
        currentModel = newModel;
      });
    }
  }

  @override
  Widget build(BuildContext context) => BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 4),
        child: _ModelBindingScope(
          modelBindingState: this,
          child: widget.child,
        ),
      );
}

const double kDefaultBackGestureWidth = 20;

/// Applies a [backGestureWidth] to descendant widgets.
class BackGestureWidthTheme extends InheritedWidget {
  const BackGestureWidthTheme({
    super.key,
    required this.backGestureWidth,
    required super.child,
  });

  final BackGestureWidthGetter backGestureWidth;

  static final BackGestureWidthGetter _kDefaultTheme =
      BackGestureWidth.fixed(kDefaultBackGestureWidth);

  static BackGestureWidthGetter of(BuildContext context) {
    final inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<BackGestureWidthTheme>();
    return inheritedTheme?.backGestureWidth ?? _kDefaultTheme;
  }

  @override
  bool updateShouldNotify(BackGestureWidthTheme oldWidget) =>
      backGestureWidth != oldWidget.backGestureWidth;
}

typedef BackGestureWidthGetter = double Function(ValueGetter<Size>);

/// [BackGestureWidthGetter] builders
class BackGestureWidth {
  const BackGestureWidth._();

  /// Always returns same value equals to [width]
  static BackGestureWidthGetter fixed(double width) => (_) => width;

  /// Always returns a value equals to [fraction] of screen width
  static BackGestureWidthGetter fraction(double fraction) =>
      (sizeGetter) => sizeGetter().width * fraction;
}
