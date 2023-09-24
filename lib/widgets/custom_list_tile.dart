import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {super.key,
      required this.width,
      required this.username,
      required this.stars,
      required this.date,
      required this.description});
  final String username;
  final int stars;
  final String date;
  final String description;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 45,
          width: 45,
          child: CircleAvatar(
            backgroundColor: Color(0xFFD9D9D9),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 7),
            SizedBox(
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // !username
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'Tenor Sans',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.20,
                    ),
                  ),
                  // !date
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 13,
                      fontFamily: 'Tenor Sans',
                      letterSpacing: 1.20,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            ReviewStars(numOfStars: stars),
            const SizedBox(height: 10),
            SizedBox(
              width: 61.w,
              child: Text(
                description,
                style: const TextStyle(
                  color: Color(0xFF383838),
                  fontSize: 14,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.50,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ],
    );
  }
}

class ReviewStars extends StatelessWidget {
  const ReviewStars({super.key, required this.numOfStars});
  final int numOfStars;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          numOfStars >= 1 ? Icons.star_rounded : Icons.star_border_rounded,
          size: 20,
          color: numOfStars >= 1
              ? const Color(0xFFFFC120)
              : const Color(0xFFC4C5C4),
        ),
        const SizedBox(width: 3),
        Icon(
          numOfStars >= 2 ? Icons.star_rounded : Icons.star_border_rounded,
          size: 20,
          color: numOfStars >= 2
              ? const Color(0xFFFFC120)
              : const Color(0xFFC4C5C4),
        ),
        const SizedBox(width: 3),
        Icon(
          numOfStars >= 3 ? Icons.star_rounded : Icons.star_border_rounded,
          size: 20,
          color: numOfStars >= 3
              ? const Color(0xFFFFC120)
              : const Color(0xFFC4C5C4),
        ),
        const SizedBox(width: 3),
        Icon(
          numOfStars >= 4 ? Icons.star_rounded : Icons.star_border_rounded,
          size: 20,
          color: numOfStars >= 4
              ? const Color(0xFFFFC120)
              : const Color(0xFFC4C5C4),
        ),
        const SizedBox(width: 3),
        Icon(
          numOfStars >= 5 ? Icons.star_rounded : Icons.star_border_rounded,
          size: 20,
          color: numOfStars >= 5
              ? const Color(0xFFFFC120)
              : const Color(0xFFC4C5C4),
        ),
      ],
    );
  }
}
