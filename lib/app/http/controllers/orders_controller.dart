import 'package:restapi_mobile/app/models/orders.dart';
import 'package:vania/vania.dart';

class OrdersController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final pesan = request.input();

      await Orders().query().insert(pesan);

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
      final pesan = await Orders().query().get();

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

  Future<Response> update(Request request, int num) async {
    try {
      final body = await request.input();
      final ordernum = body['order_num'];
      final orderdate = body['order_date'];
      final custid = body['cust_id'];

      final result = await Orders().query().where('order_num', '=', num).update(
          {"order_num": ordernum, "order_date": orderdate, "cust_id": custid});

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
      await Orders().query().where('order_num', '=', num).delete();

      return Response.json({'message': 'data terhapus'});
    } catch (e) {
      return Response.json(
          {'message': 'data gagal terhapus', 'error': e.toString()});
    }
  }
}

final OrdersController ordersController = OrdersController();
