import 'package:flutter/material.dart';
import 'package:provider_learn/NotifyModel.dart';
import 'package:provider_learn/ProviderInheritedWidget.dart';

class ModelProviderWidget<T extends NotifyModel> extends StatefulWidget {
  final T data;
  final Widget child;

  ModelProviderWidget({
    Key? key,
    required this.data,
    required this.child,
  }) : super(key: key);

  static T? of<T>(BuildContext context, {bool islisten = true}) {
    return (islisten
            ? context.dependOnInheritedWidgetOfExactType<
                ProviderInheritedWidget<T>>()
            : (context
                .getElementForInheritedWidgetOfExactType<
                    ProviderInheritedWidget<T>>()
                ?.widget as ProviderInheritedWidget<T>))
        ?.data;
  }

  @override
  State<StatefulWidget> createState() {
    return _ModelProviderState<T>();
  }
}

class _ModelProviderState<T extends NotifyModel>
    extends State<ModelProviderWidget<T>> {
  void notify() {
    print("notify");
    setState(() {
      print("set state");
      print(this.toString());
      print(widget.child.hashCode);
    });
  }

  @override
  void initState() {
    widget.data.addListener(notify);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(notify);
    super.dispose();
  }

  @override
  void didUpdateWidget(ModelProviderWidget<T> oldWidget) {
    if (oldWidget.data != widget.data) {
      oldWidget.data.removeListener(notify);
      widget.data.addListener(notify);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild model provider");
    print(widget.child.runtimeType.toString());
    return ProviderInheritedWidget<T>(
      data: widget.data,
      child: widget.child,
    );
  }
}
