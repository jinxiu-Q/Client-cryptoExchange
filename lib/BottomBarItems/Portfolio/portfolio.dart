import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Components/line_container.dart';
import 'package:coin_exchange/Components/percentage_widget.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class PortfolioList {
  final String image;
  final String amount1;
  final String amount2;

  PortfolioList(this.image, this.amount1, this.amount2);
}

class Portfolio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PortfolioList> portfolioList = [
      PortfolioList(Assets.bitcoin, '720.00', '14,242.12'),
      PortfolioList(Assets.ethereum, '7,777.63.00', '777.63'),
      PortfolioList(Assets.theter, '2366.25', '467.63'),
      PortfolioList(Assets.bitcoin, '198.87', '0.24399'),
    ];
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          context.getTranslationOf('portfolio')!,
          style: theme.textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 80,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                      padding: EdgeInsets.only(
                          left: 8, right: 30, bottom: 12, top: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: cardGradient),
                      child: Column(
                        children: [
                          Text(
                            context.getTranslationOf('current_value')!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 9,
                                    color: whiteTextColor.withOpacity(0.7)),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            '\$45,26,788',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    );
                  }),
            ),
            FadedScaleAnimation(
              Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                padding: EdgeInsets.symmetric(vertical: 34, horizontal: 16),
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
                          text: context.getTranslationOf('total_value')! + '\n',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                      TextSpan(
                          text: '720.00 INR' + '\n',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 22, fontWeight: FontWeight.w700)),
                      TextSpan(
                          text: '0.0000011037 BTC',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ])),
                    Spacer(),
                    Image.asset(
                      'assets/graph.png',
                      height: 70,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  context.getTranslationOf('coin')!,
                  style: theme.textTheme.subtitle2!.copyWith(color: darkBgColor),
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  context.getTranslationOf('holdings')!,
                  style: theme.textTheme.subtitle2!.copyWith(color: darkBgColor),
                ),
                Spacer(
                  flex: 3,
                ),
                Text(context.getTranslationOf('price')!,
                    style:
                        theme.textTheme.subtitle2!.copyWith(color: darkBgColor)),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            LineContainer(),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: portfolioList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 16,
                            ),
                            CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white.withOpacity(0.05),
                                child: Image.asset(
                                  portfolioList[index].image,
                                  height: 20,
                                )),
                            Spacer(),
                            Column(
                              children: [
                                Text('\$ ' + portfolioList[index].amount1),
                                SizedBox(
                                  height: 5,
                                ),
                                PercentageWidget(true),
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Text('\$ ' + portfolioList[index].amount2),
                                SizedBox(
                                  height: 5,
                                ),
                                PercentageWidget(true),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.end,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                          ],
                        ),
                      ),
                      LineContainer(),
                    ],
                  );
                }),
          ],
        ),
        slideCurve: Curves.linearToEaseOut,
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
      ),
    );
  }
}
