import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:swag_app_flutter/app/custom/custom_app_bar.dart';
import 'package:swag_app_flutter/app/custom/custom_grediant_button.dart';
import 'package:swag_app_flutter/app/custom/custom_text_form_field.dart';
import 'package:swag_app_flutter/app/theme/colors.dart';
import 'package:swag_app_flutter/app/views/settings/feedback_screen/feedback_controller.dart';

import '../../../services/theme_provider.dart';

class FeedbackView extends StatelessWidget {
  FeedbackView({super.key});
  final FeedbackController _controller = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Feedback",
      ),
      body: Obx(
        () => _controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colorz.main,
                  strokeWidth: 2,
                ),
              )
            : _controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colorz.main,
                      strokeWidth: 2,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          controller: _controller.feedbackController.value,
                          hintText: "Entre your feedback.",
                          maxLine: 4,
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Obx(
                          () {
                            if (_controller.pickedImage != null) {
                              return Container(
                                height: Get.height * 0.1,
                                width: Get.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colorz.textFormFieldDark,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.file(
                                    File(
                                      _controller.pickedImage!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: _controller.pickImage,
                                child: Container(
                                  height: Get.height * 0.1,
                                  width: Get.width * 0.2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colorz.textFormFieldDark,
                                    border: Border.all(
                                        strokeAlign:
                                            BorderSide.strokeAlignInside,
                                        width: 1,
                                        color: !themeProvider.isDark
                                            ? Colorz.border
                                            : Colorz.textFormFieldDark),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 46,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        CustomGrediantButton(
                          text: "Submit",
                          isGradient: true,
                          onPressed: () {
                            _controller.submitFeedback();
                          },
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
