import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/features/news/screens/cubits/details_cubit/details_cubit.dart';

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
        return Container(
          height: 55,
          decoration: BoxDecoration(
            color: dark ? AppColors.darkCardColor : AppColors.grey.withOpacity(.6),
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
        );
      },
    );
  }
}