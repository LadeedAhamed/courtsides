import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TReadMoreText extends StatelessWidget {
  const TReadMoreText({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
        trimLines: 2,
        trimExpandedText: 'Show less',
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
        data);
  }
}
