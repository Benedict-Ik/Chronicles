import 'package:chronicles/widgets/NoteDetails.dart';
import 'package:flutter/material.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  State<NoteList> createState() => NoteListState();
}

class NoteListState extends State<NoteList> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFBC103),
        title: Text("My Notes"),
      ),
      body: getNoteListView(),

      // Adding FAB
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("FAB clicked");
          // Function defined below
          navToNoteDetailsPage('Add Note');
        },
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }

  // Creating ListView function
  ListView getNoteListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.titleMedium!;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        // Creating a parent Card widget
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.yellow,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text('Title', style: titleStyle),
            subtitle: Text('Subtitle'),
            trailing: Icon(Icons.delete, color: Colors.grey),
            onTap: () {
              debugPrint("ListTile clicked");
              navToNoteDetailsPage('Edit Note');
            },
          ),
        );
      },
    );
  }

  // Function to nav to NoteDetails page
  void navToNoteDetailsPage(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NoteDetails(title);
    }));
  }
}
