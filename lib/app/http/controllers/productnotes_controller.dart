import 'package:restapi_mobile/app/models/productnotes.dart';
import 'package:vania/vania.dart';

class ProductnotesController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create(Request request) async {
    try {
      final catatanproduk = request.input();

      await Productnotes().query().insert(catatanproduk);

      return Response.json({
        "message": "produk bagus",
        "data": catatanproduk,
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
      final catatanproduk = await Productnotes().query().get();

      return Response.json({
        "message": "produk bagus",
        "data": catatanproduk,
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
      final pid = body['prod_id'];
      final notedate = body['note_date'];
      final notetext = body['note_text'];

      final result = await Productnotes()
          .query()
          .where('note_id', '=', id)
          .update(
              {"prod_id": pid, "note_date": notedate, "note_text": notetext});

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

  Future<Response> destroy(int id) async {
    try {
      await Productnotes().query().where('prod_id', '=', id).delete();

      return Response.json({'message': 'data terhapus'});
    } catch (e) {
      return Response.json(
          {'message': 'data gagal terhapus', 'error': e.toString()});
    }
  }
}

final ProductnotesController productnotesController = ProductnotesController();
