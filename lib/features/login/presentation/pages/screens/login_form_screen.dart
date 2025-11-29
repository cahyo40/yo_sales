import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yo_sales/core/helpers/l10n.dart';
import 'package:yo_ui/yo_ui.dart';

class LoginFormScreen extends HookConsumerWidget {
  const LoginFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    final password = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final isLoading = useState(false);
    final l10n = L10n.t(context);

    login() {
      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        try {
          YoSnackBar.show(
            context: context,
            message: l10n.snackbar_login_s,
            type: YoSnackBarType.success,
          );
        } catch (e, s) {
          YoSnackBar.show(
            context: context,
            message: l10n.snackbar_login_e,
            type: YoSnackBarType.error,
          );
          YoLogger.error("Login Err $e -> $s");
        } finally {
          isLoading.value = false;
        }
      }
    }

    return Form(
      key: formKey,
      child: ListView(
        padding: YoPadding.all16,
        shrinkWrap: true,
        children: [
          YoText.headlineMedium(
            l10n.login_title,
            align: .center,
            fontWeight: FontWeight.bold,
          ),
          YoSpace(height: context.yoSpacingXs.scaled(context)),
          YoText.bodyLarge(l10n.login_body, align: .center),
          YoSpace(height: context.yoSpacingLg.scaled(context)),
          YoText.bodyMedium(l10n.email),
          YoSpace(height: context.yoSpacingSm.scaled(context)),
          YoTextFormField(
            prefixIcon: Icon(Icons.mail_outline),
            inputStyle: YoInputStyle.minimal,
            controller: email,
            inputType: YoInputType.email,
            validator: YoValidation.compose([
              (value) => YoValidation.required(value),
              (value) => YoValidation.email(value),
            ]),
          ),
          YoSpace(height: context.yoSpacingMd.scaled(context)),
          YoText.bodyMedium(l10n.password),
          YoSpace(height: context.yoSpacingSm.scaled(context)),
          YoTextFormField(
            prefixIcon: Icon(Icons.lock_outline),
            controller: password,
            inputStyle: YoInputStyle.minimal,
            obscureText: true,
            showVisibilityToggle: true,
            inputType: YoInputType.password,
            validator: YoValidation.compose([
              (v) => YoValidation.required(v, fieldName: l10n.password),
              (v) => YoValidation.passwordLength(v, 8),
              (v) => YoValidation.passwordUppercase(v),
              (v) => YoValidation.passwordLowercase(v),
              (v) => YoValidation.passwordNumber(v),
              (v) => YoValidation.passwordSpecialChar(v),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              YoButton.ghost(text: l10n.forget_password, onPressed: () {}),
            ],
          ),
          YoSpace(height: context.yoSpacingMd.scaled(context)),
          YoButton.primary(
            borderRadius: 12,
            size: YoButtonSize.large,
            text: l10n.btn_login,
            textColor: context.onPrimaryColor,
            isLoading: isLoading.value,
            onPressed: isLoading.value == true ? null : () => login(),
          ),
          YoSpace(height: context.yoSpacingXl.scaled(context)),
          RichText(
            textAlign: .center,
            text: TextSpan(
              children: [
                TextSpan(text: l10n.register_now, style: context.yoBodyMedium),
                TextSpan(
                  text: l10n.register,
                  style: context.yoBodyMedium.copyWith(
                    color: context.primaryColor,
                  ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
