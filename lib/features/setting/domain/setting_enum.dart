enum LangCode {
  enUS('enUS'),
  enUK('enUK'),
  idID('idID');

  const LangCode(this.value);
  final String value;
}

enum Currency {
  usd('USD'),
  eur("EUR"),
  idr("IDR");

  const Currency(this.value);
  final String value;
}
