import 'package:flutter/material.dart';
import '../shared/sport_theme/colors.dart';
import '../shared/sport_theme/components/typography.dart';
import '../shared/sport_theme/models/tab_item.dart';
import '../shared/sport_theme/components/navigation.dart';
import '../shared/sport_theme/components/inputs.dart';
import 'tabs/live_scores_tab.dart';
import 'tabs/teams_tab.dart';
import 'tabs/players_tab.dart';
import 'tabs/news_tab.dart';
import 'tabs/favorites_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTabIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  final List<TabItem> _tabs = [
    TabItem(icon: Icons.scoreboard, label: 'Live Scores'),
    TabItem(icon: Icons.group, label: 'Teams'),
    TabItem(icon: Icons.person, label: 'Players'),
    TabItem(icon: Icons.article, label: 'News'),
    TabItem(icon: Icons.star, label: 'Favorites'),
  ];

  final List<Widget> _tabScreens = [
    const LiveScoresTab(),
    const TeamsTab(),
    const PlayersTab(),
    const NewsTab(),
    const FavoritesTab(),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sports App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Search'),
                  content: SportInputs.searchBar(
                    controller: _searchController,
                    onChanged: (value) {
                      // Handle search
                    },
                    hintText: 'Search teams, players, matches...',
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Show notifications
            },
          ),
        ],
      ),
      body: _tabScreens[_selectedTabIndex],
      bottomNavigationBar: SportNavigation.tabBar(
        items: _tabs,
        selectedIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
      ),
    );
  }
}

class SportSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Implement search suggestions
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.sports_soccer),
          title: const Text('Manchester United'),
          onTap: () {
            query = 'Manchester United';
            showResults(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.sports_soccer),
          title: const Text('Barcelona'),
          onTap: () {
            query = 'Barcelona';
            showResults(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Lionel Messi'),
          onTap: () {
            query = 'Lionel Messi';
            showResults(context);
          },
        ),
      ],
    );
  }
}
