import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsKo implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => '이 필드는 필수입니다.',
      PredefinedFormErrorType.lengthIsLessThanMin => '길이는 최소 ${errorKey.parameter}여야 합니다.',
      PredefinedFormErrorType.lengthIsMoreThanMax => '길이는 최대 ${errorKey.parameter}여야 합니다.',
      PredefinedFormErrorType.lengthIsNotEqual => '길이는 정확히 ${errorKey.parameter}여야 합니다.',
      PredefinedFormErrorType.didNotMatchPattern => '값이 예상 패턴과 일치하지 않습니다: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText => '이 필드는 문자만 포함해야 합니다.',
      PredefinedFormErrorType.isNotOnlyNumbers => '이 필드는 숫자만 포함해야 합니다.',
      PredefinedFormErrorType.isNotValidEmail => '이 필드에는 유효한 이메일 주소가 필요합니다.',
      PredefinedFormErrorType.isNotValidPhoneNumber => '이 필드에는 유효한 전화번호가 필요합니다.',
      PredefinedFormErrorType.isNotValidDateTime => '이 필드에는 유효한 날짜와 시간이 필요합니다.',
      PredefinedFormErrorType.dateIsLessThanMinAge => '값은 최소 ${errorKey.parameter}여야 합니다.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge => '값은 최대 ${errorKey.parameter}여야 합니다.',
      PredefinedFormErrorType.numIsLessThanMin => '값은 ${errorKey.parameter} 이상이어야 합니다.',
      PredefinedFormErrorType.numIsMoreThanMax => '값은 ${errorKey.parameter} 이하여야 합니다.',
      PredefinedFormErrorType.boolShouldBeTrue => '이 값은 참이어야 합니다.',
      PredefinedFormErrorType.boolShouldBeFalse => '이 값은 거짓이어야 합니다.',
      PredefinedFormErrorType.boolAgreeToTerms => '이용 약관에 동의해야 합니다.',
      PredefinedFormErrorType.intIsNotValidCreditCard => '유효한 신용카드 번호가 아닙니다.',
      PredefinedFormErrorType.wordCountIsLessThan => '단어 수는 최소 ${errorKey.parameter}개여야 합니다.',
      PredefinedFormErrorType.wordCountIsMoreThan => '단어 수는 최대 ${errorKey.parameter}개여야 합니다.',
      PredefinedFormErrorType.isNotValidIpAddress => '이 필드에는 유효한 IP 주소가 필요합니다.',
      PredefinedFormErrorType.isNotValidIpv6Address => '이 필드에는 유효한 IPv6 주소가 필요합니다.',
      PredefinedFormErrorType.isNotValidUrl => '이 필드에는 유효한 URL이 필요합니다.',
      PredefinedFormErrorType.isNotEqualTo => '값은 ${errorKey.parameter}와(과) 같아야 합니다.',
      PredefinedFormErrorType.passwordsDoNotMatch => '비밀번호가 일치하지 않습니다.',
      PredefinedFormErrorType.passwordTooShort => '비밀번호는 최소 ${errorKey.parameter}자여야 합니다.',
      PredefinedFormErrorType.passwordNoUppercase => '비밀번호에는 최소 하나의 대문자가 포함되어야 합니다.',
      PredefinedFormErrorType.passwordNoLowercase => '비밀번호에는 최소 하나의 소문자가 포함되어야 합니다.',
      PredefinedFormErrorType.passwordNoNumber => '비밀번호에는 최소 하나의 숫자가 포함되어야 합니다.',
      PredefinedFormErrorType.passwordNoSpecialChar => '비밀번호에는 최소 하나의 특수 문자(${errorKey.parameter})가 포함되어야 합니다.',
      PredefinedFormErrorType.stringDoesNotContain => '입력 값에 "${errorKey.parameter}"이(가) 포함되어야 합니다.',
      PredefinedFormErrorType.stringContains => '입력 값에 "${errorKey.parameter}"이(가) 포함되어서는 안 됩니다.',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? '잘못된 파일 유형입니다. 허용되는 유형: ${(errorKey.parameter as List<String>).join(", ")}.'
          : '잘못된 파일 유형입니다.',
      PredefinedFormErrorType.fileSizeExceedsLimit => '파일 크기가 최대 제한을 초과했습니다${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '($sizeInBytes 바이트)';
      if (sizeInBytes < 1048576) return '(${(sizeInBytes / 1024).toStringAsFixed(2)} KB)';
      return '(${(sizeInBytes / 1048576).toStringAsFixed(2)} MB)';
    }
    return '';
  }
}
