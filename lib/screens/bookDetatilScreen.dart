
import 'package:flutter/material.dart';
import 'package:myflutterapp/database/db_admin.dart';
import 'package:myflutterapp/modal/form_book_modal.dart';
import 'package:myflutterapp/model/book_model.dart';
import 'package:myflutterapp/widgets/itemSearchWidget.dart';
import 'package:path/path.dart';

class BookDetailsScreen extends StatelessWidget {
  final BookModel book;

  const BookDetailsScreen({required this.book});

  void onDelete() {

  }


  void onUpdate() {
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Book Details From Search'),
      ),
      body:ItemSearchWidget(
              book: book,
              onDelete: onDelete,
              onUpdate: onUpdate,
            ),


    );
  }
}

