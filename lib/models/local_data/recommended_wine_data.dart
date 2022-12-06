import '../main_wine_model.dart';

var recommendedWines = [
  Wine(
      id: 1,
      price: '100',
      title: 'Bold Smooth Lush',
      year: "2019",
      volume: "300cl",
      description:
          "A funky glint of smoke and yeast precedes rich notions of mirabelle and peach compote. The palate enforces this notion of rich sweet compote even more and adds a welcome lemony vein of freshness to it. There is great balance here between juicy ripe sweetish fruit and tangy uplifting freshness. The finish is off dry and generously fruited.",
      imagePath: './recommended_Wines/198.jpg',
      countryOfOrigin: 'France',
      rating: 5),
  Wine(
      id: 2,
      price: '35',
      title: "Joseph Cattin 2016 Hatschbourg Grand Cru Gewurztraminer (Alsace)",
      year: "1999",
      volume: "500ml",
      countryOfOrigin: "France",
      description:
          "A funky glint of smoke and yeast precedes rich notions of mirabelle and peach compote. The palate enforces this notion of rich sweet compote even more and adds a welcome lemony vein of freshness to it. There is great balance here between juicy ripe sweetish fruit and tangy uplifting freshness. The finish is off dry and generously fruited.",
      imagePath: './recommended_Wines/164.jpg',
      rating: 3),
  Wine(
      id: 3,
      price: '80',
      title: "Lachini 2015 Cuvée Giselle Pinot Noir (Chehalem Mountains)",
      year: "2015",
      volume: "530ml",
      countryOfOrigin: "US",
      description:
          "This barrel selection is loaded with tart cherry and blackberry fruit. Scents and accents bring hints of bread, butter, vanilla and coffee. The finish is lengthy and detailed, with no fall off in complexity. It was aged 18 months in roughly half new French oak.",
      imagePath: './recommended_Wines/165.jpg',
      rating: 4),
  Wine(
      id: 4,
      price: '65',
      title: "Lavinea 2014 Tualatin Estate Pinot Noir (Willamette Valley)",
      year: "2015",
      volume: "530ml",
      countryOfOrigin: "US",
      description:
          "Winemaker Isabelle Meunier (ex-Evening Land) has carefully selected a handful of sites for her first release of single-vineyard wines under this new label. This is perhaps the most elegant, with exceptional texture, color and overall finesse. Fruits are delicate and detailed, showing watermelon, salmonberry, strawberry and a bit of spice. The 30% new French oak aging adds a gentle kiss of cocoa. Drink now to 2030 and beyond.",
      imagePath: './recommended_Wines/166.jpg',
      rating: 4),
  Wine(
      id: 5,
      price: '65',
      title: "Lavinea 2014 Tualatin Estate Pinot Noir (Willamette Valley)",
      year: "2015",
      volume: "530ml",
      countryOfOrigin: "US",
      description:
          "Winemaker Isabelle Meunier (ex-Evening Land) has carefully selected a handful of sites for her first release of single-vineyard wines under this new label. This is perhaps the most elegant, with exceptional texture, color and overall finesse. Fruits are delicate and detailed, showing watermelon, salmonberry, strawberry and a bit of spice. The 30% new French oak aging adds a gentle kiss of cocoa. Drink now to 2030 and beyond.",
      imagePath: './recommended_Wines/167.jpg',
      rating: 5),
  Wine(
      id: 6,
      price: '100',
      title: "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
      year: "2017",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
      imagePath: './recommended_Wines/168.jpg',
      rating: 4),
  Wine(
      id: 7,
      price: '80',
      title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
      year: "2017",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
      imagePath: './recommended_Wines/169.jpg',
      rating: 4),
  Wine(
      id: 8,
      price: '500',
      title: "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
      year: "2017",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
      imagePath: './recommended_Wines/170.jpg',
      rating: 5),
  Wine(
      id: 9,
      price: '80',
      title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
      year: "2016",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
      imagePath: './recommended_Wines/171.jpg',
      rating: 4),
  Wine(
      id: 10,
      price: '80',
      title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
      year: "2017",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
      imagePath: './recommended_Wines/172.jpg',
      rating: 4),
  Wine(
      id: 11,
      price: '500',
      title: "Leo Steen Wines 2014 The Steen Chenin Blanc (Santa Ynez Valley)",
      year: "2017",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Danish sommelier-turned-winemaker Leo Hansen aims to make food-friendly wines, and this delicate Chenin is a great example. Light honey, candied lemon, lime pith and tangerine peel aromas show subtly on the nose. Sparkly acidity makes its clean and crisp nectarine, cherimoya and lime skin flavors pop, with pinpoint focus and a slight grip.",
      imagePath: './recommended_Wines/173.jpg',
      rating: 5),
  Wine(
      id: 12,
      price: '80',
      title: "Lobo 2014 Wulff Vineyards Cabernet Sauvignon (Atlas Peak)",
      year: "2016",
      volume: "720ml",
      countryOfOrigin: "US",
      description:
          "Blended with 8% Merlot and 6% Petit Verdot, this is a well-made wine from the mountain appellation. With integrated oak and a supportive undercurrent of acidity, it's rounded and rich in bright cherry fruit, the accents a mix of clove and graphite, finishing with balance.",
      imagePath: './recommended_Wines/174.jpg',
      rating: 4),
];
