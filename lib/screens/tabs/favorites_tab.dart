import 'package:flutter/material.dart';
import '../../shared/sport_theme/components/typography.dart';
import '../../shared/sport_theme/components/cards.dart';
import '../../shared/sport_theme/components/images.dart';
import '../../shared/sport_theme/components/layout.dart';
import '../../shared/sport_theme/components/buttons.dart';
import '../../models/team.dart';
import '../../models/player.dart';
import '../../services/favorites_service.dart';

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({Key? key}) : super(key: key);

  @override
  _FavoritesTabState createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> with SingleTickerProviderStateMixin {
  final FavoritesService _favoritesService = FavoritesService();
  late TabController _tabController;
  late Future<List<Team>> _favoriteTeamsFuture;
  late Future<List<Player>> _favoritePlayersFuture;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _favoriteTeamsFuture = _favoritesService.getFavoriteTeams();
    _favoritePlayersFuture = _favoritesService.getFavoritePlayers();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          tabs: const [
            Tab(text: 'Teams'),
            Tab(text: 'Players'),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildFavoriteTeams(),
              _buildFavoritePlayers(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFavoriteTeams() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Favorite Teams'),
          SportLayout.spacer(),
          FutureBuilder<List<Team>>(
            future: _favoriteTeamsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SportTypography.body('No favorite teams yet'),
                      SportLayout.spacer(),
                      SportButtons.primaryButton(
                        text: 'Browse Teams',
                        onPressed: () {
                          // Navigate to teams tab
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final team = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SportCards.scoreCard(
                        child: Row(
                          children: [
                            SportImages.teamLogo(
                              imageUrl: team.logoUrl,
                              size: 60,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SportTypography.subheading(team.name),
                                  SportTypography.caption(team.league),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.star, color: Colors.amber),
                              onPressed: () {
                                // Remove from favorites
                                setState(() {
                                  _favoriteTeamsFuture = _favoritesService.removeFavoriteTeam(team.id);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritePlayers() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Favorite Players'),
          SportLayout.spacer(),
          FutureBuilder<List<Player>>(
            future: _favoritePlayersFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SportTypography.body('No favorite players yet'),
                      SportLayout.spacer(),
                      SportButtons.primaryButton(
                        text: 'Browse Players',
                        onPressed: () {
                          // Navigate to players tab
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final player = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SportCards.scoreCard(
                        child: Row(
                          children: [
                            SportImages.avatar(
                              imageUrl: player.imageUrl,
                              size: 60,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SportTypography.subheading(player.name),
                                  SportTypography.caption('${player.position} • ${player.team}'),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.star, color: Colors.amber),
                              onPressed: () {
                                // Remove from favorites
                                setState(() {
                                  _favoritePlayersFuture = _favoritesService.removeFavoritePlayer(player.id);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
