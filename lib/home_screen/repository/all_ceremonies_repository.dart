import '../data_provider/all_ceremonies_api_client.dart';
import '../models/ceremony.dart';

class AllCeremoniesRepository {
  const AllCeremoniesRepository({
    required this.allCeremoniesAPIClient,
  });

  final AllCeremoniesAPIClient allCeremoniesAPIClient;

  Stream<List<Ceremony>> fetchAllCeremonies() async* {
    try {
      yield* allCeremoniesAPIClient.fetchAllCeremonies();
    } catch (error) {
      rethrow;
    }
  }
}
