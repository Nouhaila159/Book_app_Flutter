import 'package:flutter/material.dart';
import 'package:myflutterapp/model/book_model.dart';
import 'package:myflutterapp/theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSearchWidget extends StatelessWidget {
  final BookModel book;
  final Function onDelete;
  final Function onUpdate;

  const ItemSearchWidget({
    required this.book,
    required this.onDelete,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start, // Alignement horizontal des éléments
        crossAxisAlignment: CrossAxisAlignment.start, // Alignement vertical des éléments
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.network(
                book.image,
                width: 100.0,
                height: 140.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  book.author,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  book.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.black60,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuButton(
            onSelected: (int value) {
              if (value == 1) {
                onUpdate();
              } else {
                onDelete();
              }
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.edit, size: 16.0, color: AppTheme.black70),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Update",
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: AppTheme.black70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.delete_outline_rounded, size: 16.0, color: AppTheme.black70),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Delete",
                        style: GoogleFonts.poppins(
                          fontSize: 14.0,
                          color: AppTheme.black70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
