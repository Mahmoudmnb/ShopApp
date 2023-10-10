import 'package:flutter/material.dart';
import 'package:shop_app/widgets/similar_item.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_icon_button.dart';

class SimilarItemsScreen extends StatelessWidget {
  const SimilarItemsScreen({super.key});

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
                      'Similar Items',
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
                //! here you have to put number of items
                child: Text(
                  '150 items',
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
                // ?if this فرشت with you
                // ? change the childAspectRation
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  physics: const BouncingScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  //* _____________here_______________
                  //* I calculate it and this is the answer :)
                  childAspectRatio: 0.6373958,
                  children: const [
                    SimilarItem(),
                    SimilarItem(),
                    SimilarItem(),
                    SimilarItem(),
                    SimilarItem(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
