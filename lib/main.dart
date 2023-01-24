import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:record_and_count/models/event.dart';
import 'package:record_and_count/providers/counter_provider.dart';
import 'package:record_and_count/providers/event_provider.dart';
import 'package:record_and_count/screens/count/add_counter_screen.dart';
import 'package:record_and_count/screens/count/count_screen.dart';
import 'package:record_and_count/screens/record/add_event_screen.dart';
import 'package:record_and_count/screens/record/record_screen.dart';
import 'package:provider/provider.dart';
import 'package:record_and_count/widgets/loading.dart';
import 'package:search_page/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EventProvider()),
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Record&Count',
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[200]!,
                width: 2.0,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.lightBlue,
                width: 2.0,
              ),
            ),
          ),
          dividerTheme: const DividerThemeData().copyWith(
            thickness: 0.5,
            endIndent: 20,
            indent: 20,
          ),
        ),
        home: const Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);
  
  Future<void> initProviders(BuildContext context) async {
    Provider.of<EventProvider>(context, listen: false).getEvents();
    Provider.of<CounterProvider>(context, listen: false).getCounters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initProviders(context),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
            ? const Loading()
            : const HomePage();
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? 'Record' : 'Count'),
        actions: [
          _selectedIndex == 0
              ? IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchPage<Event>(
                          searchLabel: 'Search event',
                          suggestion: const Center(
                            child: Text(
                              'Filter event by content',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.grey),
                            ),
                          ),
                          failure: const Center(
                            child: Text(
                              'No event found :(',
                              style:
                              TextStyle(fontSize: 24, color: Colors.grey),
                            ),
                          ),
                          builder: (event) => Card(
                                child: ListTile(
                                  leading: Text(
                                    event.emoji,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  title: Text(
                                    event.content,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  trailing: Text(
                                    DateFormat('yyyy-MM-dd')
                                        .format(event.dateTime)
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ),
                              ),
                          filter: (event) => [event.content],
                          items:
                              Provider.of<EventProvider>(context, listen: false)
                                  .events),
                    );
                  },
                  icon: const Icon(Icons.search),
                  tooltip: 'Search Event',
                )
              : Container(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => _selectedIndex == 0
                      ? const AddEventScreen()
                      : const AddCounterScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
            tooltip: _selectedIndex == 0 ? 'Add Event' : 'Add Counter',
          ),
        ],
      ),
      body: _selectedIndex == 0 ? const RecordScreen() : const CountScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Record',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exposure),
            label: 'Count',
          ),
        ],
      ),
    );
  }
}
