library formz;

enum FormzStatus {
  pure,
  valid,
  invalid,
  submissionInProgress,
  submissionSuccess,
  submissionFailure,
  submissionCanceled,
}

const _validatedFormzStatuses = <FormzStatus>{
  FormzStatus.valid,
  FormzStatus.submissionInProgress,
  FormzStatus.submissionSuccess,
  FormzStatus.submissionFailure,
  FormzStatus.submissionCanceled,
};

extension FormzStatusX on FormzStatus {
  bool get isPure => this == FormzStatus.pure;
  bool get isValid => this == FormzStatus.valid;
  bool get isValidated => _validatedFormzStatuses.contains(this);
  bool get isInvalid => this == FormzStatus.invalid;
  bool get isSubmissionInProgress => this == FormzStatus.submissionInProgress;
  bool get isSubmissionSuccess => this == FormzStatus.submissionSuccess;
  bool get isSubmissionFailure => this == FormzStatus.submissionFailure;
  bool get isSubmissionCanceled => this == FormzStatus.submissionCanceled;
}

enum FormzInputStatus {
  pure,
  valid,
  invalid,
}

abstract class FormzInput<T, E> {
  const FormzInput._(this.value, [this.pure = true]);
  const FormzInput.pure(T value) : this._(value);
  const FormzInput.dirty(T value) : this._(value, false);
  final T value;
  final bool pure;

  FormzInputStatus get status => pure
      ? FormzInputStatus.pure
      : valid
          ? FormzInputStatus.valid
          : FormzInputStatus.invalid;

  E? get error => validator(value);

  bool get valid => validator(value) == null;
  bool get invalid => status == FormzInputStatus.invalid;
  E? validator(T value);

  @override
  int get hashCode => value.hashCode ^ pure.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is FormzInput<T, E> &&
        other.value == value &&
        other.pure == pure;
  }

  @override
  String toString() => '$runtimeType($value, $pure)';
}

class Formz {
  static FormzStatus validate(List<FormzInput> inputs) {
    return inputs.every((element) => element.pure)
        ? FormzStatus.pure
        : inputs.any((input) => input.valid == false)
            ? FormzStatus.invalid
            : FormzStatus.valid;
  }
}

mixin FormzMixin {
  FormzStatus get status => Formz.validate(inputs);
  List<FormzInput> get inputs;
}
