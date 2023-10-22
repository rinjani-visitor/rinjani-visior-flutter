// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingModelImpl _$$SettingModelImplFromJson(Map<String, dynamic> json) =>
    _$SettingModelImpl(
      languageCode: $enumDecode(_$LangCodeEnumMap, json['languageCode']),
      currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
    );

Map<String, dynamic> _$$SettingModelImplToJson(_$SettingModelImpl instance) =>
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
  Currency.USD: 'USD',
  Currency.EUR: 'EUR',
  Currency.IDR: 'IDR',
};
