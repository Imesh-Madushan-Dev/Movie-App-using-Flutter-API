import 'package:flutter/material.dart';
import 'package:movie_wave/pages/single_movie_page.dart';
import 'package:movie_wave/widgets/movie_detail.dart';

import '../models/movie_model.dart';
import '../services/movie_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Movie> _movies = [];
  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  //* fetch upcoming movies - method called in the initState Method

  Future<void> _fetchMovies() async {
    if (_isLoading || !_hasMore) {
      return;
    }

    setState(() {
      _isLoading = true;
    });
    //! Delay the fetch by 2 seconds
    await Future.delayed(const Duration(seconds: 1));
    try {
      final newMovies =
          await MovieService().fetchPopularMovies(page: _currentPage);
      setState(() {
        if (newMovies.isEmpty) {
          _hasMore = false;
        } else {
          // add movies to the array
          _movies.addAll(newMovies);
          _currentPage++;
        }
      });
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            'MOVIE HUB',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            if (!_isLoading &&
                notification.metrics.pixels ==
                    notification.metrics.maxScrollExtent) {
              _fetchMovies();
            }
            return true;
          },
          child: ListView.builder(
            itemCount: _movies.length + (_isLoading ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == _movies.length) {
                return const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SingleMoviePage(movie: _movies[index]),
                      ),
                    );
                  },
                  child: MovieDetailWidget(movie: _movies[index]));
            },
          ),
        ));
  }
}
