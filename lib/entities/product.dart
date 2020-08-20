import 'package:esell/models/discount.model.dart';
import 'package:esell/models/product.model.dart';
import 'package:esell/entities/discount.dart';

class Product implements ProductModel {
  String id,
      name,
      brand,
      article,
      category,
      price,
      gender,
      deliveryTime,
      seller;
  String sizes, colors, stock;
  ProductMediaModel media;
  Map description;
  String timestamp;
  String sellerId;
  String paymentMethod;
  DiscountModel discount;
  Rating rating;

  Product.fromJson(json) {
    this.id = json['_id'];
    this.name = json['name'];
    this.brand = json['brand'];
    this.seller = json['seller'];
    this.article = json['article'];
    this.category = json['category'];
    this.stock = json['stock'];
    this.price = json['price'];
    this.colors = json['colors'];
    this.sizes = json['sizes'];
    this.media = ProductMedia.fromJson(json['media']);
    this.gender = json['gender'];
    this.description = json['description'];
    this.paymentMethod = json['paymentMethod'];
    this.sellerId = json['sellerId'];
    this.timestamp = json['timestamp'];
    this.deliveryTime = json['deliveryTime'];
    this.discount = Discount.fromJson(json['discount']);
    this.rating = Rating.fromJson(json['rating']);
  }

  toJson() => {
        '_id': this.id,
        'name': this.name,
        'brand': this.brand,
        'seller': this.seller,
        'article': this.article,
        'category': this.category,
        'stock': this.stock,
        'price': this.price,
        'colors': this.colors,
        'sizes': this.sizes,
        'media': this.media.toJson(),
        'gender': this.gender,
        'description': this.description,
        'paymentMethod': this.paymentMethod,
        'sellerId': this.sellerId,
        'timestamp': this.timestamp,
        'deliveryTime': this.deliveryTime,
        'discount': this.discount.toJson(),
        'rating': this.rating.toJson(),
      };
}

class Rating {
  double rate;
  int count;
  Rating({this.rate, this.count});
  Rating.fromJson(json)
      : this.rate = json != null ? json['rate'] ?? 0 : 0,
        this.count = json != null ? json['count'] ?? 0 : 0;
  toJson() => {'rate': this.rate, 'count': this.count};
}

class ProductMedia implements ProductMediaModel {
  String front, back, left, right, top, bottom;

  ProductMedia.fromJson(json)
      : this.front = json['front'],
        this.back = json['back'],
        this.left = json['left'],
        this.right = json['right'],
        this.top = json['top'],
        this.bottom = json['bottom'];

  toJson() => {
        if (front != null) 'front': front,
        if (back != null) 'back': back,
        if (left != null) 'left': left,
        if (right != null) 'right': right,
        if (top != null) 'top': top,
        if (bottom != null) 'bottom': bottom,
      };

  int get length {
    int len = 0;
    if (this.front != null) len++;
    if (this.back != null) len++;
    if (this.left != null) len++;
    if (this.right != null) len++;
    if (this.top != null) len++;
    if (this.bottom != null) len++;
    return len;
  }
}

class TopWearDescription implements TopWearDescriptionModel {
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
  TopWearDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.fabric = json['fabric'],
        this.pattern = json['pattern'],
        this.neck = json['neck'],
        this.sleeve = json['sleeve'],
        this.hooded = json['hooded'],
        this.reversible = json['reversible'],
        this.occasion = json['occasion'];
}

class BottomWearDescription implements BottomWearDescriptionModel {
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
  BottomWearDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.fabric = json['fabric'],
        this.faded = json['faded'],
        this.rise = json['rise'],
        this.distressed = json['distressed'],
        this.fit = json['fit'],
        this.reversible = json['reversible'],
        this.occasion = json['occasion'],
        this.pocketType = json['pocketType'],
        this.closure = json['closure'],
        this.stretchable = json['stretchable'],
        this.fly = json['fly'];
}

class FootWearDescription implements FootWearDescriptionModel {
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

  FootWearDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.innerMaterial = json['innerMaterial'],
        this.soleMaterial = json['soleMaterial'],
        this.closure = json['closure'],
        this.occasion = json['occasion'],
        this.pattern = json['pattern'],
        this.tipShape = json['tipShape'];
}

class BagsDescription implements BagsDescriptionModel {
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

  BagsDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.material = json['material'],
        this.noOfCompartments = json['noOfCompartments'],
        this.noOfPockets = json['noOfPockets'],
        this.width = json['width'],
        this.height = json['height'],
        this.closure = json['closure'],
        this.size = json['size'];
}

class WatchesDescription implements WatchesDescriptionModel {
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
  WatchesDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.occasion = json['occasion'],
        this.display = json['display'],
        this.watchType = json['watchType'],
        this.dialColor = json['dialColor'],
        this.strapColor = json['strapColor'],
        this.strapMaterial = json['strapMaterial'],
        this.strapType = json['strapType'],
        this.strapDesign = json['strapDesign'],
        this.caseMaterial = json['caseMaterial'],
        this.waterResistant = json['waterResistant'],
        this.shockResistant = json['shockResistant'],
        this.mechanism = json['mechanism'],
        this.diameter = json['diameter'],
        this.noveltyFeatures = json['noveltyFeatures'],
        this.claspType = json['claspType'],
        this.powerSource = json['powerSource'],
        this.dualTime = json['dualTime'],
        this.worldTime = json['worldTime'],
        this.light = json['light'],
        this.gps = json['gps'],
        this.tourbillion = json['tourbillion'],
        this.moonPhase = json['moonPhase'];
}

class GlassDescription implements GlassDescriptionModel {
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

  GlassDescription.fromJson(json)
      : this.careInstructions = json['careInstructions'],
        this.details = json['details'],
        this.warranty = json['warranty'],
        this.disclaimer = json['disclaimer'],
        this.perfectFor = json['perfectFor'],
        this.style = json['style'],
        this.occasion = json['occasion'],
        this.purpose = json['purpose'],
        this.lensColor = json['lensColor'],
        this.lensMaterial = json['lensMaterial'],
        this.features = json['features'],
        this.type = json['type'],
        this.frame = json['frame'],
        this.frameMaterial = json['frameMaterial'],
        this.frameColor = json['frameColor'],
        this.faceType = json['faceType'],
        this.uvProtection = json['uvProtection'],
        this.caseType = json['caseType'],
        this.size = GlassSize.fromJson(json['size']);
}

class GlassSize implements GlassSizeModel {
  String bridge, horizontalWidth, verticalHeight, frameArmLength;
  GlassSize.fromJson(json)
      : this.bridge = json['bridge'],
        this.horizontalWidth = json['horizontalWidth'],
        this.verticalHeight = json['verticalHeight'],
        this.frameArmLength = json['frameArmLength'];
}
