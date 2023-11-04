import 'package:rinjani_visitor/features/product/domain/addon_model.dart';
import 'package:rinjani_visitor/features/product/domain/product_model.dart';

final mockPackages = [
  const ProductModel(
      packageId: "1",
      title: "Rinjani Trip Deluxe",
      location: "Lombok, Indonesia",
      imgUrl: "assets/rinjani.jpeg",
      rangePricing: "190-225\$ / person",
      rating: "4,8",
      tripDuration: "2 days - 1 night",
      description:
          "The best rinjani hiking package we can offer. \nThis package provides a tent, 6 cm mattress, pillow, tent toilet, chairs, table and walking stick.",
      accomodation:
          "Includes accommodation, 1 night preparation before tracking, and pick-up from the airport",
      reviewCount: 34,
      initenaryList: [
        "20.00 - Preparing for tracking tomorrow"
      ],
      timeList24H: [
        "16.00"
      ],
      addOn: [
        AddOnModel(
            name: "Replace porter with guide",
            description: "replace your porter with guide. max 4 people",
            pricing: "35\$",
            id: "123"),
      ]),
  const ProductModel(
      packageId: "2",
      title: "Rinjani Trip Standard",
      location: "Lombok, Indonesia",
      imgUrl: "assets/rinjani.jpeg",
      rangePricing: "180-200\$ / person",
      rating: "4,8",
      tripDuration: "2 days - 1 night",
      description:
          "Best middle range package. This package provides a tent, 4 cm mattress, pillow, tent toilet, chairs, and walking stick.",
      accomodation:
          "Includes accommodation, 1 night preparation before tracking, and pick-up from the airport",
      reviewCount: 28,
      initenaryList: [
        "20.00 - Preparing for tracking tomorrow"
      ],
      timeList24H: [
        "16.00"
      ],
      addOn: [
        AddOnModel(
            name: "Replace porter with guide",
            description: "replace your porter with guide. max 4 people",
            pricing: "20\$",
            id: "456"),
      ]),
  const ProductModel(
      packageId: "3",
      title: "Rinjani Trip Sharing",
      location: "Lombok, Indonesia",
      imgUrl: "assets/rinjani.jpeg",
      rangePricing: "130-160\$ / person",
      rating: "4,8",
      tripDuration: "2 days - 1 night",
      description:
          "Best shared rinjani trip package. This package provides a tent, 2 cm mattress, tent toilet, and sleeping bag",
      accomodation:
          "Includes accommodation, 1 night preparation before tracking, and pick-up from the airport for more than 3 people",
      reviewCount: 12,
      initenaryList: [
        "20.00 - Preparing for tracking tomorrow"
      ],
      timeList24H: [
        "16.00"
      ],
      addOn: [
        AddOnModel(
            name: "Replace porter with guide",
            description: "replace your porter with guide for 6 or more people",
            pricing: "30\$",
            id: "456"),
      ])
];
