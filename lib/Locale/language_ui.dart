import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Routes/routes.dart';
import 'package:coin_exchange/config/app_config.dart';
import 'package:coin_exchange/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_exchange/Locale/locales.dart';

class LanguageUI extends StatefulWidget {
  final bool fromRoot;

  LanguageUI([this.fromRoot = false]);

  @override
  _LanguageUIState createState() => _LanguageUIState();
}

class _LanguageUIState extends State<LanguageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(getTranslationOf('change_language')!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 18,
                )),
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
              height: 58.0,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  getTranslationOf('select_language')!,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
            ),
            BlocBuilder<LanguageCubit, Locale>(
              builder: (context, state) {
                return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppConfig.languagesSupported.length,
                  itemBuilder: (context, index) => Theme(
                    data: ThemeData.dark(),
                    child: RadioListTile(
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (dynamic value) {
                        print(value);
                        BlocProvider.of<LanguageCubit>(context)
                            .setCurrentLanguage(value as String);
                      },
                      groupValue: state.languageCode,
                      value: AppConfig.languagesSupported.keys.elementAt(index),
                      title: Text(AppConfig
                          .languagesSupported[AppConfig.languagesSupported.keys
                              .elementAt(index)]!
                          .name),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(
                text: getTranslationOf('continue_text'),
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.signIn);
                }),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
