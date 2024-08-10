import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsPt
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Este campo é obrigatório.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'O comprimento deve ser no mínimo ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'O comprimento deve ser no máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'O comprimento deve ser exatamente ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'O valor não corresponde ao padrão esperado: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Este campo deve conter apenas caracteres alfabéticos.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Este campo deve conter apenas números.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Este campo requer um endereço de e-mail válido.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Este campo requer um número de telefone válido.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Este campo requer uma data e hora válidas.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'O valor deve ser pelo menos ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'O valor deve ser no máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'O valor deve ser pelo menos ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'O valor deve ser no máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue =>
        'Este valor deve ser verdadeiro.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Este valor deve ser falso.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Você deve concordar com os termos e condições.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Este não é um número de cartão de crédito válido.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'A contagem de palavras deve ser pelo menos ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'A contagem de palavras deve ser no máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Este campo requer um endereço IP válido.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Este campo requer um endereço IPv6 válido.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Este campo requer uma URL válida.',
      PredefinedFormErrorType.isNotEqualTo =>
        'O valor deve ser igual a ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch => 'As senhas não coincidem.',
      PredefinedFormErrorType.passwordTooShort =>
        'A senha deve ter pelo menos ${errorKey.parameter} caracteres.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'A senha deve conter pelo menos uma letra maiúscula.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'A senha deve conter pelo menos uma letra minúscula.',
      PredefinedFormErrorType.passwordNoNumber =>
        'A senha deve conter pelo menos um número.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'A senha deve conter pelo menos um caractere especial (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'A entrada deve conter "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'A entrada não deve conter "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Tipo de arquivo inválido. Os tipos permitidos são: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Tipo de arquivo inválido.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'O tamanho do arquivo excede o limite máximo${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return ' de $sizeInBytes bytes';
      if (sizeInBytes < 1048576)
        return ' de ${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      return ' de ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
