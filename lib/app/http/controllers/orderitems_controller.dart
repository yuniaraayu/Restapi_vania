import 'package:restapi_mobile/app/models/orderitems.dart';
import 'package:vania/vania.dart';

class OrderitemsController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final pesan = request.input();

      await Orderitems().query().insert(pesan);

      return Response.json({
        "message": "Data pesanan berhasil diinput",
        "data": pesan,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "server tidak berfungsi, silahkan coba kembali",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> store(Request request) async {
    return Response.json({});
  }

  Future<Response> show(Request request) async {
    try {
      final pesan = await Orderitems().query().get();

      return Response.json({"message": "users", "data": pesan}, 201);
    } catch (e) {
      return Response.json({
        "message": "Gagal memuat data, silahkan coba kembali",
        "error": e.toString()
      }, 500);
    }
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int orderitems) async {
    try {
      final body = await request.input();
      final orderitems = body['order_item'];
      final ordernum = body['order_num'];
      final podid = body['prod_id'];
      final qty = body['quantity'];
      final size = body['size'];

      final result =
          await Orderitems().query().where('order_item', '=', int).update({
        "order_item": orderitems,
        "order_num": ordernum,
        "prod_id": podid,
        "quantity": qty,
        "size": size
      });

      if (result > 0) {
        return Response.json(
          {
            'message': 'Berhasil diperbarui',
            'updated_num': num,
          },
          200,
        );
      } else {
        return Response.json(
          {'message': 'data tidak berubah'},
          404,
        );
      }
    } catch (e) {
      return Response.json({
        'message': 'ada kesalahan update',
        'error': e.toString(),
      }, 500);
    }
  }

  Future<Response> destroy(int id) async {
    try {
      await Orderitems().query().where('order_num', '=', num).delete();

      return Response.json({'message': 'data terhapus'});
    } catch (e) {
      return Response.json(
          {'message': 'data gagal terhapus', 'error': e.toString()});
    }
  }
}

final OrderitemsController orderitemsController = OrderitemsController();
