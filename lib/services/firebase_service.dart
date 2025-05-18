import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/medicine.dart';

class FirebaseService {
  final CollectionReference medicinesCollection = FirebaseFirestore.instance
      .collection('medicines');

  // Create (Add) a new medicine
  Future<void> addMedicine(Medicine medicine) async {
    await medicinesCollection.add(medicine.toMap());
  }

  // Read all medicines
  Stream<List<Medicine>> getMedicines() {
    return medicinesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Medicine.fromFirestore(
          doc.data() as Map<String, dynamic>,
          doc.id,
        );
      }).toList();
    });
  }

  // Update a medicine
  Future<void> updateMedicine(Medicine medicine) async {
    await medicinesCollection.doc(medicine.id).update(medicine.toMap());
  }

  // Delete a medicine
  Future<void> deleteMedicine(String medicineId) async {
    await medicinesCollection.doc(medicineId).delete();
  }
}
