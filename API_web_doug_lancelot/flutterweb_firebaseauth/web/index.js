// Initialize Cloud Firestore through Firebase
var db = firebase.firestore();

function storeData() {

    var first_name_text = document.getElementById("first_name_field").value;
    var last_name_text = document.getElementById("last_name_field").value;
    var email_text = document.getElementById("email_field").value;
    var password_text = document.getElementById("password_field").value;
    var telephone_text = document.getElementById("telephone_field").value;
    var type_text = document.getElementById("type_field").value;
    var street_text = document.getElementById("street_field").value;
    var apt_floor_text = document.getElementById("apt_floor_field").value;
    var postal_code_text = document.getElementById("pcode_field").value;
    var city_text = document.getElementById("city_field").value;

    // Add a new document in collection "cities"
    db.collection("users").doc().set({
        'firstName': first_name_text,
        'lastName': last_name_text,
        'email': email_text,
        'telephone': telephone_text,
        'type': type_text,
        'street': street_text,
        'aptFloor': apt_floor_text,
        'pcode': postal_code_text,
        'city': city_text
    })
        .then(function () {
            console.log("Document successfully written!");
        })
        .catch(function (error) {
            console.error("Error writing document: ", error);
        });
}

function sign_in() {

    var email_text = document.getElementById("email_field").value;
    var password_text = document.getElementById("password_field").value;

    try {
        AuthResult authRes = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email_text, password: password_text);
        FirebaseUser signedInUser = authRes.user;
        //if (signedInUser != null) {
        //  _firestore
        //      .collection('/users')
        //      .document(signedInUser.uid)
        //      .setData({'name': name, 'email': email});
        //  Navigator.pushReplacementNamed(
        //      context, AfterLogInScreen.id); // not to be able to come back
        //}
    } catch (e) {
        Widget okBut = FlatButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
        );

        AlertDialog alert = AlertDialog(
            title: Text("Error"),
            content: Text("Email already used"),
            actions: [
            okBut,
        ],
        );

        showDialog(
            context: context,
            builder: (BuildContext context) {
            return alert;
        });
    }
}
  }

}