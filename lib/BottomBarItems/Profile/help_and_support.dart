import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Components/entry_field2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class HelpAndSupport extends StatelessWidget {
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
                context.getTranslationOf('write_us')!,
                style: theme.textTheme.headline5,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                context.getTranslationOf('we_will')!,
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 10,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            EntryField2(
              label: context.getTranslationOf('phone_number'),
              initialValue: '+1 987 654 3210',
            ),
            EntryField2(
              label: context.getTranslationOf('your_message'),
              initialValue: context.getTranslationOf('enter_your'),
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: context.getTranslationOf('submit'),
              onTap: () {
                Navigator.pop(context);
              },
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
