import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Assets/assets.dart';
import 'package:coin_exchange/Routes/routes.dart';
import 'package:coin_exchange/Theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class ProfileContent {
  final String? title;
  final String? subtitle;
  final IconData icon;

  ProfileContent(this.title, this.subtitle, this.icon);
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<ProfileContent> profileContent = [
      ProfileContent(context.getTranslationOf('user_verification'),
          context.getTranslationOf('complete_our'), Icons.person_outline),
      ProfileContent(context.getTranslationOf('bank_details'),
          context.getTranslationOf('this_account'), Icons.account_balance),
      ProfileContent(context.getTranslationOf('history'),
          context.getTranslationOf('all_your'), Icons.history),
      ProfileContent(context.getTranslationOf('help_and_support'),
          context.getTranslationOf('create_a_ticket'), Icons.support_agent),
      ProfileContent(context.getTranslationOf('privacy_policy'),
          context.getTranslationOf('how_we_work'), Icons.sticky_note_2_rounded),
      ProfileContent(context.getTranslationOf('change_language'),
          context.getTranslationOf('select_language'), Icons.language),
      ProfileContent(context.getTranslationOf('logout'), '', Icons.logout),
    ];
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 34, horizontal: 16),
            decoration: BoxDecoration(
                color: theme.backgroundColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Column(
              children: [
                FadedScaleAnimation(
                  Image.asset(
                    Assets.profile,
                    scale: 1.5,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  context.getTranslationOf('kyc_verified')!,
                  style: theme.textTheme.subtitle2,
                ),
                Text(
                  'Samantha Smith',
                  style: theme.textTheme.headline5,
                ),
                Text(
                  '+1 987 654 3210',
                  style: theme.textTheme.subtitle2,
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: FadedScaleAnimation(
                        CircleAvatar(
                          radius: 24,
                          backgroundColor:
                              theme.backgroundColor.withOpacity(0.5),
                          child: Icon(
                            profileContent[index].icon,
                            color: iconColor,
                          ),
                        ),
                      ),
                      title: Text(
                        profileContent[index].title!,
                        style: theme.textTheme.bodyText1,
                      ),
                      subtitle: Text(
                        profileContent[index].subtitle!,
                        style: theme.textTheme.caption!.copyWith(fontSize: 10),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      onTap: index == 0
                          ? () {
                              Navigator.pushNamed(
                                  context, PageRoutes.userVerification);
                            }
                          : index == 1
                              ? () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.bankDetails);
                                }
                              : index == 2
                                  ? () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.history);
                                    }
                                  : index == 3
                                      ? () {
                                          Navigator.pushNamed(context,
                                              PageRoutes.helpAndSupport);
                                        }
                                      : index == 4
                                          ? () {
                                              Navigator.pushNamed(context,
                                                  PageRoutes.privacyPolicy);
                                            }
                                          : index == 5
                                              ? () {
                                                  Navigator.pushNamed(context,
                                                      PageRoutes.language);
                                                }
                                              : () {
                                                  Navigator.pushNamed(context,
                                                      PageRoutes.signIn);
                                                },
                    ),
                    Container(
                      height: 0.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        theme.scaffoldBackgroundColor,
                        theme.hintColor,
                        theme.hintColor,
                        theme.hintColor,
                        theme.scaffoldBackgroundColor,
                        theme.scaffoldBackgroundColor,
                      ])),
                    ),
                  ],
                );
              }),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
