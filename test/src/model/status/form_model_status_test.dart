import 'package:flutter_test/flutter_test.dart';
import 'package:form_model/form_model.dart';

void main() {
  group('FormModelStatus equality:', () {
    test('pure check', () {
      const s1 = FormModelStatus.pure();

      expect(s1.isProcessing, isFalse);
      expect(s1.isPure, isTrue);
      expect(s1.isNotDirty, isTrue);
    });

    test('editing check', () {
      const s1 = FormModelStatus.editing();

      expect(s1.isProcessing, isTrue);
      expect(s1.isNotPure, isTrue);
      expect(s1.isNotDirty, isTrue);
    });

    test('edited check', () {
      const s1 = FormModelStatus.edited();

      expect(s1.isProcessing, isFalse);
      expect(s1.isNotPure, isTrue);
      expect(s1.isNotDirty, isTrue);
    });

    test('dirty check', () {
      const s1 = FormModelStatus.dirty();

      expect(s1.isProcessing, isFalse);
      expect(s1.isNotPure, isTrue);
      expect(s1.isDirty, isTrue);
    });

    test('different value 1', () {
      const s1 = FormModelStatus.pure();
      const s2 = FormModelStatus.edited();

      expect(s1 == s2, isFalse);
    });

    test('different value 2', () {
      const s1 = FormModelStatus.pure();
      const s2 = FormModelStatus.editing();

      expect(s1 == s2, isFalse);
    });

    test('different value 3', () {
      const s1 = FormModelStatus.pure();
      const s2 = FormModelStatus.dirty();

      expect(s1 == s2, isFalse);
    });

    test('different value 4', () {
      const s1 = FormModelStatus.edited();
      const s2 = FormModelStatus.editing();

      expect(s1 == s2, isFalse);
      expect(s1.isProcessing, isFalse);
      expect(s2.isProcessing, isTrue);
    });

    test('same value 1', () {
      const s1 = FormModelStatus.editing();
      const s2 = FormModelStatus.editing();

      expect(s1 == s2, isTrue);
    });
  });
}
