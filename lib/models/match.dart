class Match {
  final String id;
  final String homeTeam;
  final String awayTeam;
  final int homeScore;
  final int awayScore;
  final String league;
  final String matchTime;
  final String matchDate;
  final String homeImageUrl;
  final String awayImageUrl;
  final double homePossession;
  final double awayPossession;
  final bool isLive;

  Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.homeScore,
    required this.awayScore,
    required this.league,
    required this.matchTime,
    required this.matchDate,
    required this.homeImageUrl,
    required this.awayImageUrl,
    required this.homePossession,
    required this.awayPossession,
    required this.isLive,
  });
}
