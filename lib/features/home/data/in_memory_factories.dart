import 'package:factories/core/data/models/factory.dart';

abstract class InMemoryFactories {
  static List<Factory> get factories => const <Factory>[
        Factory(
          name: 'La Fabril',
          description:
              '''La Fabril, is an Ecuadorian company established in 1935, which began operations in 1968, under the direction of Mr. Carlos González-Artigas Díaz, who together with a great team has built with effort an innovative industry, which has established itself as a strategic partner for the growth of the country, leading the manufacture of fats, oils, oleochemicals, biofuels and cleaning and hygiene products with presence in domestic and international markets.
                As part of its philosophy of innovation and environmental care, La Fabril works through a sustainable management system, through the efficient use and reuse of its raw materials, the incorporation of clean processes and technologies, in order to minimize the impact of its operations in its areas of influence. With a wide range of products and brands in the local market, La Fabril has established itself as an icon of research and innovation in the Ecuadorian food market for several decades. For this reason, and being known as "The Industry of Ideas", within the Innovation and Development area of La Fabril we work responsibly in making ideas that give value to our clients' businesses and that connect with our consumers a reality.
                Being innovative implies responding to market changes, adapting intelligently, anticipating demands, offering new products, re-designing existing ones. Innovation also represents the capacity and dedication to identify consumer needs and satisfy them successfully.''',
          image: 'assets/factories/fabril.jpg',
        ),
        Factory(
          name: 'Volkswagen',
          description:
              '''Volkswagen in the last 25 years has been involved in several fraud scandals (very well known) in the automotive world. The first of them in 1996, with the case of "Lopez de Arriortua" and GM, where VW had to compensate the American brand, for industrial counter-espionage of which the media gave a good account of it. Then in 2015, with the so-called "Dieselgate" also discovered in the United States, affecting all VW Group brands worldwide, related to the falsity of gas emissions into the atmosphere by means of fraudulent devices mounted on their cars. In some states, as of Nov. 2020, the VAG Group has yet to be legally prosecuted.
                Volkswagen has three cars on the list of 10 best-selling cars of all time, namely Golf, Beetle and Passat. This information can be found on the website called 24/7 Wall St. With these three cars, Volkswagen has more cars on the list of those that continue to produce than any other manufacturer.''',
          image: 'assets/factories/volkswagen.jpeg',
        ),
        Factory(
          name: 'Corporación Favorita',
          description:
              '''Corporación Favorita C.A. is an Ecuadorian conglomerate of self-service stores, real estate investments, power generation, food and staples production, commerce, and hardware. The company is present in Ecuador, Peru, Paraguay, and Panama; its shares are listed on the Quito Stock Exchange and the Guayaquil Stock Exchange.''',
          image: 'assets/factories/favorita.jpg',
        ),
        Factory(
          name: 'General Motors',
          description:
              '''The GM OBB factory is an Ecuadorian automotive assembly plant, based in the Metropolitan District in the city of Quito. It is currently the largest automotive assembly and production plant in Ecuador and its facilities carry out engineering, welding, painting, assembly and quality control processes, all of which are directly supervised by General Motors.''',
          image: 'assets/factories/general.jpg',
        ),
        Factory(
          name: 'Pronaca',
          description:
              '''It is an Ecuadorian company that produces quality food, with a long-term vision, with faith in our people and their country. We honor the family values that have characterized us since our foundation. With this we continue to face challenges, which allows us to proudly declare.
            We are a family that exists to feed well, we work efficiently, humanely and sustainably''.''',
          image: 'assets/factories/pronaca.jpg',
        ),
        Factory(
          name: 'EP PETROECUADOR',
          description:
              '''Empresa Pública de Hidrocarburos del Ecuador, better known by its trade name EP Petroecuador, is an Ecuadorian state-owned company created on September 26, 1989, which is responsible for the exploitation of hydrocarbons directly through Petroecuador or through association contracts with third parties, which is responsible for the exploration and exploitation of hydrocarbon deposits in Ecuadorian territory and sea. Its current headquarters are located at Alpallana E8-86 and 6 de Diciembre Avenue in Quito.
            Since mid-2016, following the publication of the Panama Papers, a pre-trial criminal investigation was initiated against several former managers and officials of Petroecuador for the alleged crime of money laundering, known as Petroecuador Case.''',
          image: 'assets/factories/petroecuador.jpg',
        ),
      ];
}
