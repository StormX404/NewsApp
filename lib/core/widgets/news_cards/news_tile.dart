import 'package:flutter/material.dart';
import 'package:news_app/core/utils/constants/app_colors.dart';
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
        margin: const EdgeInsets.only(bottom: 15 , right: 15 ),
        decoration: BoxDecoration(
            color: dark ? AppColors.darkCardColor : AppColors.lightCardColor,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
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
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
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
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    timeAgo,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
