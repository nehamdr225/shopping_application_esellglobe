enum Gender { male, female }

extension GenderGetterExtension on Gender {
  String get getValue {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      default:
        return null;
    }
  }

  Gender fromValue(String value) {
    switch (value) {
      case 'male':
        return Gender.male;
      case 'female':
        return Gender.female;
      default:
        return null;
    }
  }
}

enum MainCategories {
  top,
  bottom,
  foot,
  glasses,
  bags,
  watches,
  seasonal,
  inner
}

extension MainGetterExtension on MainCategories {
  String get getValue {
    switch (this) {
      case MainCategories.bags:
        return 'Bags & Backpacks';
      case MainCategories.bottom:
        return 'Bottom Wear';
      case MainCategories.foot:
        return 'Foot Wear';
      case MainCategories.glasses:
        return 'Sunglasses';
      case MainCategories.inner:
        return 'Inner Wear';
      case MainCategories.seasonal:
        return 'Seasonal Wear';
      case MainCategories.top:
        return 'Top Wear';
      case MainCategories.watches:
        return 'Watches';
      default:
        return null;
    }
  }

  MainCategories fromValue(String value) {
    switch (value) {
      case 'Bags & Backpacks':
        return MainCategories.bags;
      case 'Bottom Wear':
        return MainCategories.bottom;
      case 'Foot Wear':
        return MainCategories.foot;
      case 'Sunglasses':
        return MainCategories.glasses;

      default:
        return null;
    }
  }
}

enum SubCategoryTop { casualShirts, formalShirts, tShirts, jackets }

extension TopGetterExtension on SubCategoryTop {
  String get getValue {
    switch (this) {
      case SubCategoryTop.casualShirts:
        return 'Casual Shirts';
      case SubCategoryTop.formalShirts:
        return 'Formal Shirts';
      case SubCategoryTop.jackets:
        return 'Jackets';
      case SubCategoryTop.tShirts:
        return 'T-Shirts';
      default:
        return null;
    }
  }

  SubCategoryTop fromValue(String value) {
    switch (value) {
      case 'Casual Shirts':
        return SubCategoryTop.casualShirts;
      case 'Formal Shirts':
        return SubCategoryTop.formalShirts;
      case 'Jackets':
        return SubCategoryTop.jackets;
      case 'T-Shirts':
        return SubCategoryTop.tShirts;
      default:
        return null;
    }
  }
}

enum SubCategoryBottom { jeansPants, formalPants, sportsWear }

extension BottomGetterExtension on SubCategoryBottom {
  String get getValue {
    switch (this) {
      case SubCategoryBottom.formalPants:
        return 'Formal Pants';
      case SubCategoryBottom.jeansPants:
        return 'Jeans Pants';
      case SubCategoryBottom.sportsWear:
        return 'Track/Sports Wear';
      default:
        return null;
    }
  }

  SubCategoryBottom fromValue(String value) {
    switch (value) {
      case 'Formal Pants':
        return SubCategoryBottom.formalPants;
      case 'Jeans Pants':
        return SubCategoryBottom.jeansPants;
      case 'Track/Sports Wear':
        return SubCategoryBottom.sportsWear;
      default:
        return null;
    }
  }
}

enum SubCategoryFoot { casualShoes, formalShoes, sportsShoes, slippers }

extension FootGetterExtension on SubCategoryFoot {
  String get getValue {
    switch (this) {
      case SubCategoryFoot.casualShoes:
        return 'Casual Shoes';
      case SubCategoryFoot.formalShoes:
        return 'Formal Shoes';
      case SubCategoryFoot.slippers:
        return 'Slippers & Sandals';
      case SubCategoryFoot.sportsShoes:
        return 'Sports Shoes';
      default:
        return null;
    }
  }

  SubCategoryFoot fromValue(String value) {
    switch (value) {
      case 'Casual Shoes':
        return SubCategoryFoot.casualShoes;
      case 'Formal Shoes':
        return SubCategoryFoot.formalShoes;
      case 'Slippers & Sandals':
        return SubCategoryFoot.slippers;
      case 'Sports Shoes':
        return SubCategoryFoot.sportsShoes;
      default:
        return null;
    }
  }
}

enum SubCategoryInner { briefs, vests, boxers, thermals }

extension InnerGetterExtension on SubCategoryInner {
  String get getValue {
    switch (this) {
      default:
        return null;
    }
  }

  fromValue(String value) {
    switch (value) {
      default:
        return null;
    }
  }
}

enum SubCategorySeasonal { sweaters, jackets, sweats, thermals, rainCoats }

extension SeasonalGetterExtension on SubCategorySeasonal {
  String get getValue {
    switch (this) {
      default:
        return null;
    }
  }

  fromValue(String value) {
    switch (value) {
      default:
        return null;
    }
  }
}
