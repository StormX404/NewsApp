import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
import 'package:news_app/core/widgets/icon/share_icon.dart';
import 'package:news_app/features/news/domain/entities/news_entity.dart';

class AuthorNameAndShareButton extends StatelessWidget {
  const AuthorNameAndShareButton({
    super.key,
    required this.news,
  });

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'By ', style: Theme.of(context).textTheme.titleSmall,),
              TextSpan(text: news.author, style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColors.primary)),
            ],
          ),
        ),
        ShareIcon(news: news),
      ],
    );
  }
}
