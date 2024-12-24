import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:v_express/reward_points_and_profile/reward_controller.dart';

class RewardPointsScreen extends StatelessWidget {
  final controller = Get.put(RewardPointsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3498DB), Color(0xFFF5F6FA)],
            stops: [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildPointsCard(),
                      SizedBox(height: 24),
                      _buildQuickActions(),
                      SizedBox(height: 24),
                      _buildTransactionsList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: true,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Reward Points',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ).animate()
          .fadeIn(duration: 600.ms)
          .slideX(begin: -0.2, end: 0),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF3498DB), Colors.transparent],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPointsCard() {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
          ),
        ),
        child: Column(
          children: [
            Obx(() => Text(
              '${controller.totalPoints} Points',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            )),
            SizedBox(height: 8),
            Obx(() => Text(
              '${controller.pendingPoints} Points Pending',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            )),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: 0.7,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 8),
            Text(
              '250 points until next reward',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ).animate()
        .fadeIn(duration: 800.ms)
        .scale(begin: Offset(0.9, 0.9), end: Offset(1, 1)),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton(
          icon: Icons.card_giftcard,
          label: 'Redeem',
          onTap: () {},
        ),
        _buildActionButton(
          icon: Icons.history,
          label: 'History',
          onTap: () {},
        ),
        _buildActionButton(
          icon: Icons.info_outline,
          label: 'How it Works',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 100,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Color(0xFF3498DB), size: 28),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: Color(0xFF2C3E50),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ).animate()
      .fadeIn(duration: 600.ms)
      .slideY(begin: 0.2, end: 0);
  }

  Widget _buildTransactionsList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activity',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        SizedBox(height: 16),
        Obx(() => Column(
          children: controller.recentTransactions.asMap().entries.map((entry) {
            final index = entry.key;
            final transaction = entry.value;
            return _buildTransactionCard(transaction, index);
          }).toList(),
        )),
      ],
    );
  }

  Widget _buildTransactionCard(Transaction transaction, int index) {
    final isEarned = transaction.type == TransactionType.earned;
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isEarned ? Color(0xFF2ECC71) : Color(0xFFE74C3C),
            shape: BoxShape.circle,
          ),
          child: Icon(
            isEarned ? Icons.add : Icons.remove,
            color: Colors.white,
          ),
        ),
        title: Text(
          transaction.description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        subtitle: Text(
          DateFormat('MMM dd, yyyy').format(transaction.date),
          style: TextStyle(color: Color(0xFF7F8C8D)),
        ),
        trailing: Text(
          '${isEarned ? '+' : '-'}${transaction.points}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isEarned ? Color(0xFF2ECC71) : Color(0xFFE74C3C),
          ),
        ),
      ),
    ).animate()
      .fadeIn(delay: Duration(milliseconds: 100 * index))
      .slideX(begin: 0.2, end: 0);
  }
}