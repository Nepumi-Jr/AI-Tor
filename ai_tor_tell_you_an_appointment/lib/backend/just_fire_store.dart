import 'package:cloud_firestore/cloud_firestore.dart';

Future<DocumentSnapshot<Object?>> get_dddata() async {
  CollectionReference justTest = FirebaseFirestore.instance.collection('test');

  //justTest.doc("exp").get()

  // justTest.doc("exp").collection("many").add({
  //   'full_name': "สมพง", // John Doe
  //   'company': "KKUInwza", // Stokes and Sons
  //   'age': 42 // 42
  // });

  justTest.doc("exp").collection("many").doc("HahhHAHHAHa").set({
    'full_name': "สมพง", // John Doe
    'company': "KKUInwza", // Stokes and Sons
    'age': 42 // 42
  });

  return justTest.doc("exp").get();
}
