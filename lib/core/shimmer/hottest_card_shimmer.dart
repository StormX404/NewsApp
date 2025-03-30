import 'package:flutter/material.dart';
import 'package:news_app/core/shimmer/shimmer_effect.dart';
import 'package:news_app/core/utils/device/device_utility.dart';

class HottestCardShimmer extends StatelessWidget {
  const HottestCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ShimmerEffect(
        height: 250,
        width: AppDeviceUtils.getScreenWidth(context) * 0.8,
      ),
      Positioned(
        bottom: 20,
        left: 15,
        right: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerEffect(
              height: 10,
              width: AppDeviceUtils.getScreenWidth(context) * 0.6,
            ),
            const SizedBox(height: 5),
            ShimmerEffect(
              height: 10,
              width: AppDeviceUtils.getScreenWidth(context) * 0.8,
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerEffect(
                  height: 10,
                  width: AppDeviceUtils.getScreenWidth(context) * 0.3,
                ),
                ShimmerEffect(
                  height: 10,
                  width: AppDeviceUtils.getScreenWidth(context) * 0.1,
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}

class HottestCardListShimmer extends StatelessWidget {
  const HottestCardListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: HottestCardShimmer(),
            );
          }),
    );
  }
}

