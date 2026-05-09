ASSETS = Rails.root.join("docs/images")

def attach_image(record, attribute, filename)
  return unless ASSETS.join(filename).exist?
  return if record.public_send(attribute).attached?

  record.public_send(attribute).attach(
    io: ASSETS.join(filename).open,
    filename: filename,
    content_type: "image/jpeg"
  )
end

# === HomePage ==================================================================
home = HomePage.instance

home.update!(
  intro_fr: <<~MD,
    Bienvenue chez nous, à Tréompan.

    Merci aux vacanciers français, allemands et anglais qui nous accordent leur
    confiance depuis des années — et bienvenue à vous qui préparez votre
    prochain séjour dans le Finistère nord.

    Je vous accueille **toute l'année** dans nos **trois gîtes indépendants**
    (Camélias, Arums, Hortensias), réunis dans une longère sur 1 770 m² de
    terrain dont 1 600 m² de jardins. **Capacité totale : 12 personnes.**

    Le gîte **Camélias est accessible aux personnes à mobilité réduite (PMR)**,
    tous les gîtes sont **raccordés à la fibre**, et l'équipement pour enfants
    de moins de 2 ans (lit bébé, chaise haute, baignoire) est offert sur
    demande.

    Sommeil de qualité, hygiène, confort : **faire de votre séjour un beau
    souvenir est ma priorité.** Pour des vacances en Bretagne sans nuages,
    choisissez les Gîtes de Kervao !
  MD
  intro_en: <<~MD,
    Welcome to our home in Tréompan.

    Thank you to our French, German and English guests for their trust over
    the years — and welcome to you who are planning your next stay in
    northern Finistère, Brittany.

    I welcome you **all year round** in our **three independent cottages**
    (Camellias, Arums, Hydrangeas), gathered in a longère on a 1 770 m² plot
    including 1 600 m² of gardens. **Total capacity: 12 guests.**

    The **Camellias cottage is wheelchair-accessible (PMR)**, all cottages
    are **connected to fibre internet**, and baby equipment (cot, high
    chair, baby bath) is provided on request for children under two.

    Quality sleep, hygiene and comfort: **making your stay a beautiful
    memory is my priority.** For holidays in Brittany without a single
    cloud, choose the Gîtes de Kervao!
  MD
  signature_fr: "*Cathy Madec*",
  signature_en: "*Cathy Madec*",

  marquee_words_fr: <<~LIST,
    Crêpes
    Phares
    Dunes
    Aber Wrac'h
    Fruits de mer
    GR34
    Île Molène
    Farz
    Kayak
    Pêche à pied
    Mer d'Iroise
  LIST
  marquee_words_en: <<~LIST,
    Crêpes
    Lighthouses
    Dunes
    Aber Wrac'h
    Seafood
    GR34
    Molène Island
    Farz
    Kayak
    Beachcombing
    Iroise Sea
  LIST

  cottages_title_fr: "Nos gîtes",
  cottages_title_en: "Our cottages",
  cottages_description_fr: <<~MD,
    Les trois gîtes sont rassemblés dans une longère construite en 2004 et 2005.
    Ils concilient les atouts des constructions récentes et les proportions de
    l'habitat traditionnel local.

    Le lieu est idéal pour des vacances en famille ou avec des amis, au calme,
    à proximité de la mer (800 mètres) et des dunes (balade GR34). Tous nos
    gîtes disposent d'une terrasse équipée et d'un jardin de 50 m² privatifs,
    et de tout le confort (salon de jardin, barbecue, cuisine équipée,
    lave-vaisselle, lave-linge, sèche-linge, télévision écran plat, sèche-
    cheveux, WIFI gratuit, fibre).

    Le parking privé est partagé entre les trois gîtes (2 places possibles par
    locataire).

    *Ken ar c'hentañ — à bientôt. Cathy*
  MD
  cottages_description_en: <<~MD,
    The three cottages share a longère built in 2004 and 2005. They combine
    the comfort of modern construction with the proportions of traditional
    local houses.

    The setting is ideal for family or friends holidays — quiet, close to the
    sea (800 m) and the dunes (GR34 coastal path). Each cottage has its own
    private terrace and 50 m² garden, plus full comfort (garden furniture,
    barbecue, fitted kitchen, dishwasher, washing machine, tumble drier, flat
    screen TV, hair dryer, free WiFi, fibre).

    The private car park is shared between the three cottages (two spaces
    available per cottage).

    *Ken ar c'hentañ — see you soon. Cathy*
  MD

  find_us_title_fr: "Nous trouver",
  find_us_title_en: "Find us",

  where_is_kervao_title_fr: "Où est Kervao ?",
  where_is_kervao_title_en: "Where is Kervao?",
  where_is_kervao_description_fr: <<~MD,
    Kervao est un hameau de la commune de Ploudalmézeau, à 600 mètres des dunes
    de Tréompan. À partir du bourg de Ploudalmézeau, suivez la D26 vers
    « plages de Tréompan » sur 2 km 200. 100 mètres après la pancarte
    « Tréompan », au croisement avec la rue La Flosque (aux 4 stops), vous nous
    trouverez au numéro 11 lieu dit de Kervao, sur la gauche de la route.
  MD
  where_is_kervao_description_en: <<~MD,
    Kervao is a hamlet of the Ploudalmézeau district, 600 metres from the
    Tréompan dunes. From Ploudalmézeau town, follow the D26 towards "plages de
    Tréompan" for 2.2 km. 100 metres after the "Tréompan" sign, at the four-
    way stop crossing rue La Flosque, you'll find us at number 11, lieu dit
    Kervao, on the left of the road.
  MD

  where_is_ploudal_title_fr: "Où est Ploudalmézeau ?",
  where_is_ploudal_title_en: "Where is Ploudalmézeau?",
  where_is_ploudal_description_fr: "Ploudalmézeau (6 300 habitants) est une commune du Pays d'Iroise, dans le département du Finistère, à la pointe de la Bretagne.",
  where_is_ploudal_description_en: "Ploudalmézeau (6 300 inhabitants) is a district in the Pays d'Iroise, in the Finistère department, at the tip of Brittany.",

  how_come_title_fr: "Comment venir ?",
  how_come_title_en: "How to get here?",
  how_come_subtitle_fr: "Depuis Paris",
  how_come_subtitle_en: "From Paris",

  by_car_fr: "**En voiture (600 km)** : autoroute A11 jusqu'à Rennes, voie rapide N12 jusqu'à l'entrée de Brest, puis D788 jusqu'à Ploudalmézeau (sortie Gouesnou-Lannilis). Pour les GPS, taper « Gîtes de Kervao, Finistère, Cathy Madec ».",
  by_car_en: "**By car (600 km)**: A11 motorway to Rennes, N12 dual carriageway to the edge of Brest, then D788 to Ploudalmézeau (Gouesnou-Lannilis exit). For GPS, search \"Gîtes de Kervao, Finistère, Cathy Madec\".",

  by_plane_fr: "**En avion** : jusqu'à Brest (aéroport Brest-Guipavas). [Site de l'aéroport Brest Bretagne](https://www.brest.aeroport.bzh/).",
  by_plane_en: "**By air**: fly to Brest (Brest-Guipavas airport). [Brest Bretagne airport website](https://www.brest.aeroport.bzh/).",

  by_rail_fr: "**En train** : ligne Paris–Brest ([SNCF](http://www.sncf.fr/)). Le bus local vous dépose à Ploudalmézeau ([Le Roux Bus & Cars](https://www.leroux-busetcars.fr/lignes-regulieres/circuits-itineraires-horaires)).",
  by_rail_en: "**By rail**: Paris–Brest line ([SNCF](http://www.sncf.fr/)). A local bus drops you in Ploudalmézeau ([Le Roux Bus & Cars](https://www.leroux-busetcars.fr/lignes-regulieres/circuits-itineraires-horaires))."
)

attach_image(home, :top_banner, "kervao.jpg")
attach_image(home, :banner2, "kervao2.jpg")
attach_image(home, :banner3, "kervao3.jpg")

# === ContactInfo ===============================================================
contact = ContactInfo.instance
contact.update!(
  phone_number: "07 82 38 27 50",
  email: "contact@gites-kervao.fr",
  title_fr: "Nous contacter",
  title_en: "Contact us",
  address_fr: "Cathy Madec  \nGîtes de Kervao  \n11 lieu dit Kervao  \n29830 Ploudalmézeau",
  address_en: "Cathy Madec  \nGîtes de Kervao  \n11 lieu dit Kervao  \n29830 Ploudalmézeau"
)

# === Cottages ==================================================================
COTTAGES = [
  {
    reference: "camellias", position: 1,
    surface: "82 m²", room_count: 2, beddings: 5, washroom_count: 1, parking_lot_count: 2,
    disabled_access: true, image: "camellias.jpg",
    name_fr: "Les Camélias", name_en: "The Camellias",
    short_description_fr: "Gîte pour 4 à 5 personnes à 800 mètres de la mer, dans un ensemble de 3 gîtes classés 3 étoiles, basé à Tréompan.",
    short_description_en: "Cottage for 4 to 5 guests, 800 metres from the sea, part of a 3-cottage 3-star group in Tréompan.",
    full_description_fr: <<~MD,
      Le gîte Camélias est idéal pour des vacances en couple, en famille ou
      entre amis. Il compte deux chambres (RDC et étage), une pièce à vivre
      avec salon ainsi qu'une cuisine ouverte toute équipée. Le salon donne
      directement sur la terrasse et le jardin. Vous trouverez un barbecue
      électrique pour les repas détente sous le soleil.

      **Les spécificités du gîte Camélias :**

      - L'aménagement est adapté pour les personnes à mobilité réduite
        accompagnées en rez-de-chaussée (passage de porte, hauteur de lit,
        espace en chambre, salle de bain et toilettes).
      - La cuisine rouge donne une chaleur à la pièce à vivre.
      - Deux belles armoires bretonnes anciennes occupent les lieux.
      - Le jardin est fermé, ce qui rassurera les parents d'enfants en bas âge.
      - La mezzanine équipée d'un salon (4 places) permet de lire et s'isoler
        ou jouer à des jeux de société en retrait de la pièce à vivre.
    MD
    full_description_en: <<~MD,
      The Camellias cottage is ideal for couples, families or friends. It has
      two bedrooms (ground and first floor), a living room with sofa and an
      open fitted kitchen. The living room opens onto the terrace and garden,
      with an electric barbecue for sunny meals.

      **What makes Camellias special:**

      - Ground-floor layout fitted for accompanied disabled access (door
        widths, bed height, bedroom and bathroom space).
      - The red kitchen gives warmth to the living space.
      - Two beautiful antique Breton wardrobes furnish the rooms.
      - The garden is enclosed — reassuring for parents of young children.
      - The mezzanine with its 4-seat lounge is great for reading or playing
        board games away from the main room.
    MD
    details: [
      {
        title_fr: "Couchages (capacité 4 à 5 personnes)",
        title_en: "Sleeping (4 to 5 guests)",
        description_fr: <<~MD,
          - 1 lit double 160 × 200 (chambre RDC)
          - 2 lits 90 × 190 (chambre étage)
          - 1 lit 1 personne 110 × 190 (mezzanine, lit d'appoint)
          - Coin lecture ou jeux sur la mezzanine, 3 fauteuils, table basse
        MD
        description_en: <<~MD
          - 1 double bed 160 × 200 (ground floor)
          - 2 single beds 90 × 190 (first floor)
          - 1 single bed 110 × 190 (mezzanine, extra bed)
          - Reading / games corner on the mezzanine, 3 armchairs, coffee table
        MD
      },
      {
        title_fr: "Équipements",
        title_en: "Amenities",
        description_fr: <<~MD,
          **Salon** : canapé, fauteuil et table de salon, télévision écran plat,
          radio.

          **Cuisine** : four traditionnel, four micro-ondes, plaques cuisson,
          grille-pain, bouilloire, cafetière, barbecue électrique,
          lave-vaisselle, évier, table et chaises.

          **Salle d'eau** (accès PMR) : douche, lavabo, sèche-cheveux. Machine
          à laver, sèche-linge, fer et table à repasser.

          **Connexion** : WIFI gratuit, raccordement fibre.
        MD
        description_en: <<~MD
          **Living room**: sofa, armchair, coffee table, flat-screen TV, radio.

          **Kitchen**: oven, microwave, hob, toaster, kettle, coffee machine,
          electric barbecue, dishwasher, sink, table and chairs.

          **Shower room** (disabled access): shower, basin, hair-dryer.
          Washing machine, tumble drier, iron and ironing board.

          **Connectivity**: free WiFi, fibre internet.
        MD
      },
      {
        title_fr: "Services inclus",
        title_en: "Included services",
        description_fr: <<~MD,
          - Linge de literie fourni
          - Linge de bains (1 serviette et 1 gant par personne annoncée)
          - Tapis de douche
          - Linge de table (nappe et 2 torchons)

          *Service en option : ménage de fin de séjour (55 €).*
        MD
        description_en: <<~MD
          - Bed linen provided
          - Bath linen (1 towel and 1 washcloth per guest)
          - Bath mat
          - Table linen (tablecloth and 2 tea towels)

          *Optional: end-of-stay cleaning (€55).*
        MD
      },
      {
        title_fr: "Extérieur",
        title_en: "Outdoor",
        description_fr: <<~MD,
          Le gîte dispose d'une **terrasse et d'un jardinet privatifs (50 m²)**,
          équipés d'un salon de jardin, d'un barbecue électrique, d'un parasol
          et de chaises longues.

          Le jardin de 1 600 m² est partagé avec les deux autres gîtes.
          **2 places de parking** sont réservées au gîte, dans l'enceinte de la
          propriété.
        MD
        description_en: <<~MD
          The cottage has its own **private terrace and 50 m² small garden**,
          with garden furniture, an electric barbecue, a parasol and sun
          loungers.

          The 1 600 m² main garden is shared with the two other cottages.
          **2 parking spaces** are reserved for the cottage on site.
        MD
      }
    ]
  },
  {
    reference: "arums", position: 2,
    surface: "82 m²", room_count: 2, beddings: 5, washroom_count: 1, parking_lot_count: 2,
    disabled_access: false, image: "arums.jpg",
    name_fr: "Les Arums", name_en: "The Arums",
    short_description_fr: "Gîte pour 4 à 5 personnes à 800 mètres de la mer, dans un ensemble de 3 gîtes situé à Tréompan.",
    short_description_en: "Cottage for 4 to 5 guests, 800 metres from the sea, part of a 3-cottage group in Tréompan.",
    full_description_fr: <<~MD,
      Le gîte Arums est idéal pour des vacances en couple, en famille ou entre
      amis. Il compte deux chambres (1 au rez-de-chaussée et 1 à l'étage), une
      pièce à vivre avec salon ainsi qu'une cuisine ouverte toute équipée. Le
      salon donne directement sur la terrasse et le jardin. Vous trouverez un
      barbecue électrique pour les repas détente sous le soleil.

      **Les spécificités du gîte Arums :**

      - Le jardin réservé, à l'abri des regards, est aussi ouvert sur le jardin
        commun.
      - La cheminée du salon vous réchauffera en hiver ou fin de saison.
      - La chambre au rez-de-chaussée compte une belle armoire bretonne
        ancienne.
      - La mezzanine équipée d'une table, de chaises et d'un fauteuil est
        idéale pour écrire, lire, se connecter ou s'amuser à des jeux de
        société en retrait de la pièce à vivre.
    MD
    full_description_en: <<~MD,
      The Arums cottage is ideal for couples, families or friends. It has two
      bedrooms (one on the ground floor, one upstairs), a living room with
      sofa and an open fitted kitchen. The living room opens onto the terrace
      and garden, with an electric barbecue for sunny meals.

      **What makes Arums special:**

      - A sheltered private garden that opens onto the shared garden.
      - The fireplace in the living room is a treat in winter or shoulder
        seasons.
      - The ground-floor bedroom features a beautiful antique Breton wardrobe.
      - The mezzanine — table, chairs, an armchair — is perfect for writing,
        reading, working or playing board games away from the main room.
    MD
    details: [
      {
        title_fr: "Couchages (capacité 4 à 5 personnes)",
        title_en: "Sleeping (4 to 5 guests)",
        description_fr: <<~MD,
          - 1 lit double 140 × 190 (chambre RDC)
          - 2 lits 90 × 190 (chambre étage)
          - 1 lit double 140 × 190 (mezzanine, lit d'appoint)
          - Coin lecture ou jeux sur la mezzanine, fauteuil, table et chaises
        MD
        description_en: <<~MD
          - 1 double bed 140 × 190 (ground floor)
          - 2 single beds 90 × 190 (first floor)
          - 1 double bed 140 × 190 (mezzanine, extra bed)
          - Reading / games corner on the mezzanine, armchair, table and chairs
        MD
      },
      {
        title_fr: "Équipements",
        title_en: "Amenities",
        description_fr: <<~MD,
          **Salon** : cheminée, canapé, fauteuil et table de salon, télévision
          connectée écran plat.

          **Cuisine** : four traditionnel, four micro-ondes, plaques cuisson,
          grille-pain, bouilloire, cafetière, barbecue électrique,
          lave-vaisselle, évier, table et chaises.

          **Salle d'eau** : douche, lavabo, sèche-cheveux. Machine à laver,
          sèche-linge, fer et table à repasser. WC indépendant.

          **Connexion** : WIFI gratuit, raccordement fibre.
        MD
        description_en: <<~MD
          **Living room**: fireplace, sofa, armchair, coffee table, smart
          flat-screen TV.

          **Kitchen**: oven, microwave, hob, toaster, kettle, coffee machine,
          electric barbecue, dishwasher, sink, table and chairs.

          **Shower room**: shower, basin, hair-dryer. Washing machine, tumble
          drier, iron and ironing board. Separate WC.

          **Connectivity**: free WiFi, fibre internet.
        MD
      },
      {
        title_fr: "Services inclus",
        title_en: "Included services",
        description_fr: <<~MD,
          - Linge de literie fourni
          - Linge de bains (1 serviette et 1 gant par personne annoncée)
          - Tapis de douche
          - Linge de table (nappe et 2 torchons)

          *Service en option : ménage de fin de séjour (55 €).*
        MD
        description_en: <<~MD
          - Bed linen provided
          - Bath linen (1 towel and 1 washcloth per guest)
          - Bath mat
          - Table linen (tablecloth and 2 tea towels)

          *Optional: end-of-stay cleaning (€55).*
        MD
      },
      {
        title_fr: "Extérieur",
        title_en: "Outdoor",
        description_fr: <<~MD,
          Le gîte dispose d'une **terrasse et d'un jardinet privatifs (50 m²)**,
          équipés d'un salon de jardin, d'un barbecue électrique, d'un parasol
          et de 2 chaises longues.

          Le jardin de 1 600 m² est partagé avec les deux autres gîtes.
          **2 places de parking** sont réservées au gîte.
        MD
        description_en: <<~MD
          The cottage has its own **private terrace and 50 m² small garden**,
          with garden furniture, an electric barbecue, a parasol and 2 sun
          loungers.

          The 1 600 m² main garden is shared with the two other cottages.
          **2 parking spaces** are reserved for the cottage.
        MD
      }
    ]
  },
  {
    reference: "hortensias", position: 3,
    surface: "42 m²", room_count: 1, beddings: 2, washroom_count: 1, parking_lot_count: 2,
    disabled_access: false, image: "hortensias.jpg",
    name_fr: "Les Hortensias", name_en: "The Hydrangeas",
    short_description_fr: "Hébergement 2 personnes, à 800 mètres de la plage de Tréompan et du GR34. Idéal pour un couple.",
    short_description_en: "Accommodation for 2, 800 metres from Tréompan beach and the GR34 coastal path. Ideal for a couple.",
    full_description_fr: <<~MD,
      Le gîte Hortensias est idéal pour des vacances ou week-ends en couple, en
      famille avec un enfant ou un adolescent. Il compte une chambre (au 1er
      étage, aucun occupant au rez-de-chaussée), une pièce à vivre avec salon
      ainsi qu'une cuisine ouverte toute équipée.

      Vous pourrez prendre vos repas sur la terrasse (dans le jardin en
      rez-de-chaussée qui vous est réservé) ou profiter du soleil sur les
      chaises longues mises à votre disposition. La prise électrique est prévue
      en terrasse pour brancher aisément le barbecue électrique.

      **Les spécificités du gîte Hortensias :**

      - Le salon intérieur est équipé d'un canapé convertible (neuf) et
        convient pour le couchage d'un enfant (ou adolescent sur une courte
        durée).
      - L'espace lingerie est séparé de la salle d'eau et accueille lave-linge
        et sèche-linge.
      - La télévision est une télévision connectée écran plat (WIFI gratuit,
        raccordement fibre).
    MD
    full_description_en: <<~MD,
      The Hydrangeas cottage is perfect for holidays or weekends as a couple,
      or with a child or teenager. It has one bedroom (first floor, with no
      one below), a living room with sofa and an open fitted kitchen.

      You can dine on the terrace in the private ground-floor garden, or relax
      on the sun loungers. An outdoor electrical socket on the terrace makes
      it easy to plug in the electric barbecue.

      **What makes Hydrangeas special:**

      - The living room has a brand-new sofa-bed, suitable for a child (or a
        teenager for short stays).
      - A separate utility area for the washing machine and tumble drier,
        away from the shower room.
      - Smart flat-screen TV (free WiFi, fibre internet).
    MD
    details: [
      {
        title_fr: "Couchages (capacité 2 personnes)",
        title_en: "Sleeping (2 guests)",
        description_fr: <<~MD,
          - 1 lit double 140 × 190 (chambre)
          - 1 lit bébé sur demande
          - Canapé convertible (1 jeune personne)
        MD
        description_en: <<~MD
          - 1 double bed 140 × 190 (bedroom)
          - 1 cot on request
          - Sofa-bed (1 young person)
        MD
      },
      {
        title_fr: "Équipements",
        title_en: "Amenities",
        description_fr: <<~MD,
          **Salon** : canapé convertible, table de salon, télévision connectée
          écran plat, radio.

          **Cuisine** : four traditionnel, four micro-ondes, plaques cuisson,
          grille-pain, bouilloire, cafetière, barbecue électrique (prise sur
          terrasse), lave-vaisselle, évier, table et chaises.

          **Salle d'eau** : douche, lavabo, WC. Machine à laver, sèche-linge,
          fer et table à repasser dans l'espace lingerie séparé.

          **Connexion** : WIFI gratuit, raccordement fibre.
        MD
        description_en: <<~MD
          **Living room**: sofa-bed, coffee table, smart flat-screen TV, radio.

          **Kitchen**: oven, microwave, hob, toaster, kettle, coffee machine,
          electric barbecue (terrace socket), dishwasher, sink, table and
          chairs.

          **Shower room**: shower, basin, WC. Washing machine, tumble drier,
          iron and ironing board in a separate utility area.

          **Connectivity**: free WiFi, fibre internet.
        MD
      },
      {
        title_fr: "Services inclus",
        title_en: "Included services",
        description_fr: <<~MD,
          - Linge de literie fourni
          - Linge de bains (1 serviette et 1 gant par personne annoncée)
          - Tapis de douche
          - Linge de table (nappe et 2 torchons)

          *Service en option : ménage de fin de séjour (45 €).*
        MD
        description_en: <<~MD
          - Bed linen provided
          - Bath linen (1 towel and 1 washcloth per guest)
          - Bath mat
          - Table linen (tablecloth and 2 tea towels)

          *Optional: end-of-stay cleaning (€45).*
        MD
      },
      {
        title_fr: "Extérieur",
        title_en: "Outdoor",
        description_fr: <<~MD,
          Le gîte dispose d'une **terrasse et d'un jardinet privatifs (50 m²)**,
          équipés d'un salon de jardin, d'un barbecue électrique, d'un parasol
          et de chaises longues.

          Le jardin de 1 600 m² est partagé avec les deux autres gîtes.
          **2 places de parking** sont réservées au gîte.
        MD
        description_en: <<~MD
          The cottage has its own **private terrace and 50 m² small garden**,
          with garden furniture, an electric barbecue, a parasol and sun
          loungers.

          The 1 600 m² main garden is shared with the two other cottages.
          **2 parking spaces** are reserved for the cottage.
        MD
      }
    ]
  }
].freeze

cottages_by_ref = {}

COTTAGES.each do |data|
  details = data[:details]
  image = data[:image]
  attrs = data.except(:details, :image)

  cottage = Cottage.find_or_initialize_by(reference: attrs[:reference])
  cottage.assign_attributes(attrs)
  cottage.save!

  attach_image(cottage, :main_picture, image)

  cottage.cottage_details.destroy_all
  details.each_with_index do |detail, idx|
    cottage.cottage_details.create!(detail.merge(position: idx))
  end

  cottages_by_ref[cottage.reference] = cottage
end

# === Pricing ===================================================================
pricing = Pricing.instance
pricing.update!(
  title_fr: "Nos tarifs",
  title_en: "Our rates",
  subtitle_fr: "Tarif TTC à compter du 16/11/2025 (semaine du samedi au samedi ou nuitée). Frais de chauffage inclus. Taxe de séjour en sus pour les adultes (+ 18 ans).",
  subtitle_en: "Rates incl. tax from 16/11/2025 (Saturday to Saturday weeks or per night). Heating included. Tourist tax payable separately for adults (18+)."
)

pricing.pricing_periods.destroy_all

PERIODS = [
  { title_fr: "Très haute saison", title_en: "Very high season",
    subtitle_fr: "Du 11 juillet au 21 août 2026", subtitle_en: "11 July – 21 August 2026",
    prices: { "camellias" => 750, "hortensias" => 510, "arums" => 750 } },
  { title_fr: "Haute saison", title_en: "High season",
    subtitle_fr: "Du 4 au 10 juillet et du 22 au 28 août 2026", subtitle_en: "4–10 July and 22–28 August 2026",
    prices: { "camellias" => 680, "hortensias" => 490, "arums" => 680 } },
  { title_fr: "Moyenne saison", title_en: "Mid season",
    subtitle_fr: "Du 30 mai au 3 juillet 2026 et du 29 août au 3 octobre 2026", subtitle_en: "30 May – 3 July 2026 and 29 August – 3 October 2026",
    prices: { "camellias" => 520, "hortensias" => 410, "arums" => 520 } },
  { title_fr: "Basse saison", title_en: "Low season",
    subtitle_fr: "Octobre à mai, frais de chauffage inclus", subtitle_en: "October to May, heating included",
    prices: { "camellias" => 460, "hortensias" => 360, "arums" => 460 } },
  { title_fr: "Week-end basse saison", title_en: "Low-season weekend",
    subtitle_fr: "2 nuits, +25 €/pers. supp.", subtitle_en: "2 nights, +€25/extra guest",
    prices: { "camellias" => 260, "hortensias" => 240, "arums" => 260 } },
  { title_fr: "Nuitée basse saison", title_en: "Low-season night",
    subtitle_fr: "Min. 3 nuits, +10 €/pers. supp.", subtitle_en: "Min. 3 nights, +€10/extra guest",
    prices: { "camellias" => 100, "hortensias" => 90, "arums" => 100 } },
  { title_fr: "Nuitée hors basse saison", title_en: "Off-low-season night",
    subtitle_fr: "Min. 3 nuits", subtitle_en: "Min. 3 nights",
    prices: { "camellias" => 170, "hortensias" => 130, "arums" => 170 } }
].freeze

PERIODS.each_with_index do |period_data, idx|
  prices = period_data[:prices]
  attrs = period_data.except(:prices).merge(position: idx)
  period = pricing.pricing_periods.create!(attrs)

  prices.each do |reference, price|
    cottage = cottages_by_ref[reference] or next
    period.pricing_rates.create!(cottage: cottage, price: price)
  end
end

puts "Seeded: #{Cottage.count} cottages, #{PricingPeriod.count} periods, #{PricingRate.count} rates"
