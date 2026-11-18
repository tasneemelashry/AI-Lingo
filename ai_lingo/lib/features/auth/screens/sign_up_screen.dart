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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool acceptedTerms = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void submit() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    FocusScope.of(context).unfocus();
    context.read<AuthCubit>().signUp(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          context.go(
            Routes.checkEmail,
            extra: CheckEmailArgs(
              email: state.user.email ?? '',
              type: CheckEmailType.verification,
              next: Routes.setup,
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
          body: SafeArea(
            child: Form(
              key: formKey,
              child: FormPageLayout(
                header: [
                  Text(
                    'LET’S GET STARTED',
                    style: AppTextStyles.labelStrong12.copyWith(
                      color: AppColors.brandPrimaryDark,
                    ),
                  ),
                  Text(
                    'Create your account',
                    style: AppTextStyles.headingScreenTitle26,
                  ),
                  Text(
                    'It takes under a minute.',
                    style: AppTextStyles.bodyDefault15.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text('Name', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: nameController,
                    validator: Validators.name,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.givenName],
                    enabled: !isLoading,
                  ),
                  SizedBox(height: 5.h),
                  Text('Email', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: emailController,
                    validator: Validators.emailValidation,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.email],
                    enabled: !isLoading,
                  ),
                  SizedBox(height: 5.h),
                  Text('Password', style: AppTextStyles.formFieldLabel14),
                  CustomTextField(
                    controller: passwordController,
                    validator: Validators.newPassword,
                    isPassword: true,
                    textInputAction: TextInputAction.done,
                    autofillHints: const [AutofillHints.newPassword],
                    enabled: !isLoading,
                  ),
                  Text(
                    'Use a mix of letters and numbers.',
                    style: AppTextStyles.bodySmall13.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: acceptedTerms,
                        activeColor: AppColors.brandPrimary,
                        onChanged: isLoading
                            ? null
                            : (value) =>
                                  setState(() => acceptedTerms = value ?? false),
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms and Privacy Policy',
                          style: AppTextStyles.bodySmall13.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                footer: [
                  CustomButton(
                    onPressed: acceptedTerms ? submit : null,
                    isLoading: isLoading,
                    buttonText: 'Create account',
                    buttonIcon: AppAssets.arrowRightIcon,
                  ),
                  InkWell(
                    onTap: () => context.go(Routes.login),
                    child: Text(
                      'Already have an account? Sign in',
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
