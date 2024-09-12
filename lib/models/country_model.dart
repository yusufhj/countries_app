// country_model data structure to define what each country object will look like.
// will be used to map the JSON data to the Country model.

class Country {
  final String name;
  final String region;
  final String capital;
  final String flagUrl;
  final List<String> languages;

  Country({
    required this.name,
    required this.region,
    required this.capital,
    required this.flagUrl,
    required this.languages,
  });

  // Factory method to create a Country from JSON data
  // This method takes the raw JSON data (which we’ll get from the API) and maps it to the Country model.
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name']['common'],
      region: json['region'],
      capital: json['capital'] != null ? json['capital'][0] : 'No capital',
      flagUrl: json['flags']['png'],
      languages: json['languages'] != null
          ? List<String>.from(json['languages'].values)
          : ['Unknown'],
    );
  }
}
