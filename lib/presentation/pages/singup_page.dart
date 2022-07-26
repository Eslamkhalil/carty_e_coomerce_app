import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business/cubits/auth_cubit/auth_cubit.dart';
import '../../business/cubits/auth_cubit/auth_state.dart';
import '../../constants/route_path.dart';
import '../routes/route_helper.dart';
import '../widgets/default_button.dart';
import '../widgets/default_form_field.dart';
import '../widgets/default_text_button.dart';

class SingUp extends StatelessWidget {
  SingUp({Key? key}) : super(key: key);

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is UserRegisterSuccess ){
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome.',
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
                          controller: nameController,
                          hint: 'Enter your name',
                          preIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
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
                          controller: phoneController,
                          hint: 'Enter your phone',
                          preIcon: Icons.phone,
                          isPhone: true,
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

                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        state is UserLoginLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : DefaultButton(
                                buttonTitle: 'SING UP',
                                onTap: () {
                                  if (kDebugMode) {
                                    print('validate');
                                  }
                                  if (fromKey.currentState!.validate()) {
                                    cubit.userRegister(
                                      name: nameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                      phone: phoneController.text.trim(),
                                    );
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
                                title: "Do you have an account ?",
                                color: Colors.amber),
                            DefaultTextButton(
                                title: 'Login',
                                color: Colors.blueGrey,
                                onTap: () {
                                  navigateTo(
                                      context: context, widgetId: login);
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
