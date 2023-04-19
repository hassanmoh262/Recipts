import 'package:flutter/material.dart';
class IngredientsScreen extends StatelessWidget {
  final List<dynamic> ingredients;
  final dynamic recipe;
  final Function(Map<dynamic, dynamic>) onRecipeAdded;

  IngredientsScreen({Key? key, required this.ingredients, required this.recipe, required this.onRecipeAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingredients'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: recipe['image'] != null ? Image.network(
              recipe['image'],
              fit: BoxFit.cover,
            ) : SizedBox.shrink(),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              recipe['label'],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipe['ingredientLines'].length,
              itemBuilder: (context, index) {
                final ingredient = recipe['ingredientLines'][index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Text(
                    '- $ingredient',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add the recipe and its ingredients to breakfast
                      onRecipeAdded(recipe);
                      Navigator.pop(context);
                    },
                    child: Text('Add to Breakfast'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Lunch'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Add to Dinner'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
