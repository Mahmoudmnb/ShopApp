import 'package:flutter/material.dart';
import 'package:shop_app/widgets/custom_list_tile.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_icon_button.dart';

class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) =>
          SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    CustomIconButton(
                      icon: const Icon(Icons.arrow_back_ios_rounded),
                      onPressed: () {
                        if (Navigator.of(context).canPop()) {
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    const Text(
                      'All Reviews',
                      style: TextStyle(
                        color: Color(0xFF171717),
                        fontSize: 24,
                        fontFamily: 'Tenor Sans',
                        fontWeight: FontWeight.w600,
                        height: 1.06,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.only(left: 75.0),
                //! here you have to put number of reviews
                child: Text(
                  '68 Review',
                  style: TextStyle(
                    color: Color(0xFF979797),
                    fontSize: 16,
                    fontFamily: 'Tenor Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.06,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, bottom: 15),
                    child: CustomListTile(
                      //* this width (100% - 120) becasue this card has a custom padding :)
                      //* (bannan don't kill me please ^_^)
                      width: 100.w - 120,
                      username: "Fatima Mesho",
                      date: '3 months ago',
                      description:
                          'Great shirt, perfect fit! The design is stylish and versatile.',
                      stars: 4,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
