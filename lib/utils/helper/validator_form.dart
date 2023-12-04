abstract class ValidatorForm {
  static String? validateRequired({
    required String? value,
    String fieldName = "",
  }) {
    value = (value ?? "").trim();
    if (value.isEmpty) {
      return "$fieldName is not empty";
    }
    return null;
  }
}
