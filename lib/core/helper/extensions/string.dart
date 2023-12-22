extension ExtensionString on String? {
  bool get isNullOrEmpty => this == null || this!.trim().isEmpty;

  bool get isNotNullOrEmpty => this != null && this!.trim().isNotEmpty;
}

extension StringExtension on String {
  String intelliTrim() {
    return this.length > 30 ? '${this.substring(0, 30)}...' : this;
  }
}


