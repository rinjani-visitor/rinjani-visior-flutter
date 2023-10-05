// ignore_for_file: constant_identifier_names

enum LangCode {
  enUS('enUS'),
  enUK('enUK'),
  idID('idID');

  const LangCode(this.value);
  final String value;
}

enum Currency {
  USD('USD'),
  EUR("EUR"),
  IDR("IDR");

  const Currency(this.value);
  final String value;
}
