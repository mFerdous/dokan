import 'package:dokan/features/common/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/lang/app_localizations.dart';
import '../../../../core/utils/size_config.dart';

showAppDialog(
  BuildContext context, {
  String? title,
  String? message,
  bool? isNoInternet,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppDialog(
            title: title ?? '',
            isNoInternet: isNoInternet ?? false,
          ),
        ],
      ),
    ),
  );
}

class AppDialog extends StatelessWidget {
  final String title;
  final bool isNoInternet;

  const AppDialog({
    Key? key,
    required this.title,
    required this.isNoInternet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _messageFromCode(context, title),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 30),
          AppButton(
            title: AppLocalizations.of(context).translate('common_ok'),
            width: getProportionateScreenWidth(130),
            height: getProportionateScreenHeight(50),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  _messageFromCode(BuildContext context, String code) {
    final lang = AppLocalizations.of(context);
    if (isNoInternet) return lang.translate('common_no_internet');

    return lang.translate(code);
  }
}
