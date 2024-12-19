import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class Todos extends Model {
  Todos() {
    MySqlConnection.connect;
    super.table('todos');
  }
}
