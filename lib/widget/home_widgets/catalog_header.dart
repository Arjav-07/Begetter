import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Aligns children to the start
      children: [
        "Catalog App"
            .text
            .xl5
            .bold
            .color(Theme.of(context).colorScheme.primary)
            .make(),
        "Trending Products"
            .text
            .xl2
            .color(Theme.of(context).colorScheme.primary)
            .make(),
      ],
    );
  }
}
