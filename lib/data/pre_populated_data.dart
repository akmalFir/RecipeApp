import '../models/recipe.dart';

List<Recipe> getPrePopulatedRecipes() {
  return [
    // Malay Dishes
    Recipe(
      name: 'Nasi Lemak',
      type: 'Malay Dish',
      image: 'assets/images/nasi_lemak.jpg',
      ingredients: [
        'Rice',
        'Coconut Milk',
        'Pandan Leaves',
        'Anchovies',
        'Sambal',
        'Hard-boiled Egg',
        'Cucumber'
      ],
      steps: [
        'Cook rice with coconut milk and pandan leaves.',
        'Fry anchovies until crispy.',
        'Prepare sambal with chili, onion, and shrimp paste.',
        'Serve with hard-boiled egg and cucumber slices.'
      ],
    ),
    Recipe(
      name: 'Ayam Masak Merah',
      type: 'Malay Dish',
      image: 'assets/images/ayam_masak_merah.jpg',
      ingredients: [
        'Chicken',
        'Tomato Sauce',
        'Chilies',
        'Garlic',
        'Onions',
        'Spices',
        'Coconut Milk'
      ],
      steps: [
        'Marinate and fry the chicken.',
        'Blend chilies, garlic, and onions into a paste.',
        'Cook paste with spices and tomato sauce.',
        'Add fried chicken and simmer with coconut milk.'
      ],
    ),

    // Chinese Dishes
    Recipe(
      name: 'Char Kway Teow',
      type: 'Chinese Dish',
      image: 'assets/images/char_kway_teow.jpg',
      ingredients: [
        'Flat Rice Noodles',
        'Prawns',
        'Eggs',
        'Chives',
        'Bean Sprouts',
        'Soy Sauce',
        'Garlic'
      ],
      steps: [
        'Heat oil and sauté garlic.',
        'Add prawns, noodles, and bean sprouts.',
        'Stir-fry with soy sauce and chives.',
        'Add beaten egg and cook until done.'
      ],
    ),
    Recipe(
      name: 'Hainanese Chicken Rice',
      type: 'Chinese Dish',
      image: 'assets/images/hainanese_chicken_rice.jpg',
      ingredients: [
        'Chicken',
        'Rice',
        'Ginger',
        'Garlic',
        'Spring Onions',
        'Soy Sauce'
      ],
      steps: [
        'Poach chicken with ginger and spring onions.',
        'Cook rice with chicken broth.',
        'Serve chicken with soy sauce and rice.'
      ],
    ),

    // Indian Dishes
    Recipe(
      name: 'Roti Canai',
      type: 'Indian Dish',
      image: 'assets/images/roti_canai.jpg',
      ingredients: [
        'Flour',
        'Water',
        'Ghee',
        'Salt',
      ],
      steps: [
        'Knead dough with flour, water, and salt.',
        'Flatten and stretch the dough.',
        'Fry with ghee until crispy.',
      ],
    ),
    Recipe(
      name: 'Fish Head Curry',
      type: 'Indian Dish',
      image: 'assets/images/fish_head_curry.jpg',
      ingredients: [
        'Fish Head',
        'Curry Paste',
        'Coconut Milk',
        'Okra',
        'Tomatoes',
        'Eggplant',
      ],
      steps: [
        'Sauté curry paste with oil.',
        'Add fish head and vegetables.',
        'Pour coconut milk and simmer.',
      ],
    ),

    // Western Dishes
    Recipe(
      name: 'Chicken Chop',
      type: 'Western Dish',
      image: 'assets/images/chicken_chop.jpg',
      ingredients: [
        'Chicken Thigh',
        'Black Pepper Sauce',
        'Potatoes',
        'Vegetables',
      ],
      steps: [
        'Marinate chicken thigh with spices.',
        'Pan-fry until golden brown.',
        'Serve with black pepper sauce, mashed potatoes, and vegetables.',
      ],
    ),
    Recipe(
      name: 'Spaghetti Aglio e Olio',
      type: 'Western Dish',
      image: 'assets/images/spaghetti.jpg',
      ingredients: [
        'Spaghetti',
        'Garlic',
        'Olive Oil',
        'Chili Flakes',
        'Parsley',
      ],
      steps: [
        'Cook spaghetti.',
        'Sauté garlic in olive oil with chili flakes.',
        'Toss spaghetti with garlic and parsley.',
      ],
    ),

    // Drinks
    Recipe(
      name: 'Teh Tarik',
      type: 'Drinks',
      image: 'assets/images/teh_tarik.jpg',
      ingredients: [
        'Tea Leaves',
        'Condensed Milk',
        'Hot Water',
      ],
      steps: [
        'Brew tea with hot water.',
        'Mix tea with condensed milk.',
        'Pull the tea by pouring it between two cups.',
      ],
    ),
    Recipe(
      name: 'Sirap Bandung',
      type: 'Drinks',
      image: 'assets/images/sirap_bandung.jpg',
      ingredients: [
        'Rose Syrup',
        'Evaporated Milk',
        'Water',
        'Ice',
      ],
      steps: [
        'Mix rose syrup with evaporated milk.',
        'Add water and ice cubes.',
        'Stir and serve.',
      ],
    ),

    // Desserts
    Recipe(
      name: 'Ais Kacang',
      type: 'Desserts',
      image: 'assets/images/ais_kacang.jpg',
      ingredients: [
        'Shaved Ice',
        'Red Beans',
        'Sweet Corn',
        'Grass Jelly',
        'Rose Syrup',
        'Condensed Milk',
      ],
      steps: [
        'Add red beans, sweet corn, and grass jelly to a bowl.',
        'Top with shaved ice.',
        'Drizzle with rose syrup and condensed milk.',
      ],
    ),
    Recipe(
      name: 'Kuih Seri Muka',
      type: 'Desserts',
      image: 'assets/images/seri_muka.jpg',
      ingredients: [
        'Glutinous Rice',
        'Coconut Milk',
        'Pandan Leaves',
        'Eggs',
        'Sugar',
      ],
      steps: [
        'Cook glutinous rice with coconut milk.',
        'Blend pandan leaves with eggs and sugar for the custard layer.',
        'Steam rice and custard layer together.',
      ],
    ),
  ];
}
