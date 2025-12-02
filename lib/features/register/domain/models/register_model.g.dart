// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterModelImpl _$$RegisterModelImplFromJson(Map<String, dynamic> json) =>
    _$RegisterModelImpl(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['phone'] as String,
      shopName: json['shopName'] as String,
      shopAddress: json['shopAddress'] as String,
      shopPhone: json['shopPhone'] as String,
      shopDescription: json['shopDescription'] as String,
      shopCategory: json['shopCategory'] as String,
    );

Map<String, dynamic> _$$RegisterModelImplToJson(_$RegisterModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'shopName': instance.shopName,
      'shopAddress': instance.shopAddress,
      'shopPhone': instance.shopPhone,
      'shopDescription': instance.shopDescription,
      'shopCategory': instance.shopCategory,
    };
