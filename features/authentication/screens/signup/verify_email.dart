import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';

import '../../../../utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';

import '../../../../utils/helpers/helper_functions.dart';

import '../../controllers/verify_email_controller.dart';


class VerifyEmailScreen extends StatelessWidget {

  const VerifyEmailScreen({super.key, this.email});


  final String? email;


  @override

  Widget build(BuildContext context) {

    final controller = Get.put(VerifyEmailController());

    return Scaffold(

      /// Appbar close icon will first Logout the user & then redirect back to Login Screen()

      /// Reason: We will store the data when user enters the Register Button on Previous screen.

      /// Whenever the user opens the app, we will check if email is verified or not.

      /// If not verified we will always show this Verification screen.

      appBar: YbAppBar(

        actions: [IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))],

      ),

      body: SingleChildScrollView(

        // Padding to Give Default Equal Space on all sides in all screens.

        child: Padding(

          padding: const EdgeInsets.all(YbSizes.defaultSpace),

          child: Column(

            children: [

              /// Image

              Image(

                image: const AssetImage(YbImages.deliveredEmailIllustration),

                width: YbHelperFunctions.screenWidth() * 0.6,

              ),

              const SizedBox(height: YbSizes.spaceBtwSections),


              /// Title, Email & SubTitle

              Text(YbTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),

              const SizedBox(height: YbSizes.spaceBtwItems),

              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),

              const SizedBox(height: YbSizes.spaceBtwItems),

              Text(YbTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),

              const SizedBox(height: YbSizes.spaceBtwSections),


              /// Continue Button

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(onPressed: () => controller.checkEmailVerificationStatus(), child: const Text(YbTexts.tContinue)),

              ),

              const SizedBox(height: YbSizes.spaceBtwItems),


              /// Resend Email, You can also add timer

              SizedBox(

                width: double.infinity,

                child: TextButton(onPressed: () => controller.sendEmailVerification(), child: const Text(YbTexts.resendEmail)),

              ),

            ],

          ),

        ),

      ),

    );

  }

}

