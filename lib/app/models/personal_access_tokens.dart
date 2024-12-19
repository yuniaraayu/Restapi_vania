import 'package:mysql1/mysql1.dart';
import 'package:vania/vania.dart';

class PersonalAccessTokens extends Model {
  PersonalAccessTokens() {
    MySqlConnection.connect;
    super.table('personal_access_tokens');
  }
}
