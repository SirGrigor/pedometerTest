import '../models/team.dart';

class TeamService {
  Future<List<Team>> getTeams() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Return mock data
    return [
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
        id: '2',
        name: 'Liverpool',
        league: 'Premier League',
        logoUrl: 'https://via.placeholder.com/150',
        wins: 20,
        draws: 6,
        losses: 4,
        points: 66,
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
      Team(
        id: '4',
        name: 'Real Madrid',
        league: 'La Liga',
        logoUrl: 'https://via.placeholder.com/150',
        wins: 21,
        draws: 5,
        losses: 4,
        points: 68,
      ),
      Team(
        id: '5',
        name: 'Bayern Munich',
        league: 'Bundesliga',
        logoUrl: 'https://via.placeholder.com/150',
        wins: 24,
        draws: 3,
        losses: 3,
        points: 75,
      ),
    ];
  }
}
