import 'package:esell/models/discount.model.dart';

class Discount implements DiscountModel {
  String percent, discountedPrice;
  Discount.fromJson(json)
      : this.percent = json != null ? json['percent'] : null,
        this.discountedPrice = json != null ? json['discountedPrice'] : null;

  toJson() => {
        'percent': this.percent,
        'discountedPrice': this.discountedPrice,
      };
}
