import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/background/blurred_background.dart';
import 'package:news_app/core/functions/setup_service_locator.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/custom_shapes/containers/play_sound_container.dart';
import 'package:news_app/core/widgets/texts/section_heading.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:news_app/features/news/domain/use_cases/speak_use_case.dart';
import 'package:news_app/features/news/domain/use_cases/stop_use_case.dart';
import 'package:news_app/features/news/screens/details/cubits/details_cubit/details_cubit.dart';
import 'package:news_app/features/news/screens/details/views/widget/author_name_and_share_button.dart';
import 'package:news_app/features/news/screens/details/views/widget/rounded_image_with_top_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.news});

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    final speakUseCase = getIt<SpeakUseCase>();
    final stopUseCase = getIt<StopUseCase>();

    double screenHeight = AppDeviceUtils.getScreenHeight(context);
    final BorderRadius borderRadius = const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20),);

    return BlocProvider(
      create: (context) => DetailsCubit(speakUseCase, stopUseCase),
      child: Stack(
        children: [
          const BlurredBackground(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  RoundedImageWithTopBar(borderRadius: borderRadius, screenHeight: screenHeight, image: news.urlToImage!, news: news),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(news.title, style: Theme.of(context).textTheme.headlineMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        AuthorNameAndShareButton(news: news),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        PlaySoundContainer(text: news.content),
                        const SectionHeading(title: 'Content'),
                        Text(news.content, style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}


