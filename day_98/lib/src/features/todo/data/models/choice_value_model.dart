class ChoiceValue<T> {
  const ChoiceValue(
      {required this.value, required this.title, required this.label});

  final T value;
  final String title;
  final String label;

  @override
  String toString() => '$runtimeType("$title")';
}
