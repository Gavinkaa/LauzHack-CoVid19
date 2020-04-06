import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class APIRequests {
  static final _firestore = Firestore.instance;
  static final _auth = FirebaseAuth.instance;
  static String authUserUid;

  static Future<List<Map<String, dynamic>>>
      GET_listOfRequestsNotAccepted() async {
    // gets the list of all not accepted requests
    List<Map<String, dynamic>> listOfrequests = [];
    List<DocumentSnapshot> allDocs;
    await _firestore
        .collection('orders')
        .getDocuments()
        .then((value) => allDocs = value.documents);
    print(allDocs.length);
    for (int i = 0; i < allDocs.length; i++) {
      listOfrequests.add(allDocs[i].data);
    }
    return listOfrequests;
  }

  static Future<List<Map<String, dynamic>>> GET_listOfRequestsAccepted() async {
    // gets the list of all not accepted requests
    List<Map<String, dynamic>> listOfrequests = [];
    List<DocumentSnapshot> allDocs;
    await _firestore
        .collection('/accepted')
        .getDocuments()
        .then((value) => allDocs = value.documents);
    print(allDocs.length);
    for (int i = 0; i < allDocs.length; i++) {
      listOfrequests.add(allDocs[i].data);
    }
    return listOfrequests;
  }

  static Future<bool> POST_NewRequest(Map<String, dynamic> json) async {
    // post a new request associated to the user thats logged in saved to orders
    json.putIfAbsent(
        "contact",
        () => {
              "firstName": "Ludo",
              "lastName": "Test",
              "email": "salut@gmail.com",
              "phone": "043242342",
              "type": "Asker",
              "street": "Chemin de la street",
              "aptFloor": "2c",
              "pcode": "1043",
              "city": "Lauztown",
              "accepted_orders": ["id1", "id2"]
            });

    await _auth.currentUser().then((value) => authUserUid = value.uid);
    json.putIfAbsent("orderID",
        () => "\"" + authUserUid + "\""); //we need to generate unique ID
    await _firestore.collection('/orders').document(authUserUid).setData(json);
    return true;
  }

  static Future<bool> POST_AcceptRequest(
      String orderId, String idOfPersonThatPlacedOrder) async {
    // get id of user that wants to accept order
    await _auth
        .currentUser()
        .then((value) => authUserUid = value.uid); // id user qui veut accepter
    // get the order from orders using the idOfPersonThatPlacedOrder
    Map<String, dynamic> orderToBeMoved = new Map<String, dynamic>();
    await _firestore
        .collection('/orders')
        .document(idOfPersonThatPlacedOrder)
        .get()
        .then((value) => orderToBeMoved = value.data);
    // delete order from orders
    await _firestore
        .collection('/orders')
        .document(idOfPersonThatPlacedOrder)
        .delete();
    // move order from orders to accepted
    await _firestore
        .collection('/accepted')
        .document(authUserUid)
        .setData(orderToBeMoved);
    return true;
  }
}
