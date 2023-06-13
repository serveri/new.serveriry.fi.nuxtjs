# Ohjeet sivuston kehitykseen osallistumiseen

Suosittelemme lukemaan tämän ohjeen ennen sivuston kehitykseen osallistumista.

## Kuinka voin osallistua?

Voit osallistua sivuston kehitykseen monella tavalla. Voit esimerkiksi:

- [Ilmoittaa virheistä](#ilmoita-virheistä)
- [Ehdottaa uusia ominaisuuksia](#ehdota-uusia-ominaisuuksia)
- [Korjata virheitä](#korjaa-virheitä)
- [Keihittää uusia ominaisuuksia](#kehittää-uusia-ominaisuuksia)
- [Tule mukaan ylläpitoon](#tule-mukaan-ylläpitoon)

### Ilmoita virheistä

Jos huomaat sivustolla virheen, bugin tai muuta korjattavaa, voit ilmoittaa siitä tekemällä issuen GitHubin / Codebergin
[Issues-osiossa](https://github.com/serveri/new.serveriry.fi.nuxtjs/issues/new?assignees=&labels=area%3A+examples&projects=&template=bug.yml).
Virheen korjaamiseksi helpottamiseksi kannattaa täyttää kaikki kohdat mahdollisimman tarkasti. Ylläpito auttaa
virheilmoituksen tekemisessä tarvittaessa.

### Korjaa virheitä

Jos osaat ja haluat korjata virheen itse, voit tehdä sen tekemällä pull requestin GitHubin / Codebergin
[Pull requests-osiossa](https://github.com/serveri/new.serveriry.fi.nuxtjs/compare). Lisää pull requestiin
issue numero, johon pull request liittyy. Kun pull request on valmis, ylläpito tarkistaa sen ja joko pyytää
muutoksia tai hyväksyy sen.

### Ehdota uusia ominaisuuksia

Jos haluat ehdottaa uutta ominaisuutta, voit tehdä sen tekemällä issuen GitHubin / Codebergin
[Issues-osiossa](https://github.com/serveri/new.serveriry.fi.nuxtjs/issues/new/choose). Ominaisuuksia voi ehottaa
vaikka ei itse osaa tai halua niitä toteuttaa.

### Kehittää uusia ominaisuuksia

Ennen kuin aloitat uuden ominaisuuden toteuttamisen, kannattaa kuitenkin luoda siitä ehdotus issuen muodossa, jotta
voimme keskustella sen tarpeellisuudesta ja toteutustavasta.

### Tule mukaan ylläpitoon

Jos haluat tulla mukaan ylläpitoon, voit lähettää vapaamuotoisen järjestelmätoimikuntahakemuksen ylläpidolle
yllapito@serveriry.fi tai vaikka telegrammissa. Kerro hakemuksessa vähän itsestäsi, osaamisestasi ja siitä, mitä
haluaisit tehdä
järjestelmätoimikunnassa. Lähtökohtaisesti kaikki halukkaat pääsevät mukaan, eikä se sido sinua mihinkään.
Tule rohkeasti mukaan kehittämään omia taitojasi ja Serveri ry:n infrastruktuuria.

## Kehitysympäristön pystytys ja käyttö

Ohjeet kehitysympäristön pystyttämiseen löytyvät [README.md](README.md)-tiedostosta.

## Muutosten tekeminen

1. Tee issue uudesta ominaisuudesta tai virheestä, jonka haluat korjata tai valitse joku olemassa oleva issue, johon
   haluat tehdä muutoksia. Tarkista, ettei samasta asiasta ole jo tehty issueta.
2. Forkkaa tämä repository.
3. Tee muutokset omaan forkkiisi. Varmista, että koodisi on [laadukasta](#laadukkaan-koodin-kirjoittaminen).
4. Tee pull request dev branchiin. Lisää pull requestiin issue numero, johon pull request liittyy. Kuvaa pull
   requestissa tekemäsi muutokset mahdollisimman tarkasti.
5. Kun pull request on valmis, ylläpito tarkistaa sen ja joko pyytää muutoksia tai hyväksyy sen.

Jos tarvitset missään vaiheessa apua tai neuvoja, voit kysyä niitä GitHubin / Codebergin Issues-osiossa tai suoraan
ylläpidolta, esimerkiksi telegram **yksityisviestillä**. Yhteystiedot
löytyvät [serveriry.fi/tietoa-sivusta](https://serveriry.fi/tietoa-sivusta)-sivulta.

## Laadukkaan koodin kirjoittaminen

Koodin laatu on tärkeää, jotta koodia on helppo ylläpitää ja kehittää. Tässä muutamia vinkkejä laadukkaan koodin
kirjoittamiseen:

- Projektin kielenä on englanti, käytä sitä muuttujien ja funktioiden nimissä, kommentoinnissa ja commit viesteissä.
- Kommentoi koodia aina kun se on tarpeellista. Kommentit auttavat muita ymmärtämään koodia ja nopentavat koodin
  ylläpitoa. Vältä kuitenkin itsestäänselvyyksien kommentointia.
- Käytä koodin muotoiluun [Prettier](https://prettier.io/)-työkalua. Prettier muotoilee koodin automaattisesti
  yhtenäiseen muotoon, jolloin koodin muotoilusta ei tarvitse huolehtia itse. Prettierin asetukset löytyvät
  [.prettierrc](app/.prettierrc)-tiedostosta. Suositeltavaa on lisätä Prettier suoraan editoriin, jotta koodin
  muotoilu tapahtuu automaattisesti.
- Käytä koodin tarkistukseen [ESLint](https://eslint.org/)-työkalua. ESLint tarkistaa koodin automaattisesti
  yleisimmät virheet ja varoittaa niistä. ESLintin asetukset löytyvät [.eslintrc](app/.eslintrc)-tiedostosta.
- Tarkista että koodisi ei aiheuta virheitä tai varoituksia. Jos koodi aiheuttaa virheitä tai varoituksia, korjaa ne.

## Code of Conduct

Kaikkien projektin osallistujien tulee noudattaa 
[Serveri ry:n turvallisen tilan periaatteita](https://beta.serveriry.fi/yhdistys/turvallinen-tila).
