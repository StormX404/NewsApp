import 'package:flutter/material.dart';
import 'package:news_app/core/shimmer/shimmer_effect.dart';
import 'package:news_app/core/utils/device/device_utility.dart';

class NewsTileShimmer extends StatelessWidget {
  const NewsTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = AppDeviceUtils.getScreenWidth(context);

    return Stack(
      children: [
        const ShimmerEffect(width: double.infinity, height: 120), // Background shimmer
        const Positioned(child: ShimmerEffect(width: 120, height: 120)), // Image shimmer
        _buildShimmerBlock(top: 10, left: 140, width: screenWidth * 0.3, height: 10),
        _buildShimmerBlock(top: 50, left: 140, width: screenWidth * 0.5, height: 5),
        _buildShimmerBlock(top: 60, left: 140, width: screenWidth * 0.5, height: 5),
        _buildShimmerBlock(top: 100, left: 140, width: screenWidth * 0.2, height: 6),
      ],
    );
  }

  Widget _buildShimmerBlock({required double top, required double left, required double width, required double height}) {
    return Positioned(
      top: top,
      left: left,
      child: ShimmerEffect(width: width, height: height),
    );
  }
}

class NewsTileListShimmer extends StatelessWidget {
  const NewsTileListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
          margin: const EdgeInsets.only(bottom: 15, right: 15),
          child: const NewsTileShimmer(),
        ),
        childCount: 6,
      ),
    );
  }
}
