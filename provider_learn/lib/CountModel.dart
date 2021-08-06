import 'package:provider_learn/NotifyModel.dart';

class CountModel extends NotifyModel {
  int count = 0;

  CountModel({required this.count});

  void increment() {
    this.count++;
    print("count ++");
    this.notifyDataSetChanged();
  }
}
