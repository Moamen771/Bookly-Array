import 'package:flutter/material.dart';
import '../../../../../core/utils/assets_data.dart';

class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: NetworkImage(
                AssetsData.testImage,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
