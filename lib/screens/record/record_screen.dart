import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_and_count/providers/event_provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../widgets/record_swipe_action_cell.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({Key? key}) : super(key: key);

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  Widget build(BuildContext context) {
    _focusedDay = Provider.of<EventProvider>(context, listen: false).dateTime;
    _selectedDay = Provider.of<EventProvider>(context, listen: false).dateTime;

    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar(
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });

              Provider.of<EventProvider>(context, listen: false)
                  .changeDateTime(selectedDay);
            },
          ),
          const Divider(height: 30),
          Consumer<EventProvider>(
            child: Text(
              'No events today',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 24,
              ),
            ),
            builder: (context, eventProvider, child) {
              final todayEvents = eventProvider.events
                  .where((event) => isSameDay(event.dateTime, _selectedDay))
                  .toList();

              return todayEvents.isEmpty
                  ? child!
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: todayEvents.length,
                      itemBuilder: (context, index) {
                        return RecordSwipeActionCell(event: todayEvents[index]);
                      },
                    );
            },
          ),
        ],
      ),
    );
  }
}
