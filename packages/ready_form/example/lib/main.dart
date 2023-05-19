import 'package:flutter/material.dart';
import 'package:ready_form/ready_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormPage(),
    );
  }
}

class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReadyForm(
        autoValidateMode: FormAutoValidateMode.onSubmit,
        onPostData: () async {
          await Future.delayed(const Duration(milliseconds: 300));
          return OnPostDataResult({"email": "The email already exist"});
        },
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            SubmitErrorMessageFor(
              messageFor: 'email',
              builder: (form, error) {
                return TextFormField(
                  decoration: InputDecoration(
                    errorText: error,
                    hintText: "Email",
                  ),
                );
              },
            ),
            TextFormField(),
            const SubmitErrorMessageFor(messageFor: 'email'),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            TextFormField(),
            ProgressButton(
              // type: ButtonType.outlined,
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 3));
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
