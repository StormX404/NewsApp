import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/features/news/screens/details/cubits/details_cubit/details_cubit.dart';

class PlaySoundContainer extends StatelessWidget {
  const PlaySoundContainer({
    super.key, required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        final isPlaying = state is DetailsSpeaking;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Blurred Background
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: dark
                        ? AppColors.darkCardColor.withOpacity(0.6)
                        : AppColors.lightCardColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (isPlaying) {
                          context.read<DetailsCubit>().stop();
                        } else {
                          context.read<DetailsCubit>().speak(text);
                        }
                      },
                      icon: Icon(isPlaying ? Iconsax.pause : Iconsax.play, size: 25),
                    ),
                    Expanded(
                      child: Lottie.asset(
                        fit: BoxFit.fill,
                        'assets/images/animations/voice.json',
                        width: double.infinity,
                        animate: isPlaying,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
