import '../models/player.dart';

class PlayerService {
  Future<List<Player>> getTopPlayers() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Return mock data
    return [
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
        id: '2',
        name: 'Cristiano Ronaldo',
        position: 'Forward',
        team: 'Al Nassr',
        imageUrl: 'https://via.placeholder.com/150',
        goals: 18,
        assists: 5,
      ),
      Player(
        id: '3',
        name: 'Kevin De Bruyne',
        position: 'Midfielder',
        team: 'Manchester City',
        imageUrl: 'https://via.placeholder.com/150',
        goals: 8,
        assists: 16,
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
      Player(
        id: '5',
        name: 'Erling Haaland',
        position: 'Forward',
        team: 'Manchester City',
        imageUrl: 'https://via.placeholder.com/150',
        goals: 25,
        assists: 4,
      ),
      Player(
        id: '6',
        name: 'Virgil van Dijk',
        position: 'Defender',
        team: 'Liverpool',
        imageUrl: 'https://via.placeholder.com/150',
        goals: 3,
        assists: 1,
      ),
    ];
  }
}
