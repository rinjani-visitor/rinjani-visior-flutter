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
      ]),
  const ProductModel(
      packageId: "4",
      title: 'Maulid Adat Bayan',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description: 'The traditional birth of the Prophet Muhammad SAW is also called Mulud Adat, carried out for 2 days, the first day is Saturday, 31 October 2020, called Kayu Aiq Day/preparation day, and the second day is Sunday, 1 November 2020, which is called Gawe/peak. program.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "5",
      title: 'Lebaran Pandeq',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description: 'The traditional implementation of Eid al-Adha is also called Eid "Pendeq", Eid Pendeq is held for 2 days, the first day is Sunday, 2 August 2020, called Kayu Aiq day/preparation day, and the second day is Monday, 3 August 2020 which is called Gawe/culmination of the event.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "6",
      title: 'Lebaran Tinggi',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description: 'Eid al-Fitr is held on a different day than usual. One sawal in traditional communities this year falls on Wednesday 27 May 2020. The place of implementation is Kampu Karang Bajo, Bayan - North Lombok, while the Iid (holiday prayer) is also only performed by traditional Kyai at the Bayan Ancient Mosque.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "7",
      title: 'Budidaya Madu Trigona',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'There is a lot of Trigona Honey cultivation in the Bayan Community, and it is even managed in groups. For those of you who want to know how to harvest honey from this type of bee, we are ready to guide you, you can even take part directly with guidance from our team, you can even make a special drink from Trigona Honey called Polen Juice. Of course, just by making juice that will impress you, you can drink it until you are satisfied.',
      accomodation: 'The accomodation includes local guide, foods and beverage, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "8",
      title: 'Pengolahan Kopi',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Lombok is very famous for producing coffee that tastes delicious and distinctive, but not many people know where the coffee is grown, how it is harvested, and how it is processed so it can be drunk.',
      accomodation: 'The accomodation includes local guide, coffee tools, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "9",
      title: 'Agricultural Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "10",
      title: 'Gegerok Tandak',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "11",
      title: 'Suling Dewa',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "12",
      title: 'Genggong',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "13",
      title: 'Joget Lawas',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "14",
      title: 'Gendang Beleq',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "15",
      title: 'Cupak Gurantang',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "16",
      title: 'Dah Dah Pong',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "17",
      title: 'Cungklik',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "17",
      title: 'Tembang Lontar',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "18",
      title: 'Ning Ning Se',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "19",
      title: 'Gem Gem Tanak Garu',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "20",
      title: 'Cupreng',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "21",
      title: 'Selodor',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "22",
      title: 'Anak kayu',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "23",
      title: 'Benteng',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "24",
      title: 'Historical Story',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '41-48\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'To be able to find out in detail, of course you have to come and chat with traditional actors, for this reason we are here to make it easier for you to dialogue with figures who have long carried out their duties and obligations as Community and also Bayan Traditional Officials.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "25",
      title: 'Sendang Gila Waterfall and Tiu Kelep',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '12-16\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Beautiful view of Sindang Gila Waterfall which has 2 waterfalls, the only one on Lombok Island. This place will take you to a cool and pleasant natural atmosphere. To visit this place you need to walk about 20 minutes from the parking area. After that, go to Tiu Kelep Waterfall which is one lane, about 20 minutes from Tiu Kelep Waterfall.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "26",
      title: 'Tiu Teja Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '12-16\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Tiu Teja is one of the most beautiful waterfalls in North Lombok. This place will take you to a cool and pleasant natural atmosphere. To visit this place you need to walk about 20 minutes from the parking area. At Tiu Teja Waterfall you can bathe, because there is an area that can be used for swimming.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "27",
      title: 'Tiu Teja Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '16-19\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Tiu Teja is one of the most beautiful waterfalls in North Lombok. This place will take you to a cool and pleasant natural atmosphere. To visit this place you need to walk about 20 minutes from the parking area. At Tiu Teja Waterfall you can bathe, because there is an area that can be used for swimming.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
  const ProductModel(
      packageId: "28",
      title: 'Sambik Elen Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/rinjani.jpeg',
      rangePricing: '16-19\$ / persons',
      rating: "4,8",
      tripDuration: '1 Day',
      description: 'Sambik Elen is one of the most beautiful waterfalls in North Lombok. This place will take you to a cool and pleasant natural atmosphere. To visit this place requires walking for about 50 minutes from the parking area. At Sambik Elen Waterfall you can bathe, because there is an area that can be used for swimming.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay '
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnModel(name: "Driver", pricing: "\$20", id: "339")
      ]),
];
