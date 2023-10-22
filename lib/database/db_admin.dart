import 'dart:io';
import 'package:myflutterapp/model/model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin{
  Database? _myDatabase;

  // Singleton
  static final DBAdmin _instance = DBAdmin._();
  DBAdmin._();
  factory DBAdmin() {
    return _instance;
  }

  Future<Database?> _checkDatabase() async {
    if (_myDatabase == null) {
      _myDatabase = await _initDataBase();
    }
    return _myDatabase;
  }

  Future<Database> _initDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String pathDataBase = join(directory.path, "DBBooks.db");
    return await openDatabase(
      pathDataBase,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT , title TEXT, author TEXT, description TEXT, image TEXT)"
        );
      }
    );
  }
  // CRUD
  
  // 1. READ
  getBooks() async {
    Database? db = await _checkDatabase();
    List<Map<String, dynamic>> data = await db!.query(
      "BOOK",
      orderBy: "id DESC",
    );
    List<BookModel> books = data.map((e) => BookModel.fromJson(e)).toList();
    return books;
  }

  // 2. CREATE

  Future<int> insertBook(BookModel model) async {
    Database? db = await _checkDatabase();
    int value = await db!.insert(
      "BOOK",
      model.toJson(),
    );
    return value;
  }

  // 3. UPDATE

  Future<int> updateBook(BookModel model) async {
    Database? db = await _checkDatabase();
    int value = await db!.update(
      "BOOK",
      model.toJson(),
      where: "id = ${model.id}",
    );
    return value;
  }


  // 4. DELETE

  Future<int> deleteBook(int idBook) async {
    Database? db = await _checkDatabase();
    int value = await db!.delete(
      "Book",
      where: "id = $idBook",
    );
    return value;
  }


  Future<BookModel?> searchBook(String searchTerm) async {
    List<BookModel> books = await getBooks(); // Supposons que getBooks() renvoie la liste complète des livres

    // Parcourir la liste de livres et vérifier si le titre ou l'auteur correspond au terme de recherche
    for (BookModel book in books) {
      if (book.title.toLowerCase() == searchTerm.toLowerCase() ||
          book.author.toLowerCase() == searchTerm.toLowerCase()) {
        return book; // Renvoyer le livre correspondant trouvé
      }
    }

    return null;
  }

}