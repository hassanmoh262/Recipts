import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'IngredientsScreen.dart';
import 'Profile_screen.dart';
import 'homeScreen.dart';

class SearchPage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  String _searchQuery = '';
  List<dynamic> _recipes = [];

  Future<void> _searchRecipes(String query) async {
    const String apiKey = '54d2ef4c448961c94f0a28f0346758c4';
    const String appId = '0ba90dd9';
    final String apiUrl =
        'https://api.edamam.com/search?q=$query&app_id=$appId&app_key=$apiKey&health=vegetarian';
    final Uri apiUri = Uri.parse(apiUrl);
    final response = await http.get(apiUri);

    if (response.statusCode == 200) {
      setState(() {
        _recipes = json.decode(response.body)['hits'];
      });
    } else {
      print('Error fetching recipes: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Healthy Recipes App')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a food item',
              ),
              onChanged: (value) {
                _searchQuery = value;
              },
              onSubmitted: (value) {
                _searchRecipes(value);
              },
            ),
          ),
          Flexible(
            child: _recipes == null
                ? Center(child: Text('Please search for a recipe'))
                : ListView.builder(
              itemCount: _recipes == null ? 0 : _recipes.length,
              itemBuilder: (BuildContext context, int index) {
                final recipe = _recipes[index]['recipe'];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            IngredientsScreen(recipe: recipe, ingredients: [], onRecipeAdded: (recipe ){ } ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Flexible(
                      child: Row(
                        children: [
                          Text(recipe['label']),
                          const SizedBox(width: 10),
                          // add cal text next to the number
                          // add weight text next to the number
                        ],
                      ),
                    ),
                    subtitle: Text(recipe['calories'].toStringAsFixed(0) +
                        ' cal'),
                    leading: SizedBox(
                      width: 80.0,
                      height: 80.0,
                      child: Image.network(recipe['image']),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}