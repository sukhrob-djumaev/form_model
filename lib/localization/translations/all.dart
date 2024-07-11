import '../form_error_text_translations.dart';
import 'en.dart';

final Map<String, FormModelErrorTextTranslations> localeMap = {
  'en': FormModelErrorTextTranslationsEn(),
};

// List of supported locales
final List<String> supportedLocales = localeMap.keys.toList();
