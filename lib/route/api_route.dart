import 'package:restapi_mobile/app/http/controllers/admin_controller.dart';
import 'package:restapi_mobile/app/http/controllers/auth_controller.dart';
import 'package:restapi_mobile/app/http/controllers/customers_controller.dart';
import 'package:restapi_mobile/app/http/controllers/todos_controller.dart';
// import 'package:restapi_mobile/app/http/controllers/productnotes_controller.dart';
// import 'package:restapi_mobile/app/http/controllers/products_controller.dart';
// import 'package:restapi_mobile/app/http/controllers/vendors_controller.dart';
// import 'package:restapi_mobile/app/http/controllers/orders_controller.dart';
// import 'package:restapi_mobile/app/http/controllers/orderitems_controller.dart';
import 'package:vania/vania.dart';
import 'package:restapi_mobile/app/http/middleware/authenticate.dart';

class ApiRoute implements Route {
  @override
  void register() {
    /// Base RoutePrefix
    Router.basePrefix('api');

    Router.get("/show-cus", customers.show);
    Router.post("/create-cus", customers.create);
    Router.put("/update-cus/{id}", customers.update);
    Router.delete("/delete-cus/{id}", customers.destroy);

    //login auth
    Router.group(() {
      Router.post('register', authController.register);
      Router.post('login', authController.login);
    }, prefix: 'auth');

    Router.group(() {
      // Router.patch('update-password', adminController.updatePassword);
      Router.get('', adminController.index);
    }, prefix: 'user', middleware: [AuthenticateMiddleware()]);

    Router.group(() {
      Router.post('todo', todosController.store);
    }, prefix: 'todo', middleware: [AuthenticateMiddleware()]);

    Router.get('me', authController.me).middleware([AuthenticateMiddleware()]);

    // Router.get("/show-ven", vendorsController.show);
    // Router.post("/create-ven", vendorsController.create);
    // Router.put("/update-ven/{id}", vendorsController.update);
    // Router.delete("/delete-ven/{id}", vendorsController.destroy);

    // Router.get("/show-prod", productsController.show);
    // Router.post("/create-prod", productsController.create);
    // Router.put("/update_prod/{id}", productsController.update);
    // Router.delete("/delete_prod/{id}", productsController.destroy);

    // Router.get("/show-notesprod", productnotesController.show);
    // Router.post("/create-notesprod", productnotesController.create);
    // Router.put("/update_notesprod/{id}", productnotesController.update);
    // Router.delete("/delete_notesprod/{id}", productnotesController.destroy);

    // Router.get("/show-orders", ordersController.show);
    // Router.post("/create-order", ordersController.create);
    // Router.put("/update_order/{num}", ordersController.update);
    // Router.delete("/delete_order/{num}", ordersController.destroy);

    // Router.get("/show-orderitems", orderitemsController.show);
    // Router.post("/create-orderitems", orderitemsController.create);
    // Router.put("/update_orderitems/{num}", orderitemsController.update);
    // Router.delete("/delete_orderitems/{id}", orderitemsController.destroy);
  }
}
