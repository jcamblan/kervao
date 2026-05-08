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
    En 1977, alors que nous habitions Brest, nous avons fait l'acquisition d'une
    ancienne ferme du XIXe siècle pour en faire notre maison de vacances. Au fil
    des années, nous l'avons rénovée, transformée, agrandie, et nous avons créé
    le jardin qui l'entoure. Depuis quelques années, Kervao est devenu notre
    résidence principale et nous y avons commencé à recevoir des hôtes de passage
    dans nos chambres. Nous pouvons à présent vous accueillir dans l'un de nos
    trois gîtes, récemment construits à proximité.
  MD
  intro_en: <<~MD,
    In 1977, when we were living in Brest, we bought an old 19th century farm
    house as our second home. Over the years we have renovated, transformed, and
    enlarged the house and created the garden that surrounds it. In the last few
    years Kervao has become our main residence and we have started to welcome
    passing guests to our rooms. We can now also welcome you into one of our
    three gîtes, newly built close to the house.
  MD
  signature_fr: "*Gisèle & Jean-Pierre Madec*",
  signature_en: "*Gisèle & Jean-Pierre Madec*",

  cottages_title_fr: "Nos gîtes",
  cottages_title_en: "Our cottages",
  cottages_description_fr: <<~MD,
    Les trois gîtes sont logés dans un seul bâtiment construit entre l'automne
    2004 et l'été 2005. Nous avons cherché à conjuguer le meilleur de la
    construction moderne — lumière, isolation… — avec les proportions des
    bâtisses locales typiques. Bien que mitoyens, les gîtes sont parfaitement
    séparés et chacun dispose de sa terrasse et d'un petit jardin privatif
    d'environ 50 m². Le parking et le grand jardin de 1 600 m² sont communs aux
    trois gîtes.
  MD
  cottages_description_en: <<~MD,
    The three gîtes are in a single long building constructed between the autumn
    of 2004 and the summer of 2005. We sought to bring together the best of
    modern building — light, insulation, etc. — with the proportions of typical
    local buildings. Although they are terraced, the gîtes are well separated
    and each has its own patio and small garden of about 50 sqm. The car park
    and the larger garden of 1 600 sqm are common to all three gîtes.
  MD

  find_us_title_fr: "Nous trouver",
  find_us_title_en: "Find us",

  where_is_kervao_title_fr: "Où est Kervao ?",
  where_is_kervao_title_en: "Where is Kervao?",
  where_is_kervao_description_fr: <<~MD,
    Kervao est un hameau de la commune de Ploudalmézeau, à 600 mètres des dunes
    de Tréompan. À la sortie de Ploudalmézeau, suivez la direction « Plages de
    Tréompan ». Vous nous trouverez à 2 km du bourg de Ploudalmézeau, au n° 23,
    sur la gauche de la route.
  MD
  where_is_kervao_description_en: <<~MD,
    Kervao is a hamlet in the district of Ploudalmézeau, 600 metres from the
    dunes of Tréompan. As you leave Ploudalmézeau, follow the signs to the
    "Plages de Tréompan". You will find us 2 km from the edge of the town of
    Ploudalmézeau, at number 23, on the left of the road.
  MD

  where_is_ploudal_title_fr: "Où est Ploudalmézeau ?",
  where_is_ploudal_title_en: "Where is Ploudalmézeau?",
  where_is_ploudal_description_fr: "Ploudalmézeau (5 000 habitants) est une commune du Pays d'Iroise, dans le Finistère, à la pointe de la Bretagne.",
  where_is_ploudal_description_en: "Ploudalmézeau (5 000 inhabitants) is a district in the \"Pays d'Iroise\", in the Department of Finistère, at the tip of Brittany.",

  how_come_title_fr: "Comment venir ?",
  how_come_title_en: "How to get here?",
  how_come_subtitle_fr: "Au départ de Paris",
  how_come_subtitle_en: "From Paris",

  by_car_fr: "**En voiture (600 km)** : autoroute A11 jusqu'à Rennes, puis voie express N12 jusqu'aux abords de Brest. Sortie Gouesnou - Lannilis puis D788 jusqu'à Ploudalmézeau.",
  by_car_en: "**By car (600 km)**: take the A11 motorway to Rennes, the N12 dual carriageway until you are close to Brest. Take the Gouesnou - Lannilis exit then follow the D788 to Ploudalmézeau.",

  by_plane_fr: "**En avion** : aéroport [Brest Bretagne](https://www.brest.aeroport.bzh).",
  by_plane_en: "**By air**: fly to [Brest Bretagne airport](https://www.brest.aeroport.bzh).",

  by_rail_fr: "**En train** : ligne Paris–Brest, [SNCF](http://www.sncf.fr/).",
  by_rail_en: "**By rail**: Paris–Brest line, [SNCF](http://www.sncf.fr/)."
)

attach_image(home, :top_banner, "kervao.jpg")
attach_image(home, :banner2, "kervao2.jpg")
attach_image(home, :banner3, "kervao3.jpg")

# === ContactInfo ===============================================================
contact = ContactInfo.instance
contact.update!(
  phone_number: "02 98 48 65 63",
  email: "gjpmadec@wanadoo.fr",
  title_fr: "Nous contacter",
  title_en: "Contact us",
  address_fr: "Jean-Pierre & Gisèle MADEC  \n23 rue de Kervao  \n29830 PLOUDALMÉZEAU",
  address_en: "Jean-Pierre & Gisèle MADEC  \n23 rue de Kervao  \n29830 PLOUDALMÉZEAU"
)

# === Cottages ==================================================================
COTTAGES = [
  {
    reference: "arums", position: 1,
    surface: "82 m²", room_count: 2, beddings: 5, washroom_count: 1, parking_lot_count: 2,
    disabled_access: false, image: "arums.jpg",
    name_fr: "Les arums", name_en: "The Arums",
    short_description_fr: "Gîte pour 4 à 5 personnes à 600 mètres de la mer, dans un ensemble de 3 gîtes.",
    short_description_en: "Cottage for 4 to 5 guests, 600 metres from the sea, in a group of 3 cottages.",
    full_description_fr: "Surface au sol : 82 m². Eau chaude et chauffage électrique (panneaux radiants). Linge : les lits seront faits, garnis de draps et de taies. Les serviettes et gants de toilette seront fournis à l'arrivée, sauf le linge de cuisine.",
    full_description_en: "Floor surface: 82 sqm. Hot water and electric heating (radiant panels). Linen: beds will be made up with sheets and pillowcases. Towels and washcloths are provided on arrival; kitchen linen is not.",
    details: [
      {
        title_fr: "Rez-de-chaussée", title_en: "Ground floor",
        description_fr: "**Pièce à vivre** (30 m²) avec cheminée, cuisine intégrée (4 plaques électriques, four, four micro-ondes, lave-vaisselle, réfrigérateur / congélateur), table, 6 chaises, buffet à vaisselle, canapé convertible, 2 fauteuils, téléviseur. Volets roulants électriques.\n\n**Cheminée** : la première flambée est offerte. Par la suite, le bois est mis à disposition sur demande.\n\n**Chambre** (12 m²) avec lit 2 personnes (140 × 200) et une armoire.\n\n**Salle d'eau** avec douche, lavabo, machine à laver et sèche-linge.\n\n**WC** indépendant.",
        description_en: "**Living room** (30 sqm) with fireplace and fitted kitchen (4 electric hotplates, oven, microwave, dishwasher, fridge/freezer), table, 6 chairs, dresser, sofa-bed, 2 armchairs, TV. Electric shutters.\n\n**Bedroom** (12 sqm) with double bed (140 × 200) and wardrobe.\n\n**Shower room** with shower, basin, washing machine and tumble drier.\n\n**Separate WC**."
      },
      {
        title_fr: "Étage", title_en: "First floor",
        description_fr: "**Chambre** (12 m²) avec 2 lits 1 personne (90 × 190). Volets manuels.\n\n**Mezzanine** (15 m² au sol) avec 1 lit.\n\nRangement (4 m²).",
        description_en: "**Bedroom** (12 sqm) with 2 single beds (90 × 190). Manual shutters.\n\n**Mezzanine** (15 sqm) with 1 bed.\n\nStorage (4 sqm)."
      },
      {
        title_fr: "Extérieur", title_en: "Outdoor",
        description_fr: "Le gîte dispose d'une **terrasse et d'un jardinet privatifs** (50 m²), équipés d'un salon de jardin et d'un barbecue électrique. Le **jardin clos** de 1 600 m² est partagé avec les deux autres gîtes. **2 places de parking** sont réservées au gîte.",
        description_en: "The cottage has its own **private terrace and small garden** (50 sqm) with garden furniture and an electric barbecue. The **enclosed garden** of 1 600 sqm is shared with the two other cottages. **2 parking spaces** are reserved for the cottage."
      }
    ]
  },
  {
    reference: "camellias", position: 2,
    surface: "82 m²", room_count: 2, beddings: 5, washroom_count: 1, parking_lot_count: 2,
    disabled_access: true, image: "camellias.jpg",
    name_fr: "Les camélias", name_en: "The Camellias",
    short_description_fr: "Gîte pour 4 à 5 personnes à 600 mètres de la mer, accessible aux personnes à mobilité réduite.",
    short_description_en: "Cottage for 4 to 5 guests, 600 metres from the sea, with disabled access.",
    full_description_fr: "Surface au sol : 82 m². Eau chaude et chauffage électrique (panneaux radiants). Linge : les lits seront faits, garnis de draps et de taies. Les serviettes et gants de toilette seront fournis à l'arrivée, sauf le linge de cuisine.",
    full_description_en: "Floor surface: 82 sqm. Hot water and electric heating (radiant panels). Linen: beds will be made up with sheets and pillowcases. Towels and washcloths are provided on arrival; kitchen linen is not.",
    details: [
      {
        title_fr: "Rez-de-chaussée", title_en: "Ground floor",
        description_fr: "*(aux normes pour l'accès des personnes à mobilité réduite)*\n\n**Entrée** (4 m²).\n\n**Pièce à vivre** (25 m²) avec cuisine aménagée (plaques électriques, hotte, four, micro-ondes, lave-vaisselle, réfrigérateur / congélateur), table, 6 chaises, buffet à vaisselle, canapé, 2 fauteuils, téléviseur. Volets roulants électriques.\n\n**Chambre** (14 m²) avec lit 2 personnes (160 × 200) et commode.\n\n**Salle d'eau** (7,2 m²) avec douche, lavabo, WC, machine à laver et sèche-linge.",
        description_en: "*(disabled-access compliant)*\n\n**Entrance hall** (4 sqm).\n\n**Living room** (25 sqm) with fitted kitchen (hotplates, hood, oven, microwave, dishwasher, fridge/freezer), table, 6 chairs, dresser, sofa, 2 armchairs, TV. Electric shutters.\n\n**Bedroom** (14 sqm) with double bed (160 × 200) and chest of drawers.\n\n**Shower room** (7.2 sqm) with shower, basin, WC, washing machine and tumble drier."
      },
      {
        title_fr: "Étage", title_en: "First floor",
        description_fr: "**Chambre** (14 m²) avec 2 lits 1 personne (90 × 190), un lit bébé et une armoire-penderie.\n\n**Mezzanine** (15 m² au sol) avec un lit (100).\n\n**Rangement** (4 m²).",
        description_en: "**Bedroom** (14 sqm) with 2 single beds (90 × 190), a cot, and a wardrobe.\n\n**Mezzanine** (15 sqm) with one bed (100).\n\n**Storage** (4 sqm)."
      },
      {
        title_fr: "Extérieur", title_en: "Outdoor",
        description_fr: "Le gîte dispose d'une **terrasse et d'un jardinet privatifs** (50 m²), équipés d'un salon de jardin et d'un barbecue électrique. Le **jardin clos** de 1 600 m² est partagé avec les deux autres gîtes. **2 places de parking** sont réservées au gîte.",
        description_en: "The cottage has its own **private terrace and small garden** (50 sqm) with garden furniture and an electric barbecue. The **enclosed garden** of 1 600 sqm is shared with the two other cottages. **2 parking spaces** are reserved for the cottage."
      }
    ]
  },
  {
    reference: "hortensias", position: 3,
    surface: "42 m²", room_count: 1, beddings: 2, washroom_count: 1, parking_lot_count: 1,
    disabled_access: false, image: "hortensias.jpg",
    name_fr: "Les hortensias", name_en: "The Hydrangeas",
    short_description_fr: "Gîte pour 2 personnes à 600 mètres de la mer, à l'étage, accessible par un escalier extérieur privatif.",
    short_description_en: "Cottage for 2 guests, 600 metres from the sea, on the first floor, accessed by a private external staircase.",
    full_description_fr: "Surface au sol : 42 m². Eau chaude et chauffage électrique (panneaux radiants). Linge : les lits seront faits, garnis de draps et de taies. Les serviettes et gants de toilette seront fournis à l'arrivée, sauf le linge de cuisine.",
    full_description_en: "Floor surface: 42 sqm. Hot water and electric heating (radiant panels). Linen: beds will be made up with sheets and pillowcases. Towels and washcloths are provided on arrival; kitchen linen is not.",
    details: [
      {
        title_fr: "Étage", title_en: "First floor",
        description_fr: "**Pièce à vivre** (23 m²) avec cuisine intégrée (4 plaques électriques, hotte, four, micro-ondes, lave-vaisselle, réfrigérateur / congélateur), table, 4 chaises, buffet à vaisselle, canapé, téléviseur.\n\n**Chambre** (12 m²) avec lit 2 personnes (140) et armoire.\n\n**Salle d'eau** (7 m²) avec douche, lavabo et WC.\n\n**Sas** : machine à laver, sèche-linge.",
        description_en: "**Living room** (23 sqm) with fitted kitchen (4 hotplates, hood, oven, microwave, dishwasher, fridge/freezer), table, 4 chairs, dresser, sofa, TV.\n\n**Bedroom** (12 sqm) with double bed (140) and wardrobe.\n\n**Shower room** (7 sqm) with shower, basin and WC.\n\n**Utility area**: washing machine, tumble drier."
      },
      {
        title_fr: "Extérieur", title_en: "Outdoor",
        description_fr: "Le gîte dispose d'une **terrasse et d'un jardinet privatifs** (50 m²), équipés d'un salon de jardin et d'un barbecue électrique. Le **jardin clos** de 1 600 m² est partagé avec les deux autres gîtes. Une **place de parking** est réservée au gîte.",
        description_en: "The cottage has its own **private terrace and small garden** (50 sqm) with garden furniture and an electric barbecue. The **enclosed garden** of 1 600 sqm is shared with the two other cottages. **1 parking space** is reserved for the cottage."
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
  title_fr: "Tarifs",
  title_en: "Rates",
  subtitle_fr: "Tarifs à la semaine, charges comprises",
  subtitle_en: "Weekly rates, all charges included"
)

pricing.pricing_periods.destroy_all

PERIODS = [
  { title_fr: "Haute saison", title_en: "Peak season",
    subtitle_fr: "Juillet – Août", subtitle_en: "July – August",
    prices: { "arums" => 595, "camellias" => 595, "hortensias" => 410 } },
  { title_fr: "Moyenne saison", title_en: "Mid season",
    subtitle_fr: "Mai, juin, septembre", subtitle_en: "May, June, September",
    prices: { "arums" => 400, "camellias" => 400, "hortensias" => 310 } },
  { title_fr: "Basse saison", title_en: "Off-peak",
    subtitle_fr: "Octobre – Avril", subtitle_en: "October – April",
    prices: { "arums" => 300, "camellias" => 300, "hortensias" => 290 } },
  { title_fr: "Week-end (2 jours)", title_en: "Weekend (2 days)",
    subtitle_fr: "Hors haute saison", subtitle_en: "Outside peak season",
    prices: { "arums" => 220, "camellias" => 220, "hortensias" => 150 } },
  { title_fr: "Week-end (3 jours)", title_en: "Weekend (3 days)",
    subtitle_fr: "Hors haute saison", subtitle_en: "Outside peak season",
    prices: { "arums" => 270, "camellias" => 275, "hortensias" => 200 } }
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
