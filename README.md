# Movie Challenge

The Movie Challenge is a small Flutter app that lists the most popular and now playing movies. It utilizes the GetX package for state management and Hive for lightweight and encrypted key-value database functionality.

## Table of Contents

- [Features](#features)
- [Technologies Used](#technologies-used)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Features

- Displays a list of the most popular movies.
- Provides information about movies currently playing.
- Utilizes GetX for state management, dependency injection, and route management.
- Uses Hive as a lightweight, fast, and encrypted key-value database for storing movie data.

## Technologies Used

- **Flutter**: A UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **GetX**: A Flutter package for high-performance state management, dependency injection, and route management.
- **Hive**: A lightweight, fast, and encrypted key-value database for Dart and Flutter.

## Getting Started

To run the project locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/saferac/moviechallenge.git
   ```

2. Navigate to the project directory:

   ```bash
   cd moviechallenge
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

Make sure you have Flutter installed on your machine. If not, you can [install Flutter](https://flutter.dev/docs/get-started/install).

## Project Structure

The project structure follows a standard Flutter project layout. The key directories are as follows:

- **`lib`**: Contains the Dart source code files for the project.
- **`test`**: Includes test files for unit and widget tests.
- **`assets`**: Stores static assets such as images.

## Usage

The app displays a list of popular movies and movies currently playing. Users can toggle between grid and list views. The project uses GetX for efficient state management, and Hive for local data storage.

Feel free to customize and extend the app to suit your needs. Contributions are welcome!

## Contributing

If you'd like to contribute to the project, please follow the standard GitHub workflow:

1. Fork the repository.
2. Create a new branch for your feature or bug fix: `git checkout -b feature-name`.
3. Make your changes and commit them: `git commit -m 'Description of changes'`.
4. Push your changes to the branch: `git push origin feature-name`.
5. Open a pull request with a detailed description of your changes.

## License

This project is licensed under the MIT License 