import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Components/entry_field2.dart';
import 'package:coin_exchange/Routes/routes.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class CurrencyDetail extends StatelessWidget {
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
            context.getTranslationOf('bitcoin_btc')!,
            style: theme.textTheme.headline5!.copyWith(
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              context.getTranslationOf('realtime_price')!,
              style: theme.textTheme.subtitle2!.copyWith(
                color: darkBgColor,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'INR 0.001.321.514',
              style: theme.textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            //PercentageWidget(true),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 16,
                ),
                Text(
                  context.getTranslationOf('one_d')!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    color: darkBgColor,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '\$ 44,77,131',
                  style: theme.textTheme.subtitle2!.copyWith(
                    fontSize: 10,
                  ),
                ),
                Spacer(),
                Text(
                  context.getTranslationOf('one_l')!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    color: darkBgColor,
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '\$ 44,77,131',
                  style: theme.textTheme.subtitle2!.copyWith(
                    fontSize: 10,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: Image.asset(
                Assets.portfolioGraph,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: theme.backgroundColor,
                  ),
                  child: Text(
                    '24 H',
                    style: theme.textTheme.subtitle2,
                  ),
                ),
                Text(
                  '1W',
                  style: theme.textTheme.subtitle2,
                ),
                Text(
                  '1M',
                  style: theme.textTheme.subtitle2,
                ),
                Text(
                  '1M',
                  style: theme.textTheme.subtitle2,
                ),
                Text(
                  context.getTranslationOf('all')!,
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: context.getTranslationOf('buy'),
                    onTap: () {
                      BottomTabBar(context);
                    },
                    icon: Icon(
                      Icons.arrow_circle_up,
                      size: 18,
                    ),
                    gradient: blueGradient,
                  ),
                ),
                Expanded(
                  child: CustomButton(
                    text: context.getTranslationOf('sell'),
                    icon: Icon(
                      Icons.arrow_circle_down,
                      size: 18,
                    ),
                    onTap: () {
                      BottomTabBar(context);
                    },
                    gradient: orangeGradient,
                  ),
                ),
              ],
            ),
            Text(
              context.getTranslationOf('what_is_btc')!.padLeft(16),
              style: theme.textTheme.headline6!.copyWith(
                fontSize: 16,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                style: theme.textTheme.subtitle2!.copyWith(
                  color: darkBgColor,
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

  // ignore: non_constant_identifier_names
  Future BottomTabBar(BuildContext context) async => showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        context: context,
        builder: (context) {
          var theme = Theme.of(context);
          return DefaultTabController(
            length: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: theme.scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.transparent,
                    unselectedLabelColor: theme.primaryColor,
                    labelColor: whiteTextColor,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: theme.backgroundColor,
                    ),
                    labelStyle: theme.textTheme.headline6,
                    tabs: [
                      Tab(
                        text: context.getTranslationOf('buy'),
                      ),
                      Tab(
                        text: context.getTranslationOf('sell'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      FadedSlideAnimation(
                        ListView(
                          padding: EdgeInsets.all(16),
                          children: [
                            EntryField2(
                              label: context.getTranslationOf('at_buy_price'),
                              initialValue: '45,26,788.50',
                            ),
                            EntryField2(
                              label: context.getTranslationOf('amount_inr'),
                              initialValue: '500',
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.remove,
                                      color: darkBgColor,
                                    ),
                                    color: darkButtonColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.add,
                                      color: darkBgColor,
                                    ),
                                    color: darkButtonColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                ],
                              ),
                            ),
                            EntryField2(
                              label: context.getTranslationOf('total_btc_'),
                              initialValue: '0.00011045',
                            ),
                            CustomButton(
                              text: context.getTranslationOf('buy'),
                              gradient: blueGradient,
                              onTap: () {
                                Navigator.pushNamed(context, PageRoutes.buy);
                              },
                            ),
                          ],
                        ),
                        slideCurve: Curves.linearToEaseOut,
                        beginOffset: Offset(0, 0.3),
                        endOffset: Offset(0, 0),
                      ),
                      FadedSlideAnimation(
                        ListView(
                          padding: EdgeInsets.all(16),
                          children: [
                            EntryField2(
                              label: context.getTranslationOf('at_buy_price'),
                              initialValue: '45,26,788.50',
                            ),
                            EntryField2(
                              label: context.getTranslationOf('amount_inr'),
                              initialValue: '500',
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.remove,
                                      color: darkBgColor,
                                    ),
                                    color: darkButtonColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.add,
                                      color: darkBgColor,
                                    ),
                                    color: darkButtonColor,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 4),
                                  ),
                                ],
                              ),
                            ),
                            EntryField2(
                              label: context.getTranslationOf('total_btc_'),
                              initialValue: '0.00011045',
                            ),
                            CustomButton(
                              text: context.getTranslationOf('sell'),
                              gradient: orangeGradient,
                              onTap: () {
                                Navigator.pushNamed(context, PageRoutes.sell);
                              },
                            ),
                          ],
                        ),
                        slideCurve: Curves.linearToEaseOut,
                        beginOffset: Offset(0, 0.3),
                        endOffset: Offset(0, 0),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          );
        },
      );
}
