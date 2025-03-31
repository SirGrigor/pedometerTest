class Team {
  final String id;
  final String name;
  final String league;
  final String logoUrl;
  final int wins;
  final int draws;
  final int losses;
  final int points;

  Team({
    required this.id,
    required this.name,
    required this.league,
    required this.logoUrl,
    required this.wins,
    required this.draws,
    required this.losses,
    required this.points,
  });
}
