# Recipe App  

A simple Recipe App built using Flutter and GetX for state management. This app allows users to manage recipes, including adding, editing, viewing, and deleting them. Authentication is implemented using Firebase to ensure secure login, registration, and password recovery functionalities.  

## Features  

- **Authentication**  
  - User login, registration, and password reset with Firebase Authentication.  
  - User-specific data management to ensure personalized experiences.  

- **Recipe Management**  
  - Add new recipes with details such as name, ingredients, steps, and an optional image.  
  - Edit and delete existing recipes.  
  - View detailed information about a recipe.  

- **Navigation**  
  - Dynamic navigation with route-based authentication checks.  
  - Navigate between pages (Recipe List, Recipe Detail, Recipe Add/Edit, Profile, etc.).  

- **State Management**  
  - GetX for reactive state management and dependency injection.  

## Screens  

1. **Login Page** - Allows users to log in using their email and password.

2. **Registration Page** - Enables new users to create an account.

3. **Forgot Password Page** - Lets users reset their password via email.

4. **Recipe List** - Displays all recipes added by the user.

5. **Recipe Detail** - Shows detailed information about a specific recipe.

6. **Recipe Add/Edit** - Page to add or edit recipes.

7. **Profile Page** - Displays user information and logout option.


## Project Structure 

lib/ ├── controller/ │ └── recipe_controller.dart # Manages recipe data and state ├── models/ │ └── recipe.dart # Defines the Recipe model ├── routes.dart # App route configuration and navigation logic ├── view/ │ ├── authentication/ # Authentication-related pages │ │ ├── login_page.dart # Login screen │ │ ├── register.dart # Registration screen │ │ └── forgot_password_page.dart # Forgot password screen │ ├── profile/ │ │ └── profile_page.dart # Profile screen │ ├── recipe_add.dart # Recipe add/edit page │ ├── recipe_detail.dart # Recipe details page │ └── recipe_list.dart # Main page listing all recipes └── main.dart # Application entry point


## Dependencies  

The following dependencies are used in this project:  

- **Flutter SDK**: `>=3.0.0`  
- **GetX**: State management and navigation.  
- **Firebase Core & Auth**: Firebase integration for authentication.  


## Setup and Installation  

1. **Clone the Repository** 

   ```bash
   git clone https://github.com/your-username/recipe-app.git
   cd recipe-app

2. **Install Dependencies**

   Run the following command to fetch all the dependencies:
   ```bash
   flutter pub get

3. **Firebase Setup**

   - Create a Firebase project at Firebase Console.
   - Add an Android app to the project and download the google-services.json file.
   - Place the google-services.json file in the android/app/ directory.

4. **Run the App**

   Use the following command to run the app:
   ```bash
   flutter run