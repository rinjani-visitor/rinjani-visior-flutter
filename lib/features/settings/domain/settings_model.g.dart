// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SettingsModel _$$_SettingsModelFromJson(Map<String, dynamic> json) =>
    _$_SettingsModel(
      languageCode: $enumDecode(_$LangCodeEnumMap, json['languageCode']),
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
    );

Map<String, dynamic> _$$_SettingsModelToJson(_$_SettingsModel instance) =>
    <String, dynamic>{
      'languageCode': _$LangCodeEnumMap[instance.languageCode]!,
      'currency': _$CurrencyEnumMap[instance.currency]!,
    };

const _$LangCodeEnumMap = {
  LangCode.enUS: 'enUS',
  LangCode.enUK: 'enUK',
  LangCode.idID: 'idID',
};

const _$CurrencyEnumMap = {
  Currency.usd: 'usd',
  Currency.eur: 'eur',
  Currency.idr: 'idr',
};
