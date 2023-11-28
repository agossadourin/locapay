class TransactionModel {
  final String userId;
  final String amount;
  final String type;
  final String transactionId;
  final String reason;
  final String updatedAt;
  final String createdAt;
  final int id;
  final double balance;

  TransactionModel({
    required this.userId,
    required this.amount,
    required this.type,
    required this.transactionId,
    required this.reason,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.balance,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      userId: json['user_id'],
      amount: json['amount'],
      type: json['type'],
      transactionId: json['transaction_id'],
      reason: json['reason'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      id: json['id'],
      balance: json['balance'].toDouble(),
    );
  }
}
