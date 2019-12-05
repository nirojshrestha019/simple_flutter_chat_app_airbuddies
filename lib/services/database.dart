import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:air_buddies/models/EachUser.dart';
import 'package:air_buddies/models/user.dart';



class DatabaseService {
  final String uid;

  DatabaseService({ this.uid });

//collection reference
//collection name users we created if doesn't exit and use it if exist
final CollectionReference usersCollection = Firestore.instance.collection('users');

  Future<void> updateUserData(String name, String gender, String age, String detail, String transit_at, String date) async {

    return await usersCollection.document(uid).setData({

      'name': name,
      'gender': gender,
      'age': age,
      'detail': detail,
      'transit_at': transit_at,
      'date': date,
    });
  }

 // user list from snapshot
  List<EachUser> _eachuserListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      //print(doc.data);
      return EachUser(
        name: doc.data['name'] ?? '',
        gender: doc.data['gender'] ?? '',
        age: doc.data['age'] ?? '0',
        detail: doc.data['detail'] ?? '',
        transit_at: doc.data['transit_at'] ?? '',
        date: doc.data['date'] ?? ''
      );
    }).toList();
  }


  // user data from snapshots
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      gender: snapshot.data['gender'],
      age: snapshot.data['age'],
      detail: snapshot.data['detail'],
      transit_at: snapshot.data['transit_at'],
      date: snapshot.data['date']
    );
  }

  // get users stream
  Stream<List<EachUser>> get users {
    return usersCollection.snapshots()
      .map(_eachuserListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return usersCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
  }

}
