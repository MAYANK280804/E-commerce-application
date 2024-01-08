import 'package:flutter/material.dart';


import '../../../../../utils/constants/image_strings.dart';

import '../../../../../utils/constants/sizes.dart';

import '../../../../../utils/constants/text_strings.dart';

import '../../../../../utils/helpers/helper_functions.dart';


class TLoginHeader extends StatelessWidget {

  const TLoginHeader({

    super.key,

  });


  @override

  Widget build(BuildContext context) {

    final dark = YbHelperFunctions.isDarkMode(context);

    return Column(

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Image(

          height: 150,

          image: AssetImage(dark ? YbImages.lightAppLogo : YbImages.darkAppLogo),

        ),

        Text(YbTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium),

        const SizedBox(height: YbSizes.sm),

        Text(YbTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium),

      ],

    );

  }

}

