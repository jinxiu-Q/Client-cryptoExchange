import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 24),
              padding:
                  EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 34),
              decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(),
                  Image.asset(
                    Assets.logo,
                    scale: 3.2,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.getTranslationOf('privacy_policy')!,
                style: theme.textTheme.headline5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.getTranslationOf('how_we_work')!,
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(context.getTranslationOf('terms_of_use')!,
                  style: theme.textTheme.caption),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(context.getTranslationOf('privacy_policy')!,
                  style: theme.textTheme.caption),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        slideCurve: Curves.linearToEaseOut,
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
      ),
    );
  }
}
