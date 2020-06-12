class Utils{
  static const String subFolder = "/apis";
//  static const String baseUrl = "http://192.168.0.102/market_app_backend$subFolder";
  static const String baseUrl = "http://web.dedeveloperz.com/market$subFolder";

  static const String getProducts = "$baseUrl/get_products.php";
  static const String getVegetables = "$baseUrl/get_vegetables.php";
  static const String uploadVeggie = "$baseUrl/upload_veggie.php";
  static const String login = "$baseUrl/login.php";
  static const String order = "$baseUrl/order.php";
  static const String getOrders = "$baseUrl/get_orders.php";
  static const String orderCompleted = "$baseUrl/order_completed.php";
  static const String orderItemCompleted = "$baseUrl/order_item_completed.php";
  static const String getOrderItems = "$baseUrl/get_order_items.php";
}