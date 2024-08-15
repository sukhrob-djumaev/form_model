import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsRu
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required =>
        'Это поле обязательно для заполнения.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'Длина должна быть не менее ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'Длина должна быть не более ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'Длина должна быть равна ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Значение не соответствует ожидаемому шаблону: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Это поле должно содержать только буквы.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Это поле должно содержать только цифры.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Это поле требует действительный адрес электронной почты.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Это поле требует действительный номер телефона.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Это поле требует действительную дату и время.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'Значение должно быть не менее ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'Значение должно быть не более ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'Значение должно быть не менее ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'Значение должно быть не более ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue =>
        'Это значение должно быть истинным.',
      PredefinedFormErrorType.boolShouldBeFalse =>
        'Это значение должно быть ложным.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Вы должны согласиться с условиями.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Это недействительный номер кредитной карты.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Количество слов должно быть не менее ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Количество слов должно быть не более ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Это поле требует действительный IP-адрес.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Это поле требует действительный IPv6-адрес.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Это поле требует действительный URL.',
      PredefinedFormErrorType.isNotEqualTo =>
        'Значение должно быть равно ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Пароли не совпадают.',
      PredefinedFormErrorType.passwordTooShort =>
        'Пароль должен содержать не менее ${errorKey.parameter} символов.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Пароль должен содержать хотя бы одну заглавную букву.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Пароль должен содержать хотя бы одну строчную букву.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Пароль должен содержать хотя бы одну цифру.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Пароль должен содержать хотя бы один специальный символ (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'Ввод должен содержать "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'Ввод не должен содержать "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Недопустимый тип файла. Разрешенные типы: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Недопустимый тип файла.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Размер файла превышает максимальный лимит${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' в $sizeInBytes байт';
      if (sizeInBytes < 1048576) {
        return ' в ${(sizeInBytes / 1024).toStringAsFixed(2)} КБ';
      }
      return ' в ${(sizeInBytes / 1048576).toStringAsFixed(2)} МБ';
    }
    return '';
  }
}
