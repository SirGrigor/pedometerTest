import 'package:flutter/material.dart';
import '../../shared/sport_theme/components/typography.dart';
import '../../shared/sport_theme/components/cards.dart';
import '../../shared/sport_theme/components/images.dart';
import '../../shared/sport_theme/components/layout.dart';
import '../../models/news_article.dart';
import '../../services/news_service.dart';

class NewsTab extends StatefulWidget {
  const NewsTab({Key? key}) : super(key: key);

  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  final NewsService _newsService = NewsService();
  late Future<List<NewsArticle>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = _newsService.getLatestNews();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SportTypography.heading('Latest News'),
          SportLayout.spacer(),
          FutureBuilder<List<NewsArticle>>(
            future: _newsFuture,
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
                  child: SportTypography.body('No news available'),
                );
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final article = snapshot.data![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: InkWell(
                        onTap: () {
                          // Navigate to article details
                        },
                        child: SportCards.scoreCard(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SportImages.banner(
                                imageUrl: article.imageUrl,
                                height: 160,
                              ),
                              SportLayout.spacer(height: 12),
                              SportTypography.subheading(article.title),
                              SportLayout.spacer(height: 8),
                              SportTypography.body(article.summary),
                              SportLayout.spacer(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SportTypography.caption(article.source),
                                  SportTypography.caption(article.publishedDate),
                                ],
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
}
