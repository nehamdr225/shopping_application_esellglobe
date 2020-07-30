import 'package:esell/models/discount.model.dart';

abstract class ProductModel<T> {
  String id, name, brand, article, category, price, gender, deliveryTime;
  String sizes, colors, stock;
  ProductMediaModel media;
  T description;
  String timestamp;
  String sellerId;
  String paymentMethod;
  DiscountModel discount;
}

abstract class ProductMediaModel {
  String front, back, left, right, top, bottom;
}

abstract class TopWearDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      fabric,
      pattern,
      neck,
      sleeve,
      hooded,
      reversible,
      occasion;
}

abstract class BottomWearDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      fabric,
      faded,
      rise,
      distressed,
      fit,
      reversible,
      occasion,
      pocketType,
      closure,
      stretchable,
      fly;
}

abstract class FootWearDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      innerMaterial,
      soleMaterial,
      closure,
      occasion,
      pattern,
      tipShape;
}

abstract class BagsDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      material,
      noOfCompartments,
      noOfPockets,
      width,
      height,
      closure,
      size;
}

abstract class WatchesDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      occasion,
      display,
      watchType,
      dialColor,
      strapColor,
      strapMaterial,
      strapType,
      strapDesign,
      caseMaterial,
      waterResistant,
      shockResistant,
      mechanism,
      diameter,
      noveltyFeatures,
      powerSource,
      claspType;
  bool dualTime, worldTime, light, gps, tourbillion, moonPhase;
}

abstract class GlassDescriptionModel {
  String warranty,
      careInstructions,
      details,
      disclaimer,
      perfectFor,
      style,
      occasion,
      purpose,
      lensColor,
      lensMaterial,
      features,
      type,
      frame,
      frameMaterial,
      frameColor,
      faceType,
      uvProtection,
      caseType;
  GlassSizeModel size;
}

abstract class GlassSizeModel {
  String bridge, horizontalWidth, verticalHeight, frameArmLength;
}
