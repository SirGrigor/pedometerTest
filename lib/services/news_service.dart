import '../models/news_article.dart';

class NewsService {
  Future<List<NewsArticle>> getLatestNews() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    
    // Return mock data
    return [
      NewsArticle(
        id: '1',
        title: 'Manchester United Secures Dramatic Win Against Liverpool',
        summary: 'A last-minute goal gives United the victory in a thrilling match at Old Trafford.',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.',
        imageUrl: 'https://via.placeholder.com/800x400',
        source: 'Sports News',
        publishedDate: 'Mar 31, 2025',
      ),
      NewsArticle(
        id: '2',
        title: 'Barcelona and Real Madrid Set for El Clásico Showdown',
        summary: 'The two Spanish giants prepare for their highly anticipated match this weekend.',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.',
        imageUrl: 'https://via.placeholder.com/800x400',
        source: 'Football Today',
        publishedDate: 'Mar 30, 2025',
      ),
      NewsArticle(
        id: '3',
        title: 'Kylian Mbappé Scores Hat-trick in Real Madrid Debut',
        summary: 'The French superstar makes an immediate impact at his new club with three goals.',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.',
        imageUrl: 'https://via.placeholder.com/800x400',
        source: 'Goal.com',
        publishedDate: 'Mar 29, 2025',
      ),
      NewsArticle(
        id: '4',
        title: 'Bayern Munich Extends Lead in Bundesliga with Convincing Win',
        summary: 'The German champions move further ahead in the title race after defeating Dortmund.',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl. Nullam euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, quis aliquam nisl nunc eu nisl.',
        imageUrl: 'https://via.placeholder.com/800x400',
        source: 'Bundesliga News',
        publishedDate: 'Mar 28, 2025',
      ),
    ];
  }
}
