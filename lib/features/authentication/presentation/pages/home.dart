import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blog_app/features/authentication/presentation/pages/auth/sign_in_page.dart';
import '../bloc/authentication/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoggedOutState) {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const SignIn()));
          }
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Home page'),
              actions: [
                TextButton(
                  child: const Text('Log out',
                      style: TextStyle(color: Colors.red)),
                  onPressed: () {
                    BlocProvider.of<AuthBloc>(context).add(LogOutEvent());
                  },
                )
              ],
            ),
            body: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is GetNameState) {
                  return Center(
                    child: Text(
                      'Hello ${state.name}',
                      style: const TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'Loading...',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                );
              },
            )),
      ),
    );
  }
}
