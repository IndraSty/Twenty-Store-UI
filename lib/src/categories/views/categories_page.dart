import 'package:flutter/material.dart';
import 'package:twenty_store/common/utils/kcolors.dart';
import 'package:twenty_store/common/utils/kstrings.dart';
import 'package:twenty_store/common/widgets/app_style.dart';
import 'package:twenty_store/common/widgets/back_button.dart';
import 'package:twenty_store/common/widgets/reusable_text.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: ReusableText(
          text: AppText.kCategories,
          style: appStyle(16, Kolors.kPrimary, FontWeight.bold),
        ),
      ),
    );
  }
}
