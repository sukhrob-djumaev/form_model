sealed class FormModelStatus {
  const FormModelStatus();

  const factory FormModelStatus.loading() = _Pure._inProcess;
  const factory FormModelStatus.pure() = _Pure._;

  const factory FormModelStatus.editing() = _Edited._inProcess;
  const factory FormModelStatus.edited() = _Edited._;

  const factory FormModelStatus.dirty() = _Dirty._;

  bool get isEnabled;
  bool get isPure;
  bool get isNotPure => !isPure;
  bool get isDirty;
  bool get isNotDirty => !isDirty;
  bool get isProcessing;

  @override
  int get hashCode => Object.hash(
        runtimeType,
        isProcessing,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FormModelStatus &&
            other.isProcessing == isProcessing);
  }
}

class _Pure extends FormModelStatus {
  const _Pure._({this.processing = false});
  const _Pure._inProcess({this.processing = true});

  final bool processing;

  @override
  bool get isPure => true;

  @override
  bool get isDirty => false;

  @override
  bool get isProcessing => processing;

  @override
  bool get isEnabled => !processing;
}

class _Edited extends FormModelStatus {
  const _Edited._({this.processing = false});
  const _Edited._inProcess({this.processing = true});

  final bool processing;

  @override
  bool get isProcessing => processing;

  @override
  bool get isDirty => false;

  @override
  bool get isPure => false;

  @override
  bool get isEnabled => true;
}

class _Dirty extends FormModelStatus {
  const _Dirty._();

  @override
  bool get isDirty => true;

  @override
  bool get isPure => false;

  @override
  bool get isProcessing => false;

  @override
  bool get isEnabled => true;
}
