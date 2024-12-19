import 'package:restapi_mobile/app/models/todos.dart';
import 'package:vania/vania.dart';

class TodosController extends Controller {
  Future<Response> index() async {
    return Response.json({'message': 'Hello World'});
  }

  Future<Response> create() async {
    return Response.json({});
  }

  Future<Response> store(Request request) async {
    request.validate({
      'title': 'required',
      'description': 'required',
    }, {
      'title.required': "judul todo wajib diisi",
      'description.required': 'Deskripsi todo wajib diisi',
    });

    Map<String, dynamic> data = request.all();
    Map<String, dynamic>? user = Auth().user();

    if (user != null) {
      var todo = await Todos().query().create({
        'user_id': Auth().id(),
        'title': data['title'],
        'description': data['description'],
      });

      return Response.json({
        'status': 'success',
        'message': "todo berhasil dibuat",
        'data': todo,
      }, 201);
    } else {
      return Response.json(
          {'status': 'error', 'message': 'pengguna tidak terautentikasi'}, 401);
    }
  }

  Future<Response> show(int id) async {
    return Response.json({});
  }

  Future<Response> edit(int id) async {
    return Response.json({});
  }

  Future<Response> update(Request request, int id) async {
    return Response.json({});
  }

  Future<Response> destroy(int id) async {
    return Response.json({});
  }
}

final TodosController todosController = TodosController();
