class Medicine {
  String? id;
  String name;
  String dosage;
  int quantity;
  DateTime expiryDate;

  Medicine({
    this.id,
    required this.name,
    required this.dosage,
    required this.quantity,
    required this.expiryDate,
  });

  // Convert a Medicine object into a Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dosage': dosage,
      'quantity': quantity,
      'expiryDate': expiryDate,
    };
  }

  // Create a Medicine object from a Firestore DocumentSnapshot
  factory Medicine.fromFirestore(Map<String, dynamic> data, String id) {
    return Medicine(
      id: id,
      name: data['name'] as String,
      dosage: data['dosage'] as String,
      quantity: data['quantity'] as int,
      expiryDate: (data['expiryDate'] as dynamic).toDate(),
    );
  }
}
