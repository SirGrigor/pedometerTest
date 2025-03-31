import 'package:flutter/material.dart';
import '../../shared/sport_theme/components/typography.dart';
import '../../shared/sport_theme/components/cards.dart';
import '../../shared/sport_theme/components/images.dart';
import '../../shared/sport_theme/components/layout.dart';
import '../../shared/sport_theme/components/lists.dart';
import '../../models/team.dart';
import '../../services/team_service.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({Key? key}) : super(key: key);

  @override
  _TeamsTabState createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  final TeamService _teamService = TeamService();
  late Future<List<Team>> _teamsFuture;

  @override
  void initState() {
    super.initState();
    _teamsFuture = _teamService.getTeams();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Teams'),
          SportLayout.spacer(),
          FutureBuilder<List<Team>>(
            future: _teamsFuture,
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
                  child: SportTypography.body('No teams available'),
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
                      child: InkWell(
                        onTap: () {
                          // Navigate to team details
                        },
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
                                    SportLayout.spacer(height: 4),
                                    Row(
                                      children: [
                                        _buildStatItem('W', team.wins.toString()),
                                        _buildStatItem('D', team.draws.toString()),
                                        _buildStatItem('L', team.losses.toString()),
                                        _buildStatItem('Pts', team.points.toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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

  Widget _buildStatItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          SportTypography.caption(label),
          SportTypography.body(value),
        ],
      ),
    );
  }
}
