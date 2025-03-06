import 'package:blablacar_part2/model/ride/locations.dart';
import 'package:blablacar_part2/repository/locations_repository.dart';

import '../dummy_data/dummy_data.dart';

////
///   This service handles:
///   - The list of available rides
///
// class LocationsService {
//   static const List<Location> availableLocations = fakeLocations;
// }

//new update for the service that wiil get old locations and new locations
class LocationsService {
  final LocationsRepository locationsRepository;

  LocationsService(this.locationsRepository);

  /// Retrieves a combined list of available locations
  List<Location> getAvailableLocations() {
    return [...fakeLocations, ...locationsRepository.getLocations()];
  }
}
