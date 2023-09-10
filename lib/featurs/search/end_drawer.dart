import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget sb({double width = 0, double height = 0}) {
      return SizedBox(
        height: height,
        width: width,
      );
    }

    return Drawer(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Filter",
                  style: TextStyle(fontSize: 30),
                ),
                Image(
                  image: AssetImage('assets/images/filter_big.jpg'),
                  height: 40,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            thickness: 1,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Category",
                style: TextStyle(color: Color(0xFF7E7E7E), fontSize: 20),
              ),
              sb(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButton(
                  underline: Container(),
                  isExpanded: true,
                  onChanged: (value) {},
                  value: 'Suits',
                  hint: const Text("Choose category"),
                  items: [
                    DropdownMenuItem(
                      value: "Suits",
                      child: const Text('Suits'),
                      onTap: () {
                        // Category = 'Main';
                      },
                    ),
                    DropdownMenuItem(
                      value: "Sweetes",
                      child: const Text('Sweetes'),
                      onTap: () {
                        // Category = 'Sweetes';
                      },
                    ),
                    DropdownMenuItem(
                      value: "Aprrtie",
                      child: const Text("Aprrtie"),
                      onTap: () {
                        // Category = 'Aprrtie';
                      },
                    ),
                    DropdownMenuItem(
                      value: "Drinks",
                      child: const Text("Drinks"),
                      onTap: () {
                        // Category = 'Drinks';
                      },
                    ),
                    DropdownMenuItem(
                      value: "Candies",
                      child: const Text("Candies"),
                      onTap: () {
                        // Category = 'Candies';
                      },
                    ),
                    DropdownMenuItem(
                      value: "Vegin",
                      child: const Text("Vegin"),
                      onTap: () {
                        // Category = 'Vegin';
                      },
                    ),
                  ],
                ),
              ),
              sb(height: 30),
              const Text(
                "Price",
                style: TextStyle(color: Color(0xFF7E7E7E), fontSize: 20),
              ),
              RangeSlider(
                  overlayColor: MaterialStateProperty.all(Colors.white),
                  max: 10,
                  min: 0,
                  values: const RangeValues(0, 9),
                  onChanged: (value) {}),
            ]),
          )
        ]),
      ),
    );
  }
}
