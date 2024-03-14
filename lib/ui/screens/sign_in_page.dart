import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teeeemj/core/routes/app_router.dart';
import 'package:teeeemj/cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:teeeemj/cubit/sign_in/sign_in_cubit.dart';
import 'package:teeeemj/ui/widgets/auth_button.dart';
import 'package:teeeemj/ui/widgets/auth_textfield.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        leading: IconButton(
          onPressed: () {
            context.router.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Register',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Color(0xffeeeeee),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    AuthTextfield(
                      hintText: 'Username',
                      controller: controllerEmail,
                    ),
                    const SizedBox(height: 30),
                    AuthTextfield(
                      hintText: 'Password',
                      controller: controllerPassword,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    height: 200,
                                    width: 200,
                                    child: Column(
                                      children: [
                                        AuthTextfield(
                                            hintText: 'Email',
                                            controller: controllerEmail),
                                        const SizedBox(height: 5),
                                        BlocBuilder<ResetPasswordCubit,
                                            ResetPasswordState>(
                                          builder: (context, state) {
                                            if (state is ResetLoading) {
                                              return const CircularProgressIndicator();
                                            }
                                            if (state is ResetError) {
                                              return Text(state.errorText);
                                            }
                                            if (state is ResetSuccess) {
                                              return ElevatedButton(
                                                onPressed: () {
                                                  context.router.pop();
                                                },
                                                child: const Text('Close'),
                                              );
                                            }
                                            return ElevatedButton(
                                              onPressed: () {
                                                context
                                                    .read<ResetPasswordCubit>()
                                                    .resetPassword(
                                                      email:
                                                          controllerEmail.text,
                                                    );
                                              },
                                              child:
                                                  const Text('Reset Password'),
                                            );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      height: 60,
                      child: AuthButton(
                        title: 'Sign In',
                        onPressed: () async {
                          await context.read<SignInCubit>().signIn(
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                              );
                        },
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: 20),
                    BlocConsumer<SignInCubit, SignInState>(
                      listener: (context, state) {
                        if (state is SignInSuccess) {
                          context.router.push(HomeRoute());
                        }
                      },
                      builder: (context, state) {
                        if (state is SignInLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is SignInError) {
                          return Text(state.errorText);
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
