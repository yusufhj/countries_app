// display the list of countries


import 'countries_list_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../country_details/country_details_view.dart';

class CountriesListView extends StatelessWidget{
  const CountriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    // ViewModelBuilder is a widget that provides the view model to its child widget. 
    // binds CountriesListViewmodel to the ui

    return ViewModelBuilder<CountriesListViewmodel>.reactive(
      viewModelBuilder: () => CountriesListViewmodel(),
      onModelReady: (model) => model.loadCountries(),
      builder: (context, model, child) {
        return Scaffold(
          // appbar contains a searchbar that allows users to search for countries
          // using model.setSearchQuery method ro update the search query when the user types in the search bar
          appBar: AppBar(
            title: const Text('Countries List'),
            actions: [
              IconButton(
                icon: Icon(
                  model.isSortedAlphabetically
                  ? Icons.sort_by_alpha
                  : Icons.sort,
                ),
                onPressed: model.toggleSortAlphabetically,
                tooltip: 'Sort alphabetically',
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(56), 
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                
                child: TextField(
                  onChanged: model.setSearchQuery,
                  decoration: InputDecoration(
                    hintText: 'Search countires...',
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                ),
              ),
            ),
          ),
          body: model.isBusy // check if the view model is busy
          // if it is, show a loading indicator
          ? const Center (child: CircularProgressIndicator())

          // if not, show the list of countries
          : ListView.builder(
            itemCount: model.countries.length,
            itemBuilder: (context, index) {
              final country = model.countries[index];
              return ListTile(
                leading: Image.network(country.flagUrl, width: 50),
                title: Text(country.name, style: const TextStyle(fontSize: 22) ),
                subtitle: Text(country.region, style: const TextStyle(fontSize: 18)),
                isThreeLine: false,
                onTap: () {
                  // navigate to the details page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountryDetailsView(country: country),
                    ),
                  );
                },
                
              );
            },
          ),
        );
      },
    );
  }
}
