import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Components/market_list.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: blueGradient,
              ),
              width: double.infinity,
              child: Row(
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: '\$290.05' + '\n\n',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                    TextSpan(
                        text: context.getTranslationOf('available_balance'),
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w300)),
                  ])),
                  Spacer(),
                  Image.asset(
                    Assets.homeImage,
                    height: 90,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MarketList(5),
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
