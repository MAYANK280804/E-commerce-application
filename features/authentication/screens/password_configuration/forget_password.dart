import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validation.dart';
import '../../controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      /// Custom Appbar
      appBar: YbAppBar(actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))]),
      body: Padding(
        padding: const EdgeInsets.all(YbSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(YbTexts.forgetPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: YbSizes.spaceBtwItems),
            Text(YbTexts.forgetPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: YbSizes.spaceBtwSections * 2),

            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: YbValidator.validateEmail,
                decoration: const InputDecoration(labelText: YbTexts.email, prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
            const SizedBox(height: YbSizes.spaceBtwSections),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(YbTexts.submit)),
            ),
          ],
        ),
      ),
    );
  }
}
