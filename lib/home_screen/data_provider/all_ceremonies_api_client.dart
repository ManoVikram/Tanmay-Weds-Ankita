import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../common/models/ceremony.dart';

class AllCeremoniesAPIClient {
  const AllCeremoniesAPIClient();

  List<Ceremony> _snapshotToCeremonies(QuerySnapshot allCeremoniesSnapshot) {
    List<Ceremony> allCeremonies = [];

    final List<QueryDocumentSnapshot> allCeremonyDocs =
        allCeremoniesSnapshot.docs;

    for (var ceremonyDoc in allCeremonyDocs) {
      final Map<String, dynamic> rawCeremonyData =
          ceremonyDoc.data() as Map<String, dynamic>;

      Ceremony ceremony = Ceremony.fromJson(rawCeremonyData);

      allCeremonies.add(ceremony);
    }

    return allCeremonies;
  }

  Stream<List<Ceremony>> fetchAllCeremonies() async* {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final CollectionReference ceremonyRef = db.collection("ceremonies");

    final StreamController<List<Ceremony>> streamController =
        StreamController<List<Ceremony>>();

    List<Ceremony> allCeremonies = [];

    try {
      StreamSubscription allCeremoniesStreamSubscription =
          ceremonyRef.snapshots().listen((QuerySnapshot querySnapshot) {
        allCeremonies = _snapshotToCeremonies(querySnapshot);

        streamController.add(allCeremonies);
      });

      allCeremoniesStreamSubscription.onError((dynamic error) {
        streamController.addError(error);

        allCeremoniesStreamSubscription.cancel();
      });

      streamController.onCancel =
          () => allCeremoniesStreamSubscription.cancel();
    } catch (error) {
      streamController.addError(error);

      streamController.close();
    }

    yield* streamController.stream;
  }
}
