import 'package:blablacar_part2/model/ride/locations.dart';

abstract class LocationsRepository {
  List<Location> getLocations(); // Define the method to fetch locations
}
