import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utils/device/device_utility.dart';
import 'package:news_app/core/widgets/icon/favorite_icon.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:timeago/timeago.dart' as timeago;

class HottestCard extends StatelessWidget {
  const HottestCard({
    super.key,
    required this.imageUrl,
    required this.time,
    required this.title,
    required this.author,
    required this.onTap, required this.news,
  });

  final String imageUrl;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;
  final NewsEntity news;


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
          Positioned(
            top: 12,
            right: 15,
            child: FavoriteIcon(news: news,),
          ),
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: AppDeviceUtils.getScreenWidth(context) * 0.5,
                      child: Text(
                        author,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        timeAgo,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 14,
                        ),
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