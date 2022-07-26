import 'package:carty_e_coomerce_app/business/cubits/auth_cubit/auth_state.dart';
import 'package:carty_e_coomerce_app/constants/route_path.dart';
import 'package:carty_e_coomerce_app/presentation/routes/route_helper.dart';
import 'package:carty_e_coomerce_app/presentation/widgets/default_button.dart';
import 'package:carty_e_coomerce_app/presentation/widgets/default_form_field.dart';
import 'package:carty_e_coomerce_app/presentation/widgets/default_text_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/auth_cubit/auth_cubit.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
        if(state is UserLoginSuccess ){
          navigateAndRemoveUntil(context: context, widgetId: home);
        }

      },
      builder: (context, state) {
        final cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: fromKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome Back .',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 50,
                            wordSpacing: 0.2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Login now to browse hot offers ',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        DefaultFormField(
                          controller: emailController,
                          hint: 'Enter your Email',
                          preIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        DefaultFormField(
                          controller: passwordController,
                          hint: 'Enter your password',
                          preIcon: Icons.lock_outline,
                          isPassword: cubit.isPasswordShown,
                          sufIcon: cubit.suffix,
                          suffixPressed: () => cubit.changePasswordVisibility(),
                        ),
                        DefaultTextButton(
                            color: Colors.black54,
                            title: 'Forget your password ?',
                            onTap: () {}),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                         state is UserLoginLoading ? const Center(child: CircularProgressIndicator(),) : DefaultButton(
                          buttonTitle: 'LOGIN',
                          onTap: () {
                            if (kDebugMode) {
                              print('validate');
                            }
                            if (fromKey.currentState!.validate()) {
                              cubit.userLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim());
                            }
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const DefaultTextButton(
                                title: "Don't have an account ?",
                                color: Colors.amber),
                            DefaultTextButton(
                                title: 'Register',
                                color: Colors.blueGrey,
                                onTap: () {
                                  navigateTo(
                                      context: context, widgetId: singUp);
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
