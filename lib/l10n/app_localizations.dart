import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<Locale> supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];

  static const Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'news_app': 'News App',
      'home': 'Home',
      'go_to_home': 'Go To Home',
      'theme': 'Theme',
      'language': 'Language',
      'dark': 'Dark',
      'light': 'Light',
      'english': 'English',
      'arabic': 'Arabic',
      'good_morning': 'Good Morning\nHere is Some News For You',
      'view_all': 'View All',
      'search': 'Search',
      'by': 'By',
      'general': 'General',
      'business': 'Business',
      'sports': 'Sports',
      'technology': 'Technology',
      'entertainment': 'Entertainment',
      'health': 'Health',
      'science': 'Science',
    },
    'ar': {
      'news_app': 'تطبيق الأخبار',
      'home': 'الرئيسية',
      'go_to_home': 'الذهاب إلى الرئيسية',
      'theme': 'المظهر',
      'language': 'اللغة',
      'dark': 'داكن',
      'light': 'فاتح',
      'english': 'الإنجليزية',
      'arabic': 'العربية',
      'good_morning': 'صباح الخير\nإليك بعض الأخبار لك',
      'view_all': 'عرض الكل',
      'search': 'بحث',
      'by': 'بواسطة',
      'general': 'عام',
      'business': 'أعمال',
      'sports': 'رياضة',
      'technology': 'تكنولوجيا',
      'entertainment': 'ترفيه',
      'health': 'صحة',
      'science': 'علوم',
    },
  };

  String get newsApp => _localizedValues[locale.languageCode]?['news_app'] ?? '';
  String get home => _localizedValues[locale.languageCode]?['home'] ?? '';
  String get goToHome => _localizedValues[locale.languageCode]?['go_to_home'] ?? '';
  String get theme => _localizedValues[locale.languageCode]?['theme'] ?? '';
  String get language => _localizedValues[locale.languageCode]?['language'] ?? '';
  String get dark => _localizedValues[locale.languageCode]?['dark'] ?? '';
  String get light => _localizedValues[locale.languageCode]?['light'] ?? '';
  String get english => _localizedValues[locale.languageCode]?['english'] ?? '';
  String get arabic => _localizedValues[locale.languageCode]?['arabic'] ?? '';
  String get goodMorning => _localizedValues[locale.languageCode]?['good_morning'] ?? '';
  String get viewAll => _localizedValues[locale.languageCode]?['view_all'] ?? '';
  String get search => _localizedValues[locale.languageCode]?['search'] ?? '';
  String get by => _localizedValues[locale.languageCode]?['by'] ?? '';
  String get general => _localizedValues[locale.languageCode]?['general'] ?? '';
  String get business => _localizedValues[locale.languageCode]?['business'] ?? '';
  String get sports => _localizedValues[locale.languageCode]?['sports'] ?? '';
  String get technology => _localizedValues[locale.languageCode]?['technology'] ?? '';
  String get entertainment => _localizedValues[locale.languageCode]?['entertainment'] ?? '';
  String get health => _localizedValues[locale.languageCode]?['health'] ?? '';
  String get science => _localizedValues[locale.languageCode]?['science'] ?? '';
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
