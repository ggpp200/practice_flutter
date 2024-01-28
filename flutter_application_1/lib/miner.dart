import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("테스트 화면입니다.")),
      body: Text('안녕'),
      bottomNavigationBar: BottomAppBar(child: Text(" 하단바")),
    );
  }
}
