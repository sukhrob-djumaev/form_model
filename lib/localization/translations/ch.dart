import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

import '../form_error_text_translations.dart';

class FormErrorTextTranslationsZh implements FormErrorTextTranslations {
  @override
  String translate(FormError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "此字段为必填项。";
      case ErrorCode.lengthIsLessThanMin:
        return "长度应至少为 ${error.parameter}。";
      case ErrorCode.lengthIsMoreThanMax:
        return "长度不能超过 ${error.parameter}。";
      case ErrorCode.lengthIsNotEqual:
        return "长度必须为 ${error.parameter}。";
      case ErrorCode.didNotMatchPattern:
        return "值不符合预期的模式：${error.parameter}。";
      case ErrorCode.isNotOnlyText:
        return "此字段应仅包含字母字符。";
      case ErrorCode.isNotOnlyNumbers:
        return "此字段应仅包含数字。";
      case ErrorCode.isNotValidEmail:
        return "此字段应包含有效的电子邮件地址。";
      case ErrorCode.isNotValidPhoneNumber:
        return "此字段应包含有效的电话号码。";
      case ErrorCode.isNotValidDateTime:
        return "此字段应包含有效的日期和时间。";
      case ErrorCode.dateIsLessThanMinAge:
        return "值应至少为 ${error.parameter}。";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "值不能超过 ${error.parameter}。";
      case ErrorCode.numIsLessThanMin:
        return "值应至少为 ${error.parameter}。";
      case ErrorCode.numIsMoreThanMax:
        return "值不能超过 ${error.parameter}。";
      case ErrorCode.boolShouldBeTrue:
        return "此值应为 true。";
      case ErrorCode.boolShouldBeFalse:
        return "此值应为 false。";
      case ErrorCode.boolAgreeToTerms:
        return "您必须同意条款和条件。";
      case ErrorCode.intIsNotValidCreditCard:
        return "此不是有效的信用卡号码。";
      case ErrorCode.wordCountIsLessThan:
        return "单词数应至少为 ${error.parameter}。";
      case ErrorCode.wordCountIsMoreThan:
        return "单词数不能超过 ${error.parameter}。";
      case ErrorCode.isNotValidIpAddress:
        return "此字段应包含有效的 IP 地址。";
      case ErrorCode.isNotValidIpv6Address:
        return "此字段应包含有效的 IPv6 地址。";
      case ErrorCode.isNotValidUrl:
        return "此字段应包含有效的 URL。";
      case ErrorCode.isNotEqualTo:
        return "该值应等于 ${error.parameter}.";
      case ErrorCode.custom:
        return "发生错误：${error.customErrorText ?? '未知错误'}";
      default:
        throw ArgumentError('不支持的错误代码：${error.code}');
    }
  }
}
