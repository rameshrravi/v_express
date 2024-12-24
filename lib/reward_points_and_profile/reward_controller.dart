import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RewardPointsController extends GetxController {
  final totalPoints = 1250.obs;
  final pendingPoints = 150.obs;
  final recentTransactions = <Transaction>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
  }

  void loadTransactions() {
    recentTransactions.value = [
      Transaction(
        id: '1',
        points: 100,
        type: TransactionType.earned,
        description: 'Bus Booking - Chennai to Bangalore',
        date: DateTime.now().subtract(Duration(days: 2)),
      ),
      Transaction(
        id: '2',
        points: 50,
        type: TransactionType.spent,
        description: 'Discount Redemption',
        date: DateTime.now().subtract(Duration(days: 5)),
      ),
      // Add more transactions
    ];
  }
}

enum TransactionType { earned, spent }

class Transaction {
  final String id;
  final int points;
  final TransactionType type;
  final String description;
  final DateTime date;

  Transaction({
    required this.id,
    required this.points,
    required this.type,
    required this.description,
    required this.date,
  });
}
