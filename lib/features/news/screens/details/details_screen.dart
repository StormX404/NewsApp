import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/custom_shapes/containers/play_sound_container.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/screens/details/widget/rounded_image_with_top_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = AppDeviceUtils.getScreenHeight(context);
    final BorderRadius borderRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            RoundedImageWithTopBar(
                borderRadius: borderRadius, screenHeight: screenHeight),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Musk and Trump’s Fort Knox Trip Is About Bitcoin',
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'By ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            TextSpan(
                              text: 'Matthew Gault',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      CircularIcon(
                        width: 40,
                        height: 40,
                        icon: Icons.share_rounded,
                        color: Colors.blue,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  const PlaySoundContainer(),
                  const SectionHeading(title: 'Content'),
                  Text('Can a President make money out of thin air? On paper, yes.Donald Trump and Elon Musk have been talking a lot about Fort Knox lately, the place where America keeps its official gold reserves. Both h… [+3792 chars]',
                    style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

