import 'package:flutter/material.dart';

import 'package:konquer_club/widgets/all_fighter_list.dart';
import 'package:konquer_club/widgets/matches_list.dart';
import 'package:konquer_club/widgets/unmatched_fighter_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }

}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(1);
  }

  static const List<Tab> _tabs = [
    Tab( text: 'Unmatched'),
    Tab( text: 'Matches'),
    Tab( text: 'All'),
  ];

  static const List<Widget> _views = [
     UnmatchedFighterList(),
     MatchList(),
     AllFighterList(),
  ];

  @override
  Widget build(BuildContext context) {
    //final _data =  ref.watch(boutsProvider);
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Konquer Club'),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            overlayColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.blue;
              } if (states.contains(MaterialState.focused)) {
                return Colors.orange;
              } else if (states.contains(MaterialState.hovered)) {
                return Colors.pinkAccent;
              }

              return Colors.transparent;
            }),
            indicatorWeight: 10,
            indicatorColor: Colors.red,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: const EdgeInsets.all(5),
            indicator: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(10),
              color: Colors.pinkAccent,
            ),
            isScrollable: true,
            physics: const BouncingScrollPhysics(),
            onTap: (int index) {

            },
            enableFeedback: true,
            controller: _tabController,
            tabs: _tabs,
          ),

        ),
        body:  TabBarView(
          physics: const BouncingScrollPhysics(),
           controller: _tabController,
          children: _views,
        ),
      ),
    );
  }

}

