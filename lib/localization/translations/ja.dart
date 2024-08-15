import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsJa
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'このフィールドは必須です。',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        '長さは${errorKey.parameter}以上である必要があります。',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        '長さは${errorKey.parameter}以下である必要があります。',
      PredefinedFormErrorType.lengthIsNotEqual =>
        '長さは正確に${errorKey.parameter}である必要があります。',
      PredefinedFormErrorType.didNotMatchPattern =>
        '値が予期されたパターンと一致しません：${errorKey.parameter}。',
      PredefinedFormErrorType.isNotOnlyText =>
        'このフィールドにはアルファベット文字のみを含める必要があります。',
      PredefinedFormErrorType.isNotOnlyNumbers => 'このフィールドには数字のみを含める必要があります。',
      PredefinedFormErrorType.isNotValidEmail => 'このフィールドには有効なメールアドレスが必要です。',
      PredefinedFormErrorType.isNotValidPhoneNumber => 'このフィールドには有効な電話番号が必要です。',
      PredefinedFormErrorType.isNotValidDateTime => 'このフィールドには有効な日付と時刻が必要です。',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        '値は少なくとも${errorKey.parameter}である必要があります。',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        '値は最大で${errorKey.parameter}である必要があります。',
      PredefinedFormErrorType.numIsLessThanMin =>
        '値は${errorKey.parameter}以上である必要があります。',
      PredefinedFormErrorType.numIsMoreThanMax =>
        '値は${errorKey.parameter}以下である必要があります。',
      PredefinedFormErrorType.boolShouldBeTrue => 'この値は真である必要があります。',
      PredefinedFormErrorType.boolShouldBeFalse => 'この値は偽である必要があります。',
      PredefinedFormErrorType.boolAgreeToTerms => '利用規約に同意する必要があります。',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'これは有効なクレジットカード番号ではありません。',
      PredefinedFormErrorType.wordCountIsLessThan =>
        '単語数は少なくとも${errorKey.parameter}である必要があります。',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        '単語数は最大で${errorKey.parameter}である必要があります。',
      PredefinedFormErrorType.isNotValidIpAddress => 'このフィールドには有効なIPアドレスが必要です。',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'このフィールドには有効なIPv6アドレスが必要です。',
      PredefinedFormErrorType.isNotValidUrl => 'このフィールドには有効なURLが必要です。',
      PredefinedFormErrorType.isNotEqualTo =>
        '値は${errorKey.parameter}と等しくなければなりません。',
      PredefinedFormErrorType.passwordsDoNotMatch => 'パスワードが一致しません。',
      PredefinedFormErrorType.passwordTooShort =>
        'パスワードは少なくとも${errorKey.parameter}文字である必要があります。',
      PredefinedFormErrorType.passwordNoUppercase =>
        'パスワードには少なくとも1つの大文字を含める必要があります。',
      PredefinedFormErrorType.passwordNoLowercase =>
        'パスワードには少なくとも1つの小文字を含める必要があります。',
      PredefinedFormErrorType.passwordNoNumber =>
        'パスワードには少なくとも1つの数字を含める必要があります。',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'パスワードには少なくとも1つの特殊文字（${errorKey.parameter}）を含める必要があります。',
      PredefinedFormErrorType.stringDoesNotContain =>
        '入力には "${errorKey.parameter}" を含める必要があります。',
      PredefinedFormErrorType.stringContains =>
        '入力に "${errorKey.parameter}" を含めることはできません。',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? '無効なファイルタイプです。許可されるタイプは次のとおりです：${(errorKey.parameter as List<String>).join("、")}。'
          : '無効なファイルタイプです。',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'ファイルサイズが最大制限を超えています${_formatFileSize(errorKey.parameter)}。',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '（$sizeInBytes バイト）';
      if (sizeInBytes < 1048576) {
        return '（${(sizeInBytes / 1024).toStringAsFixed(2)} KB）';
      }
      return '（${(sizeInBytes / 1048576).toStringAsFixed(2)} MB）';
    }
    return '';
  }
}
