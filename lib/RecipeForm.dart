import 'package:flutter/material.dart';

class Recipe {
  final String name;
  final List<String> ingredients;

  Recipe({required this.name, required this.ingredients});
}

class RecipeForm extends StatefulWidget {
  final Function(Recipe recipe) onRecipeAdded;

  RecipeForm({required this.onRecipeAdded});

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _ingredientsController,
                decoration: InputDecoration(
                  labelText: 'Ingredients (comma separated)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter ingredients';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final name = _nameController.text;
                    final ingredients =
                    _ingredientsController.text.split(',').map((e) => e.trim()).toList();
                    final recipe = Recipe(name: name, ingredients: ingredients);

                    // Add the recipe and its ingredients to breakfast
                    widget.onRecipeAdded(recipe);

                    // Pop the form screen
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Recipe'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
