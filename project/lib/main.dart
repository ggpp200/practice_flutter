import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
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
  final _pageList = [const HomePage(), const NewPage()];

  void _changePage() {
    setState(() {
      if (selectedPage == 0) {
        selectedPage = 1;
      } else {
        selectedPage = 0;
        print(selectedPage);
      }
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
      bottomNavigationBar: Navigation(
        changePage: _changePage,
      ),
    ));
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
    return Center(
      child: Column(
        children: [
          Image.asset('assets/mainIcon.png'),
          const Text(
            "가계부 새쌋",
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
    );
  }
}

// 내비게이션 상태
class Navigation extends StatefulWidget {
  const Navigation({super.key, required changePage});

  final Function() changePage;

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
            tooltip: 'Open popup menu',
            icon: const Icon(Icons.event_note),
            onPressed: () {
              widget.changePage();
            },
          ),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.query_stats),
            onPressed: () {
              widget.changePage();
            },
          ),
          Container(
            height: double.infinity,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
            child: const Text('asdf'),
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.calendar_month),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
