# Marquee personnalisable depuis le BO

**Date :** 2026-05-09
**Statut :** Validé pour implémentation

## Contexte

La partial [_marquee.html.erb](../../../app/views/shared/_marquee.html.erb) défile une liste de 11 mots codés en dur (Crêpes, Phares, Dunes, Aber Wrac'h, Fruits de mer, GR34, Île Molène, Farz, Kayak, Pêche à pied, Mer d'Iroise) sur la page d'accueil. La même liste FR est servie aux visiteurs anglophones, alors que plusieurs entrées se traduiraient bien (Phares → Lighthouses, Fruits de mer → Seafood, Pêche à pied → Beachcombing).

L'objectif est de rendre la liste éditable depuis le back-office par locale, sans introduire de nouveau modèle ni de migration.

## Approche retenue

Stocker la liste comme un champ texte traduisible sur `HomePage` (singleton existant), une entrée par ligne. Mobility est déjà configuré en backend `container` ([config/initializers/mobility.rb](../../../config/initializers/mobility.rb)) — toutes les traductions vivent dans la colonne `translations` jsonb. **Aucune migration** n'est requise pour ajouter un nouvel attribut traduisible.

### Pourquoi un seul textarea (et pas un modèle dédié `MarqueeWord`)

- 11 mots, ordre figé, pas de meta par mot → un modèle dédié serait du sur-ingénierie.
- Mobility container backend transforme l'ajout d'un champ en une seule ligne dans `translates`.
- Le partial `admin/shared/translatable_field` existe déjà et gère `:text_area` — l'admin reste cohérent avec le reste de la page d'édition.

### Pourquoi une entrée par ligne (et pas CSV)

Plusieurs mots contiennent des apostrophes (Aber Wrac'h, Mer d'Iroise) — pas de conflit avec `\n`. Cohérent avec `intro` qui est déjà multi-ligne.

## Composants

### Modèle — [home_page.rb](../../../app/models/home_page.rb)

Ajouter `:marquee_words` à la liste `translates`. Exposer un helper qui parse en tableau :

```ruby
def marquee_words_list
  marquee_words.to_s.lines.map(&:strip).reject(&:blank?)
end
```

### Vue — [_marquee.html.erb](../../../app/views/shared/_marquee.html.erb)

- Accepter un local `home_page:`.
- Lire `home_page.marquee_words_list`.
- **Masquer la section entièrement** si la liste est vide : envelopper le `<section>` dans un `<% if words.any? %> ... <% end %>`.
- Préserver la logique existante (duplication `words + words` pour le défilement, alternance d'opacité `i % 3 == 0`).

### Rendu — [pages/home.html.erb](../../../app/views/pages/home.html.erb)

Mettre à jour `render "shared/marquee"` pour passer `home_page: @home_page`. `@home_page` est déjà assigné dans [PagesController#home](../../../app/controllers/pages_controller.rb).

### BO — [admin/home_pages/edit.html.erb](../../../app/views/admin/home_pages/edit.html.erb)

Dans la section « Introduction » existante, ajouter sous `signature` :

```erb
<%= render "admin/shared/translatable_field",
    form: f,
    attribute: :marquee_words,
    label: "Mots du marquee (un par ligne)",
    type: :text_area,
    rows: 8 %>
```

### Controller — [admin/home_pages_controller.rb](../../../app/controllers/admin/home_pages_controller.rb)

Ajouter `:marquee_words_fr, :marquee_words_en` aux paramètres autorisés.

### Seeds — [db/seeds.rb](../../../db/seeds.rb)

Ajouter à l'appel `home.update!` :

```ruby
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
```

## Hors-scope

- Pas d'ordre éditable dans le BO (au-delà de l'ordre des lignes du textarea).
- Pas de meta par mot (couleur, opacité, lien).
- Pas de fallback codé en dur si l'admin vide le champ — la section disparaît.
- Pas d'animation/style modifié — uniquement la source des mots change.

## Vérification

1. `bin/rails db:seed` → la table `home_pages` contient les deux listes dans `translations`.
2. `bin/rails s` puis `/` (FR) → le marquee défile la liste FR.
3. `/?locale=en` (ou `/en` selon les routes) → le marquee défile la liste EN.
4. `/admin/home_pages/edit` → la section « Introduction » montre le textarea « Mots du marquee » en FR et EN.
5. Modifier la liste, sauvegarder, recharger `/` → la liste reflète l'édition.
6. Vider entièrement les deux champs, sauvegarder, recharger `/` → la section `<section class="py-8 bg-ink ...">` est totalement absente du DOM.

## Risques

- **Re-seed écrase les éditions admin.** Connu, déjà valable pour les autres champs `HomePage` (cf. commit précédent). Pas d'action — si on veut résoudre ça plus tard, c'est un autre chantier (seed conditionnel sur `created_at` ou guard).
