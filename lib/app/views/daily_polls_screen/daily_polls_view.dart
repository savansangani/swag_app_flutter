import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_image_polls.dart';
import 'package:swag_app_flutter/app/custom/custom_polls.dart';
import 'package:swag_app_flutter/app/custom/custom_single_child_scoll_view.dart';

import '../../services/theme_provider.dart';

class DailyPollsView extends StatelessWidget {
  const DailyPollsView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Daily Polls",
      ),
      body: CustomSingleChildScrollView(
        child: Column(
          children: [
            const CustomPolls(
              title: "What is your favorite decade for fashion inspiration?",
              creatorName: "Adam Liu",
              creatorIcon: "assets/images/prod.png",
            ),
            CustomImagePolls(
              title: "What style do you like more?",
              creatorName: "Balenciaga",
              creatorIcon: !themeProvider.isDark
                  ? "assets/icons/brand.png"
                  : "assets/icons/branddark.png",
            ),
          ],
        ),
      ),
    );
  }
}
