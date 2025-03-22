import 'package:flutter/material.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/icon/favourite_icon.dart';
import 'package:timeago/timeago.dart' as timeago;

class HottestCard extends StatelessWidget {
  const HottestCard({
    super.key,
    required this.imageUrl,
    required this.time,
    required this.title,
    required this.author,
    required this.onTap,
  });

  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(time);
    String timeAgo = timeago.format(dateTime, locale: 'en');

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 250,
            width: AppDeviceUtils.getScreenWidth(context) * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
          ),
          Container(
            height: 250,
            width: AppDeviceUtils.getScreenWidth(context) * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black87,
                  Colors.transparent,
                ],
              ),
            ),
          ),
          const Positioned(
            top: 12,
            right: 15,
            child: FavouriteIcon(),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      author,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      timeAgo,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}