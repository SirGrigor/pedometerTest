import '../models/match.dart';

class MatchService {
  Future<List<Match>> getLiveMatches() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Return mock data
    return [
      Match(
        id: '1',
        homeTeam: 'Manchester United',
        awayTeam: 'Liverpool',
        homeScore: 2,
        awayScore: 1,
        league: 'Premier League',
        matchTime: '75\'',
        matchDate: '2025-03-31',
        homeImageUrl: 'https://via.placeholder.com/150',
        awayImageUrl: 'https://via.placeholder.com/150',
        homePossession: 45,
        awayPossession: 55,
        isLive: true,
      ),
      Match(
        id: '2',
        homeTeam: 'Barcelona',
        awayTeam: 'Real Madrid',
        homeScore: 0,
        awayScore: 0,
        league: 'La Liga',
        matchTime: '32\'',
        matchDate: '2025-03-31',
        homeImageUrl: 'https://via.placeholder.com/150',
        awayImageUrl: 'https://via.placeholder.com/150',
        homePossession: 60,
        awayPossession: 40,
        isLive: true,
      ),
      Match(
        id: '3',
        homeTeam: 'Bayern Munich',
        awayTeam: 'Borussia Dortmund',
        homeScore: 3,
        awayScore: 2,
        league: 'Bundesliga',
        matchTime: '88\'',
        matchDate: '2025-03-31',
        homeImageUrl: 'https://via.placeholder.com/150',
        awayImageUrl: 'https://via.placeholder.com/150',
        homePossession: 52,
        awayPossession: 48,
        isLive: true,
      ),
    ];
  }

  Future<List<Match>> getUpcomingMatches() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Return mock data
    return [
      Match(
        id: '4',
        homeTeam: 'Arsenal',
        awayTeam: 'Chelsea',
        homeScore: 0,
        awayScore: 0,
        league: 'Premier League',
        matchTime: '',
        matchDate: 'Apr 2, 2025 • 15:00',
        homeImageUrl: 'https://via.placeholder.com/150',
        awayImageUrl: 'https://via.placeholder.com/150',
        homePossession: 0,
        awayPossession: 0,
        isLive: false,
      ),
      Match(
        id: '5',
        homeTeam: 'Juventus',
        awayTeam: 'AC Milan',
        homeScore: 0,
        awayScore: 0,
        league: 'Serie A',
        matchTime: '',
        matchDate: 'Apr 3, 2025 • 20:45',
        homeImageUrl: 'https://via.placeholder.com/150',
        awayImageUrl: 'https://via.placeholder.com/150',
        homePossession: 0,
        awayPossession: 0,
        isLive: false,
      ),
    ];
  }
}
