// void main() async {
//   // نفس الحوار برضه برينت هتشتغل علي طول
//   // فلازم اخليها ايسينك اوييت علشان تستني شويه
//   print(await createOrderMessage());
// }

// // طالما دي بتستخدم جواها فانكشن بتاخد فلازم استعمل الايسينك اوايت
// // علشان ارجع سترينج مش فيوتشر سترينج
// createOrderMessage() async {
//   String order = await fetchUserOrder();
//   return "Your order is: $order";
// }

// dynamic fetchUserOrder() {
//   Future.delayed(Duration(seconds: 2), () => "Large Latte");
// }
