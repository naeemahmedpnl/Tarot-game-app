import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';

String phonecode = "";

class CountryCodePicker extends StatefulWidget {
  const CountryCodePicker({super.key});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String getcounCode() {
    return phonecode.toString();
  }

  String countrycode = "";
  String flgurl = "";
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showCountryPicker(
            countryListTheme: CountryListThemeData(
              backgroundColor: Colors.transparent,
              textStyle: const TextStyle(
                color: TarotColors.textWhite,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            context: context,
            showPhoneCode: true,
            onSelect: (Country country) {
              debugPrint('Select country: ${country.displayName}');
              debugPrint(country.countryCode.toString());
              debugPrint(country.phoneCode.toString());
              debugPrint(country.flagEmoji);
              countrycode = country.phoneCode.toString();
              flgurl = country.flagEmoji;
              setState(() {
                phonecode = country.phoneCode.toString();
              });
            },
          );
        },
        child: Row(
          children: [
            Text(flgurl),
            const SizedBox(width: 3),
            Text(
              '+ $countrycode',
              style: const TextStyle(color: TarotColors.textWhite),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ));
  }
}
