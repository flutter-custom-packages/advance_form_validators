enum Regex {
  general(r'^.*$'),
  email(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
  containsUppercase(r'(?=.*[A-Z])'),
  containsLowercase(r'(?=.*[a-z])'),
  containsNumber(r'(?=.*[0-9])'),
  username(r'^[a-zA-Z][a-zA-Z0-9_]{2,19}$'),

  decimal(r'^[0-9]{0,7}\.[0-9]{1,9}$'),
  decimalValue(r'^[+-]?\d+(\.\d{decimalValue})?$'),
  numberOnly(r'^[+-]?(\d+(\.\d*)?|\.\d+)$'),
  ;

  final String regex;
  const Regex(this.regex);

  RegExp get expression => RegExp(regex);
}
