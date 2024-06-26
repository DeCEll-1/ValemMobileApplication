import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valem_application/services/auth_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: content(context),
    );
  }
}

Widget content(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  addcarpark() {
    AuthService()
        .signup(
            name: nameController.text,
            phone: phoneController.text,
            email: mailController.text,
            password: passwordController.text,
            creationtime: Timestamp.now())
        .then((value) => {
              if (value == true)
                {
                  Fluttertoast.showToast(
                      msg: 'Otopark Kaydı Tamamlandı',
                      timeInSecForIosWeb: 3,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.green,
                      toastLength: Toast.LENGTH_LONG)
                }
            });

    FocusScope.of(context).unfocus();
  }

  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
              width: double.infinity,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Otopark Adı',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.storefront),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Gsm Numarası',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.phone_android),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            TextFormField(
              controller: mailController,
              decoration: InputDecoration(
                labelText: 'Mail Adresi',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.mail),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Şifre',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.lock_open),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            TextFormField(
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Şifre Tekrar',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.lock),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            SizedBox(
              width: 300,
              height: 400,
              child: DatePicker(
                minDate: DateTime(2021, 1, 1),
                maxDate: DateTime(2023, 12, 31),
                onDateSelected: (value) {
                  // Handle selected date
                },
              ),
            ),
            ElevatedButton(
              onPressed: addcarpark,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                  minimumSize: MaterialStateProperty.all(const Size(300, 50)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //side: BorderSide(color: Colors.red),
                    ),
                  )),
              child: const Text(
                "Otopark Kaydet",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ));
}
