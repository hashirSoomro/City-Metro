import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../../component/constant.dart';
import '../../../getLanguage/getLanguage.dart';
import '../../global-constants.dart';

class RatingPopup extends StatefulWidget {
  final Function(double) onRatingSubmit;

  RatingPopup({required this.onRatingSubmit});

  @override
  State<RatingPopup> createState() => _RatingPopupState();
}

class _RatingPopupState extends State<RatingPopup> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider selectedLanguage = Provider.of<LanguageProvider>(context);
    String language = selectedLanguage.selectedLanguage;

    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: Text(
        'Do you like the app?',
        textAlign: (language == 'Urdu' || language == 'Arabic')
            ? TextAlign.end
            : TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      content: Text(
        'Your feedback is important!\nHelp us with a 5 stars rating on play store!',
        style: TextStyle(
          fontSize: 16,
        ),
        textAlign: (language == 'Urdu' || language == 'Arabic')
            ? TextAlign.end
            : TextAlign.start,
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'No',
            style: TextStyle(
              color: ConstantColor.blue,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            StoreRedirect.redirect(androidAppId: app_id);
          },
          child: Text(
            'Yes',
            style: TextStyle(
              color: ConstantColor.blue,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
