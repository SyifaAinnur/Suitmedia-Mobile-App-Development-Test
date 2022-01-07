import 'package:flutter/material.dart';
import 'package:suitmedia_test/components/custom_button.dart';
import 'package:suitmedia_test/screen/third_screen/list_of_user.dart';

class PickName extends StatefulWidget {
  const PickName({required this.insertedName, Key? key}) : super(key: key);

  final String insertedName;

  @override
  _PickNameState createState() => _PickNameState();
}

class _PickNameState extends State<PickName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNameSection(context),
            SizedBox(height: 24),
            Text(
              "Pilih nama User",
            ),
            _buildUserButton(context),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _buildNameSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 50)),
            Text(
              "Welcome",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "" + widget.insertedName,
              style: Theme.of(context).textTheme.headline2,
            )
          ],
        ))
      ],
    );
  }

  Widget _buildUserButton(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: CustomButton(
          text: Text("Choose a User"),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => ListUser()));
          },
          style: ButtonStyle(
              shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),
        ));
  }
}
