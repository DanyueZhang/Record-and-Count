import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:provider/provider.dart';
import 'package:record_and_count/providers/counter_provider.dart';
import 'package:record_and_count/screens/count/update_counter_screen.dart';

import '../../widgets/swipe_action_cell_button.dart';

class CountScreen extends StatelessWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'No counters',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 24,
          ),
        ),
      ),
      builder: (context, counterProvider, child) {
        final counters = counterProvider.counters;

        return counters.isEmpty
            ? child!
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: counters.length,
                  itemBuilder: (context, index) {
                    final counter = counters[index];

                    return SwipeActionCell(
                      key: ValueKey(counter),
                      trailingActions: [
                        SwipeAction(
                          onTap: (handler) async {
                            await Provider.of<CounterProvider>(context, listen: false).deleteCounters(counter.id);
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
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
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
                                builder: (_) => UpdateCounterScreen(counter: counter),
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
                            counter.emoji,
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(
                            counter.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          trailing: FittedBox(
                            child: Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    await Provider.of<CounterProvider>(context, listen: false).decreaseCount(counter);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    fixedSize: const Size(15, 15),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    '-',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                                Text(
                                  counter.count.toString(),
                                  style: const TextStyle(fontSize: 24),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await Provider.of<CounterProvider>(context, listen: false).increaseCount(counter);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    fixedSize: const Size(15, 15),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Text(
                                    '+',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
