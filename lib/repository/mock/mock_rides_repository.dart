import 'package:blablacar_part2/model/ride/locations.dart';
import 'package:blablacar_part2/model/ride/ride.dart';
import 'package:blablacar_part2/model/ride_pref/ride_pref.dart';
import 'package:blablacar_part2/model/user/user.dart';
import 'package:blablacar_part2/repository/rides_repository.dart';
import 'package:blablacar_part2/service/rides_service.dart';

class MockRidesRepository implements RidesRepository {
  final List<Ride> _rides = [
    Ride(
      departureLocation: Location(
        name: 'Battambang',
        country: Country.cambodia,
      ),
      departureDate: DateTime.now().add(Duration(hours: 2)), // Today at 5:30 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(
        Duration(hours: 4),
      ), // 2 hours duration
      driver: User(
        firstName: 'Kannika',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        acceptsPets: false, // Not accepting pets
      ),
      availableSeats: 2,
      pricePerSeat: 10.0,
    ),
    Ride(
      departureLocation: Location(
        name: 'Battambang',
        country: Country.cambodia,
      ),
      departureDate: DateTime.now().add(
        Duration(hours: 15),
      ), // Today at 8:00 PM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(
        Duration(hours: 17),
      ), // 2 hours duration
      driver: User(
        firstName: 'Chaylim',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        acceptsPets: false, // Not accepting pets
      ),
      availableSeats: 0,
      pricePerSeat: 12.0,
    ),
    Ride(
      departureLocation: Location(
        name: 'Battambang',
        country: Country.cambodia,
      ),
      departureDate: DateTime.now().add(Duration(hours: 1)), // Today at 5:00 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(
        Duration(hours: 4),
      ), // 3 hours duration
      driver: User(
        firstName: 'Mengtech',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        acceptsPets: false, // Not accepting pets
      ),
      availableSeats: 1,
      pricePerSeat: 11.0,
    ),
    Ride(
      departureLocation: Location(
        name: 'Battambang',
        country: Country.cambodia,
      ),
      departureDate: DateTime.now().add(
        Duration(hours: 15),
      ), // Today at 8:00 PM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(
        Duration(hours: 17),
      ), // 2 hours duration
      driver: User(
        firstName: 'Limhao',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        acceptsPets: true, // Accepting pets
      ),
      availableSeats: 2,
      pricePerSeat: 14.0,
    ),
    Ride(
      departureLocation: Location(
        name: 'Battambang',
        country: Country.cambodia,
      ),
      departureDate: DateTime.now().add(Duration(hours: 1)), // Today at 5:00 AM
      arrivalLocation: Location(name: 'SiemReap', country: Country.cambodia),
      arrivalDateTime: DateTime.now().add(
        Duration(hours: 4),
      ), // 3 hours duration
      driver: User(
        firstName: 'Sovanda',
        lastName: '',
        email: '',
        phone: '',
        profilePicture: '',
        verifiedProfile: false,
        acceptsPets: false, // Not accepting pets
      ),
      availableSeats: 1,
      pricePerSeat: 13.0,
    ),
  ];

  @override
  List<Ride> getRides(RidePreference preference, RidesFilter? filter) {
    return _rides.where((ride) {
      bool matchesDeparture = ride.departureLocation == preference.departure;
      bool matchesArrival = ride.arrivalLocation == preference.arrival;

      if (filter?.acceptPets != null && filter!.acceptPets) {
        return matchesDeparture && matchesArrival && ride.driver.acceptsPets;
      }

      return matchesDeparture && matchesArrival;
    }).toList();
  }
}
