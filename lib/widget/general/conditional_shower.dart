import 'package:flutter/material.dart';

class ConditionalShower extends StatelessWidget {
  final bool isNull;
  final WidgetBuilder builder;
  const ConditionalShower({
    required this.isNull,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isNull
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : builder(context);
  }
}
