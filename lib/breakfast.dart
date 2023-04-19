import 'package:flutter/material.dart';
import 'IngredientsScreen.dart';


class BreakfastScreen extends StatefulWidget {
  final List<Map<dynamic, dynamic>> recipe;
  final List<dynamic> ingredientLines;

  const BreakfastScreen({
    Key? key,
    required this.recipe,
    required this.ingredientLines,
    required List ingredients,
  }) : super(key: key);

  @override
  State<BreakfastScreen> createState() => _BreakfastScreenState();
}

class _BreakfastScreenState extends State<BreakfastScreen> {
  List<Map<dynamic, dynamic>> _recipes = [];

  @override
  void initState() {
    super.initState();
    _recipes.addAll(widget.recipe);
  }

   addRecipe(Map<dynamic, dynamic> recipe) {
    setState(() {
      _recipes.add(recipe);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Breakfast'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _recipes.length,
              itemBuilder: (context, index) {
                final recipeItem = _recipes[index];
                return ListTile(
                  title: Text(recipeItem['label']),
                  subtitle: Image.network(recipeItem['image']),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ingredients:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.ingredientLines.length,
              itemBuilder: (context, index) {
                final ingredient = widget.ingredientLines[index];
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
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => IngredientsScreen(
                ingredients: widget.ingredientLines,
                recipe: null,
                onRecipeAdded: addRecipe,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
