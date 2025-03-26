import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/icon/circular_icon.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ShareIcon extends StatelessWidget {
  const ShareIcon({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return CircularIcon(icon: Icons.share_rounded, color: Colors.blue, onPressed: () async {
      final Uri url = Uri.parse(news.url!);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open the link')),
        );
      }
    },
    );
  }
}