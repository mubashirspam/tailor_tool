import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                "Register",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 10),
              Text(
                "Create your account",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 35),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  )),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  )),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Number",
                  )),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Age",
                  )),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Gender",
                  )),
              const SizedBox(height: 10),
              TextFormField(
                  controller: _controllerUsername,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                    labelText: "Password",
                  )),
              const SizedBox(height: 10),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            width: 200,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            behavior: SnackBarBehavior.floating,
                            content: const Text("Registered Successfully"),
                          ),
                        );

                        _formKey.currentState?.reset();

                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Register"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
