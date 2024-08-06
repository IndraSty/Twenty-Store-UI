import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:twenty_store/common/utils/kcolors.dart';
import 'package:twenty_store/common/widgets/app_style.dart';
import 'package:twenty_store/src/cart/views/cart_page.dart';
import 'package:twenty_store/src/entrypoint/controllers/bottom_tab_notifier.dart';
import 'package:twenty_store/src/home/views/home_page.dart';
import 'package:twenty_store/src/profile/views/profile_page.dart';
import 'package:twenty_store/src/wishlist/views/wishlist_page.dart';

class AppEntryPoint extends StatelessWidget {
  AppEntryPoint({super.key});

  List<Widget> pageList = [
    const HomePage(),
    const WishlistPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabIndexNotifier>(
        builder: (context, tabIndexNotifier, child) {
      late final index = tabIndexNotifier.index;
      return Scaffold(
        body: Stack(
          children: [
            pageList[index],
            Align(
              alignment: Alignment.bottomCenter,
              child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Kolors.kOffWhite),
                child: BottomNavigationBar(
                  selectedFontSize: 12,
                  elevation: 0,
                  backgroundColor: Kolors.kOffWhite,
                  showSelectedLabels: true,
                  selectedLabelStyle:
                      appStyle(12, Kolors.kPrimary, FontWeight.w500),
                  showUnselectedLabels: true,
                  currentIndex: index,
                  selectedItemColor: Kolors.kPrimary,
                  unselectedItemColor: Kolors.kGray,
                  unselectedIconTheme:
                      const IconThemeData(color: Colors.black38),
                  onTap: (i) {
                    tabIndexNotifier.setIndex(i);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: index == 0
                            ? const Icon(
                                AntDesign.home,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(
                                AntDesign.home,
                                color: Kolors.kPrimary,
                                size: 24,
                              ),
                        label: "Home"),
                    BottomNavigationBarItem(
                        icon: index == 1
                            ? const Icon(
                                Ionicons.heart,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(
                                Ionicons.heart_outline,
                                color: Kolors.kPrimary,
                                size: 24,
                              ),
                        label: "Wishlist"),
                    BottomNavigationBarItem(
                        icon: index == 2
                            ? const Badge(
                                label: Text("9"),
                                child: Icon(
                                  MaterialCommunityIcons.shopping,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                ),
                              )
                            : const Badge(
                                label: Text("9"),
                                child: Icon(
                                  MaterialCommunityIcons.shopping_outline,
                                  color: Kolors.kPrimary,
                                  size: 24,
                                ),
                              ),
                        label: "Cart"),
                    BottomNavigationBarItem(
                        icon: index == 3
                            ? const Icon(
                                Icons.person,
                                color: Kolors.kPrimary,
                                size: 24,
                              )
                            : const Icon(
                                Icons.person_outline,
                                color: Kolors.kPrimary,
                                size: 24,
                              ),
                        label: "Profile"),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
