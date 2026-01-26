-- ============================================================================
-- Mondial Attractions Data: Baden-Württemberg, Germany
-- ============================================================================
-- Sample data for tourist attractions in Baden-Württemberg cities
-- ============================================================================

-- ----------------------------------------------------------------------------
-- Insert Attraction Categories
-- ----------------------------------------------------------------------------
INSERT INTO attraction_category (name, description) VALUES
    ('Museum', 'Museums, galleries, and exhibition spaces'),
    ('Church', 'Churches, cathedrals, chapels, and religious buildings'),
    ('Park', 'Parks, gardens, and green spaces'),
    ('Monument', 'Monuments, memorials, and statues'),
    ('Historic Building', 'Historic buildings, castles, and palaces'),
    ('Nature', 'Natural attractions, viewpoints, and landscapes'),
    ('Theater', 'Theaters, concert halls, and performance venues'),
    ('Bridge', 'Historic or notable bridges'),
    ('Ruins', 'Archaeological sites and ruins'),
    ('Tower', 'Towers and observation points'),
    ('Cemetery', 'Historic cemeteries and burial grounds'),
    ('Square', 'Notable squares and plazas');

-- ----------------------------------------------------------------------------
-- Insert Attraction Tags
-- ----------------------------------------------------------------------------
INSERT INTO attraction_tag (name) VALUES
    ('jewelry'),
    ('gold'),
    ('history'),
    ('art'),
    ('architecture'),
    ('nature'),
    ('black forest'),
    ('roman'),
    ('medieval'),
    ('baroque'),
    ('modern'),
    ('family-friendly'),
    ('free entry'),
    ('guided tours'),
    ('wheelchair accessible'),
    ('outdoor'),
    ('indoor'),
    ('panorama'),
    ('reconstruction'),
    ('war memorial'),
    ('university'),
    ('zoo'),
    ('automotive'),
    ('technology'),
    ('renaissance');

-- ============================================================================
-- PFORZHEIM - Die Goldstadt
-- ============================================================================

-- Schmuckmuseum Pforzheim (Jewelry Museum)
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours, 
    entrance_fee, unesco_heritage)
VALUES (
    'Jewelry Museum Pforzheim',
    'Schmuckmuseum Pforzheim',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8924, 8.7044)::geocoord,
    1961,
    'Weltweit einzigartiges Museum zur Geschichte des Schmucks von der Antike bis zur Gegenwart. Beherbergt über 2.000 Exponate aus 5.000 Jahren Schmuckgeschichte, darunter antiken, ethnographischen und zeitgenössischen Schmuck.',
    'https://www.schmuckmuseum.de',
    'Di-So 10:00-17:00, Mo geschlossen',
    '3€ / ermäßigt 1,50€',
    FALSE
);

-- Technisches Museum der Pforzheimer Schmuck- und Uhrenindustrie
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Technical Museum of Jewelry and Watch Industry',
    'Technisches Museum der Pforzheimer Schmuck- und Uhrenindustrie',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8916, 8.7038)::geocoord,
    1970,
    'Museum im historischen Industriegebäude zeigt die traditionelle Schmuck- und Uhrenherstellung. Historische Maschinen und Werkzeuge demonstrieren die Handwerkskunst der Goldstadt.',
    'https://www.technisches-museum-pforzheim.de',
    'Mi 9:00-12:00, 14:00-17:00, jeden 2. und 4. Sonntag 10:00-17:00',
    'Eintritt frei',
    FALSE
);

-- Stadtkirche St. Michael
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'St. Michael City Church',
    'Stadtkirche St. Michael',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Church'),
    ROW(48.8918, 8.7057)::geocoord,
    1225,
    'Ältestes erhaltenes Bauwerk Pforzheims, ursprünglich romanisch, später gotisch erweitert. Beherbergt Grabmäler badischer Markgrafen. Nach Kriegszerstörung 1945 wiederaufgebaut.',
    NULL,
    'Täglich 9:00-18:00',
    'Eintritt frei',
    FALSE
);

-- Schlosskirche St. Michael
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Schlosskirche (Castle Church)',
    'Schlosskirche St. Michael',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Church'),
    ROW(48.8923, 8.7062)::geocoord,
    1460,
    'Spätgotische Kirche mit bedeutender Grablege der badischen Markgrafen. Hier liegt Johannes Reuchlin begraben, der bedeutende Humanist und Begründer der christlichen Hebraistik.',
    NULL,
    'Führungen nach Vereinbarung',
    'Eintritt frei',
    FALSE
);

-- Wildpark Pforzheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, established_year, description, website, 
    opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Wildpark Pforzheim',
    'Wildpark Pforzheim',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Park'),
    ROW(48.8689, 8.7419)::geocoord,
    380,
    1965,
    'Beliebter Tierpark am Rand des Schwarzwalds mit über 400 Tieren in 70 Arten. Heimische Wildtiere wie Wildschweine, Hirsche, Luchse und Wölfe in naturnahen Gehegen. Waldspielplatz und Streichelzoo.',
    'https://www.wildpark-pforzheim.de',
    'Ganzjährig geöffnet, täglich ab 7:00',
    'Eintritt frei',
    FALSE
);

-- Enzauenpark
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Enzauenpark',
    'Enzauenpark',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Park'),
    ROW(48.9012, 8.7156)::geocoord,
    1992,
    'Weitläufiger Park entlang der Enz mit Wasserspielplatz, Biergarten und dem Römerboot "Lusia". Entstanden zur Landesgartenschau 1992. Beliebtes Naherholungsgebiet.',
    'https://www.pforzheim.de/enzauenpark',
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Gasometer Pforzheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Gasometer Pforzheim',
    'Gasometer Pforzheim',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8847, 8.6928)::geocoord,
    2003,
    'Ehemaliger Gasbehälter, heute größte 360°-Panorama-Ausstellung der Welt. Zeigt wechselnde monumentale Panoramabilder des Künstlers Yadegar Asisi auf 40m Höhe und 110m Umfang.',
    'https://www.gasometer-pforzheim.de',
    'Di-So 10:00-18:00',
    '12€ / ermäßigt 10€',
    FALSE
);

-- Reuchlinhaus
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Reuchlinhaus',
    'Reuchlinhaus',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8922, 8.7048)::geocoord,
    1961,
    'Kulturzentrum mit dem Schmuckmuseum und dem Museum Johannes Reuchlin. Benannt nach dem in Pforzheim geborenen Humanisten Johannes Reuchlin (1455-1522). Modernistische Architektur der Nachkriegszeit.',
    'https://www.pforzheim.de/reuchlinhaus',
    'Di-So 10:00-17:00',
    '3€',
    FALSE
);

-- Wallberg (Aussichtspunkt)
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Wallberg Viewpoint',
    'Wallberg',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Nature'),
    ROW(48.8831, 8.7208)::geocoord,
    417,
    'Aussichtspunkt mit Panoramablick über Pforzheim und den nördlichen Schwarzwald. Standort des Mahnmals für die Opfer des Zweiten Weltkriegs, das an den verheerenden Luftangriff vom 23. Februar 1945 erinnert. Beliebtes Ausflugsziel mit Waldwegen und Ruhebänken.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Römerbrücke
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Roman Bridge Foundation (Archaeological Site)',
    'Fundamente der Römerbrücke',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Ruins'),
    ROW(48.8928, 8.7098)::geocoord,
    NULL,
    'Archäologische Überreste einer römischen Brücke über die Enz. Zeugt von der römischen Siedlung Portus (lat. Hafen), die dem heutigen Pforzheim seinen Namen gab.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Kupferhammer
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Kupferhammer (Copper Mill)',
    'Kupferhammer',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(48.8756, 8.6678)::geocoord,
    1513,
    'Historisches Hammerwerk am Würmtal, eines der ältesten Industriedenkmäler der Region. Zeigt die frühe Metallverarbeitung, die zur Entwicklung der Pforzheimer Schmuckindustrie beitrug.',
    NULL,
    'Führungen nach Vereinbarung',
    'Eintritt frei',
    FALSE
);

-- DDM - Das Deutsche Damenmode Museum (DDMM im Reuchlinhaus)
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'German Fashion Museum',
    'DDM - Deutsches Damenmode Museum',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8922, 8.7048)::geocoord,
    2006,
    'Museum für Mode und Textilgeschichte mit Exponaten vom 18. Jahrhundert bis heute. Zeigt die Entwicklung der Damenmode und des Modedesigns.',
    'https://www.ddm-pforzheim.de',
    'Di-So 10:00-17:00',
    '3€',
    FALSE
);

-- Alfons-Kern-Turm (Aussichtsturm)
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, established_year, description, website, 
    opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Alfons Kern Tower',
    'Alfons-Kern-Turm',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Tower'),
    ROW(48.8614, 8.7478)::geocoord,
    470,
    1895,
    'Historischer Aussichtsturm auf dem Schlossberg mit Blick über Pforzheim und den Schwarzwald. Benannt nach dem Pädagogen Alfons Kern.',
    NULL,
    'Tagsüber geöffnet',
    'Eintritt frei',
    FALSE
);

-- Hauptfriedhof Pforzheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Main Cemetery Pforzheim',
    'Hauptfriedhof Pforzheim',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Cemetery'),
    ROW(48.8834, 8.6862)::geocoord,
    1877,
    'Parkartiger Friedhof mit historischen Grabmälern und Gedenkstätte für die Opfer des Luftangriffs vom 23. Februar 1945, bei dem fast 18.000 Menschen starben.',
    NULL,
    'Täglich 8:00-20:00 (Sommer), 8:00-17:00 (Winter)',
    'Eintritt frei',
    FALSE
);

-- Marktplatz Pforzheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, description, website, opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Market Square Pforzheim',
    'Marktplatz',
    'Pforzheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Square'),
    ROW(48.8912, 8.7025)::geocoord,
    'Zentraler Platz der Innenstadt mit Wochenmarkt (Di, Do, Sa). Nach der Zerstörung 1945 modern wieder aufgebaut. Treffpunkt und Veranstaltungsort.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- ============================================================================
-- KARLSRUHE - Die Fächerstadt
-- ============================================================================

-- Schloss Karlsruhe
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Karlsruhe Palace',
    'Schloss Karlsruhe',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(49.0134, 8.4044)::geocoord,
    1715,
    'Barockschloss und Gründungsort der Stadt Karlsruhe. Heute Sitz des Badischen Landesmuseums. Von hier aus erstrecken sich 32 Straßen fächerförmig - daher der Beiname "Fächerstadt".',
    'https://www.landesmuseum.de',
    'Di-So 10:00-17:00',
    '5€ / ermäßigt 4€',
    FALSE
);

-- ZKM Zentrum für Kunst und Medien
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'ZKM Center for Art and Media',
    'ZKM Zentrum für Kunst und Medien',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(49.0006, 8.3850)::geocoord,
    1997,
    'Weltweit einzigartiges Kulturinstitut, das Kunst und neue Medien verbindet. Interaktive Ausstellungen, Medienkunst und digitale Kultur in einer ehemaligen Munitionsfabrik.',
    'https://zkm.de',
    'Mi-Fr 10:00-18:00, Sa-So 11:00-18:00',
    '8€ / ermäßigt 6€',
    FALSE
);

-- Botanischer Garten Karlsruhe
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Botanical Garden Karlsruhe',
    'Botanischer Garten Karlsruhe',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Park'),
    ROW(49.0128, 8.4117)::geocoord,
    1808,
    'Historischer Garten mit über 20 Gewächshäusern und exotischen Pflanzen. Teil des Schlossgartens mit seltenen Baumarten und einem malerischen See.',
    'https://www.botanischer-garten-karlsruhe.de',
    'Täglich 6:00-21:00 (Sommer)',
    'Eintritt frei',
    FALSE
);

-- Pyramide am Marktplatz
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Karlsruhe Pyramid',
    'Pyramide am Marktplatz',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Monument'),
    ROW(49.0092, 8.4039)::geocoord,
    1825,
    'Wahrzeichen der Stadt und Grabmal des Stadtgründers Markgraf Karl Wilhelm. Die Pyramide aus rotem Sandstein steht genau über der Gruft in der ehemaligen Konkordienkirche.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Staatliche Kunsthalle Karlsruhe
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'State Art Gallery Karlsruhe',
    'Staatliche Kunsthalle Karlsruhe',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(49.0097, 8.3947)::geocoord,
    1846,
    'Eine der ältesten und bedeutendsten Kunstsammlungen Deutschlands. Meisterwerke vom Mittelalter bis zur Gegenwart, darunter Grünewalds Kreuzigung und Werke von Monet und Cézanne.',
    'https://www.kunsthalle-karlsruhe.de',
    'Di-So 10:00-18:00',
    '8€ / ermäßigt 6€',
    FALSE
);

-- Turmberg
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, established_year, description, website, 
    opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Turmberg',
    'Turmberg',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Nature'),
    ROW(48.9994, 8.4622)::geocoord,
    256,
    1888,
    'Aussichtsberg in Durlach mit Ruine einer mittelalterlichen Burg. Die Turmbergbahn, Deutschlands älteste Standseilbahn, fährt auf den Gipfel. Panoramablick über die Rheinebene.',
    'https://www.turmbergbahn.de',
    '24 Stunden geöffnet',
    'Eintritt frei (Bahn: 2€)',
    FALSE
);

-- Bundesverfassungsgericht
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Federal Constitutional Court',
    'Bundesverfassungsgericht',
    'Karlsruhe',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(49.0125, 8.4006)::geocoord,
    1969,
    'Höchstes Gericht der Bundesrepublik Deutschland. Der moderne Bau am Schlossplatz symbolisiert die Offenheit der Demokratie. Führungen nach Anmeldung möglich.',
    'https://www.bundesverfassungsgericht.de',
    'Führungen nach Anmeldung',
    'Eintritt frei',
    FALSE
);

-- ============================================================================
-- MANNHEIM - Die Quadratestadt
-- ============================================================================

-- Barockschloss Mannheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Mannheim Baroque Palace',
    'Barockschloss Mannheim',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(49.4833, 8.4625)::geocoord,
    1760,
    'Eines der größten Barockschlösser Europas mit über 500m Fassadenlänge. Heute Sitz der Universität Mannheim. Prunkvolle Innenräume und Schlosskirche besichtbar.',
    'https://www.schloss-mannheim.de',
    'Di-So 10:00-17:00',
    '8€ / ermäßigt 4€',
    FALSE
);

-- Wasserturm Mannheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Mannheim Water Tower',
    'Wasserturm Mannheim',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Monument'),
    ROW(49.4839, 8.4772)::geocoord,
    1889,
    'Wahrzeichen Mannheims im Jugendstil. Der 60m hohe Turm mit Brunnenanlage und Wasserspielen bildet das Zentrum des Friedrichsplatzes, einem der schönsten Jugendstilensembles Deutschlands.',
    NULL,
    '24 Stunden geöffnet (außen)',
    'Eintritt frei',
    FALSE
);

-- Technoseum
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'TECHNOSEUM - Museum of Technology',
    'Technoseum',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(49.4764, 8.4969)::geocoord,
    1990,
    'Eines der größten Technikmuseen Europas. Interaktive Ausstellungen zur Industrialisierung, Technikgeschichte und Zukunftstechnologien. Hier wurde das erste Auto erfunden!',
    'https://www.technoseum.de',
    'Täglich 9:00-17:00',
    '9€ / ermäßigt 6€',
    FALSE
);

-- Luisenpark
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Luisenpark',
    'Luisenpark',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Park'),
    ROW(49.4797, 8.4950)::geocoord,
    1903,
    'Einer der schönsten Stadtparks Deutschlands. Chinesischer Garten, Gondoletta-Bootsfahrt, Schmetterlingshaus und Pflanzenschauhaus. Austragungsort der BUGA 2023.',
    'https://www.luisenpark.de',
    'Täglich 9:00-20:00 (Sommer)',
    '8€ / ermäßigt 4€',
    FALSE
);

-- Kunsthalle Mannheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Kunsthalle Mannheim',
    'Kunsthalle Mannheim',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(49.4844, 8.4758)::geocoord,
    1907,
    'Bedeutende Sammlung moderner und zeitgenössischer Kunst. Der spektakuläre Neubau von 2018 verbindet historische und moderne Architektur. Werke von Manet, Cézanne, Beckmann.',
    'https://www.kuma.art',
    'Di-So 10:00-18:00, Mi 10:00-20:00',
    '14€ / ermäßigt 12€',
    FALSE
);

-- Jesuitenkirche Mannheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Jesuit Church Mannheim',
    'Jesuitenkirche Mannheim',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Church'),
    ROW(49.4875, 8.4633)::geocoord,
    1760,
    'Bedeutendste Barockkirche im deutschen Südwesten. Prachtvolle Innenausstattung mit Fresken und vergoldeten Stuckaturen. Vorbild für viele süddeutsche Kirchenbauten.',
    NULL,
    'Täglich 8:00-18:00',
    'Eintritt frei',
    FALSE
);

-- Fernmeldeturm Mannheim
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, established_year, description, website, 
    opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Mannheim Telecommunications Tower',
    'Fernmeldeturm Mannheim',
    'Mannheim',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Tower'),
    ROW(49.4797, 8.4958)::geocoord,
    217,
    1975,
    'Mit 217,8m höchstes Bauwerk der Region. Drehrestaurant und Aussichtsplattform bieten 360°-Panorama über Mannheim, Ludwigshafen und die Rheinebene.',
    NULL,
    'Derzeit geschlossen für Renovierung',
    '5€',
    FALSE
);

-- ============================================================================
-- STUTTGART - Die Schwabenmetropole
-- ============================================================================

-- Mercedes-Benz Museum
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Mercedes-Benz Museum',
    'Mercedes-Benz Museum',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.7882, 9.2339)::geocoord,
    2006,
    'Spektakuläre Architektur beherbergt 160 Fahrzeuge und 1.500 Exponate zur Geschichte des Automobils. Neun Ebenen führen durch 130 Jahre Automobilgeschichte.',
    'https://www.mercedes-benz.com/museum',
    'Di-So 9:00-18:00',
    '12€ / ermäßigt 6€',
    FALSE
);

-- Porsche Museum
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Porsche Museum',
    'Porsche Museum',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.8342, 9.1519)::geocoord,
    2009,
    'Futuristische Architektur präsentiert die Geschichte der Marke Porsche. Über 80 Fahrzeuge vom ersten Porsche 356 bis zu aktuellen Rennwagen und Prototypen.',
    'https://www.porsche.com/museum',
    'Di-So 9:00-18:00',
    '10€ / ermäßigt 5€',
    FALSE
);

-- Staatsgalerie Stuttgart
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'State Gallery Stuttgart',
    'Staatsgalerie Stuttgart',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(48.7797, 9.1867)::geocoord,
    1843,
    'Eine der bedeutendsten Kunstsammlungen Deutschlands. Der postmoderne Erweiterungsbau von James Stirling ist selbst ein Kunstwerk. Alte Meister bis zeitgenössische Kunst.',
    'https://www.staatsgalerie.de',
    'Di-So 10:00-17:00, Do 10:00-20:00',
    '7€ / ermäßigt 5€',
    FALSE
);

-- Wilhelma
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Wilhelma Zoo and Botanical Garden',
    'Wilhelma',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Park'),
    ROW(48.8053, 9.2067)::geocoord,
    1846,
    'Einzigartiger zoologisch-botanischer Garten in historischer maurischer Architektur. Über 11.000 Tiere und 8.500 Pflanzenarten. Zweitgrößter Zoo Deutschlands.',
    'https://www.wilhelma.de',
    'Täglich 8:15-17:30',
    '20€ / ermäßigt 10€',
    FALSE
);

-- Schlossplatz Stuttgart
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Schlossplatz Stuttgart',
    'Schlossplatz',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Square'),
    ROW(48.7784, 9.1794)::geocoord,
    1746,
    'Zentraler Platz der Stadt mit dem Neuen Schloss, Jubiläumssäule und Kunstgebäude. Beliebter Treffpunkt für Veranstaltungen, Weihnachtsmarkt und Stadtfeste.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Fernsehturm Stuttgart
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, established_year, description, website, 
    opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Stuttgart TV Tower',
    'Fernsehturm Stuttgart',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Tower'),
    ROW(48.7558, 9.1919)::geocoord,
    217,
    1956,
    'Erster Fernsehturm der Welt in Stahlbetonbauweise und Vorbild für viele weitere. Aussichtsplattform auf 150m Höhe mit Panoramablick über Stuttgart und die schwäbische Alb.',
    'https://www.fernsehturm-stuttgart.de',
    'Mo-Do 10:00-21:00, Fr-So 9:00-22:00',
    '9€ / ermäßigt 5€',
    FALSE
);

-- Neues Schloss Stuttgart
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'New Palace Stuttgart',
    'Neues Schloss Stuttgart',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(48.7783, 9.1811)::geocoord,
    1807,
    'Letzte große Barockresidenz in Deutschland. Heute Sitz von Ministerien. Der Ehrenhof und die Fassade können besichtigt werden, Innenräume nur bei besonderen Anlässen.',
    NULL,
    'Außenbesichtigung jederzeit',
    'Eintritt frei',
    FALSE
);

-- Stiftskirche Stuttgart
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Collegiate Church Stuttgart',
    'Stiftskirche Stuttgart',
    'Stuttgart',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Church'),
    ROW(48.7769, 9.1783)::geocoord,
    1240,
    'Älteste Kirche der Innenstadt und Grablege der württembergischen Grafen. Gotischer Bau mit romanischem Südturm. Nach Kriegszerstörung originalgetreu wiederaufgebaut.',
    NULL,
    'Täglich 10:00-19:00',
    'Eintritt frei',
    FALSE
);

-- ============================================================================
-- FREIBURG - Das Tor zum Schwarzwald
-- ============================================================================

-- Freiburger Münster
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Freiburg Minster',
    'Freiburger Münster',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Church'),
    ROW(47.9958, 7.8522)::geocoord,
    1200,
    'Gotisches Meisterwerk mit dem "schönsten Turm der Christenheit" (Jacob Burckhardt). Der 116m hohe durchbrochene Turmhelm überstand als einziger die Bombenangriffe 1944.',
    'https://www.freiburgermuenster.info',
    'Mo-Sa 10:00-17:00, So 13:00-17:00',
    'Eintritt frei, Turm 5€',
    FALSE
);

-- Schlossberg Freiburg
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, elevation, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Schlossberg Freiburg',
    'Schlossberg',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Nature'),
    ROW(47.9967, 7.8619)::geocoord,
    456,
    'Hausberg Freiburgs mit Aussichtsturm und Panoramablick über die Stadt, den Schwarzwald und bis zu den Vogesen. Erreichbar per Seilbahn oder zu Fuß.',
    'https://www.schlossbergbahn.de',
    '24 Stunden geöffnet',
    'Eintritt frei, Seilbahn 4€',
    FALSE
);

-- Augustinermuseum
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Augustiner Museum',
    'Augustinermuseum',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(47.9939, 7.8508)::geocoord,
    1923,
    'Kunst und Kulturgeschichte vom Mittelalter bis zum Barock in einem ehemaligen Augustinerkloster. Originalfiguren vom Münster und Werke von Matthias Grünewald und Hans Baldung Grien.',
    'https://www.freiburg.de/augustinermuseum',
    'Di-So 10:00-17:00',
    '7€ / ermäßigt 5€',
    FALSE
);

-- Münsterplatz Freiburg
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, description, website, opening_hours, entrance_fee, unesco_heritage)
VALUES (
    'Münsterplatz Freiburg',
    'Münsterplatz',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Square'),
    ROW(47.9956, 7.8519)::geocoord,
    'Historischer Marktplatz rund um das Münster. Täglich Bauernmarkt mit regionalen Produkten. Umgeben von historischen Gebäuden wie dem Kaufhaus und dem Wentzingerhaus.',
    NULL,
    '24 Stunden geöffnet, Markt Mo-Sa 7:30-13:30',
    'Eintritt frei',
    FALSE
);

-- Historisches Kaufhaus
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Historical Merchants Hall',
    'Historisches Kaufhaus',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Historic Building'),
    ROW(47.9950, 7.8525)::geocoord,
    1520,
    'Spätgotischer Prachtbau mit markanter roter Fassade und Erkern. Ehemals Handels- und Zollhaus, heute Veranstaltungsort. Habsburger Wappen an der Fassade.',
    NULL,
    'Außenbesichtigung jederzeit',
    'Eintritt frei',
    FALSE
);

-- Bächle
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Freiburg Bächle (Water Channels)',
    'Freiburger Bächle',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Monument'),
    ROW(47.9960, 7.8510)::geocoord,
    1220,
    'Einzigartige mittelalterliche Wasserrinnen, die sich durch die Altstadt ziehen. Ursprünglich zur Löschwasserversorgung und Viehtränke. Wer hineintritt, heiratet angeblich einen Freiburger.',
    NULL,
    '24 Stunden geöffnet',
    'Eintritt frei',
    FALSE
);

-- Colombischlössle
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Colombi Palace - Archaeological Museum',
    'Colombischlössle',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Museum'),
    ROW(47.9925, 7.8456)::geocoord,
    1861,
    'Neugotische Villa im Colombipark beherbergt das Archäologische Museum. Funde von der Steinzeit bis zum Mittelalter aus der Region Südbaden.',
    'https://www.freiburg.de/museen',
    'Di-So 10:00-17:00',
    '5€ / ermäßigt 3€',
    FALSE
);

-- Martinstor
INSERT INTO attraction (name, local_name, city, country, province, category_id,
    coordinates, established_year, description, website, opening_hours,
    entrance_fee, unesco_heritage)
VALUES (
    'Martinstor (City Gate)',
    'Martinstor',
    'Freiburg',
    'D',
    'Baden-Württemberg',
    (SELECT id FROM attraction_category WHERE name = 'Monument'),
    ROW(47.9936, 7.8500)::geocoord,
    1202,
    'Eines der zwei erhaltenen mittelalterlichen Stadttore Freiburgs. Der Turm wurde 1901 auf 60m erhöht. Heute führt die Haupteinkaufsstraße hindurch.',
    NULL,
    '24 Stunden geöffnet (außen)',
    'Eintritt frei',
    FALSE
);

-- ----------------------------------------------------------------------------
-- Link Attractions to Tags
-- ----------------------------------------------------------------------------

-- Schmuckmuseum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Schmuckmuseum Pforzheim' 
  AND t.name IN ('jewelry', 'gold', 'history', 'art', 'indoor', 'wheelchair accessible');

-- Technisches Museum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Technisches Museum der Pforzheimer Schmuck- und Uhrenindustrie' 
  AND t.name IN ('jewelry', 'gold', 'history', 'indoor', 'free entry');

-- Wildpark tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Wildpark Pforzheim' 
  AND t.name IN ('nature', 'black forest', 'family-friendly', 'free entry', 'outdoor');

-- Enzauenpark tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Enzauenpark' 
  AND t.name IN ('nature', 'family-friendly', 'free entry', 'outdoor');

-- Gasometer tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Gasometer Pforzheim' 
  AND t.name IN ('art', 'modern', 'panorama', 'indoor', 'wheelchair accessible');

-- Stadtkirche tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Stadtkirche St. Michael' 
  AND t.name IN ('history', 'architecture', 'medieval', 'free entry', 'reconstruction');

-- Schlosskirche tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Schlosskirche St. Michael' 
  AND t.name IN ('history', 'architecture', 'medieval', 'free entry');

-- Wallberg tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Wallberg' 
  AND t.name IN ('nature', 'war memorial', 'panorama', 'free entry', 'outdoor');

-- Römerbrücke tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Fundamente der Römerbrücke' 
  AND t.name IN ('roman', 'history', 'free entry', 'outdoor');

-- Kupferhammer tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Kupferhammer' 
  AND t.name IN ('history', 'gold', 'guided tours');

-- Hauptfriedhof tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Hauptfriedhof Pforzheim' 
  AND t.name IN ('history', 'war memorial', 'free entry', 'outdoor');

-- Alfons-Kern-Turm tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Alfons-Kern-Turm' 
  AND t.name IN ('panorama', 'black forest', 'free entry', 'outdoor');

-- ============================================================================
-- KARLSRUHE Tags
-- ============================================================================

-- Schloss Karlsruhe tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Schloss Karlsruhe' 
  AND t.name IN ('baroque', 'history', 'architecture', 'indoor');

-- ZKM tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'ZKM Zentrum für Kunst und Medien' 
  AND t.name IN ('art', 'modern', 'technology', 'indoor', 'wheelchair accessible');

-- Botanischer Garten tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Botanischer Garten Karlsruhe' 
  AND t.name IN ('nature', 'free entry', 'outdoor', 'family-friendly');

-- Pyramide tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Pyramide am Marktplatz' 
  AND t.name IN ('history', 'free entry', 'outdoor');

-- Kunsthalle Karlsruhe tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Staatliche Kunsthalle Karlsruhe' 
  AND t.name IN ('art', 'history', 'indoor');

-- Turmberg tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Turmberg' 
  AND t.name IN ('panorama', 'nature', 'medieval', 'outdoor', 'family-friendly');

-- Bundesverfassungsgericht tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Bundesverfassungsgericht' 
  AND t.name IN ('modern', 'architecture', 'guided tours', 'free entry');

-- ============================================================================
-- MANNHEIM Tags
-- ============================================================================

-- Barockschloss Mannheim tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Barockschloss Mannheim' 
  AND t.name IN ('baroque', 'history', 'architecture', 'university', 'indoor');

-- Wasserturm tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Wasserturm Mannheim' 
  AND t.name IN ('architecture', 'free entry', 'outdoor');

-- Technoseum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Technoseum' 
  AND t.name IN ('technology', 'automotive', 'history', 'family-friendly', 'indoor', 'wheelchair accessible');

-- Luisenpark tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Luisenpark' 
  AND t.name IN ('nature', 'family-friendly', 'outdoor');

-- Kunsthalle Mannheim tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Kunsthalle Mannheim' 
  AND t.name IN ('art', 'modern', 'architecture', 'indoor', 'wheelchair accessible');

-- Jesuitenkirche tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Jesuitenkirche Mannheim' 
  AND t.name IN ('baroque', 'architecture', 'free entry', 'indoor');

-- Fernmeldeturm Mannheim tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Fernmeldeturm Mannheim' 
  AND t.name IN ('panorama', 'modern', 'architecture');

-- ============================================================================
-- STUTTGART Tags
-- ============================================================================

-- Mercedes-Benz Museum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Mercedes-Benz Museum' 
  AND t.name IN ('automotive', 'history', 'technology', 'modern', 'architecture', 'indoor', 'wheelchair accessible');

-- Porsche Museum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Porsche Museum' 
  AND t.name IN ('automotive', 'history', 'technology', 'modern', 'architecture', 'indoor');

-- Staatsgalerie Stuttgart tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Staatsgalerie Stuttgart' 
  AND t.name IN ('art', 'history', 'modern', 'architecture', 'indoor');

-- Wilhelma tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Wilhelma' 
  AND t.name IN ('zoo', 'nature', 'family-friendly', 'outdoor');

-- Schlossplatz Stuttgart tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Schlossplatz' AND a.city = 'Stuttgart'
  AND t.name IN ('baroque', 'free entry', 'outdoor');

-- Fernsehturm Stuttgart tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Fernsehturm Stuttgart' 
  AND t.name IN ('panorama', 'modern', 'architecture');

-- Neues Schloss Stuttgart tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Neues Schloss Stuttgart' 
  AND t.name IN ('baroque', 'history', 'architecture', 'free entry', 'outdoor');

-- Stiftskirche Stuttgart tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Stiftskirche Stuttgart' 
  AND t.name IN ('medieval', 'history', 'architecture', 'free entry', 'reconstruction');

-- ============================================================================
-- FREIBURG Tags
-- ============================================================================

-- Freiburger Münster tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Freiburger Münster' 
  AND t.name IN ('medieval', 'architecture', 'history', 'free entry', 'panorama');

-- Schlossberg Freiburg tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Schlossberg' AND a.city = 'Freiburg'
  AND t.name IN ('nature', 'panorama', 'black forest', 'outdoor', 'family-friendly');

-- Augustinermuseum tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Augustinermuseum' 
  AND t.name IN ('art', 'medieval', 'history', 'indoor');

-- Münsterplatz Freiburg tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Münsterplatz' AND a.city = 'Freiburg'
  AND t.name IN ('history', 'free entry', 'outdoor');

-- Historisches Kaufhaus tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Historisches Kaufhaus' 
  AND t.name IN ('medieval', 'renaissance', 'architecture', 'free entry');

-- Bächle tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Freiburger Bächle' 
  AND t.name IN ('medieval', 'history', 'free entry', 'outdoor', 'family-friendly');

-- Colombischlössle tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Colombischlössle' 
  AND t.name IN ('history', 'roman', 'indoor');

-- Martinstor tags
INSERT INTO attraction_has_tag (attraction_id, tag_id)
SELECT a.id, t.id FROM attraction a, attraction_tag t
WHERE a.local_name = 'Martinstor' 
  AND t.name IN ('medieval', 'history', 'free entry', 'outdoor');

-- ----------------------------------------------------------------------------
-- Add alternative names for some attractions
-- ----------------------------------------------------------------------------
INSERT INTO attraction_othername (attraction_id, othername, language) VALUES
    ((SELECT id FROM attraction WHERE local_name = 'Schmuckmuseum Pforzheim'), 
     'Pforzheim Jewelry Museum', 'English'),
    ((SELECT id FROM attraction WHERE local_name = 'Gasometer Pforzheim'), 
     'Panorama Museum', 'English'),
    ((SELECT id FROM attraction WHERE local_name = 'Wildpark Pforzheim'), 
     'Wildlife Park Pforzheim', 'English'),
    ((SELECT id FROM attraction WHERE local_name = 'Stadtkirche St. Michael'), 
     'Stiftskirche', 'German');
