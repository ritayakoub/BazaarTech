import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/widgets/drawerListTile.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final double width;
  final VoidCallback onClose;

  const CustomDrawer({super.key, required this.width, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: MediaQueryUtil.screenWidth / 41.2,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(10),
        bottomRight: Radius.circular(10),
      ),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    AppImages.user3,
                    width: MediaQueryUtil.screenWidth / 7.5,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "rita yakoub",
                        style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 18.3,
                            color: AppColors.black70),
                      ),
                      Text(
                        "view profile",
                        style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 30.3,
                            color: AppColors.black70),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Store',
                style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 15.3,
                  fontFamily: FontFamily.russoOne,
                ),
              ),
            ),
            const Drawerlisttile(title: "Details"),
            const Drawerlisttile(title: "Products"),
            const Drawerlisttile(title: "Orders"),
            SizedBox(height: MediaQueryUtil.screenHeight / 12.75),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Bazaars',
                style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 15.3,
                  fontFamily: FontFamily.russoOne,
                ),
              ),
            ),
            const Drawerlisttile(title: "Details"),
            const Drawerlisttile(title: "Stores"),
            const Drawerlisttile(title: "Orders"),
            const Drawerlisttile(title: "Customers"),
            const Drawerlisttile(title: "Sales"),
            const Drawerlisttile(title: "Requests"),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: MediaQueryUtil.screenWidth / 0.05,
                child: MaterialButton(
                  onPressed: () {},
                  color: AppColors.primaryOrangeColor,
                  minWidth: double.maxFinite,
                  height: MediaQueryUtil.screenHeight / 20.58,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQueryUtil.screenWidth / 51.5)),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: MediaQueryUtil.screenWidth / 25.75),
                  ),
                ),
              ),
            )
          ],
        ))),
      ),
    );
  }
}
