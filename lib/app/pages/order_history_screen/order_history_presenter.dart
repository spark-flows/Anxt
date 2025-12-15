import 'package:a_nxt/domain/domain.dart';

class OrderHistoryPresenter {
  OrderHistoryPresenter(this.homeUsecases, this.commonUsecases);

  final OrderHistoryUsecases homeUsecases;
  final CommonUsecases commonUsecases;
}
