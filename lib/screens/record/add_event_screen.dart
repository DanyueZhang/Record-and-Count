import 'package:flutter/material.dart';
import 'package:emoji_dialog_picker/emoji_dialog_picker.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

import '../../providers/event_provider.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({Key? key}) : super(key: key);

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final _formKey = GlobalKey<FormState>();

  String _emoji = '📝';
  String _content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Event'),
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
                      'Pick an Emoji for Event',
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
                  decoration: const InputDecoration(hintText: 'Event Name'),
                  initialValue: _content,
                  onChanged: (val) {
                    setState(() {
                      _content = val;
                    });
                  },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter event name';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await Provider.of<EventProvider>(context, listen: false)
                          .addEvent(_emoji, _content);

                      if (!mounted) return;
                      Navigator.of(context).pop();
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.scale,
                        title: 'Warning',
                        desc: 'Please enter event name',
                        btnOkOnPress: () {},
                      ).show();
                    }
                  },
                  child: const Text(
                    'Add Event',
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
