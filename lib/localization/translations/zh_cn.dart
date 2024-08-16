import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsZhCn
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => '此字段为必填项。',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        '长度应至少为 ${errorKey.parameter}。',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        '长度应最多为 ${errorKey.parameter}。',
      PredefinedFormErrorType.lengthIsNotEqual =>
        '长度应恰好为 ${errorKey.parameter}。',
      PredefinedFormErrorType.didNotMatchPattern =>
        '值不符合预期模式：${errorKey.parameter}。',
      PredefinedFormErrorType.isNotOnlyText => '此字段应仅包含字母字符。',
      PredefinedFormErrorType.isNotOnlyNumbers => '此字段应仅包含数字。',
      PredefinedFormErrorType.isNotValidEmail => '此字段需要有效的电子邮件地址。',
      PredefinedFormErrorType.isNotValidPhoneNumber => '此字段需要有效的电话号码。',
      PredefinedFormErrorType.isNotValidDateTime => '此字段需要有效的日期和时间。',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        '值应至少为 ${errorKey.parameter}。',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        '值应最多为 ${errorKey.parameter}。',
      PredefinedFormErrorType.numIsLessThanMin =>
        '值应至少为 ${errorKey.parameter}。',
      PredefinedFormErrorType.numIsMoreThanMax =>
        '值应最多为 ${errorKey.parameter}。',
      PredefinedFormErrorType.boolShouldBeTrue => '此值应为真。',
      PredefinedFormErrorType.boolShouldBeFalse => '此值应为假。',
      PredefinedFormErrorType.boolAgreeToTerms => '您必须同意条款和条件。',
      PredefinedFormErrorType.intIsNotValidCreditCard => '这不是有效的信用卡号码。',
      PredefinedFormErrorType.wordCountIsLessThan =>
        '字数应至少为 ${errorKey.parameter}。',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        '字数应最多为 ${errorKey.parameter}。',
      PredefinedFormErrorType.isNotValidIpAddress => '此字段需要有效的 IP 地址。',
      PredefinedFormErrorType.isNotValidIpv6Address => '此字段需要有效的 IPv6 地址。',
      PredefinedFormErrorType.isNotValidUrl => '此字段需要有效的 URL。',
      PredefinedFormErrorType.isNotEqualTo => '值应等于 ${errorKey.parameter}。',
      PredefinedFormErrorType.passwordsDoNotMatch => '密码不匹配。',
      PredefinedFormErrorType.passwordTooShort =>
        '密码长度至少应为 ${errorKey.parameter} 个字符。',
      PredefinedFormErrorType.passwordNoUppercase => '密码必须包含至少一个大写字母。',
      PredefinedFormErrorType.passwordNoLowercase => '密码必须包含至少一个小写字母。',
      PredefinedFormErrorType.passwordNoNumber => '密码必须包含至少一个数字。',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        '密码必须包含至少一个特殊字符 (${errorKey.parameter})。',
      PredefinedFormErrorType.stringDoesNotContain =>
        '输入必须包含 "${errorKey.parameter}"。',
      PredefinedFormErrorType.stringContains =>
        '输入不得包含 "${errorKey.parameter}"。',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? '无效的文件类型。允许的类型是：${(errorKey.parameter as List<String>).join("、")}。'
          : '无效的文件类型。',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        '文件大小超过最大限制${_formatFileSize(errorKey.parameter)}。',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '$sizeInBytes 字节';
      if (sizeInBytes < 1048576) {
        return '${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      }
      return '${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
