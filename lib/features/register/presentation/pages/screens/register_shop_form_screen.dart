import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/features/register/presentation/providers/register_provider.dart';
import 'package:yo_sales/l10n/app_localizations.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterShopFormScreen extends HookConsumerWidget {
  final PageController pageController;

  const RegisterShopFormScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(registerNotifierProvider);
    final l10n = AppLocalizations.of(context)!;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final shopNameController = useTextEditingController();
    final shopAddressController = useTextEditingController();
    final shopTypeController = useTextEditingController();
    final shopPhoneController = useTextEditingController();
    final shopDescriptionController = useTextEditingController();
    final isLoading = useState(false);

    onSumbit() async {
      YoLogger.debug(data.email);
    }

    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: YoColumn(
          padding: YoPadding.all16,
          spacing: context.yoSpacingMd.scaled(context),
          children: [
            YoTextFormField(
              labelText: l10n.shop_name,
              hintText: l10n.shop_name_hint,
              controller: shopNameController,
              inputType: YoInputType.text,
              inputStyle: YoInputStyle.minimal,
              validator: (value) {
                return YoValidation.required(value, fieldName: l10n.shop_name);
              },
            ),
            YoTextFormField(
              labelText: l10n.shop_addess,
              hintText: l10n.shop_addess_hint,
              controller: shopAddressController,
              inputType: YoInputType.text,
              inputStyle: YoInputStyle.minimal,
              validator: (value) {
                return YoValidation.required(
                  value,
                  fieldName: l10n.shop_addess,
                );
              },
            ),
            YoTextFormField(
              labelText: l10n.shop_type,
              hintText: l10n.shop_type_hint,
              controller: shopTypeController,
              inputType: YoInputType.text,
              inputStyle: YoInputStyle.minimal,
              validator: (value) {
                return YoValidation.required(value, fieldName: l10n.shop_type);
              },
            ),
            YoTextFormField(
              labelText: l10n.phone_number,
              hintText: l10n.phone_number_hint,
              controller: shopPhoneController,
              inputType: YoInputType.phone,
              inputStyle: YoInputStyle.minimal,
              validator: YoValidation.compose([
                (v) => YoValidation.required(v, fieldName: l10n.phone_number),
                (v) => YoValidation.phoneNumber(v),
              ]),
            ),
            YoTextFormField(
              hintText: l10n.shop_description_hint,
              labelText: l10n.shop_description,
              controller: shopDescriptionController,
              inputType: YoInputType.multiline,
              inputStyle: YoInputStyle.minimal,
              validator: (value) {
                return YoValidation.required(
                  value,
                  fieldName: l10n.shop_description,
                );
              },
            ),
            YoButton.primary(
              expanded: true,
              textColor: context.onPrimaryColor,
              text: l10n.btn_register,
              isLoading: isLoading.value,
              onPressed: () {
                onSumbit();
                // pageController.nextPage(
                //   duration: const Duration(milliseconds: 300),
                //   curve: Curves.easeInOut,
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
