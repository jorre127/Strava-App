import 'package:flutter/material.dart';

typedef ConditionalBuilder<T> = Widget Function(BuildContext, T);

class ConditionalShower<T> extends StatelessWidget {
  final T? data;
  final ConditionalBuilder<T> builder;
  const ConditionalShower({
    required this.data,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = this.data;
    return data == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : builder(context, data);
  }
}
