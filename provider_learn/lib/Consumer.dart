import 'package:flutter/cupertino.dart';

import 'ModelProviderWidget.dart';

class Consumer<T> extends StatelessWidget {
  final Widget Function(BuildContext context, T? value) builder;

  const Consumer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("rebuild consumer");
    return builder(context, ModelProviderWidget.of<T>(context));
  }
}
