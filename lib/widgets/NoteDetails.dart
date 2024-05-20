import 'package:flutter/material.dart';

class NoteDetails extends StatefulWidget {
  // Property declaration
  final String appBarTitle;

  // Constructor
  NoteDetails(this.appBarTitle);

  // Overrides the createState method inherited from StatefulWidget to
  // create an instance of NoteDetailsState and pass the appBarTitle to it.
  @override
  State<NoteDetails> createState() => NoteDetailsState(appBarTitle);
}

// Defines a class named NoteDetailsState that extends State<NoteDetails>,
// indicating that it's the mutable state for the NoteDetails widget.
class NoteDetailsState extends State<NoteDetails> {
  // Defining dropdown items
  static var _severityDropdownItem = ["High", "Low"];
  String selectedValue = _severityDropdownItem[1];

  // Property declaration within the NoteDetailsState
  final String appBarTitle;

  // Creates instances of TextEditingController to control the
  // text fields for the title and description.
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  // Constructor for the NoteDetailsState class
  NoteDetailsState(this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.titleMedium;
    return WillPopScope(
        onWillPop: () async {
          debugPrint("WillPop function triggered");
          moveToPreviousScreen();
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  moveToPreviousScreen();
                }),
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
                    onChanged: (String? valueSelectedByUser) {
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
                    onChanged: (String value) {
                      debugPrint('Title value has changed: $value');
                    },
                    decoration: InputDecoration(
                      labelText: 'Title',
                      hintText: 'Enter the title',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                // Third Element
                Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    controller: _descriptionController,
                    style: textStyle,
                    onChanged: (String value) {
                      debugPrint('Description value has changed: $value');
                    },
                    decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Enter the description',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
                          child: Text("Save"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            debugPrint("Delete button clicked");
                          },
                          child: Text("Delete"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void moveToPreviousScreen() {
    Navigator.of(context).pop();
  }
}
