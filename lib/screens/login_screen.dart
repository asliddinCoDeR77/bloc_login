import 'package:bloc_login/bloc/login_bloc.dart';
import 'package:bloc_login/bloc/login_event.dart';
import 'package:bloc_login/bloc/login_state.dart';
import 'package:bloc_login/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  LoginScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(userRepository: userRepository),
        child: _LoginForm(),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  __LoginFormState createState() => __LoginFormState();
}

class __LoginFormState extends State<_LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(LoginUsernameChanged(username: value));
              },
            ),
            const SizedBox(
              height: 14,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                ),
              ),
              obscureText: true,
              onChanged: (value) {
                context
                    .read<LoginBloc>()
                    .add(LoginPasswordChanged(password: value));
              },
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isSubmitting) {
                  return const CircularProgressIndicator();
                } else {
                  return FilledButton(
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(343, 50)),
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginSubmitted());
                    },
                    child: const Text('Login'),
                  );
                }
              },
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isFailure) {
                  return const Text('Login Failed',
                      style: TextStyle(color: Colors.red));
                } else if (state.isSuccess) {
                  return const Text('Login Successful',
                      style: TextStyle(color: Colors.green));
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
