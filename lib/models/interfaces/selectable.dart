class Selectable {
  bool isEqual(Selectable other) {
    return identical(this, other);
  }

  int compare(Selectable other) {
    return toString().compareTo(other.toString());
  }
}
