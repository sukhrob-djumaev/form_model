abstract interface class IFormModelValidator<T extends Object?, E> {
  E? validate(T value);
}
