// basically a service to use to fetch the data from the REST Countries API.
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:first_stacked/models/country_model.dart';

class ApiService {
  // This is the endpoint for the REST Countries API that gives us data on all countries.
  final String _baseUrl = 'https://restcountries.com/v3.1/all';


  // This method fetches the data, converts it from JSON, and returns a list of Country objects using the Country.fromJson factory method.
  Future<List<Country>> fetchCountries() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    
    } else {
      throw Exception('Failed to load countries');
    }
  }
}