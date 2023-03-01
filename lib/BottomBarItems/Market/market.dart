import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Components/market_list.dart';
import 'package:flutter/material.dart';

import '../../Theme/colors.dart';
import 'package:coin_exchange/Locale/locales.dart';

class Market extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 12,
          ),
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: context.getTranslationOf('market_is'),
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text: context.getTranslationOf('up')! + ' 1.49% ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Theme.of(context).primaryColor)),
                TextSpan(
                    text: context.getTranslationOf('in_last'),
                    style: Theme.of(context).textTheme.bodyText1),
              ])),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: context.getTranslationOf('search'),
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 12, color: darkBgColor),
                  suffixIcon: Icon(
                    Icons.search,
                    color: darkBgColor,
                    size: 20,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkBgColor, width: 0.5),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: MarketList(10),
          ),
        ],
      ),
      slideCurve: Curves.linearToEaseOut,
      beginOffset: Offset(0, 0.3),
      endOffset: Offset(0, 0),
    );
  }
}
