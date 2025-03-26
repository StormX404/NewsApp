import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/utils/constants/sizes.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsTile extends StatelessWidget {
  const NewsTile(
      {super.key,
        required this.imageUrl,
        required this.title,
        required this.time,
        required this.author,
        required this.ontap});

  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String timeAgo = timeago.format(dateTime, locale: 'en');
    final dark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15, right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // Blurred Background
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: dark
                        ? AppColors.darkCardColor.withOpacity(0.6)
                        : AppColors.lightCardColor.withOpacity(0.4),
                  ),
                  width: double.infinity,
                  height: 120,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: imageUrl,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        ),
                      ),

                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          author,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          title,
                          maxLines: 2,
                        ),
                        const SizedBox(height: AppSizes.sm),
                        Text(
                          timeAgo,
                          style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}