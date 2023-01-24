import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:provider/provider.dart';
import 'package:record_and_count/models/event.dart';
import 'package:record_and_count/screens/record/update_event_screen.dart';
import 'package:record_and_count/widgets/swipe_action_cell_button.dart';

import '../providers/event_provider.dart';

class RecordSwipeActionCell extends StatelessWidget {
  final Event event;

  const RecordSwipeActionCell({required this.event, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwipeActionCell(
      key: ValueKey(event),
      trailingActions: [
        SwipeAction(
          onTap: (handler) async {
            await Provider.of<EventProvider>(context, listen: false)
                .deleteEvent(event.id);
          },
          color: Colors.transparent,
          content: const SwipeActionCellButton(
            color: Colors.red,
            icon: Icons.delete,
          ),
          nestedAction: SwipeNestedAction(
            /// customize your nested action content
            content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              width: 130,
              height: 60,
              child: OverflowBox(
                maxWidth: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Text('Delete?',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
        ),
        SwipeAction(
          onTap: (handler) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UpdateEventScreen(event: event),
              ),
            );
          },
          color: Colors.transparent,
          content: const SwipeActionCellButton(
            color: Colors.grey,
            icon: Icons.edit,
          ),
        ),
      ],
      child: Card(
        child: ListTile(
          leading: Text(
            event.emoji,
            style: const TextStyle(fontSize: 24),
          ),
          title: Text(
            event.content,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
