import 'package:vania/vania.dart';

class Admin extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('admin', () {
      id();
      string('name', length: 100);
      string('email', length: 191);
      string('password', length: 200);
      dateTime('created_at', nullable: true);
      dateTime('updated_at', nullable: true);
      dateTime('deleted_at', nullable: true);
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('admin');
  }
}
