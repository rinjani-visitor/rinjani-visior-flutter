import 'package:rinjani_visitor/features/product/domain/entity/addon.dart';
import 'package:rinjani_visitor/features/product/domain/category_enum.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final mockPackages = [
  ProductEntity(
      packageId: "1",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Deluxe",
      location: "Lombok, Indonesia",
      imgUrl: "assets/products/rinjani_2.jpg",
      priceLow: 190,
      priceHigh: 225,
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
   ProductEntity(
      packageId: "2",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Standard",
      location: "Lombok, Indonesia",
      imgUrl: "assets/rinjani.jpeg",
      priceLow: 180,
      priceHigh: 200,
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
   ProductEntity(
      packageId: "3",
      category: ProductCategory.rinjani,
      title: "Rinjani Trip Sharing",
      location: "Lombok, Indonesia",
      imgUrl: "assets/products/rinjani_3.jpg",
      priceLow: 130,
      priceHigh: 160,
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
   ProductEntity(
      packageId: "4",
      category: ProductCategory.culture,
      title: 'Maulid Adat Bayan Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Mulud Adat.JPG',
      priceLow: 43,
      priceHigh: 50,
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description:
          'The traditional birth of the Prophet Muhammad SAW is also called Mulud Adat, carried out for 2 days, the first day is Saturday, 31 October 2020, called Kayu Aiq Day/preparation day, and the second day is Sunday, 1 November 2020, which is called Gawe/peak. program.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "5",
      category: ProductCategory.culture,
      title: 'Lebaran Pandeq',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lebaran Pandeq.JPG',
      priceLow: 41,
      priceHigh: 48,
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
    ProductEntity(
      packageId: "6",
      category: ProductCategory.culture,
      title: 'Lebaran Tinggi',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lebaran Tinggi.JPG',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '3 Days - 2 Nights',
      description:
          'Eid al-Fitr is held on a different day than usual. One sawal in traditional communities this year falls on Wednesday 27 May 2020. The place of implementation is Kampu Karang Bajo, Bayan - North Lombok, while the Iid (holiday prayer) is also only performed by traditional Kyai at the Bayan Ancient Mosque.',
      accomodation: 'The accomodation includes local guide, foods and beverage, home stay, and traditional dress',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "7",
      category: ProductCategory.culture,
      title: 'Budidaya Madu Trigona',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/trigona.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'There is a lot of Trigona Honey cultivation in the Bayan Community, and it is even managed in groups. For those of you who want to know how to harvest honey from this type of bee, we are ready to guide you, you can even take part directly with guidance from our team, you can even make a special drink from Trigona Honey called Polen Juice. Of course, just by making juice that will impress you, you can drink it until you are satisfied.',
      accomodation: 'The accomodation includes local guide, foods and beverage, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "8",
      category: ProductCategory.culture,
      title: 'Coffee Processing Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/coffee.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Lombok is very famous for producing coffee that tastes delicious and distinctive, but not many people know where the coffee is grown, how it is harvested, and how it is processed so it can be drunk.',
      accomodation: 'The accomodation includes local guide, coffee tools, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "9",
      category: ProductCategory.culture,
      title: 'Agricultural Tour',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/agricultural.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Most of the land in Lombok is the result of the eruption of Mount Samalas, so there is a lot of fertile land as a location for agriculture. The community with the most activities as farmers is the community known as the Bayan Indigenous Community.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "10",
      category: ProductCategory.culture,
      title: 'Gegerok Tandak',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Gegerok.JPG',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Gegerok Tandak is a traditional dance of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a dance that is performed by a group of male dancers who wear traditional clothing and headgear. The dance is accompanied by traditional music played on instruments such as gendang beleq, genggong, and cungklik.\n\nThe dance is believed to have originated from the Bayan district of Lombok. It is often performed during traditional ceremonies such as weddings, circumcision, and other cultural events. The dance is characterized by its energetic and rhythmic movements, which are meant to symbolize the spirit of togetherness and cooperation.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "11",
      category: ProductCategory.culture,
      title: 'Suling Dewa',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/suling dewa.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Suling Dewa is a traditional music of the Sasak people who inhabit the island of Lombok, West Nusa Tenggara, Indonesia. It is a type of bamboo flute that is made from bamboo and is played by blowing air into the instrument. The sound produced by the instrument is soothing and calming.\n\nSuling Dewa is often played during traditional ceremonies such as weddings, circumcision, and other cultural events. It is also played during the Lombok Bau Nyale Festival, which is held annually in February or March. The music is believed to have originated from the Palompong instrument of Sumbawa.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "12",
      category: ProductCategory.culture,
      title: 'Genggong',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/genggong.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Genggong is a traditional musical instrument of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a type of idiophone that is made from the stem of the aren palm or enau and is played by pulling a string that is attached to the instrument. The sound produced by the instrument is similar to the sound of a frog.\n\nGenggong is often played during traditional ceremonies such as weddings, circumcision, and other cultural events. It is also played during the Lombok Bau Nyale Festival, which is held annually in February or March. The instrument is believed to have originated from the sound of frogs that inhabit the rice fields in Lombok.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "13",
      category: ProductCategory.culture,
      title: 'Joget Lawas',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Lawas.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Joget Lawas is a traditional dance of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a dance that is performed by a group of male dancers who wear traditional clothing and headgear. The dance is accompanied by traditional music played on instruments such as gendang beleq, genggong, and cungklik.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "14",
      category: ProductCategory.culture,
      title: 'Gendang Beleq',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/gendang.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Gendang Beleq is a traditional music of the Sasak people who inhabit the island of Lombok, West Nusa Tenggara, Indonesia. It is a percussion ensemble that consists of a large drum called beleq and several smaller drums, cymbals, and gongs. The music is often played during traditional ceremonies such as weddings, circumcision, and other cultural events.\n\nOriginally, Gendang Beleq was used to boost the morale of soldiers before they went to war and to welcome them back home. The music is believed to have originated in the 14th century, around a hundred years after the eruption of Mount Samalas or Rinjani. The drum is made of large but lightweight wood such as meranti or randu, and is hollowed out into a tube shape and covered with cowhide. The drum is approximately 110 cm long and weighs around 2.5 kg on average.\n\nGendang Beleq is a symbol of strength, courage, and unity in Lombok culture. When playing the music, the performers usually wear traditional clothing and a Lombok-style mask called Barong. The music is also known for its fast tempo and energetic beats, which can be heard from a distance.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "15",
      category: ProductCategory.culture,
      title: 'Cupak Gurantang',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Cupak Gurantang.JPG',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Cupak Gurantang is a popular folk tale of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a story about two brothers, Cupak and Gerantang, who have contrasting personalities. Cupak is a cunning, greedy, and dishonest person, while Gerantang is honest, kind, and forgiving.\n\nCupak Gurantang is often performed as a traditional theater or dance in Lombok. The story is also taught in schools to promote the values of honesty, kindness, and forgiveness. The characters of Cupak and Gerantang are often used to represent good and evil, respectively.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),

    ProductEntity(
      packageId: "17",
      category: ProductCategory.culture,
      title: 'Cungklik',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/cungklik.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Cungklik is a traditional musical instrument of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. It is a type of xylophone that is made from wood and metal. The instrument is played by striking the wooden bars with two mallets.\n\nCungklik is often played during traditional ceremonies such as weddings, circumcision, and other cultural events. It is also played during the Lombok Bau Nyale Festival, which is held annually in February or March. The instrument is believed to have originated from the Palompong instrument of Sumbawa.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),
    ProductEntity(
      packageId: "171",
      category: ProductCategory.culture,
      title: 'Tembang Lontar',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/lontar.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Tembang Lontar is a traditional music of the Sasak people who inhabit the island of Lombok, West Nusa Tenggara, Indonesia. It is also known as Pepaosan, Macapat, or Mocopot in Javanese. The music is performed using a lontar or palm leaf manuscript that contains the lyrics and melody of the song.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: []),

    ProductEntity(
      packageId: "21",
      category: ProductCategory.culture,
      title: 'Selodor',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/selodor.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Selodor is a traditional game of the Sasak people in Lombok, West Nusa Tenggara, Indonesia. The game is played by two teams, each consisting of four players. The objective of the game is to capture the players of the opposing team by touching them. The game is played on a rectangular field with eight columns. The players are required to move around the field while avoiding being touched by the opposing team.\n\nSelodor is a popular game among children in Lombok and is often played in the late afternoon. The game is believed to help improve concentration and agility. The game is also a symbol of the rich cultural heritage of the Sasak people.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),

    ProductEntity(
      packageId: "25",
      category: ProductCategory.landscape,
      title: 'Tiu Kelep Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Tiu Kelep.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Beautiful view of Sindang Gila Waterfall which has 2 waterfalls, the only one on Lombok Island. This place will take you to a cool and pleasant natural atmosphere. To visit this place you need to walk about 20 minutes from the parking area. After that, go to Tiu Kelep Waterfall which is one lane, about 20 minutes from Tiu Kelep Waterfall.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "26",
      category: ProductCategory.landscape,
      title: 'Tiu Teja Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/Tiu_Teja_waterfall.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Tiu Teja is one of the most beautiful waterfalls in North Lombok. This place will take you to a cool and pleasant natural atmosphere. To visit this place you need to walk about 20 minutes from the parking area. At Tiu Teja Waterfall you can bathe, because there is an area that can be used for swimming.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),

    ProductEntity(
      packageId: "28",
      category: ProductCategory.landscape,
      title: 'Sambik Elen Waterfall',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/sambik elen.jpg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          'Sambik Elen is one of the most beautiful waterfalls in North Lombok. This place will take you to a cool and pleasant natural atmosphere. To visit this place requires walking for about 50 minutes from the parking area. At Sambik Elen Waterfall you can bathe, because there is an area that can be used for swimming.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),
    ProductEntity(
      packageId: "29",
      category: ProductCategory.culture,
      title: 'Perisean',
      location: 'Kampung Karang Bajo, Bayan - Lombok Utara',
      imgUrl: 'assets/products/perisean.jpeg',
      priceLow: 41,
      priceHigh: 48,
      rating: "4,8",
      tripDuration: '1 Day',
      description:
          '“Peresean” is a tradition of fighting between two men from the Sasak tribe in Lombok. They use a rattan stick like a sword, and a shield made of buffalo skin called ende. Fighters are only allowed to attack the opponent\'s back and shoulders.',
      accomodation: 'The accomodation includes local guide, snack, transport, and mineral water',
      reviewCount: 12,
      initenaryList: ['First day - arrive at home stay '],
      timeList24H: ["16:00"],
      addOn: [AddOnEntity(name: "Driver", price: 20, id: "339")]),

    ProductEntity(
      packageId: "30",
      title: "Budaya Kaki Rinjani",
      location: "Jl.Pariwisata, RT 01 RW 06, Senaru, Indonesia",
      category: ProductCategory.homeStay,
      imgUrl: "assets/products/homestay.jpg",
      priceLow: 41,
      priceHigh: 48,
      rating: "4,3",
      reviewCount: 45,
      tripDuration: "No duration",
      description:
          "Located in Senaru, Budaya Kaki Rinjani offers beachfront accommodations 2.4 miles from Tiu Kelep Waterfall and has facilities like a shared lounge, a terrace and a restaurant. The property is around 3.1 miles from Sindang Gila Waterfall, 8.7 miles from Umar Maya Waterfall and 10 miles from Telaga Madu Waterfall. The property provides a shared kitchen, room service and organizing tours for guests.\n\nIf you have purchased a package from booking.com, you can purchase this package as an additional service package that you can enjoy. Don't worry, the price calculation process can be done through direct negotiation",
      avaiabilityStatus: "avaiable",
      accomodation: "bike rental and car rental is avaiable",
      addOn: [
        AddOnEntity(name: "Bike Rental", price: 10, id: "1291"),
        AddOnEntity(name: "Car Rental", price: 30, id: "1292"),
        AddOnEntity(name: "Personal Driver", price: 30, id: "1293"),
      ],
      initenaryList: [
        ''
      ],
      timeList24H: [])
];
