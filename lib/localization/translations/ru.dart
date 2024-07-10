import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

import '../form_error_text_translations.dart';

class FormErrorTextTranslationsRu implements FormErrorTextTranslations {
  @override
  String translate(FormError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "Это поле обязательно для заполнения.";
      case ErrorCode.lengthIsLessThanMin:
        return "Длина должна быть не менее ${error.parameter}.";
      case ErrorCode.lengthIsMoreThanMax:
        return "Длина должна быть не более ${error.parameter}.";
      case ErrorCode.lengthIsNotEqual:
        return "Длина должна быть равна ${error.parameter}.";
      case ErrorCode.didNotMatchPattern:
        return "Значение не соответствует ожидаемому шаблону: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "Это поле должно содержать только буквенные символы.";
      case ErrorCode.isNotOnlyNumbers:
        return "Это поле должно содержать только цифры.";
      case ErrorCode.isNotValidEmail:
        return "Это поле должно содержать корректный адрес электронной почты.";
      case ErrorCode.isNotValidPhoneNumber:
        return "Это поле должно содержать корректный номер телефона.";
      case ErrorCode.isNotValidDateTime:
        return "Это поле должно содержать корректную дату и время.";
      case ErrorCode.dateIsLessThanMinAge:
        return "Значение должно быть не меньше ${error.parameter}.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "Значение должно быть не больше ${error.parameter}.";
      case ErrorCode.numIsLessThanMin:
        return "Значение должно быть не меньше ${error.parameter}.";
      case ErrorCode.numIsMoreThanMax:
        return "Значение должно быть не больше ${error.parameter}.";
      case ErrorCode.boolShouldBeTrue:
        return "Значение должно быть true.";
      case ErrorCode.boolShouldBeFalse:
        return "Значение должно быть false.";
      case ErrorCode.boolAgreeToTerms:
        return "Вы должны согласиться с условиями и положениями.";
      case ErrorCode.intIsNotValidCreditCard:
        return "Это не является действительным номером кредитной карты.";
      case ErrorCode.wordCountIsLessThan:
        return "Количество слов должно быть не меньше ${error.parameter}.";
      case ErrorCode.wordCountIsMoreThan:
        return "Количество слов должно быть не больше ${error.parameter}.";
      case ErrorCode.isNotValidIpAddress:
        return "Это поле должно содержать корректный IP-адрес.";
      case ErrorCode.isNotValidIpv6Address:
        return "Это поле должно содержать корректный IPv6-адрес.";
      case ErrorCode.isNotValidUrl:
        return "Это поле должно содержать корректный URL.";
      case ErrorCode.isNotEqualTo:
        return "Значение должно быть равно ${error.parameter}.";
      case ErrorCode.custom:
        return "Произошла ошибка: ${error.customErrorText ?? 'Неизвестная ошибка'}";
      default:
        throw ArgumentError('Неподдерживаемый код ошибки: ${error.code}');
    }
  }
}
