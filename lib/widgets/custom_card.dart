import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            child: Image(
              image: const AssetImage('asset/images/photo1.jpg'),
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, top: 5),
            child: SizedBox(
              width: width,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Zara',
                        style: TextStyle(
                          color: Color(0xFF383838),
                          fontSize: 16,
                          fontFamily: 'Tenor Sans',
                          fontWeight: FontWeight.w400,
                          height: 1.06,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        '15.00\$',
                        style: TextStyle(
                          color: Color(0xFFD47676),
                          fontSize: 12,
                          fontFamily: 'Tenor Sans',
                          fontWeight: FontWeight.w400,
                          height: 1.06,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.0),
                    child: Text(
                      'white cotton shirt',
                      style: TextStyle(
                        color: Color(0xFF818181),
                        fontSize: 12,
                        fontFamily: 'Tenor Sans',
                        fontWeight: FontWeight.w400,
                        height: 1.06,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
