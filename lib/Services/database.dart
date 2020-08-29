import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tt_firebase/models/patient.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  //collection reference
  final CollectionReference patientCollection = Firestore.instance.collection('Patients');
  
  Future updateUserData(String name, int bp, int oxi, int temp, int ecg) async {
    return await patientCollection.document(uid).setData({
      'name':name,
      'bp':bp,
      'oxi':oxi,
      'temp':temp,
      'ecg':ecg,
    });
  }

  //patient list from snapshot
  List<Patient> _patientListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Patient(
        name: doc.data['name'] ?? '', //returns name else empty string
        bp: doc.data['bp'] ?? 0,
        oxi: doc.data['oxi'],
        temp: doc.data['temp'] ?? 0,
        ecg: doc.data['ecg'] ?? 0,
      );
    }).toList(); 
  }

  //get patients stream
  Stream<List<Patient>> get patients {
    return patientCollection.snapshots()
    .map(_patientListFromSnapshot);
  }

}