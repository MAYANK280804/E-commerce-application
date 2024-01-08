import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/validators/validation.dart';
import '../../../controllers/login_in_controller.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: YbSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.email,
              validator: YbValidator.validateEmail,
              decoration: const InputDecoration(prefixIcon: Icon(Icons.email), labelText: YbTexts.email),
            ),
            const SizedBox(height: YbSizes.spaceBtwInputFields),

            /// Password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => YbValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                  labelText: YbTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check5),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash5 : Iconsax.eye4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: YbSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = value!)),
                    const Text(YbTexts.rememberMe),
                  ],
                ),

                /// Forget Password
                TextButton(onPressed: () => Get.to(() => const ForgetPasswordScreen()), child: const Text(YbTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: YbSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.emailAndPasswordSignIn(), child: const Text(YbTexts.signIn)),
            ),
            const SizedBox(height: YbSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(YbTexts.createAccount)),
            ),
          ],
        ),
      ),
    );
  }
}
