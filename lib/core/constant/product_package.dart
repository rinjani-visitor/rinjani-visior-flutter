import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final mockPackages = [
  ProductDetailEntity(
      packageId: "1",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Deluxe",
      location: "Lombok, Indonesia",
      imgUrl: "assets/products/rinjani_2.jpg",
      priceLow: 190,
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
        AddOnEntity(
            name: "Replace porter with guide",
            description: "replace your porter with guide. max 4 people",
            price: 35,
            id: "123"),
      ]),
  ProductDetailEntity(
      packageId: "2",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Standard",
      location: "Lombok, Indonesia",
      imgUrl: "assets/rinjani.jpeg",
      priceLow: 180,
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
        AddOnEntity(
            name: "Replace porter with guide",
            description: "replace your porter with guide. max 4 people",
            price: 20,
            id: "456"),
      ]),
  ProductDetailEntity(
      packageId: "3",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Sharing",
      location: "Lombok, Indonesia",
      imgUrl: "assets/products/rinjani_3.jpg",
      priceLow: 130,
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
        AddOnEntity(
            name: "Replace porter with guide",
            description: "replace your porter with guide for 6 or more people",
            price: 30,
            id: "456"),
      ]),
  //Paket Budaya - Ritual
  ProductDetailEntity(
      packageId: "4",
      category: ProductCategory.culture,
      title: 'Maulid Adat Bayan Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Mulud Adat.JPG',
      priceLow: 43,
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description:
          'The traditional birth of the Prophet Muhammad SAW is also called Mulud Adat, carried out for 2 days, the first day is Saturday, 31 October 2020, called Kayu Aiq Day/preparation day, and the second day is Sunday, 1 November 2020, which is called Gawe/peak. program.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
  ProductDetailEntity(
      packageId: "5",
      category: ProductCategory.culture,
      title: 'Lebaran Pandeq',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lebaran Pandeq.JPG',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description:
          'The traditional implementation of Eid al-Adha is also called Eid "Pendeq", Eid Pendeq is held for 2 days, the first day is Sunday, 2 August 2020, called Kayu Aiq day/preparation day, and the second day is Monday, 3 August 2020 which is called Gawe/culmination of the event.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: [
        'First day - arrive at home stay, change your clothes with traditional dress'
      ],
      timeList24H: [
        "16:00"
      ],
      addOn: [
        AddOnEntity(name: "Driver", price: 20, id: "339")
      ]),
  ProductDetailEntity(
      packageId: "6",
      category: ProductCategory.culture,
      title: 'Lebaran Tinggi',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lebaran Tinggi.JPG',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description:
          'Eid al-Fitr is held on a different day than usual. One sawal in traditional communities this year falls on Wednesday 27 May 2020. The place of implementation is Kampu Karang Bajo, Bayan - North Lombok, while the Iid (holiday prayer) is also only performed by traditional Kyai at the Bayan Ancient Mosque.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
  ProductDetailEntity(
      packageId: "7",
      category: ProductCategory.culture,
      title: 'Budidaya Madu Trigona',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/trigona.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'There is a lot of Trigona Honey cultivation in the Bayan Community, and it is even managed in groups. For those of you who want to know how to harvest honey from this type of bee, we are ready to guide you, you can even take part directly with guidance from our team, you can even make a special drink from Trigona Honey called Polen Juice. Of course, just by making juice that will impress you, you can drink it until you are satisfied.',
      accomodation: 'The accomodation includes local guide, foods and beverage, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
  ProductDetailEntity(
      packageId: "8",
      category: ProductCategory.culture,
      title: 'Coffee Processing Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/coffee.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Lombok is very famous for producing coffee that tastes delicious and distinctive, but not many people know where the coffee is grown, how it is harvested, and how it is processed so it can be drunk.',
      accomodation: 'The accomodation includes local guide, coffee tools, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
  ProductDetailEntity(
      packageId: "9",
      category: ProductCategory.culture,
      title: 'Agricultural Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/agricultural.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
  ProductDetailEntity(
      packageId: "10",
      category: ProductCategory.culture,
      title: 'Gegerok Tandak',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Gegerok.JPG',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Gegerok Tandak is a traditional dance of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a dance that is performed by a group of male dancers who wear traditional clothing and headgear. The dance is accompanied by traditional music played on instruments such as gendang beleq, genggong, and cungklik.\n\nThe dance is believed to have originated from the Bayan district of Lombok. It is often performed during traditional ceremonies such as weddings, circumcision, and other cultural events. The dance is characterized by its energetic and rhythmic movements, which are meant to symbolize the spirit of togetherness and cooperation.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
  ProductDetailEntity(
      packageId: "11",
      category: ProductCategory.culture,
      title: 'Suling Dewa',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/suling dewa.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Suling Dewa is a traditional music of the Sasak people who inhabit the island of Lombok, West Nusa Tenggara, Indonesia. It is a type of bamboo flute that is made from bamboo and is played by blowing air into the instrument. The sound produced by the instrument is soothing and calming.\n\nSuling Dewa is often played during traditional ceremonies such as weddings, circumcision, and other cultural events. It is also played during the Lombok Bau Nyale Festival, which is held annually in February or March. The music is believed to have originated from the Palompong instrument of Sumbawa.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
  ProductDetailEntity(
      packageId: "12",
      category: ProductCategory.culture,
      title: 'Genggong',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/genggong.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Genggong is a traditional musical instrument of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a type of idiophone that is made from the stem of the aren palm or enau and is played by pulling a string that is attached to the instrument. The sound produced by the instrument is similar to the sound of a frog.\n\nGenggong is often played during traditional ceremonies such as weddings, circumcision, and other cultural events. It is also played during the Lombok Bau Nyale Festival, which is held annually in February or March. The instrument is believed to have originated from the sound of frogs that inhabit the rice fields in Lombok.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
  ProductDetailEntity(
      packageId: "13",
      category: ProductCategory.culture,
      title: 'Joget Lawas',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lawas.jpg',
      priceLow: 41,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Joget Lawas is a traditional dance of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a dance that is performed by a group of male dancers who wear traditional clothing and headgear. The dance is accompanied by traditional music played on instruments such as gendang beleq, genggong, and cungklik.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
];
