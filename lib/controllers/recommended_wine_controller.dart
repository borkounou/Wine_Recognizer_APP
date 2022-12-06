import 'package:get/get.dart';

import '../models/recommended_wine_model.dart';

class RecommendedWineController extends GetxController {
  final List<RecommendedWineModel> _recommendedWines = [
    RecommendedWineModel(
        id: 1,
        price: '100',
        title: 'Bold Smooth Lush',
        description:
            "A funky glint of smoke and yeast precedes rich notions of mirabelle and peach compote. The palate enforces this notion of rich sweet compote even more and adds a welcome lemony vein of freshness to it. There is great balance here between juicy ripe sweetish fruit and tangy uplifting freshness. The finish is off dry and generously fruited.",
        imagePath: './recommended_Wines/198.jpg',
        rating: 5),
    RecommendedWineModel(
        id: 2,
        price: '35',
        title:
            "Joseph Cattin 2016 Hatschbourg Grand Cru Gewurztraminer (Alsace)",
        description:
            "A funky glint of smoke and yeast precedes rich notions of mirabelle and peach compote. The palate enforces this notion of rich sweet compote even more and adds a welcome lemony vein of freshness to it. There is great balance here between juicy ripe sweetish fruit and tangy uplifting freshness. The finish is off dry and generously fruited.",
        imagePath: './recommended_Wines/164.jpg',
        rating: 3),
    RecommendedWineModel(
        id: 3,
        price: '80',
        title: "Lachini 2015 Cuvée Giselle Pinot Noir (Chehalem Mountains)",
        description:
            "This barrel selection is loaded with tart cherry and blackberry fruit. Scents and accents bring hints of bread, butter, vanilla and coffee. The finish is lengthy and detailed, with no fall off in complexity. It was aged 18 months in roughly half new French oak.",
        imagePath: './recommended_Wines/165.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 4,
        price: '65',
        title: "Lavinea 2014 Tualatin Estate Pinot Noir (Willamette Valley)",
        description:
            "Winemaker Isabelle Meunier (ex-Evening Land) has carefully selected a handful of sites for her first release of single-vineyard wines under this new label. This is perhaps the most elegant, with exceptional texture, color and overall finesse. Fruits are delicate and detailed, showing watermelon, salmonberry, strawberry and a bit of spice. The 30% new French oak aging adds a gentle kiss of cocoa. Drink now to 2030 and beyond.",
        imagePath: './recommended_Wines/166.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 5,
        price: '65',
        title: "Lavinea 2014 Tualatin Estate Pinot Noir (Willamette Valley)",
        description:
            "Winemaker Isabelle Meunier (ex-Evening Land) has carefully selected a handful of sites for her first release of single-vineyard wines under this new label. This is perhaps the most elegant, with exceptional texture, color and overall finesse. Fruits are delicate and detailed, showing watermelon, salmonberry, strawberry and a bit of spice. The 30% new French oak aging adds a gentle kiss of cocoa. Drink now to 2030 and beyond.",
        imagePath: './recommended_Wines/167.jpg',
        rating: 5),
    RecommendedWineModel(
        id: 6,
        price: '100',
        title:
            "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/168.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 7,
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/169.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 8,
        price: '500',
        title:
            "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/170.jpg',
        rating: 5),
    RecommendedWineModel(
        id: 9,
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/171.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 10,
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/172.jpg',
        rating: 4),
    RecommendedWineModel(
        id: 11,
        price: '500',
        title:
            "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
        description:
            "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
        imagePath: './recommended_Wines/173.jpg',
        rating: 5),
    RecommendedWineModel(
        id: 12,
        price: '80',
        title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
        description:
            "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
        imagePath: './recommended_Wines/174.jpg',
        rating: 4),
  ];

  List<RecommendedWineModel> get recommendedWines {
    return [..._recommendedWines];
  }

  List<RecommendedWineModel> get favouriteWine {
    return _recommendedWines
        .where((productItem) => productItem.isFavourite)
        .toList();
  }

  RecommendedWineModel findProductById(int id) {
    return _recommendedWines.firstWhere((element) => element.id == id);
  }

  void toggleFavoriteStatus(int id) {
    recommendedWines[id].isFavourite = !recommendedWines[id].isFavourite;
  }
}
