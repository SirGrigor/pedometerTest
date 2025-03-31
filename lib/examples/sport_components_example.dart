import 'package:flutter/material.dart';
import '../shared/sport_components.dart';

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
        backgroundColor: SportComponents.sportBlue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Typography examples
            SportComponents.Typography.heading('Sports UI Components'),
            SportComponents.Typography.subheading('Button Components'),
            
            // Button examples
            Row(
              children: [
                Expanded(
                  child: SportComponents.Buttons.primaryButton(
                    text: 'Primary',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SportComponents.Buttons.primaryButton(
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
                  child: SportComponents.Buttons.primaryButton(
                    text: 'Danger',
                    onPressed: () {},
                    variant: ButtonVariant.danger,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SportComponents.Buttons.primaryButton(
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
                SportComponents.Buttons.iconButton(
                  icon: Icons.favorite,
                  onPressed: () {},
                ),
                SportComponents.Buttons.iconButton(
                  icon: Icons.share,
                  onPressed: () {},
                ),
                SportComponents.Buttons.iconButton(
                  icon: Icons.bookmark,
                  onPressed: () {},
                ),
              ],
            ),
            
            SportComponents.Layout.divider(),
            
            // Card examples
            SportComponents.Typography.subheading('Card Components'),
            
            SportComponents.Cards.scoreCard(
              child: Column(
                children: [
                  SportComponents.Typography.caption('Premier League'),
                  const SizedBox(height: 8),
                  SportComponents.SportSpecific.scoreBoard(
                    homeTeam: 'Liverpool',
                    awayTeam: 'Man City',
                    homeScore: '2',
                    awayScore: '1',
                  ),
                ],
              ),
            ),
            
            SportComponents.Cards.playerCard(
              name: 'Lionel Messi',
              position: 'Forward',
            ),
            
            SportComponents.Cards.statsCard(
              child: Column(
                children: [
                  SportComponents.Typography.subheading('Match Stats'),
                  const SizedBox(height: 8),
                  SportComponents.SportSpecific.statBar(
                    label: 'Possession',
                    homeValue: 65,
                    awayValue: 35,
                    homeLabel: '65%',
                    awayLabel: '35%',
                  ),
                  const SizedBox(height: 8),
                  SportComponents.SportSpecific.statBar(
                    label: 'Shots',
                    homeValue: 12,
                    awayValue: 8,
                    homeLabel: '12',
                    awayLabel: '8',
                  ),
                ],
              ),
            ),
            
            SportComponents.Layout.divider(),
            
            // Input examples
            SportComponents.Typography.subheading('Input Components'),
            
            SportComponents.Inputs.textField(
              controller: _textFieldController,
              labelText: 'Player Name',
              hintText: 'Enter player name',
            ),
            
            const SizedBox(height: 16),
            
            SportComponents.Inputs.searchBar(
              controller: _searchController,
              onChanged: (value) {
                // Handle search
              },
              hintText: 'Search teams, players...',
            ),
            
            SportComponents.Layout.divider(),
            
            // List examples
            SportComponents.Typography.subheading('List Components'),
            
            SportComponents.Lists.listItem(
              title: 'Premier League',
              subtitle: 'England',
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            
            SportComponents.Lists.listItem(
              title: 'La Liga',
              subtitle: 'Spain',
              leading: Icon(Icons.sports_soccer),
              trailing: Icon(Icons.chevron_right),
              onTap: () {},
            ),
            
            SportComponents.Typography.subheading('Leaderboard'),
            
            SportComponents.Lists.leaderboardItem(
              rank: 1,
              name: 'Arsenal',
              score: '72 pts',
            ),
            
            SportComponents.Lists.leaderboardItem(
              rank: 2,
              name: 'Manchester City',
              score: '70 pts',
            ),
            
            SportComponents.Lists.leaderboardItem(
              rank: 3,
              name: 'Liverpool',
              score: '67 pts',
            ),
            
            SportComponents.Layout.divider(),
            
            // Progress examples
            SportComponents.Typography.subheading('Progress Components'),
            
            SportComponents.Progress.progressBar(value: 0.7),
            
            const SizedBox(height: 16),
            
            SportComponents.Progress.activityIndicator(),
            
            SportComponents.Layout.divider(),
            
            // Badge examples
            SportComponents.Typography.subheading('Badge Components'),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SportComponents.Badges.notificationBadge(
                  count: '3',
                  child: Icon(Icons.notifications, size: 30),
                ),
                
                SportComponents.Badges.statusBadge(
                  text: 'LIVE',
                  status: BadgeStatus.error,
                ),
                
                SportComponents.Badges.statusBadge(
                  text: 'UPCOMING',
                  status: BadgeStatus.info,
                ),
                
                SportComponents.Badges.statusBadge(
                  text: 'FINISHED',
                  status: BadgeStatus.success,
                ),
              ],
            ),
            
            SportComponents.Layout.divider(),
            
            // Sport-specific examples
            SportComponents.Typography.subheading('Sport-Specific Components'),
            
            Center(
              child: SportComponents.SportSpecific.matchTimer(
                time: '67:23',
                isLive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SportComponents.Buttons.floatingActionButton(
        icon: Icons.add,
        onPressed: () {},
      ),
      bottomNavigationBar: SportComponents.Navigation.tabBar(
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
