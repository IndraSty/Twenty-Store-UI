import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:twenty_store/common/utils/kcolors.dart';
import 'package:twenty_store/common/widgets/app_style.dart';
import 'package:twenty_store/common/widgets/tab_widget.dart';
import 'package:twenty_store/src/home/views/home_page.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
          color: Kolors.kPrimary,
          borderRadius: BorderRadius.circular(25),
        ),
        labelColor: Kolors.kWhite,
        labelPadding: EdgeInsets.zero,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w600),
        unselectedLabelStyle: appStyle(11, Kolors.kGray, FontWeight.normal),
        tabs: List.generate(
          homeTabs.length,
          (index) => Tab(
            child: TabWidget(
              text: homeTabs[index],
            ),
          ),
        ),
      ),
    );
  }
}
