import 'package:flutter/material.dart';
import '../shared/sport_theme/sport_components.dart';

class SportComponentsExample extends StatefulWidget {
  const SportComponentsExample({Key? key}) : super(key: key);

  @override
  _SportComponentsExampleState createState() => _SportComponentsExampleState();
}

class _SportComponentsExampleState extends State<SportComponentsExample> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();
  int _selectedTabIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports UI Components'),
        backgroundColor: SportColors.sportBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Typography examples
            SportTypography.heading('Sports UI Components'),
            SportTypography.subheading('Button Components'),
            
            // Button examples
            Row(
              children: [
                Expanded(
                  child: SportButtons.primaryButton(
                    text: 'Primary',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SportButtons.primaryButton(
                    text: 'Success',
                    onPressed: () {},
                    variant: ButtonVariant.success,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: SportButtons.primaryButton(
                    text: 'Danger',
                    onPressed: () {},
                    variant: ButtonVariant.danger,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SportButtons.primaryButton(
                    text: 'Warning',
                    onPressed: () {},
                    variant: ButtonVariant.warning,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SportButtons.iconButton(
                  icon: Icons.favorite,
                  onPressed: () {},
                ),
                SportButtons.iconButton(
                  icon: Icons.share,
                  onPressed: () {},
                ),
                SportButtons.iconButton(
                  icon: Icons.bookmark,
                  onPressed: () {},
                ),
              ],
            ),
            
            SportLayout.divider(),
            
            // Card examples
            SportTypography.subheading('Card Components'),
            
            SportCards.scoreCard(
              child: Column(
                children: [
                  SportTypography.caption('Premier League'),
                  const SizedBox(height: 8),
                  SportSpecific.scoreBoard(
                    homeTeam: 'Liverpool',
                    awayTeam: 'Man City',
                    homeScore: '2',
                    awayScore: '1',
                  ),
                ],
              ),
            ),
            
            SportCards.playerCard(
              name: 'Lionel Messi',
              position: 'Forward',
            ),
            
            SportCards.statsCard(
              child: Column(
                children: [
                  SportTypography.subheading('Match Stats'),
                  const SizedBox(height: 8),
                  SportSpecific.statBar(
                    label: 'Possession',
                    homeValue: 65,
                    awayValue: 35,
                    homeLabel: '65%',
                    awayLabel: '35%',
                  ),
                  const SizedBox(height: 8),
                  SportSpecific.statBar(
                    label: 'Shots',
                    homeValue: 12,
                    awayValue: 8,
                    homeLabel: '12',
                    awayLabel: '8',
                  ),
                ],
              ),
            ),
            
            SportLayout.divider(),
            
            // Input examples
            SportTypography.subheading('Input Components'),
            
            SportInputs.textField(
              controller: _textFieldController,
              labelText: 'Player Name',
              hintText: 'Enter player name',
            ),
            
            const SizedBox(height: 16),
            
            SportInputs.searchBar(
              controller: _searchController,
              onChanged: (value) {
                // Handle search
              },
              hintText: 'Search teams, players...',
            ),
            
            SportLayout.divider(),
            
            // List examples
            SportTypography.subheading('List Components'),
            
            SportLists.listItem(
              title: 'Premier League',
              subtitle: 'England',
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            
            SportLists.listItem(
              title: 'La Liga',
              subtitle: 'Spain',
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            
            SportTypography.subheading('Leaderboard'),
            
            SportLists.leaderboardItem(
              rank: 1,
              name: 'Arsenal',
              score: '72 pts',
            ),
            
            SportLists.leaderboardItem(
              rank: 2,
              name: 'Manchester City',
              score: '70 pts',
            ),
            
            SportLists.leaderboardItem(
              rank: 3,
              name: 'Liverpool',
              score: '67 pts',
            ),
            
            SportLayout.divider(),
            
            // Progress examples
            SportTypography.subheading('Progress Components'),
            
            SportProgress.progressBar(value: 0.7),
            
            const SizedBox(height: 16),
            
            SportProgress.activityIndicator(),
            
            SportLayout.divider(),
            
            // Badge examples
            SportTypography.subheading('Badge Components'),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SportBadges.notificationBadge(
                  count: '3',
                  child: Icon(Icons.notifications, size: 30),
                ),
                
                SportBadges.statusBadge(
                  text: 'LIVE',
                  status: BadgeStatus.error,
                ),
                
                SportBadges.statusBadge(
                  text: 'UPCOMING',
                  status: BadgeStatus.info,
                ),
                
                SportBadges.statusBadge(
                  text: 'FINISHED',
                  status: BadgeStatus.success,
                ),
              ],
            ),
            
            SportLayout.divider(),
            
            // Sport-specific examples
            SportTypography.subheading('Sport-Specific Components'),
            
            Center(
              child: SportSpecific.matchTimer(
                time: '67:23',
                isLive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SportButtons.floatingActionButton(
        icon: Icons.add,
        onPressed: () {},
      ),
      bottomNavigationBar: SportNavigation.tabBar(
        selectedIndex: _selectedTabIndex,
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        items: [
          TabItem(icon: Icons.home, label: 'Home'),
          TabItem(icon: Icons.sports_soccer, label: 'Matches'),
          TabItem(icon: Icons.leaderboard, label: 'Table'),
          TabItem(icon: Icons.person, label: 'Profile'),
        ],
      ),
    );
  }
}
