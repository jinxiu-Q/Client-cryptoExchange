import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Components/line_container.dart';
import 'package:coin_exchange/Routes/routes.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class Sell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: theme.backgroundColor,
          ),
          child: Text(
            context.getTranslationOf('sell_btc')!,
            style: theme.textTheme.headline5!.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              context.getTranslationOf('total_btc')! + '\n',
              style: theme.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            Text(
              '0.00011037',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              context.getTranslationOf('at_buy_price')! + ' \$45,26,788.50',
              style: theme.textTheme.subtitle2,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100,
            ),
            LineContainer(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  context.getTranslationOf('coinExchangeFee')!,
                  style: theme.textTheme.subtitle2,
                ),
                Spacer(),
                Text('\$0'),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            LineContainer(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  context.getTranslationOf('amount_payable')!,
                  style: theme.textTheme.subtitle2,
                ),
                Spacer(),
                Text('\$500'),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            LineContainer(),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: context.getTranslationOf('sell_now')!.toUpperCase(),
              gradient: orangeGradient,
              onTap: () {
                Navigator.pushNamed(context, PageRoutes.appNavigation);
              },
            )
          ],
        ),
        slideCurve: Curves.linearToEaseOut,
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
      ),
    );
  }
}
