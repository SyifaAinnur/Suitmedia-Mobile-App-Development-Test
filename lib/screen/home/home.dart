import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/custom_button.dart';
import 'package:suitmedia_test/components/custom_text_input.dart';
import 'package:suitmedia_test/screen/second_screen/pick_name.dart';
import 'package:suitmedia_test/services/palindrome_check.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/modules/home/bg_validation.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 64),
                  _buildWelcomeText(context),
                  SizedBox(height: 64),
                  _buildAddProfilePicture(context),
                  SizedBox(height: 32),
                  _buildInsertNameForm(context),
                  SizedBox(height: 64),
                  _buildNextButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText(BuildContext context) {
    return Text(
      "Selamat Datang!",
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildAddProfilePicture(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 48),
        Container(
          width: 128,
          child: Image.asset("assets/modules/home/btn_add_photo.png"),
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),
        ),
      ],
    );
  }

  Widget _buildInsertNameForm(BuildContext context) {
    return Column(
      children: [
        _buildNameInputTextField(context),
        _buildPalindromeInputTextField(context),
      ],
    );
  }

  Widget _buildNameInputTextField(BuildContext context) {
    return CustomTextInputFormField(
      controller: _nameController,
      decoration: InputDecoration(
        hintText: "Masukkan nama...",
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }

    Widget _buildPalindromeInputTextField(BuildContext context) {
    return CustomTextInputFormField(
      controller: _palindromeController,
      decoration: InputDecoration(
        hintText: "Masukkan Palindrome...",
        hintStyle: TextStyle(color: Colors.white),
        fillColor: Colors.white,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }



  Widget _buildNextButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: CustomButton(
        text: Text("Selesai"),
        onPressed: () {
          _buildIsPalindromeDialog();
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          foregroundColor: MaterialStateProperty.all(Colors.white),
          side: MaterialStateProperty.all(
            BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _buildIsPalindromeDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              Text(
                _palindromeController.text,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(" "),
              Text(_nameIsPalindrome()),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickName(
                      insertedName: _nameController.text,
                    ),
                  ),
                );
              },
              child: Text("Lanjut"),
            ),
          ],
        );
      },
    );
  }

  String _nameIsPalindrome() {
    return isPalindrome(_palindromeController.text)
        ? "is palindrome"
        : "is not palindrome";
  }
}