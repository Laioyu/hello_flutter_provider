import 'package:flutter/material.dart';

class NotifyModel extends Listenable {
  final List _linteners = [];

  @override
  void addListener(VoidCallback listener) {
    this._linteners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    this._linteners.remove(listener);
  }

  void notifyDataSetChanged() {
    _linteners.forEach((item) => item());
  }
}
