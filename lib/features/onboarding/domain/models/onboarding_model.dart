import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yo_sales/core/assets/images/images_const.dart';
import 'package:yo_sales/core/helpers/l10n.dart';

part 'onboarding_model.freezed.dart';
part 'onboarding_model.g.dart';

@freezed
class OnboardingModel with _$OnboardingModel {
  const factory OnboardingModel({
    required String id,
    required String image,
    required String title,
    required String description,
    // Add your fields here
  }) = _OnboardingModel;

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingModelFromJson(json);

  static List<OnboardingModel> values(BuildContext context) => [
    OnboardingModel(
      id: '1',
      image: YoAssetsImage.onboarding1,
      title: L10n.t(context).onboard_title_1,
      description: L10n.t(context).onboard_desc_1,
    ),
    OnboardingModel(
      id: '2',
      image: YoAssetsImage.onboarding2,
      title: L10n.t(context).onboard_title_2,
      description: L10n.t(context).onboard_desc_2,
    ),
    OnboardingModel(
      id: '3',
      image: YoAssetsImage.onboarding3,
      title: L10n.t(context).onboard_title_3,
      description: L10n.t(context).onboard_desc_3,
    ),
  ];
}
