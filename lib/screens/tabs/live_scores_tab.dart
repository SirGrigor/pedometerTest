import 'package:flutter/material.dart';
import '../../shared/sport_theme/components/typography.dart';
import '../../shared/sport_theme/components/cards.dart';
import '../../shared/sport_theme/components/sport_specific.dart';
import '../../shared/sport_theme/components/layout.dart';
import '../../shared/sport_theme/components/badges.dart';
import '../../shared/sport_theme/colors.dart';
import '../../shared/sport_theme/enums.dart';
import '../../models/match.dart';
import '../../services/match_service.dart';

class LiveScoresTab extends StatefulWidget {
  const LiveScoresTab({Key? key}) : super(key: key);

  @override
  _LiveScoresTabState createState() => _LiveScoresTabState();
}

class _LiveScoresTabState extends State<LiveScoresTab> {
  final MatchService _matchService = MatchService();
  late Future<List<Match>> _matchesFuture;

  @override
  void initState() {
    super.initState();
    _matchesFuture = _matchService.getLiveMatches();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Live Matches'),
          SportLayout.spacer(),
          FutureBuilder<List<Match>>(
            future: _matchesFuture,
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
                  child: SportTypography.body('No live matches at the moment'),
                );
              } else {
                return Column(
                  children: snapshot.data!.map((match) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SportCards.scoreCard(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SportTypography.caption(match.league),
                                SportBadges.statusBadge(
                                  text: 'LIVE',
                                  status: BadgeStatus.success,
                                ),
                              ],
                            ),
                            SportLayout.spacer(height: 8),
                            SportSpecific.scoreBoard(
                              homeTeam: match.homeTeam,
                              awayTeam: match.awayTeam,
                              homeScore: match.homeScore.toString(),
                              awayScore: match.awayScore.toString(),
                              homeImageUrl: match.homeImageUrl,
                              awayImageUrl: match.awayImageUrl,
                            ),
                            SportLayout.spacer(height: 8),
                            SportSpecific.matchTimer(
                              time: match.matchTime,
                              isLive: true,
                            ),
                            SportLayout.divider(),
                            SportSpecific.statBar(
                              label: 'Possession',
                              homeValue: match.homePossession,
                              awayValue: match.awayPossession,
                              homeLabel: '${match.homePossession.toInt()}%',
                              awayLabel: '${match.awayPossession.toInt()}%',
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
          SportLayout.spacer(),
          SportTypography.heading('Upcoming Matches'),
          SportLayout.spacer(),
          FutureBuilder<List<Match>>(
            future: _matchService.getUpcomingMatches(),
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
                  child: SportTypography.body('No upcoming matches'),
                );
              } else {
                return Column(
                  children: snapshot.data!.map((match) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: SportCards.scoreCard(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SportTypography.caption(match.league),
                                SportTypography.caption(match.matchDate),
                              ],
                            ),
                            SportLayout.spacer(height: 8),
                            SportSpecific.scoreBoard(
                              homeTeam: match.homeTeam,
                              awayTeam: match.awayTeam,
                              homeScore: '-',
                              awayScore: '-',
                              homeImageUrl: match.homeImageUrl,
                              awayImageUrl: match.awayImageUrl,
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
