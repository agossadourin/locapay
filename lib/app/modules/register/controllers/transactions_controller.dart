import 'package:get/get.dart';
import 'package:locapay/app/data/models/transaction_model.dart';

class TransactionsController extends GetxController {
  RxList<TransactionModel> transactions = RxList<TransactionModel>();
}
