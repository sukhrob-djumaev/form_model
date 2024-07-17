// import 'package:form_model/src/enums/error_code.dart';
// import 'package:form_model/src/models/form_error.dart';

// import '../form_error_text_translations.dart';

// class FormErrorTextTranslationsJa implements FormErrorTextTranslations {
//   @override
//   String translate(FormErrorKey error) {
//     switch (error.code) {
//       case ErrorCode.required:
//         return "このフィールドは必須です。";
//       case ErrorCode.lengthIsLessThanMin:
//         return "長さは最小で ${error.parameter} 必要です。";
//       case ErrorCode.lengthIsMoreThanMax:
//         return "長さは最大で ${error.parameter} を超えてはいけません。";
//       case ErrorCode.lengthIsNotEqual:
//         return "長さは ${error.parameter} でなければなりません。";
//       case ErrorCode.didNotMatchPattern:
//         return "値が期待されるパターンに一致しませんでした：${error.parameter}。";
//       case ErrorCode.isNotOnlyText:
//         return "このフィールドにはアルファベットのみを含める必要があります。";
//       case ErrorCode.isNotOnlyNumbers:
//         return "このフィールドには数字のみを含める必要があります。";
//       case ErrorCode.isNotValidEmail:
//         return "このフィールドには有効なメールアドレスを入力してください。";
//       case ErrorCode.isNotValidPhoneNumber:
//         return "このフィールドには有効な電話番号を入力してください。";
//       case ErrorCode.isNotValidDateTime:
//         return "このフィールドには有効な日時を入力してください。";
//       case ErrorCode.dateIsLessThanMinAge:
//         return "値は少なくとも ${error.parameter} でなければなりません。";
//       case ErrorCode.dateIsMoreThanMaxAge:
//         return "値は最大で ${error.parameter} を超えてはいけません。";
//       case ErrorCode.numIsLessThanMin:
//         return "値は少なくとも ${error.parameter} でなければなりません。";
//       case ErrorCode.numIsMoreThanMax:
//         return "値は最大で ${error.parameter} を超えてはいけません。";
//       case ErrorCode.boolShouldBeTrue:
//         return "この値は true である必要があります。";
//       case ErrorCode.boolShouldBeFalse:
//         return "この値は false である必要があります。";
//       case ErrorCode.boolAgreeToTerms:
//         return "利用規約に同意する必要があります。";
//       case ErrorCode.intIsNotValidCreditCard:
//         return "これは有効なクレジットカード番号ではありません。";
//       case ErrorCode.wordCountIsLessThan:
//         return "単語数は少なくとも ${error.parameter} でなければなりません。";
//       case ErrorCode.wordCountIsMoreThan:
//         return "単語数は最大で ${error.parameter} を超えてはいけません。";
//       case ErrorCode.isNotValidIpAddress:
//         return "このフィールドには有効なIPアドレスを入力してください。";
//       case ErrorCode.isNotValidIpv6Address:
//         return "このフィールドには有効なIPv6アドレスを入力してください。";
//       case ErrorCode.isNotValidUrl:
//         return "このフィールドには有効なURLを入力してください。";
//       case ErrorCode.isNotEqualTo:
//         return "値は ${error.parameter} に等しい必要があります。";
//       case ErrorCode.custom:
//         return "エラーが発生しました：${error.customErrorText ?? '未知のエラー'}";
//       default:
//         throw ArgumentError('サポートされていないエラーコードです：${error.code}');
//     }
//   }
// }
