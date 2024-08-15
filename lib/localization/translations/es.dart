import 'package:form_model/form_model.dart';

class PredefinedFormErrorKeyTranslationsEs
    implements PredefinedFormErrorKeyTranslations {
  @override
  String translate(PredefinedFormErrorKey errorKey) {
    return switch (errorKey.type) {
      PredefinedFormErrorType.required => 'Este campo es obligatorio.',
      PredefinedFormErrorType.lengthIsLessThanMin =>
        'La longitud debe ser al menos ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsMoreThanMax =>
        'La longitud debe ser como máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.lengthIsNotEqual =>
        'La longitud debe ser exactamente ${errorKey.parameter}.',
      PredefinedFormErrorType.didNotMatchPattern =>
        'El valor no coincide con el patrón esperado: ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotOnlyText =>
        'Este campo solo debe contener caracteres alfabéticos.',
      PredefinedFormErrorType.isNotOnlyNumbers =>
        'Este campo solo debe contener números.',
      PredefinedFormErrorType.isNotValidEmail =>
        'Este campo requiere una dirección de correo electrónico válida.',
      PredefinedFormErrorType.isNotValidPhoneNumber =>
        'Este campo requiere un número de teléfono válido.',
      PredefinedFormErrorType.isNotValidDateTime =>
        'Este campo requiere una fecha y hora válidas.',
      PredefinedFormErrorType.dateIsLessThanMinAge =>
        'El valor debe ser al menos ${errorKey.parameter}.',
      PredefinedFormErrorType.dateIsMoreThanMaxAge =>
        'El valor debe ser como máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsLessThanMin =>
        'El valor debe ser al menos ${errorKey.parameter}.',
      PredefinedFormErrorType.numIsMoreThanMax =>
        'El valor debe ser como máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.boolShouldBeTrue =>
        'Este valor debe ser verdadero.',
      PredefinedFormErrorType.boolShouldBeFalse => 'Este valor debe ser falso.',
      PredefinedFormErrorType.boolAgreeToTerms =>
        'Debes aceptar los términos y condiciones.',
      PredefinedFormErrorType.intIsNotValidCreditCard =>
        'Este no es un número de tarjeta de crédito válido.',
      PredefinedFormErrorType.wordCountIsLessThan =>
        'El recuento de palabras debe ser al menos ${errorKey.parameter}.',
      PredefinedFormErrorType.wordCountIsMoreThan =>
        'El recuento de palabras debe ser como máximo ${errorKey.parameter}.',
      PredefinedFormErrorType.isNotValidIpAddress =>
        'Este campo requiere una dirección IP válida.',
      PredefinedFormErrorType.isNotValidIpv6Address =>
        'Este campo requiere una dirección IPv6 válida.',
      PredefinedFormErrorType.isNotValidUrl =>
        'Este campo requiere una URL válida.',
      PredefinedFormErrorType.isNotEqualTo =>
        'El valor debe ser igual a ${errorKey.parameter}.',
      PredefinedFormErrorType.passwordsDoNotMatch =>
        'Las contraseñas no coinciden.',
      PredefinedFormErrorType.passwordTooShort =>
        'La contraseña debe tener al menos ${errorKey.parameter} caracteres.',
      PredefinedFormErrorType.passwordNoUppercase =>
        'La contraseña debe contener al menos una letra mayúscula.',
      PredefinedFormErrorType.passwordNoLowercase =>
        'La contraseña debe contener al menos una letra minúscula.',
      PredefinedFormErrorType.passwordNoNumber =>
        'La contraseña debe contener al menos un número.',
      PredefinedFormErrorType.passwordNoSpecialChar =>
        'La contraseña debe contener al menos un carácter especial (${errorKey.parameter}).',
      PredefinedFormErrorType.stringDoesNotContain =>
        'El texto debe contener "${errorKey.parameter}".',
      PredefinedFormErrorType.stringContains =>
        'El texto no debe contener "${errorKey.parameter}".',
      PredefinedFormErrorType.invalidFileType => errorKey.parameter is List
          ? 'Tipo de archivo inválido. Los tipos permitidos son: ${(errorKey.parameter as List<String>).join(", ")}.'
          : 'Tipo de archivo inválido.',
      PredefinedFormErrorType.fileSizeExceedsLimit =>
        'El tamaño del archivo excede el límite máximo${_formatFileSize(errorKey.parameter)}.',
    };
  }

  String _formatFileSize(dynamic sizeInBytes) {
    if (sizeInBytes is int) {
      if (sizeInBytes < 1024) return '$sizeInBytes B';
      if (sizeInBytes < 1048576) {
        return '${(sizeInBytes / 1024).toStringAsFixed(2)} KB';
      }
      return ' de ${(sizeInBytes / 1048576).toStringAsFixed(2)} MB';
    }
    return '';
  }
}
