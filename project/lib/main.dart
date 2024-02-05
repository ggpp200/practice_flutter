import 'package:flutter/material.dart';
import 'package:project/widgets/payment_list.dart';
import 'package:project/utils/kakao_certification.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:project/utils/keys.dart';

void main() {
  debugPrint(myKeys['nativeAppKey']);
  kakaoInit();
  runApp(const MyApp());
}

// 앱 실행 (상태관리도)
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

//(마이앱을 상속받아 기본구성하는 틀)
class _MyAppState extends State<MyApp> {
  int selectedPage = 0;
  final _pageList = [const HomePage(), const NewPage(), const CalendarPage()];

  void _changePage(idx) {
    setState(() {
      selectedPage = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(home: Center(child: Image.asset('assets/test.png')));
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('start'),
        ),
        body: _pageList[selectedPage],
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                tooltip: 'Open popup menu',
                icon: const Icon(Icons.event_note),
                onPressed: () {
                  _changePage(0);
                },
              ),
              IconButton(
                tooltip: 'Search',
                icon: const Icon(Icons.query_stats),
                onPressed: () {
                  _changePage(1);
                },
              ),
              Container(
                height: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 3)),
                child: const Text('asdf'),
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  _changePage(2);
                },
              ),
              IconButton(
                tooltip: 'Favorite',
                icon: const Icon(Icons.person),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//첫 홈화면 (아이콘 및 앱이름)
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset('assets/mainIcon.png'),
          const Text(
            "새싹 가계부",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}

// (내역 페이지)
class NewPage extends StatelessWidget {
  const NewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: const Column(
          children: [DateList(), PaymentList()],
        ));
  }
}

// (달력 페이지)
class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
    );
  }
}
