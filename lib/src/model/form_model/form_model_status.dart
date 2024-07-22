enum FormModelStatus {
  pure,
  edited,
  dirty,
  // valid;
}

// sealed class FormModelStatus {
//   const FormModelStatus();

//   factory FormModelStatus.pure() => Pure();

//   factory FormModelStatus.edited() => Edited();

//   factory FormModelStatus.dirty({bool isDirty = true}) =>
//       Dirty(isDirty: isDirty);

//   // Optional: Add factory for valid state if needed
//   // factory FormModelStatus.valid() => Valid();
// }

// class Pure extends FormModelStatus {}

// class Edited extends FormModelStatus {}

// class Dirty extends FormModelStatus {
//   final bool isDirty;

//   const Dirty({required this.isDirty});
// }
