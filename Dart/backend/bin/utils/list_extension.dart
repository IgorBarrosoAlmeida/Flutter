extension ListExtension<T> on List<T> {
  T? firstWhereNullable(bool Function(T element) test) {
    for (T element in this) {
      if (test(element)) return element;
    }

    return null;
  }
}
