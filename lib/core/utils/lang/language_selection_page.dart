import 'package:dokan/core/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  LanguageSelectionPageState createState() => LanguageSelectionPageState();
}

class LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _selectedLanguage = 'English (US)';

  final List<String> _suggestedLanguages = ['English (US)', 'English (UK)'];
  final List<String> _otherLanguages = [
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Bengali',
    'Russian',
    'Indonesian'
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // context.read<ValidationCubit>().setSelectedIndex(0);
            Navigator.pop(context);
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: Text(
          "Change Language",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Suggested',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Urbanist',
              height: 0.07,
            ),
          ),
          ..._suggestedLanguages.map((language) => Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                      Color(0xFFF5F5F8), // Set unselected color
                ),
                child: RadioListTile(
                  title: Text(
                    language,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      height: 0.10,
                      letterSpacing: 0.20,
                    ),
                  ),
                  value: language,
                  groupValue: _selectedLanguage,
                  activeColor: const Color(0xFFA1045A),
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              )),
          SizedBox(
            height: getProportionateScreenHeight(32),
          ),
          const Text(
            'Language',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: 'Urbanist',
              height: 0.07,
            ),
          ),
          ..._otherLanguages.map((language) => Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor:
                      Color(0xFFFFFFFF), // Set unselected color
                ),
                child: RadioListTile(
                  title: Text(
                    language,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontFamily: 'Urbanist',
                      height: 0.10,
                      letterSpacing: 0.20,
                    ),
                  ),
                  value: language,
                  groupValue: _selectedLanguage,
                  activeColor: const Color(0xFFA1045A),
                  controlAffinity: ListTileControlAffinity.trailing,
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLanguage = value!;
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }
}
