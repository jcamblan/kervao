# Design — Refonte Kervao en Rails

**Date :** 2026-05-06
**Contexte :** Le site vitrine des gîtes Kervao est actuellement une Jamstack Middleman + DatoCMS déployée sur Netlify. Les dépendances ne sont plus maintenues. Objectif : recréer le site de zéro en Rails avec un back office intégré.

---

## Stack technique

- **Framework :** Ruby on Rails 8 (latest)
- **Frontend :** Hotwire (Turbo + Stimulus) + Tailwind CSS
- **i18n contenu :** gem Mobility (attributs traduisibles en base, backend JSONB — PostgreSQL natif)
- **i18n UI :** YML classiques Rails (`config/locales/fr.yml`, `en.yml`)
- **Images :** Active Storage → S3 (ou compatible S3 : Tigris, Cloudflare R2)
- **Carte :** Leaflet.js + OpenStreetMap (gratuit, sans clé API)
- **Formulaire contact :** ActionMailer (envoi email uniquement, pas de stockage en base)
- **Auth back office :** HTTP Basic Auth — identifiants dans `config/credentials.yml.enc`
- **Base de données :** PostgreSQL

---

## Modèles de données

### Cottage
Champs non traduisibles :
- `reference` (string, slug unique — ex: "arums", "camellias", "hortensias")
- `surface` (string — ex: "65 m²")
- `room_count` (integer)
- `beddings` (integer — nombre de couchages)
- `washroom_count` (integer)
- `parking_lot_count` (integer)
- `disabled_access` (boolean)
- `position` (integer — ordre d'affichage)

Champs traduisibles (Mobility) :
- `name`
- `short_description`
- `full_description` (markdown)

Associations :
- `has_many :cottage_details, dependent: :destroy`
- `has_many :pricing_rates, dependent: :destroy`
- `has_one_attached :main_picture`
- `has_many_attached :photos`

### CottageDetail
- `cottage_id`
- `position` (integer)
- Traduisibles : `title`, `description` (markdown)
- `belongs_to :cottage`

### HomePage (singleton)
Toujours un seul enregistrement, initialisé par seed.

Champs non traduisibles :
- `has_one_attached :top_banner`
- `has_one_attached :banner2`
- `has_one_attached :banner3`

Champs traduisibles (Mobility) :
- `intro` (markdown)
- `signature` (markdown)
- `cottages_title`
- `cottages_description` (markdown)
- `find_us_title`
- `where_is_kervao_title`
- `where_is_kervao_description`
- `where_is_ploudal_title`
- `where_is_ploudal_description`
- `how_come_title`
- `how_come_subtitle`
- `by_car` (markdown)
- `by_plane` (markdown)
- `by_rail` (markdown)

### ContactInfo (singleton)
- `phone_number` (string)
- `email` (string)
- Traduisibles : `title`, `address` (markdown)

### Pricing (singleton)
- Traduisibles : `title`, `subtitle`
- `has_many :pricing_periods, dependent: :destroy`

### PricingPeriod
- `pricing_id`
- `position` (integer)
- Traduisibles : `title`, `subtitle`
- `belongs_to :pricing`
- `has_many :pricing_rates, dependent: :destroy`

### PricingRate
Table de liaison période ↔ gîte :
- `pricing_period_id`
- `cottage_id`
- `price` (decimal)
- `belongs_to :pricing_period`
- `belongs_to :cottage`

---

## Site public

### Routes

```
GET  /                        → redirect vers /fr
GET  /:locale                 → pages#home
GET  /:locale/gites/:reference → cottages#show
POST /:locale/contact         → contacts#create
```

Le paramètre `:locale` est intercepté dans `ApplicationController` via `before_action` pour setter `I18n.locale`. Les locales supportées sont `[:fr, :en]`, avec `fr` comme défaut.

### Page d'accueil (`/:locale`)

Single-page scroll avec les sections suivantes (ancres) :

1. **Navbar** — logo, liens vers les ancres, switcher FR/EN
2. **#intro** — image bannière (top_banner) en pleine largeur, citation (intro + signature en markdown)
3. **#gites** — titre + description + cards des gîtes (main_picture, nom, features clés, lien vers page détail)
4. **Séparateur parallaxe** — image banner2 (CSS `background-attachment: fixed`)
5. **#findus** — titre + carte Leaflet.js centrée sur Kervao + textes d'accès (voiture/avion/train en markdown)
6. **Séparateur parallaxe** — image banner3
7. **#prices** — tableau des tarifs (périodes en lignes, gîtes en colonnes, prix via PricingRate)
8. **#contact (footer)** — adresse/téléphone/email + formulaire de contact

### Page gîte (`/:locale/gites/:reference`)

1. Navbar
2. Header : nom du gîte + short_description + icônes features (surface, chambres, couchages, salle d'eau, parking, accessibilité)
3. Carousel photos (Stimulus controller, pas de librairie externe)
4. Description complète (full_description rendu depuis markdown)
5. Sections CottageDetail (titre + description par bloc)
6. Footer/lien retour

### Formulaire de contact

- Champs : nom, email, motif (réservation / renseignement), message
- Soumission via `POST /:locale/contact`
- Envoi par ActionMailer à l'adresse configurée dans ContactInfo
- Réponse : redirect avec flash de confirmation (Turbo compatible)

---

## Back office (`/admin`)

### Authentification

`Admin::BaseController` avec `http_basic_authenticate_with` :
```ruby
http_basic_authenticate_with(
  name: Rails.application.credentials.admin.fetch(:login),
  password: Rails.application.credentials.admin.fetch(:password)
)
```

### Routes

```
GET              /admin                    → admin/dashboard#index
GET  PATCH       /admin/home_page          → admin/home_pages#edit, #update
GET  PATCH       /admin/contact_info       → admin/contact_infos#edit, #update
GET  PATCH       /admin/pricing            → admin/pricings#edit, #update
GET              /admin/cottages           → admin/cottages#index
GET  POST        /admin/cottages/new       → admin/cottages#new, #create
GET  PATCH       /admin/cottages/:id       → admin/cottages#edit, #update
DELETE           /admin/cottages/:id       → admin/cottages#destroy
```

Pas de CREATE/DELETE sur les singletons (toujours un seul enregistrement).
Les gîtes ont un CRUD complet (index, new, create, edit, update, destroy).

### UX formulaires bilingues

Les champs traduisibles affichent deux onglets FR / EN gérés par un Stimulus controller (`locale-tabs`). Un seul formulaire est soumis avec les paramètres imbriqués `[fr]` et `[en]` pour chaque attribut traduisible.

### Gestion des images

- Image principale du gîte : champ file upload simple (`<input type="file">`)
- Galerie photos : upload multiple + réordonnancement par drag & drop (Stimulus controller `sortable`)
- Bannières (top_banner, banner2, banner3) : 3 champs file upload sur le formulaire HomePage
- Variantes via `ImageProcessing` pour les thumbnails en back office

### Tarifs (nested forms)

Le formulaire `/admin/pricing` gère :
- Les champs du singleton Pricing (titre, sous-titre)
- Les PricingPeriods imbriquées avec leurs PricingRates (un prix par gîte par période)
- Ajout/suppression de périodes via Turbo Frames (sans rechargement de page)

---

## Points hors scope

- Pas de système de réservation en ligne
- Pas de gestion multi-utilisateurs (un seul admin)
- Pas de newsletter
- Pas de galerie photos publique dédiée (les photos sont sur la page de chaque gîte)
