import 'package:restapi_mobile/app/models/products.dart';
import 'package:vania/vania.dart';

class ProductsController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final produk = request.input();

      await Products().query().insert(produk);

      return Response.json({
        "message": "Data penjual berhasil diinput",
        "data": produk,
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
      final barang = await Products().query().get();

      return Response.json({
        "message": "Item",
        "data": barang,
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
      final vid = body['vend_id'];
      final name = body['prod_name'];
      final price = body['prod_price'];
      final desc = body['prod_desc'];

      final result = await Products().query().where('prod_id', '=', id).update({
        "vend_id": vid,
        "prod_name": name,
        "prod_price": price,
        "prod_desc": desc,
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
      await Products().query().where('prod_id', '=', id).delete();

      return Response.json({'message': 'data terhapus'});
    } catch (e) {
      return Response.json(
          {'message': 'data gagal terhapus', 'error': e.toString()});
    }
  }
}

final ProductsController productsController = ProductsController();
