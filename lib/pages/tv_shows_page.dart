import 'package:flutter/material.dart';
import 'package:movie_wave/widgets/tv_show_details.dart';

import '../models/tv_show_model.dart';
import '../services/tv_show_service.dart';

class TVShowsPage extends StatefulWidget {
  const TVShowsPage({super.key});

  @override
  _TVShowsPageState createState() => _TVShowsPageState();
}

class _TVShowsPageState extends State<TVShowsPage> {
  final TvShowService _tvShowService = TvShowService();
  List<TVShow> _tvShows = [];
  bool _isLoading = true;
  String _error = '';

  @override
  void initState() {
    super.initState();
    _fetchTVShows();
  }

  Future<void> _fetchTVShows() async {
    try {
      List<TVShow> tvShows = await _tvShowService.fetchTVShows();
      setState(() {
        _tvShows = tvShows;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Failed to load TV shows: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Shows'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _error.isNotEmpty
              ? Center(
                  child:
                      Text(_error, style: const TextStyle(color: Colors.blue)),
                )
              : ListView.builder(
                  itemCount: _tvShows.length,
                  itemBuilder: (context, index) {
                    return TVShowListItem(tvShow: _tvShows[index]);
                  },
                ),
    );
  }
}
