import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  const NoteDetails({Key? key}) : super(key: key);

  @override
  State<NoteDetails> createState() => NoteDetailsState();
}

class NoteDetailsState extends State<NoteDetails> {
  // Defining dropdown items
  static var _severityDropdownItem = ["High", "Low"];
  String selectedValue = _severityDropdownItem[1];

  // Defining controllers
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit note'),
        backgroundColor: Color(0xFFFBC103),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            // First Element
            ListTile(
              title: DropdownButton<String>(
                value: selectedValue,
                items: _severityDropdownItem.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                style: textStyle,
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    selectedValue = valueSelectedByUser!;
                  });
                },
              ),
            ),
            // Second Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _titleController,
                style: textStyle,
                onChanged: (ValueChanged) {
                  debugPrint('Title value has changed');
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter the title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                keyboardType: TextInputType.text,
              ),
            ),
            // Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: _descriptionController,
                style: textStyle,
                onChanged: (ValueChanged) {
                  debugPrint('Description value has changed');
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter the description',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            // Fourth Element
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            debugPrint("Save button clicked");
                          },
                          child: Text("Save", textScaleFactor: 1.0),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white)),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () {
                            debugPrint("Delete button clicked");
                          },
                          child: Text("Delete", textScaleFactor: 1.0),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white)),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
