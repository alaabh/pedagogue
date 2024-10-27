import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/calendar/event_creation/coaching_subview.dart';
import 'package:pedagogue/feature/home/tabs/calendar/event_creation/matches_subview.dart';
import 'package:pedagogue/feature/home/tabs/calendar/event_creation/meeting_subview.dart';
import 'package:pedagogue/shared/style/app_color.dart';

import '../../../../../l10n/localization.dart';
import '../../../../../shared/style/dimensions.dart';
import '../../../../../shared/widget/custom_button.dart';

class EventCreationView extends StatefulWidget {
  final DateTime dateTime;
  final Function loadDataFunction;

  const EventCreationView({
    super.key,
    required this.dateTime,
    required this.loadDataFunction,
  });

  @override
  State<EventCreationView> createState() => _EventCreationViewState();
}

class _EventCreationViewState extends State<EventCreationView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final GlobalKey<CoachingSubviewState> coachingSubviewKey =
      GlobalKey<CoachingSubviewState>();

  final GlobalKey<MatchesSubviewState> matchesSubviewKey =
      GlobalKey<MatchesSubviewState>();

  final GlobalKey<MeetingSubviewState> meetingSubviewKey =
      GlobalKey<MeetingSubviewState>();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          intl.addNew(intl.event),
          style: TextStyle(color: AppColors.accentColor),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: Dimensions.paddingMediumHorizontal,
            child: TabBar(
              controller: _tabController,
              splashBorderRadius: Dimensions.mediumBorderRadius,
              padding: Dimensions.paddingSmall,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              indicator: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: Dimensions.mediumBorderRadius,
              ),
              indicatorPadding: Dimensions.paddingSmallVertical,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: intl.coaching),
                Tab(text: intl.matches),
                Tab(text: intl.meeting),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                CoachingSubview(
                  key: coachingSubviewKey,
                  loadDataFunction: widget.loadDataFunction,
                ),
                MatchesSubview(
                  key: matchesSubviewKey,
                  loadDataFunction: widget.loadDataFunction,
                ),
                MeetingSubview(
                  key: meetingSubviewKey,
                  loadDataFunction: widget.loadDataFunction,
                ),
              ],
            ),
          ),
          _buildSubmitButton(
            coachingSubviewKey,
            matchesSubviewKey,
            meetingSubviewKey,
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(
    GlobalKey<CoachingSubviewState> coachingSubviewKey,
    GlobalKey<MatchesSubviewState> matchesSubviewKey,
    GlobalKey<MeetingSubviewState> meetingSubviewKey,
  ) {
    return Container(
      width: double.infinity,
      padding: Dimensions.paddingExtraLarge,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          )
        ],
      ),
      child: CustomButton(
        text: intl.create,
        onPressed: () {
          switch (_tabController.index) {
            case 0:
              coachingSubviewKey.currentState?.submit(widget.dateTime);
              break;
            case 1:
              matchesSubviewKey.currentState?.submit(widget.dateTime);
              break;
            case 2:
              meetingSubviewKey.currentState?.submit(widget.dateTime);
              break;
          }
        },
      ),
    );
  }
}
