import 'package:flutter/material.dart';

class PropertiesModel extends ChangeNotifier {
  List<String> allProperties;
  properties(category) {
    if(category == 'Top Wear'){
      return allProperties = ['Fabric', 'Pattern', 'Neck', 'Sleeve', 'Hooded', 'Reversible', 'Occasion'];
    }else if(category == 'Bottom Wear'){
      return allProperties = ['Fabric', 'Faded', 'Rise', 'Distressed', 'Fit', 'Pocket Type', 'Reversible', 'Closure', 'Stretchable', 'Fly', 'Occasion'];
    }else if(category == 'Foot Wear'){
      return allProperties = ['Inner Material', 'Sole Material', 'Closure', 'Occasion', 'Pattern', 'Tip Shape'];
   
    }else if(category == 'Bags'){
      return allProperties = ['Material', 'Occasion', 'No. of Compartments', 'No. of Pockets', 'Width', 'Height', 'Closure', 'Size' ];
    }else if(category == 'Bottom Wear'){
      return allProperties = ['Fabric', 'Faded', 'Rise', 'Distressed', 'Fit', 'Pocket Type', 'Reversible', 'Closure', 'Stretchable', 'Fly', 'Occasion'];
    }else if(category == 'Watches'){
      return allProperties = ['Occasion', 'Display', 'Watch Type', 'Dial Color', 'Strap Color', 'Strap Material', 'Strap Type', 'Strap Design', 'Case Material', 'Water Resistant', 'Shock Resistant', 'Mechanism', 'Diameter', 'Dual Time', 'World Time', 'Novelty Features', 'Power Source', 'Light', 'GPS', 'Tour Billion', 'Clasp Type', 'Moon Phase'];
    }else{
      return allProperties = ['Occasion', 'Purpose', 'Lens Color', 'Lens Material', 'Feature', 'Type', 'Frame', 'Frame Material', 'Frame Color', 'Face Type', 'UV Protection', 'Case Type'];
    }
  }  
}
