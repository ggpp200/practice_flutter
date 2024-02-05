import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateList extends StatefulWidget {
  const DateList({super.key});

  @override
  State<DateList> createState() => _DateListState();
}

//내역리스트에 들어갈 날짜 상자
class _DateListState extends State<DateList> {
  int data = 0000;
  @override
  Widget build(BuildContext context) {
    return Container(padding: const EdgeInsets.all(10), child: Text(getDate()));
  }
}

//내역 리스트
class PaymentList extends StatelessWidget {
  const PaymentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.blue,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Image.asset('assets/graph.png'), Text(getDate())]),
    );
  }
}

String getDate() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}
