import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsUk
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Це поле є обов\'язковим.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'Довжина має бути не менше ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'Довжина має бути не більше ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'Довжина має бути рівно ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Значення не відповідає очікуваному шаблону: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Це поле має містити лише літери.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Це поле має містити лише цифри.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Це поле вимагає дійсну адресу електронної пошти.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Це поле вимагає дійсний номер телефону.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Це поле вимагає дійсну дату та час.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'Значення має бути не менше ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'Значення має бути не більше ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'Значення має бути не менше ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'Значення має бути не більше ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue =>
        'Це значення має бути істинним.',
      PredefinedFormErrorType.boolShouldBeFalse =>
        'Це значення має бути хибним.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Ви повинні погодитися з умовами.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Це недійсний номер кредитної картки.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Кількість слів має бути не менше ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Кількість слів має бути не більше ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Це поле вимагає дійсну IP-адресу.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Це поле вимагає дійсну IPv6-адресу.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Це поле вимагає дійсну URL-адресу.',
      PredefinedFormErrorType.isNotEqualTo =>
        'Значення має бути рівним ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Паролі не співпадають.',
      PredefinedFormErrorType.passwordTooShort =>
        'Пароль має містити щонайменше ${errorKey.parameter} символів.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Пароль має містити хоча б одну велику літеру.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Пароль має містити хоча б одну малу літеру.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Пароль має містити хоча б одну цифру.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Пароль має містити хоча б один спеціальний символ (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'Введений текст має містити "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'Введений текст не повинен містити "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Недійсний тип файлу. Дозволені типи: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Недійсний тип файлу.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Розмір файлу перевищує максимальний ліміт${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' у $sizeInBytes байт';
      if (sizeInBytes < 1048576) {
        return ' у ${(sizeInBytes / 1024).toStringAsFixed(2)} КБ';
      }
      return ' у ${(sizeInBytes / 1048576).toStringAsFixed(2)} МБ';
    }
    return '';
  }
}
