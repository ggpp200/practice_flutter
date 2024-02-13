import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
// import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:project/widgets/payment_test.dart';
import 'package:project/utils/http_request.dart';

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
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 5),
          color: const Color.fromRGBO(205, 255, 201, 1),
        ),
        padding: const EdgeInsets.all(10),
        child: Text(getDate(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            )));
  }
}

//내역 리스트
class PaymentList extends StatefulWidget {
  const PaymentList({super.key});

  @override
  State<PaymentList> createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  late Future<List<Info>> futureInfo;

  @override
  void initState() {
    super.initState();
    futureInfo = fetchInfo();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Info>>(
      future: futureInfo,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildList(snapshot.data);
        } else if (snapshot.hasError) {
          debugPrint('list error');
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        debugPrint('list fail');
        return const CircularProgressIndicator();
      },
    );
  }

  Widget buildList(snapshotList) {
    return ListView.builder(
        itemCount: snapshotList.length,
        itemBuilder: (context, index) {
          debugPrint(snapshotList);
          return;
          // return Container(
          //   decoration: BoxDecoration(
          //     border: Border.all(color: Colors.black, width: 5),
          //   ),
          //   padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          //   child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Row(children: [
          //           const Icon(Icons.paid),
          //           Text(
          //             snapshotList.data![index].word,
          //             style: const TextStyle(fontSize: 20, height: 1),
          //           )
          //         ]),
          //         Text(snapshotList.data![index].createdAt)
          //       ]),
          // );
        });
  }
}

String getDate() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('MM월 dd일');
  return formatter.format(now);
}

//infinity scroll
class PostsList {
  late final List<PayContent> posts;

  PostsList({required this.posts});

  factory PostsList.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['content'] as List;

    List<PayContent> postList =
        list.map((i) => PayContent.fromJson(i)).toList();

    return PostsList(posts: postList);
  }
}

class PayContent {
  final String? title;
  final String? price;

  PayContent({required this.title, required this.price});

  factory PayContent.fromJson(Map<String, dynamic> json) {
    PayContent pay =
        PayContent(title: payTest[1]["title"], price: payTest[1]["price"]);
    return pay;
  }
}
