import 'package:flutter/material.dart';
import '../../../models/country_model.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

// display the country as a detailed view
class CountryDetailsView extends StatelessWidget{
  final Country country;

  const CountryDetailsView({super.key, required this.country});

  // method to launch google maps with the country's coordinates
  Future<void> _launchGoogleMaps(String countryName) async {
    final Uri url = Uri(
      scheme: 'https',
      host: 'www.google.com',
      path: '/maps/place/${Uri.encodeComponent(countryName)}'
    );
    if (await url_launcher.canLaunchUrl(url)) {
      await url_launcher.launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // display the country's flag, region, capital, and languages
            Center(
              child: Image.network(
                country.flagUrl,
                width: 500,
                height: 200,
                fit: BoxFit.cover,
              ), 
            ),
            const SizedBox(height: 20),

            _buildDetailRow('Region', country.region),
            _buildDetailRow('Capital', country.capital),
            _buildDetailRow('Languages', country.languages.join(', ')),

            // Text('Region: ${country.region}', style: const TextStyle(fontSize: 18)),
            // Text('Capital: ${country.capital}', style: const TextStyle(fontSize: 18)),
            // Text('Languages: ${country.languages.join(', ')}', style: const TextStyle(fontSize: 18)),
            // const SizedBox(height: 16),

            const Spacer(),

            // elevated button at tje bottom of the screen that opens google maps with the country's capital
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => _launchGoogleMaps(country.name),
                child: const Text('View on Google Maps'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: 
                const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

}