abstract interface class IFormModelValidator<T extends Object?,
    E extends Object> {
  E? validate(T value);
}
