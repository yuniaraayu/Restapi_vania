import 'dart:io';
import 'package:vania/vania.dart';
import 'create_users_table.dart';
import 'admin.dart';
import 'personal_access_tokens.dart';
import 'todos.dart';

void main(List<String> args) async {
  await MigrationConnection().setup();
  if (args.isNotEmpty && args.first.toLowerCase() == "migrate:fresh") {
    await Migrate().dropTables();
  } else {
    await Migrate().registry();
  }
  await MigrationConnection().closeConnection();
  exit(0);
}

class Migrate {
  registry() async {
		 await CreateUserTable().up();
		 await Admin().up();
		 await PersonalAccessTokens().up();
		 await Todos().up();
	}

  dropTables() async {
		 await Todos().down();
		 await PersonalAccessTokens().down();
		 await Admin().down();
		 await CreateUserTable().down();
	 }
}
