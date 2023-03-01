import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Components/percentage_widget.dart';
import 'package:coin_exchange/Routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:coin_exchange/Components/market_list.dart';
import 'package:coin_exchange/Locale/locales.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CardDetails {
  final String image;
  final String? currencyName;
  final bool isGreen;
  final String value;

  CardDetails(this.image, this.currencyName, this.isGreen, this.value);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }
  @override
  Widget build(BuildContext context) {
    List<CardDetails> _cardDetails = [
      CardDetails(Assets.ethereum, context.getTranslationOf('etherium'), true,
          'ETH 0.001.321.514'),
      CardDetails(Assets.bitcoin, context.getTranslationOf('bitcoin'), true,
          'BTC 0.001.321.514'),
      CardDetails(Assets.theter, context.getTranslationOf('theter'), false,
          'THR 0.001.321.514'),
    ];
    return Builder(builder: (BuildContext context){
      if (!_loadingAnchoredBanner) {
        _loadingAnchoredBanner = true;
        _createAnchoredBanner(context);
      }
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                    child: Row(
                      children: [
                        RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: context.getTranslationOf('your_account_value')! +
                                      '\n',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12, fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: '\$ 48,374.65',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 23)),
                            ])),
                        Spacer(),
                        CircleAvatar(
                          child: Icon(
                            Icons.photo,
                            color: Colors.grey[400],
                          ),
                          backgroundColor: darkBgColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 153,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        itemCount: _cardDetails.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return FadedScaleAnimation(
                            Container(
                              margin:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                              padding: EdgeInsets.only(
                                  left: 18, right: 18, bottom: 24, top: 24),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  gradient: cardGradient),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            _cardDetails[index].image,
                                            height: 20,
                                          ),
                                          SizedBox(
                                            width: 6,
                                          ),
                                          Text(
                                            _cardDetails[index].currencyName!,
                                            style:
                                            Theme.of(context).textTheme.subtitle2,
                                          ),
                                          PercentageWidget(
                                              _cardDetails[index].isGreen),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        _cardDetails[index].value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(fontSize: 16),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.sync,
                                            size: 12,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            'INR 2.000.000',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w300),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Image.asset(
                                    Assets.graph,
                                    scale: 3,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: context.getTranslationOf('buy'),
                          onTap: () {
                            Navigator.pushNamed(context, PageRoutes.currencyDetail);
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
                            Navigator.pushNamed(context, PageRoutes.currencyDetail);
                          },
                          gradient: orangeGradient,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: Text(
                      context.getTranslationOf('currencies')!,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                    child: MarketList(3),
                  ),
                  CustomButton(
                    text: context.getTranslationOf('see_all'),
                    color: darkButtonColor,
                  ),
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
                                  text: context.getTranslationOf('gift_cards')! + '\n\n',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 20, fontWeight: FontWeight.w700)),
                              TextSpan(
                                  text: context.getTranslationOf('gift_crypto')! +
                                      '\n' +
                                      context.getTranslationOf('keeps_on_growing')!,
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      fontSize: 12, fontWeight: FontWeight.w300)),
                            ])),
                        Spacer(),
                        Image.asset(
                          Assets.homeImage,
                          height: 90,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (_anchoredBanner != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _anchoredBanner!.size.width.toDouble(),
                    height: _anchoredBanner!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredBanner!),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
