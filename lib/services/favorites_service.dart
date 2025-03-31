import '../models/team.dart';
import '../models/player.dart';

class FavoritesService {
  // Mock favorite teams
  final List<Team> _favoriteTeams = [
    Team(
      id: '1',
      name: 'Manchester United',
      league: 'Premier League',
      logoUrl: 'https://via.placeholder.com/150',
      wins: 18,
      draws: 5,
      losses: 7,
      points: 59,
    ),
    Team(
      id: '3',
      name: 'Barcelona',
      league: 'La Liga',
      logoUrl: 'https://via.placeholder.com/150',
      wins: 22,
      draws: 4,
      losses: 4,
      points: 70,
    ),
  ];

  // Mock favorite players
  final List<Player> _favoritePlayers = [
    Player(
      id: '1',
      name: 'Lionel Messi',
      position: 'Forward',
      team: 'Inter Miami',
      imageUrl: 'https://via.placeholder.com/150',
      goals: 15,
      assists: 12,
    ),
    Player(
      id: '4',
      name: 'Kylian Mbappé',
      position: 'Forward',
      team: 'Real Madrid',
      imageUrl: 'https://via.placeholder.com/150',
      goals: 22,
      assists: 7,
    ),
  ];

  Future<List<Team>> getFavoriteTeams() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return List.from(_favoriteTeams);
  }

  Future<List<Player>> getFavoritePlayers() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return List.from(_favoritePlayers);
  }

  Future<List<Team>> removeFavoriteTeam(String teamId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    _favoriteTeams.removeWhere((team) => team.id == teamId);
    return List.from(_favoriteTeams);
  }

  Future<List<Player>> removeFavoritePlayer(String playerId) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    _favoritePlayers.removeWhere((player) => player.id == playerId);
    return List.from(_favoritePlayers);
  }

  Future<List<Team>> addFavoriteTeam(Team team) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    if (!_favoriteTeams.any((t) => t.id == team.id)) {
      _favoriteTeams.add(team);
    }
    return List.from(_favoriteTeams);
  }

  Future<List<Player>> addFavoritePlayer(Player player) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 500));
    if (!_favoritePlayers.any((p) => p.id == player.id)) {
      _favoritePlayers.add(player);
    }
    return List.from(_favoritePlayers);
  }
}
