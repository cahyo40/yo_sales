import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/features/register/presentation/providers/register_provider.dart';
import 'package:yo_sales/l10n/app_localizations.dart';
import 'package:yo_ui/yo_ui.dart';

class RegisterUserFormScreen extends HookConsumerWidget {
  final PageController pageController;
  const RegisterUserFormScreen({super.key, required this.pageController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final phoneController = useTextEditingController();
    final isLoading = useState(false);
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: YoColumn(
          padding: YoPadding.all16,
          spacing: context.yoSpacingLg.scaled(context),
          children: [
            YoTextFormField(
              labelText: l10n.full_name,
              hintText: l10n.full_name_hint,
              controller: nameController,
              inputType: YoInputType.text,
              inputStyle: YoInputStyle.minimal,
              validator: (value) {
                return YoValidation.required(value, fieldName: l10n.full_name);
              },
            ),
            YoTextFormField(
              labelText: l10n.email,
              hintText: l10n.email_hint,
              controller: emailController,
              inputType: YoInputType.email,
              inputStyle: YoInputStyle.minimal,
              validator: YoValidation.compose([
                (value) => YoValidation.required(value, fieldName: l10n.email),
                (value) => YoValidation.email(value),
              ]),
            ),
            YoTextFormField(
              labelText: l10n.phone_number,
              controller: phoneController,
              inputType: YoInputType.phone,
              inputStyle: YoInputStyle.minimal,
              validator: YoValidation.compose([
                (v) => YoValidation.required(v, fieldName: l10n.phone_number),
                (v) => YoValidation.phoneNumber(v),
              ]),
            ),
            YoTextFormField(
              obscureText: true,
              showVisibilityToggle: true,
              controller: passwordController,
              labelText: l10n.password,
              hintText: l10n.password_hint,
              inputType: YoInputType.password,
              inputStyle: YoInputStyle.minimal,
              validator: YoValidation.compose([
                (v) => YoValidation.required(v, fieldName: l10n.password),
                (v) => YoValidation.passwordLength(v, 8),
                (v) => YoValidation.passwordUppercase(v),
                (v) => YoValidation.passwordLowercase(v),
                (v) => YoValidation.passwordNumber(v),
                (v) => YoValidation.passwordSpecialChar(v),
              ]),
            ),
            YoTextFormField(
              labelText: l10n.confirm_password,
              hintText: l10n.confirm_password_hint,
              controller: confirmPasswordController,
              obscureText: true,
              showVisibilityToggle: true,
              inputType: YoInputType.password,
              inputStyle: YoInputStyle.minimal,
              validator: YoValidation.match(passwordController),
            ),

            YoButton.primary(
              expanded: true,
              textColor: context.onPrimaryColor,
              text: l10n.next,
              isLoading: isLoading.value,
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  ref
                      .read(registerNotifierProvider.notifier)
                      .updateData(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                      );
                  ref.watch(registerNotifierProvider);
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
