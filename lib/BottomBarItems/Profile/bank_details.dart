import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:coin_exchange/Components/custom_button.dart';
import 'package:coin_exchange/Components/entry_field2.dart';
import 'package:flutter/material.dart';
import 'package:coin_exchange/Locale/locales.dart';

class BankDetails extends StatefulWidget {
  @override
  _BankDetailsState createState() => _BankDetailsState();
}

class _BankDetailsState extends State<BankDetails> {
  int? groupValue = 2;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.getTranslationOf('your_bank_details')!,
          style: theme.textTheme.bodyText1!.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: theme.primaryColor.withOpacity(0.07),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: theme.primaryColor,
                    width: 0.5,
                  )),
              child: ListTile(
                title: Text(
                  context.getTranslationOf('bank_verification')!,
                  style: theme.textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '\n' + context.getTranslationOf('congratulations')!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    fontSize: 9,
                  ),
                ),
              ),
            ),
            EntryField2(
              label: context.getTranslationOf('account_number'),
              initialValue: '9876543210',
            ),
            EntryField2(
              label: context.getTranslationOf('ifsc_code'),
              initialValue: 'ABCIN0098765',
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                context.getTranslationOf('selectAccount')!,
                style: theme.textTheme.caption!.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 160,
                  child: Theme(
                    data: ThemeData.dark(),
                    child: RadioListTile(
                        activeColor: theme.primaryColor,
                        title: Text(
                          context.getTranslationOf('savings')!,
                          style: theme.textTheme.bodyText1,
                        ),
                        value: 0,
                        groupValue: groupValue,
                        onChanged: (dynamic value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: Theme(
                    data: ThemeData.dark(),
                    child: RadioListTile(
                        activeColor: theme.primaryColor,
                        title: Text(
                          context.getTranslationOf('current')!,
                          style: theme.textTheme.bodyText1,
                        ),
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (dynamic value) {
                          setState(() {
                            groupValue = value;
                          });
                        }),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            CustomButton(
              text: context.getTranslationOf('save'),
              onTap: () {
                Navigator.pop(context);
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
