import 'package:flutter/material.dart';

class ProviderInheritedWidget<T> extends InheritedWidget {
  final T data;
  final Widget child;

  ProviderInheritedWidget({
    required this.data,
    required this.child,
  }) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("update Provider notify");
    return true;
  }
}
