import 'package:esell/data/discount.model.dart';

class Discount implements DiscountModel {
  String percent, discountedPrice;
  Discount.fromJson(json)
      : this.percent = json['percent'],
        this.discountedPrice = json['discountedPrice'];
}
