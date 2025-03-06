import 'package:blablacar_part2/model/ride/locations.dart';
import 'package:blablacar_part2/repository/locations_repository.dart';

class MockLocationsRepository implements LocationsRepository {
  @override
  List<Location> getLocations() {
    return [
      Location(name: 'Phnom Penh', country: Country.cambodia),
      Location(name: 'Siem Reap', country: Country.cambodia),
      Location(name: 'Battambang', country: Country.cambodia),
      Location(
        name: 'Shah Alam',
        country: Country.uk,
      ), // Assuming this is the proper country
      Location(name: 'Kampot', country: Country.cambodia),
    ];
  }
}
