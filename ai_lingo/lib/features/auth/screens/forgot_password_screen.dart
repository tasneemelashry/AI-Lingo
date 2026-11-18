import 'package:ai_lingo/core/constants/app_assets.dart';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_colors.dart';
import 'package:ai_lingo/core/theme/app_text_styles.dart';
import 'package:ai_lingo/core/widgets/app_snack_bar.dart';
import 'package:ai_lingo/core/widgets/custom_button.dart';
import 'package:ai_lingo/core/widgets/custom_text_field.dart';
import 'package:ai_lingo/core/widgets/form_page_layout.dart';
import 'package:ai_lingo/core/utils/validators.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:ai_lingo/features/auth/cubit/auth_state.dart';
import 'package:ai_lingo/features/auth/screens/check_email_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.read<AuthCubit>().forgotPassword(emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetLinkSent) {
          context.pushReplacement(
            Routes.checkEmail,
            extra: CheckEmailArgs(
              email: state.email,
              type: CheckEmailType.passwordReset,
              next: Routes.login,
              linkJustSent: true,
            ),
          );
        } else if (state is AuthError) {
          showErrorSnackBar(context, state.failure.message);
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              tooltip: 'Back',
              onPressed: () =>
                  context.canPop() ? context.pop() : context.go(Routes.login),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          ),
          body: SafeArea(
            child: Form(
              key: formKey,
              child: FormPageLayout(
                topPadding: 10.h,
                header: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceBrandTint,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.email_outlined,
                        color: AppColors.brandPrimaryDark,
                        size: 32,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'RESET PASSWORD',
                    style: AppTextStyles.labelStrong12.copyWith(
                      color: AppColors.brandPrimaryDark,
                    ),
                  ),
                  Text(
                    'Forgot your password?',
                    style: AppTextStyles.headingScreenTitle26,
                  ),
                  Text(
                    'Enter your email and we’ll send you a link to choose a new one.',
                    style: AppTextStyles.bodyDefault15.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text('Email', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: emailController,
                    validator: Validators.emailValidation,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.email],
                    onFieldSubmitted: (_) => submit(),
                    enabled: !isLoading,
                  ),
                ],
                footer: [
                  CustomButton(
                    onPressed: submit,
                    isLoading: isLoading,
                    buttonText: 'Send reset link',
                    buttonIcon: AppAssets.arrowRightIcon,
                  ),
                  InkWell(
                    onTap: () => context.go(Routes.login),
                    child: Text(
                      'Back to sign in',
                      style: AppTextStyles.labelStrong15.copyWith(
                        color: AppColors.brandPrimaryDark,
                      ),
                      textAlign: .center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
