# 🎬 Movie Wave using Flutter and TMDB API

Welcome to **Movie Wave**! This project is a Flutter application designed to provide users with the latest information on movies, including ratings, reviews, and more.

## 📱 Features

- 🔍 Search for movies by title
- ⭐ View movie ratings and reviews
- 🎥 Watch trailers
- 📅 See upcoming movie releases
- 📋 Save your favorite movies
  
![photo-collage png (2)](https://github.com/user-attachments/assets/7dafbb57-88ad-474f-838d-bd869137eed8)

## 🚀 Getting Started

To get a local copy up and running, follow these simple steps.

### 📋 Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart SDK: Included with Flutter
- An IDE like Visual Studio Code or Android Studio

### 🔧 Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/yourusername/movie_wave.git
    cd movie_wave
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    ```

3. **Set up environment variables:**

    Create a `.env` file in the root directory and add your API key:

    ```env
    MOVIE_API_KEY=your_api_key_here
    ```

4. **Run the app:**

    ```sh
    flutter run
    ```

## 📂 Project Structure

```plaintext
movie_wave/
├── android/
├── build/
├── ios/
├── lib/
│   ├── models/
│   ├── pages/
│   ├── services/
│   ├── widgets/
│   ├── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── .env
├── .gitignore
├── [analysis_options.yaml](http://_vscodecontentref_/1)
├── [pubspec.lock](http://_vscodecontentref_/2)
├── [pubspec.yaml](http://_vscodecontentref_/3)
└── [README.md](http://_vscodecontentref_/4)
```
## 📄 Key Files and Directories

- **`lib/main.dart`**: Entry point of the application.
- **`lib/pages/`**: Contains the different pages/screens of the app.
- **`lib/services/`**: Contains the services for fetching data from APIs.
- **`lib/models/`**: Contains the data models.
- **`lib/widgets/`**: Contains reusable widgets.

## 🛠️ Features

- **Search Movies**: Search for movies by title.
- **Popular TV Shows**: Browse popular TV shows.
- **Now Playing Movies**: Discover movies currently playing in theaters.
- **Movie Details**: View detailed information about a movie.

## 🧪 Running Tests

To run the widget test:

```sh
flutter test
```
## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---
