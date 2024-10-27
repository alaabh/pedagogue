import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/drawer_widget.dart';
import 'package:pedagogue/feature/home/settings/settings_view.dart';
import 'package:pedagogue/feature/home/tab_item.dart';
import 'package:pedagogue/feature/home/tabs/calendar/calendar_view.dart';
import 'package:pedagogue/feature/home/tabs/chat/chat_provider.dart';
import 'package:pedagogue/feature/home/tabs/chat/conversation_list_view.dart';
import 'package:pedagogue/feature/home/tabs/home/home_view.dart';
import 'package:pedagogue/feature/home/tabs/matches/matches_view.dart';
import 'package:provider/provider.dart';

import '../../../l10n/localization.dart';
import '../document/ListeOfDocument.dart';
import 'bottom_navigation_bar_widget.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => MainPageViewState();
}

class MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  late List<TabItem> tabItems;
  bool listenerCreated = false;

  @override
  void initState() {
    super.initState();

    tabItems = [
      TabItem(
        iconData: "assets/home.png",
        content: HomeView(),
      ),
      TabItem(
        iconData: "assets/history.png",
        content: ListofHistory(),
      ),
      TabItem(
        iconData: "assets/match.png",
        content: const MatchesView(),
      ),
      TabItem(
        iconData: "assets/calender.png",
        content: const CalendarView(),
      ),
      TabItem(
        iconData: "assets/chat.png",
        content: Builder(
          builder: (context) => Provider(
            create: (_) => ChatProvider(
              FirebaseFirestore.instance,
              FirebaseStorage.instance,
            ),
            child: const ConversationListView(),
          ),
        ),
      ),
    ];

    _tabController = TabController(
      length: tabItems.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> tabTitles = [
      intl.home,
      intl.document,
      intl.matches,
      intl.calendar,
      intl.chat,
    ];

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SizedBox(
                width: MediaQuery.of(context).size.width * 0.08,
                child: Image.asset(
                  "assets/list.png",
                ),
              ), // Change this icon to whatever you prefer
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: StatefulBuilder(
          builder: (context, setState) {
            if (!listenerCreated) {
              listenerCreated = true;
              _tabController.addListener(() => setState(() {}));
            }
            return Text(tabTitles[_tabController.index]);
          },
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SettingsView()),
            ),
            icon: Image.asset(
              "assets/gear.png",
              width: MediaQuery.of(context).size.width * 0.08,
            ),
          ),
        ],
      ),
      drawer: const DrawerWidget(),
      body: TabBarView(
        controller: _tabController,
        children: tabItems
            .map((item) => item.content)
            .toList(), // Disable swiping between tabs
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        controller: _tabController,
        tabTitles: tabTitles,
        tabItems: tabItems,
      ),
    );
  }
}
