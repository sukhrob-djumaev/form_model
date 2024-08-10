import '../form_error_text_translations.dart';
import 'en.dart';
import 'es.dart';
import 'de.dart';
import 'fr.dart';
import 'ar.dart';
import 'zh_cn.dart';
import 'hi.dart';
import 'it.dart';
import 'ja.dart';
import 'ko.dart';
import 'nl.dart';
import 'pt.dart';
import 'ru.dart';
import 'tr.dart';
import 'uk.dart';
import 'vi.dart';
import 'pl.dart';
import 'sv.dart';

final Map<String, PredefinedFormErrorKeyTranslations> localeMap = {
  'en': PredefinedFormErrorKeyTranslationsEn(),
  'es': PredefinedFormErrorKeyTranslationsEs(),
  'de': PredefinedFormErrorKeyTranslationsDe(),
  'fr': PredefinedFormErrorKeyTranslationsFr(),
  'ar': PredefinedFormErrorKeyTranslationsAr(),
  'zh_CN': PredefinedFormErrorKeyTranslationsZhCn(),
  'hi': PredefinedFormErrorKeyTranslationsHi(),
  'it': PredefinedFormErrorKeyTranslationsIt(),
  'ja': PredefinedFormErrorKeyTranslationsJa(),
  'ko': PredefinedFormErrorKeyTranslationsKo(),
  'nl': PredefinedFormErrorKeyTranslationsNl(),
  'pt': PredefinedFormErrorKeyTranslationsPt(),
  'ru': PredefinedFormErrorKeyTranslationsRu(),
  'tr': PredefinedFormErrorKeyTranslationsTr(),
  'uk': PredefinedFormErrorKeyTranslationsUk(),
  'vi': PredefinedFormErrorKeyTranslationsVi(),
  'pl': PredefinedFormErrorKeyTranslationsPl(),
  'sv': PredefinedFormErrorKeyTranslationsSv(),
};

final List<String> supportedLocales = localeMap.keys.toList();
