// this handles the data fetching login and provides the data to the ui

import 'package:stacked/stacked.dart';
import 'package:first_stacked/models/country_model.dart';
import 'package:first_stacked/services/api_services.dart';

class CountriesListViewmodel extends BaseViewModel {
  final ApiService _apiService = ApiService();
  List<Country> _countries = [];
  String _searchQuery = '';
  bool _isSortedAlphabetically = false;

  // List<Country> get countries => _countries
  //     .where((country) => country.name.toLowerCase().contains(_searchQuery.toLowerCase()))
  //     .toList();

  List<Country> get countries {
    // Create a copy of the countries list
    var sortedCountries = List<Country>.from(_countries);

    // Sort the copy if the sorting flag is enabled
    if (_isSortedAlphabetically) {
      sortedCountries.sort((a, b) => a.name.compareTo(b.name));
    }

    // Filter the countries based on the search query
    return sortedCountries
        .where((country) =>
            country.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  bool get isSortedAlphabetically => _isSortedAlphabetically;


  // This method fetches the data from the API and sets the _countries list.
  Future<void> loadCountries() async {
    setBusy(true); // set busy state (loading)
    _countries = await _apiService.fetchCountries();
    setBusy(false); // done loading
  }

  // hadnles search functionality by filtering the list of countries based on the search query
  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners(); // search done
  }

  // New method to toggle alphabetical sorting
  void toggleSortAlphabetically() {
    _isSortedAlphabetically = !_isSortedAlphabetically;
    notifyListeners(); // Notify UI that sorting has changed
  }
}