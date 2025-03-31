import 'package:flutter/material.dart';
import '../../shared/sport_theme/components/typography.dart';
import '../../shared/sport_theme/components/cards.dart';
import '../../shared/sport_theme/components/images.dart';
import '../../shared/sport_theme/components/layout.dart';
import '../../models/player.dart';
import '../../services/player_service.dart';

class PlayersTab extends StatefulWidget {
  const PlayersTab({Key? key}) : super(key: key);

  @override
  _PlayersTabState createState() => _PlayersTabState();
}

class _PlayersTabState extends State<PlayersTab> {
  final PlayerService _playerService = PlayerService();
  late Future<List<Player>> _playersFuture;

  @override
  void initState() {
    super.initState();
    _playersFuture = _playerService.getTopPlayers();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Top Players'),
          SportLayout.spacer(),
          FutureBuilder<List<Player>>(
            future: _playersFuture,
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
                  child: SportTypography.body('No players available'),
                );
              } else {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final player = snapshot.data![index];
                    return InkWell(
                      onTap: () {
                        // Navigate to player details
                      },
                      child: Column(
                        children: [
                          SportCards.playerCard(
                            name: player.name,
                            position: player.position,
                            imageUrl: player.imageUrl,
                          ),
                          SportLayout.spacer(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildStatItem('Goals', player.goals.toString()),
                              _buildStatItem('Assists', player.assists.toString()),
                            ],
                          ),
                          SportLayout.spacer(height: 4),
                          SportTypography.caption('Team: ${player.team}'),
                        ],
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

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        SportTypography.caption(label),
        SportTypography.body(value),
      ],
    );
  }
}
