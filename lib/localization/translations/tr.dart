import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsTr
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Bu alan zorunludur.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'Uzunluk en az ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'Uzunluk en fazla ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'Uzunluk tam olarak ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'Değer beklenen desene uymuyor: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Bu alan sadece alfabetik karakterler içermelidir.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Bu alan sadece sayılar içermelidir.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Bu alan geçerli bir e-posta adresi gerektiriyor.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Bu alan geçerli bir telefon numarası gerektiriyor.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Bu alan geçerli bir tarih ve saat gerektiriyor.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'Değer en az ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'Değer en fazla ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'Değer en az ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'Değer en fazla ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.boolShouldBeTrue => 'Bu değer doğru olmalıdır.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Bu değer yanlış olmalıdır.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Şartları ve koşulları kabul etmelisiniz.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Bu geçerli bir kredi kartı numarası değil.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'Kelime sayısı en az ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'Kelime sayısı en fazla ${errorKey.parameter} olmalıdır.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Bu alan geçerli bir IP adresi gerektiriyor.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Bu alan geçerli bir IPv6 adresi gerektiriyor.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Bu alan geçerli bir URL gerektiriyor.',
      PredefinedFormErrorType.isNotEqualTo =>
        'Değer ${errorKey.parameter} ile eşit olmalıdır.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'Şifreler eşleşmiyor.',
      PredefinedFormErrorType.passwordTooShort =>
        'Şifre en az ${errorKey.parameter} karakter uzunluğunda olmalıdır.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'Şifre en az bir büyük harf içermelidir.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'Şifre en az bir küçük harf içermelidir.',
      PredefinedFormErrorType.passwordNoNumber =>
        'Şifre en az bir rakam içermelidir.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'Şifre en az bir özel karakter içermelidir (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'Giriş "${errorKey.parameter}" içermelidir.',
      PredefinedFormErrorType.stringContains =>
        'Giriş "${errorKey.parameter}" içermemelidir.',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Geçersiz dosya türü. İzin verilen türler: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Geçersiz dosya türü.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'Dosya boyutu maksimum limiti aşıyor${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' ($sizeInBytes bayt)';
      if (sizeInBytes < 1048576)
        return ' (${(sizeInBytes / 1024).toStringAsFixed(2)} KB)';
      return ' (${(sizeInBytes / 1048576).toStringAsFixed(2)} MB)';
    }
    return '';
  }
}
