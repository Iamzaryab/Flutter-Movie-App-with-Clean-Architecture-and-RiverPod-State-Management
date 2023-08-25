# FilmKu: Clean Architecture Flutter Movie App

![Flutter Movie Application](/screenshots/screenshots.png)

FilmKu is an open-source Flutter movie application that exemplifies clean architecture principles while leveraging the power of both [Riverpod](https://pub.dev/packages/flutter_bloc) and [Bloc](https://pub.dev/packages/flutter_bloc) for state management. The app utilizes the [Movies Database API](https://developer.themoviedb.org/docs) to provide users with an immersive movie discovery experience. With dependency injection powered by [get_it](https://pub.dev/packages/get_it), remote API calls managed by [dio](https://pub.dev/packages/dio), and local data storage utilizing [Isar](https://pub.dev/packages/isar), FilmKu offers a comprehensive solution for movie enthusiasts.

[//]: # (Insert Getting Started Hyperlink Here)
Jump to the [Getting Started](#getting-started) section below to set up the application on your local machine.

## Features

- **Browse Movies:** Dive into an expansive collection of films organized by popularity, top ratings.

- **Unlimited Scrolling:** Enjoy seamless and endless browsing of movies with the addition of an unlimited scrolling feature.

- **Movie Details:** Access comprehensive information for each movie, including release dates, ratings, casts, and more.


- **Favorites:** Bookmark movies as favorites for quick access and reference.

- **Responsive Design:** FilmKu's interface adapts seamlessly to various devices and screen sizes, powered by `flutter_screenutil`.

- **Offline Access:** Enjoy access to recently viewed movies even without an active internet connection.

- **Loading Animations:** Experience smooth loading animations with `flutter_shimmer` as the app fetches data.



## Architecture and Libraries Used

The Flutter Movie Application embraces a variety of architectural principles and libraries to enhance development and maintainability:

### Clean Architecture

The project follows the principles of clean architecture, categorizing code into distinct layers:

- **Data Layer:** This contains data sources and repository implementations, offering a clear separation between data retrieval methods.

- **Domain Layer:** The domain layer includes abstract repositories and use cases, representing the core business logic of the application.

- **Presentation Layer:** Here, you'll find the state management(Bloc & Riverpod) implementation , screens and widgets responsible for rendering the user interface.

### State Management

The project features two branches, each showcasing a different state management approach:

- **Master Branch:** Utilizes the Riverpod state management library for predictable and efficient state management.

- **Bloc Branch:** Implements the Bloc state management library, providing a different perspective on state management techniques.

### Dependency Injection

get_it is used for dependency injection, ensuring the application is decoupled and modular.

### Networking

Dio is employed to facilitate remote API calls, enhancing the efficiency of data retrieval.

### Local Database

Isar is utilized for local database storage, enabling seamless offline access to previously viewed movies.

### Functional Programming

Dartz library is integrated to introduce functional programming concepts, resulting in more predictable and expressive code.

### Code Generation

Freezed is employed for code generation, simplifying the creation of data classes and reducing boilerplate code.

### Other Libraries

- `flutter_svg` for loading SVG images.
- `flutter_screenutil` for responsive screen design.
- `equatable` for efficient class comparisons.
- `go_router` for handling application routing.
- `shimmer` for smooth loading animations.
- `cached_network_image` for image caching.
- `flutter_dotenv` for managing environment variables.

## Getting Started
To set up the FilmKu Flutter Movie Application on your local machine, follow these steps:

1. **Clone the Repository:** Open a terminal and run the following command to clone the project repository:

   ```bash
   git clone https://github.com/Iamzaryab/Movie-Application-Flutter-Clean-Architecture.git
2. Create a `.env` file in the root directory of the project. Add the following lines, replacing `ADD YOUR API KEY` with your actual API key. You can generate your API key from [here](https://www.themoviedb.org/settings/api):

   ```
   BASEURL=https://api.themoviedb.org/3/
   APIKEY=ADD YOUR API KEY
   ```
3. Choose the state management approach:
- For Riverpod implementation, stay on the `master` branch.
- For Bloc implementation, switch to the `bloc` branch using:
  ```bash
  git checkout bloc
  ```
4. Install project dependencies:
   ```bash
   flutter get pub
   ```
5. Generate necessary code using `build_runner`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
Now you're ready to explore the FilmKu Flutter Movie Application! Depending on your chosen state management branch, you can delve into either the Riverpod or Bloc implementation. For any questions or issues, refer to the documentation or seek assistance from the project community.

Feel free to explore the various features and functionalities outlined in the README.
## Contributions

Contributions are welcome! If you want to contribute to the Flutter Movie Application, simply follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature/your-feature-name` or `bugfix/issue-number`.
3. Make your changes and commit them: `git commit -m 'Add some feature'`.
4. Push your changes to the branch: `git push origin feature/your-feature-name`.
5. Open a pull request against the `master` branch of the original repository.

Your contributions help enhance the FilmKu Flutter Movie Application. Feel free to propose new features, improve existing ones, or fix bugs. Together, we can make FilmKu even better!

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- The Movies Database API provides the movie data that powers the application.

---

Experience the world of movies with the Flutter Movie Application! If you encounter issues or have suggestions, please feel free to create an issue on the GitHub repository. Enjoy exploring and watching movies with this versatile and feature-rich application!
