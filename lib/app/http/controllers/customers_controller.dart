import 'package:vania/vania.dart';
import 'package:restapi_mobile/app/models/customers.dart';

class Customers extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final pelanggan = request.input();

      await Customer().query().insert(pelanggan);

      return Response.json({
        "message": "Data pelanggan berhasil diinput",
        "data": pelanggan,
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
      final pelanggan = await Customer().query().get();

      return Response.json({
        "message": "users",
        "data": pelanggan,
      }, 201);
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

  Future<Response> update(Request request, int id) async {
    try {
      final body = await request.input();
      final name = body['cust_name'];
      final address = body['cust_address'];
      final city = body['cust_city'];
      final state = body['cust_state'];
      final zip = body['cust_zip'];
      final country = body['cust_country'];
      final telp = body['cust_telp'];

      final result = await Customer().query().where('cust_id', '=', id).update({
        "cust_name": name,
        "cust_address": address,
        "cust_city": city,
        "cust_state": state,
        "cust_zip": zip,
        "cust_country": country,
        "cust_telp": telp
      });

      if (result > 0) {
        return Response.json(
          {
            'message': 'Berhasil diperbarui',
            'updated_id': id,
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

  Future<Response> destroy(Request request, int id) async {
    try {
      await Customer().query().where('cust_id', '=', id).delete();

      return Response.json({'message': 'data terhapus'});
    } catch (e) {
      return Response.json(
          {'message': 'data gagal terhapus', 'error': e.toString()});
    }
  }
}

final Customers customers = Customers();
