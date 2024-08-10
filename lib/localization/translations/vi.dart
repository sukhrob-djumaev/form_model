import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsVi
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Trường này là bắt buộc.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'Độ dài phải ít nhất ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'Độ dài không được vượt quá ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'Độ dài phải chính xác ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Giá trị không khớp với mẫu mong đợi: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Trường này chỉ được chứa các ký tự chữ cái.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Trường này chỉ được chứa các chữ số.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Trường này yêu cầu một địa chỉ email hợp lệ.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Trường này yêu cầu một số điện thoại hợp lệ.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Trường này yêu cầu ngày và giờ hợp lệ.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'Giá trị phải ít nhất là ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'Giá trị không được vượt quá ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'Giá trị phải ít nhất là ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'Giá trị không được vượt quá ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Giá trị này phải là đúng.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Giá trị này phải là sai.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Bạn phải đồng ý với các điều khoản và điều kiện.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Đây không phải là số thẻ tín dụng hợp lệ.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Số từ phải ít nhất là ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Số từ không được vượt quá ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Trường này yêu cầu một địa chỉ IP hợp lệ.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Trường này yêu cầu một địa chỉ IPv6 hợp lệ.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Trường này yêu cầu một URL hợp lệ.',
      PredefinedFormErrorType.isNotEqualTo =>
        'Giá trị phải bằng ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Mật khẩu không khớp.',
      PredefinedFormErrorType.passwordTooShort =>
        'Mật khẩu phải có ít nhất ${errorKey.parameter} ký tự.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Mật khẩu phải chứa ít nhất một chữ cái viết hoa.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Mật khẩu phải chứa ít nhất một chữ cái viết thường.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Mật khẩu phải chứa ít nhất một chữ số.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Mật khẩu phải chứa ít nhất một ký tự đặc biệt (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'Đầu vào phải chứa "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'Đầu vào không được chứa "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Loại tệp không hợp lệ. Các loại được phép là: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Loại tệp không hợp lệ.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Kích thước tệp vượt quá giới hạn tối đa${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' là $sizeInBytes byte';
      if (sizeInBytes < 1048576)
        return ' là ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' là ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
