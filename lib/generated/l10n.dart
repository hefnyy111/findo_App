// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `========== Get Started Screen ==========`
  String get comment {
    return Intl.message(
      '========== Get Started Screen ==========',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Hello to Ascend`
  String get getstarted_title {
    return Intl.message(
      'Hello to Ascend',
      name: 'getstarted_title',
      desc: '',
      args: [],
    );
  }

  /// `Your journey to smarter chat & epic rewards begins`
  String get getstarted_subtitle {
    return Intl.message(
      'Your journey to smarter chat & epic rewards begins',
      name: 'getstarted_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Start your journey`
  String get getstarted_textbutton {
    return Intl.message(
      'Start your journey',
      name: 'getstarted_textbutton',
      desc: '',
      args: [],
    );
  }

  /// `By tapping "Start your journey", you agree to`
  String get getstarted_button_navigation_text1 {
    return Intl.message(
      'By tapping "Start your journey", you agree to',
      name: 'getstarted_button_navigation_text1',
      desc: '',
      args: [],
    );
  }

  /// `our`
  String get getstarted_button_navigation_text2 {
    return Intl.message(
      'our',
      name: 'getstarted_button_navigation_text2',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get getstarted_button_navigation_text3 {
    return Intl.message(
      'and',
      name: 'getstarted_button_navigation_text3',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get getstarted_button_navigation_button1 {
    return Intl.message(
      'Privacy Policy',
      name: 'getstarted_button_navigation_button1',
      desc: '',
      args: [],
    );
  }

  /// `Terms of services.`
  String get getstarted_button_navigation_button2 {
    return Intl.message(
      'Terms of services.',
      name: 'getstarted_button_navigation_button2',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
