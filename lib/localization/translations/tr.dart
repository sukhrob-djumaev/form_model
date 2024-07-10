import 'package:form_model/src/enums/error_code.dart';
import 'package:form_model/src/models/form_error.dart';

import '../form_error_text_translations.dart';

class FormErrorTextTranslationsTr implements FormErrorTextTranslations {
  @override
  String translate(FormError error) {
    switch (error.code) {
      case ErrorCode.required:
        return "Bu alan zorunludur.";
      case ErrorCode.lengthIsLessThanMin:
        return "Uzunluk en az ${error.parameter} olmalıdır.";
      case ErrorCode.lengthIsMoreThanMax:
        return "Uzunluk en fazla ${error.parameter} olmalıdır.";
      case ErrorCode.lengthIsNotEqual:
        return "Uzunluk tam olarak ${error.parameter} olmalıdır.";
      case ErrorCode.didNotMatchPattern:
        return "Değer beklenen desenle eşleşmiyor: ${error.parameter}.";
      case ErrorCode.isNotOnlyText:
        return "Bu alan yalnızca alfabetik karakterler içermelidir.";
      case ErrorCode.isNotOnlyNumbers:
        return "Bu alan yalnızca rakamlar içermelidir.";
      case ErrorCode.isNotValidEmail:
        return "Geçerli bir e-posta adresi giriniz.";
      case ErrorCode.isNotValidPhoneNumber:
        return "Geçerli bir telefon numarası giriniz.";
      case ErrorCode.isNotValidDateTime:
        return "Geçerli bir tarih ve saat giriniz.";
      case ErrorCode.dateIsLessThanMinAge:
        return "Değer en az ${error.parameter} olmalıdır.";
      case ErrorCode.dateIsMoreThanMaxAge:
        return "Değer en fazla ${error.parameter} olmalıdır.";
      case ErrorCode.numIsLessThanMin:
        return "Değer en az ${error.parameter} olmalıdır.";
      case ErrorCode.numIsMoreThanMax:
        return "Değer en fazla ${error.parameter} olmalıdır.";
      case ErrorCode.boolShouldBeTrue:
        return "Bu değer doğru olmalıdır.";
      case ErrorCode.boolShouldBeFalse:
        return "Bu değer yanlış olmalıdır.";
      case ErrorCode.boolAgreeToTerms:
        return "Koşulları kabul etmelisiniz.";
      case ErrorCode.intIsNotValidCreditCard:
        return "Geçerli bir kredi kartı numarası değil.";
      case ErrorCode.wordCountIsLessThan:
        return "Kelime sayısı en az ${error.parameter} olmalıdır.";
      case ErrorCode.wordCountIsMoreThan:
        return "Kelime sayısı en fazla ${error.parameter} olmalıdır.";
      case ErrorCode.isNotValidIpAddress:
        return "Geçerli bir IP adresi giriniz.";
      case ErrorCode.isNotValidIpv6Address:
        return "Geçerli bir IPv6 adresi giriniz.";
      case ErrorCode.isNotValidUrl:
        return "Geçerli bir URL giriniz.";
      case ErrorCode.isNotEqualTo:
        return "Değer ${error.parameter} ile eşit olmalıdır.";
      case ErrorCode.custom:
        return "Bir hata oluştu: ${error.parameter ?? 'Bilinmeyen hata'}";
      default:
        throw ArgumentError('Desteklenmeyen hata kodu: ${error.code}');
    }
  }
}
