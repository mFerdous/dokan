class RegexRes {
  RegexRes._init();

  static RegExp kOnlyNumber = RegExp(r'^[0-9]+$');

  static RegExp kEmailId = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@([a-zA-Z0-9_\-\.]+)\.[a-zA-Z]+");

  static RegExp kSpecialOneChar = RegExp(r'^.*\W$');
}
