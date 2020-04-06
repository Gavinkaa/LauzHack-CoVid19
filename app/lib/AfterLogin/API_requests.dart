import 'dart:convert';

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
    await _auth
        .currentUser()
        .then((value) => authUserUid = value.uid); // get user thats logged in
    Map<String, dynamic> infoOfLoggedInUser = new Map<String, dynamic>();
    await _firestore
        .collection('/users')
        .document(authUserUid)
        .get()
        .then((value) => infoOfLoggedInUser = value.data);
    // post a new request associated to the user thats logged in saved to orders
    json.putIfAbsent("contact", () => infoOfLoggedInUser);
    json.putIfAbsent("orderID",
        () => "\"" + authUserUid + "\""); //we need to generate unique ID
    await _firestore.collection('/orders').document(authUserUid).setData(json);
    print(json);
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

  static Future<Map<String, dynamic>> GET_userOrder() async {
    await _auth
        .currentUser()
        .then((value) => authUserUid = value.uid); // get user thats logged in
    Map<String, dynamic> infoOfLoggedInUser = new Map<String, dynamic>();
    await _firestore
        .collection('/orders')
        .document(authUserUid)
        .get()
        .then((value) => infoOfLoggedInUser = value.data);
    print(infoOfLoggedInUser);
    return infoOfLoggedInUser; // returns null if no orders
  }

  // get the order of the user if it exists and has been accepted else  null
  static Future<Map<String, dynamic>> GET_orderOfUserIfNotAccepted() async {
    await _auth
        .currentUser()
        .then((value) => authUserUid = value.uid); // get user thats logged in
    Map<String, dynamic> infoOfLoggedInUser = new Map<String, dynamic>();
    await _firestore
        .collection('/orders')
        .document(authUserUid)
        .get()
        .then((value) => infoOfLoggedInUser = value.data);
    print(infoOfLoggedInUser);
    return infoOfLoggedInUser; // returns null if no accepted orders exist
  }

  // gets the order(s) List that the user accepted
  static Future<List<Map<String, dynamic>>> GET_ordersAcceptedByUser() async {
    await _auth
        .currentUser()
        .then((value) => authUserUid = value.uid); // get user thats logged in
    Map<String, dynamic> infoOfLoggedInUser = new Map<String, dynamic>();
    await _firestore
        .collection('/accepted')
        .document(authUserUid)
        .get()
        .then((value) => print(value.data));
    print([infoOfLoggedInUser]);
    return [infoOfLoggedInUser]; // returns null if no accepted orders exist
  }
}
