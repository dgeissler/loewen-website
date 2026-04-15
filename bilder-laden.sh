#!/bin/bash
# ============================================
# Bilder herunterladen für loewen-forst.de
# ============================================
# Dieses Skript lädt alle Bilder vom aktuellen
# Wix-Server herunter und speichert sie im
# images/ Ordner.
#
# Ausführen: bash bilder-laden.sh
# ============================================

mkdir -p images

echo "Lade Bilder herunter..."

curl -sL -o "images/favicon-32.png" "https://static.wixstatic.com/media/43b550_34e49fd4c7664fb9b18eb971e98f7d93~mv2.png/v1/crop/x_93,y_0,w_183,h_127/fill/w_32,h_32,al_c,q_85,enc_auto/logo_transparent.png"
echo "  ✓ favicon-32.png"

curl -sL -o "images/favicon-180.png" "https://static.wixstatic.com/media/43b550_34e49fd4c7664fb9b18eb971e98f7d93~mv2.png/v1/crop/x_93,y_0,w_183,h_127/fill/w_180,h_180,al_c,q_85,enc_auto/logo_transparent.png"
echo "  ✓ favicon-180.png"

curl -sL -o "images/logo.png" "https://static.wixstatic.com/media/43b550_34e49fd4c7664fb9b18eb971e98f7d93~mv2.png/v1/crop/x_93,y_0,w_183,h_127/fill/w_160,h_110,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/logo_transparent.png"
echo "  ✓ logo.png"

curl -sL -o "images/hero-bg.jpg" "https://static.wixstatic.com/media/43b550_38b04ef59ccd46bd8d5872a0b3ba94c9~mv2.jpg/v1/fill/w_1920,h_1080,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/43b550_38b04ef59ccd46bd8d5872a0b3ba94c9~mv2.jpg"
echo "  ✓ hero-bg.jpg"

curl -sL -o "images/hero-gastraum.jpg" "https://static.wixstatic.com/media/43b550_d7cce85abc224867bce6fbd40dac0dad~mv2.jpg/v1/crop/x_331,y_634,w_2791,h_1748/fill/w_800,h_500,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/Bild_06_JPG.jpg"
echo "  ✓ hero-gastraum.jpg"

curl -sL -o "images/hero-gastraum-og.jpg" "https://static.wixstatic.com/media/43b550_d7cce85abc224867bce6fbd40dac0dad~mv2.jpg/v1/crop/x_331,y_634,w_2791,h_1748/fill/w_1200,h_630,al_c,q_80,enc_avif,quality_auto/Bild_06_JPG.jpg"
echo "  ✓ hero-gastraum-og.jpg"

curl -sL -o "images/varta-siegel.jpg" "https://static.wixstatic.com/media/43b550_7649e40d8c444be4b798059ac7095095~mv2.jpg/v1/fill/w_160,h_95,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/VartaSiegel_2026_304x180.jpg"
echo "  ✓ varta-siegel.jpg"

curl -sL -o "images/familie-geissler.jpg" "https://static.wixstatic.com/media/43b550_95b4219e4aba48e984ec233ae30b8a41~mv2.jpg/v1/crop/x_233,y_0,w_1761,h_1742/fill/w_600,h_594,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC01441-2.jpg"
echo "  ✓ familie-geissler.jpg"

curl -sL -o "images/gericht-teller.jpg" "https://static.wixstatic.com/media/43b550_28b25605fa6b493c80d0d985cec9257b~mv2.jpg/v1/crop/x_339,y_0,w_1052,h_1080/fill/w_400,h_410,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC02434.jpg"
echo "  ✓ gericht-teller.jpg"

curl -sL -o "images/gastraum-holz.jpg" "https://static.wixstatic.com/media/43b550_460a78f41a8a4241929f1d5640fa118f~mv2.jpg/v1/crop/x_121,y_776,w_2174,h_1454/fill/w_700,h_460,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC01433%20Kopie_JPG.jpg"
echo "  ✓ gastraum-holz.jpg"

curl -sL -o "images/gericht-spargel.jpg" "https://static.wixstatic.com/media/43b550_7faa45b3a10a4b10af772c4c233acade~mv2.jpg/v1/fill/w_400,h_270,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/43b550_7faa45b3a10a4b10af772c4c233acade~mv2.jpg"
echo "  ✓ gericht-spargel.jpg"

curl -sL -o "images/gericht-dessert.jpg" "https://static.wixstatic.com/media/43b550_eb12d9be2b404e188b31f164a06d5f08~mv2.jpg/v1/fill/w_400,h_270,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/43b550_eb12d9be2b404e188b31f164a06d5f08~mv2.jpg"
echo "  ✓ gericht-dessert.jpg"

curl -sL -o "images/besteck-deko.png" "https://static.wixstatic.com/media/e4f166_b7f78982d379495884e4ac16be26d04b~mv2_d_1455_1985_s_2.png/v1/crop/x_102,y_285,w_575,h_1626/fill/w_80,h_220,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/sakum_yellow.png"
echo "  ✓ besteck-deko.png"

curl -sL -o "images/nebenzimmer-1.jpg" "https://static.wixstatic.com/media/43b550_14df4b9861804969a992d620ff2841fe~mv2.jpg/v1/fill/w_900,h_600,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC01434%20Kopie_JPG.jpg"
echo "  ✓ nebenzimmer-1.jpg"

curl -sL -o "images/nebenzimmer-2.jpg" "https://static.wixstatic.com/media/43b550_460a78f41a8a4241929f1d5640fa118f~mv2.jpg/v1/fill/w_900,h_600,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC01433%20Kopie_JPG.jpg"
echo "  ✓ nebenzimmer-2.jpg"

curl -sL -o "images/eingang.jpg" "https://static.wixstatic.com/media/43b550_da2e0a8b29b64df1a1ddc47aaa45e0e4~mv2.jpg/v1/crop/x_94,y_26,w_936,h_1522/fill/w_500,h_500,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/DSC02546.jpg"
echo "  ✓ eingang.jpg"

echo ""
echo "✅ Fertig! $(ls images/ | wc -l) Bilder heruntergeladen."
echo ""
echo "Nächster Schritt: Legen Sie Ihre aktuelle"
echo "Speisekarte als 'speisekarte.pdf' in diesen Ordner."
