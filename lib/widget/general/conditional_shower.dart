import 'package:flutter/material.dart';
import 'package:flutter_template/widget/general/section_card.dart';

typedef ConditionalBuilder<T> = Widget Function(BuildContext, T);

class ConditionalShower<T> extends StatelessWidget {
  final T? data;
  final double placeholderHeight;
  final ConditionalBuilder<T> builder;
  const ConditionalShower({
    required this.data,
    required this.builder,
    this.placeholderHeight = 150,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = this.data;
    return data == null
        ? SizedBox(
            height: placeholderHeight,
            child: const SectionCard(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : builder(context, data);
  }
}
