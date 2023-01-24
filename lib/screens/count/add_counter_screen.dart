import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:emoji_dialog_picker/emoji_dialog_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:record_and_count/providers/counter_provider.dart';

class AddCounterScreen extends StatefulWidget {
  const AddCounterScreen({Key? key}) : super(key: key);

  @override
  State<AddCounterScreen> createState() => _AddCounterScreenState();
}

class _AddCounterScreenState extends State<AddCounterScreen> {
  final _formKey = GlobalKey<FormState>();

  String _emoji = '🧮';
  String _name = '';
  String _count = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Counter'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Pick an Emoji for Counter',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    EmojiButton(
                      emojiPickerView: EmojiPickerView(
                        onEmojiSelected: (String emoji) {
                          setState(() {
                            _emoji = emoji;
                          });
                        },
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          _emoji,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Counter Name'),
                  initialValue: _name,
                  onChanged: (val) {
                    setState(() {
                      _name = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter counter name';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: 'Count Value'),
                  initialValue: _count,
                  onChanged: (val) {
                    setState(() {
                      _count = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter count value';
                    } else if (int.parse(val) < 0) {
                      return 'Please enter count value >= 0';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<CounterProvider>(context, listen: false)
                          .addCounter(_emoji, _name, int.parse(_count));

                      if (!mounted) return;
                      Navigator.of(context).pop();
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Warning',
                        desc: 'Please enter event name and count value >= 0',
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                  child: const Text(
                    'Add Counter',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
