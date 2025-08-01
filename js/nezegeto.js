
/**
 * Select tag Három értékkel(tablo,tanár,diák) kötelező eggyet választani 
 *
 * @param {selectObject}    response    Amit kiválsaztott (options értéke)
 * 
 */
function valaszt(selectObject){

    var value = selectObject.value; 
    let snev = document.getElementById('snev')
    let sevszam = document.getElementById('sevszam')
    let sosztaly =  document.getElementById('sosztaly')
    let nev = document.getElementById('nev')
    let evszam = document.getElementById('evszam')
    let osztaly = document.getElementById('osztaly')

    if(value == "tablo"){
        snev.style.opacity='0'
        sevszam.style.opacity='1'
        sosztaly.style.opacity='1'
        nev.value=''
    }
    else if(value == "diak"){
        snev.style.opacity='1'
        sevszam.style.opacity='1'
        sosztaly.style.opacity='1'
    }else if(value == "tanar"){
        snev.style.opacity='1'
        sevszam.style.opacity='0'
        sosztaly.style.opacity='0'
        osztaly.value=''
        evszam.value=''
    }else{
        alert('Tipus mező hiba')
    }
}
/**
 * Minden beviteli mező figyelése és ha nincs egyezés akkor nincs küldés sem!
 *
 * Név beviteli mezőnél figyelni kell a speciális karakterekre illetve majd kisbetüre kell konvertálni. A szóközt kivéve. (Szó elötti és utáni szóközöket átengedi :c).
 * 
 * Dátum beviteli mezőnél max 4 szám lehet és nem tartalmazhat betűket.
 * 
 * osztály beviteli mező max 2 karakter és nem lehet szám, speciális karakter.
 * 
 * Ha egy mező nem stimmel már nem is küldi ki az adatokat a szervere.
 * Majd kinullázza az elrontott mező értékét és lehet folytatni
 * Egy alert üzenet figyelmeztet a hibára
 * 
 * Ha minden mező passzol akkor kezdődhet a kiküldés a szerverre.
 */
function ellenorzes(){

    var joe = true
    var string = ''

    /**
     * 
     * Név ellenőrzése speckó karakterek nincsennek kivéve szóköz és kötölyel
     * 
     */

	var nevInput = document.getElementById("nev");
	var nev = nevInput.value;
    const nevRegex = /^[a-zA-ZÁÉÍÓÖŐÚÜŰáéíóöőúüű\s-]+$/;
	if (nev!='' && nevRegex.test(nev)==false) {
        string +='Név,'
        document.getElementById("nev").value = "";
		joe =  false;
	}
    
    /**
     * 
     * 
     * Dátum ellenőrzése csak négy szám és nincs benne karakter
     * 
     */

	var datumInput = document.getElementById("evszam");
	var evszam = datumInput.value;
	if (evszam!='' && !/^\d{4}$/.test(evszam)) {
        string +='Dátum,'
        document.getElementById("evszam").value = "";
		joe = false
	}

    /**
     * 
     * 
     * osztály ellenőrzése max 2 karakter és nem lehet benne szám se speckó karakter
     * 
     * 
     */

    var osztalyinput = document.getElementById("osztaly")
    var osztaly = osztalyinput.value;
    var regex = /^[a-zA-Z]{0,2}$/;
    if (!regex.test(osztaly)) {
      string +='Osztály,'
      document.getElementById("osztaly").value = "";
      joe = false
    }
    if(joe==false){
        string +='Beviteli mező(k) nem megfelelő(ek)'
        alert(string)
        return false
        
    }else{
        return true
       
    }
}

/**
 * Ha sikeres az ellenőrzés akkor.
 * A nevet kis betükre kell konvertálni.
 * Json formátumban eltárolja a data változóba
 * /szures API hivással a bodyban felküldjük az a adatot a szerverre.
 * A választ egy táblázatban építődik be.
 * 
 */
function kuldes(){

    /**
     * 
     * 
     * Tipus változó (tablo/diak)
     * Nev változó (Nem lehet benne szám, speciális karakter a szóközön kívül.)
     * Evszam változó (Négy karakter és csak számokat tartalmazhat.)
     * Osztaly változó (Kis betűs max 2 karakter és számokat tartalmazhat.)
     * 
     * 
     */

    if(ellenorzes()){

        tipus = document.getElementById('tipus').value; 
        nev = document.getElementById('nev').value; 
        evszam = document.getElementById('evszam').value; 
        osztaly = document.getElementById('osztaly').value.toLowerCase()
        
        let vnev = ''
        let knev = ''
        let hossz=0 

        /**
         * 
         * Név változó feldarabolása vezetéknévre és keresztnévre
         * 
         * Szóközök mentén szétdarabolom és ha egy szóköz van akkor az első elem a vezetéknév a második a keresztnév
         * Ha valakinerk három neve van akkor az első kettő a vezetéknévbe megy a harmadik a keresztnévbe
         * 
         */

        if(tipus == 'diak'){
            if(nev != ''){
                nevek = nev.split(' ')
                hossz = 1
                if(nevek.length == 2){
                    vnev = nevek[0]
                    knev = nevek[1]
                    hossz= 2
                }
                if(nevek.length == 3){
                    vnev = nevek[0]
                    knev = nevek[1]+" "+nevek[2]
                    hossz = 3
                }
            }
        }else if(tipus == 'tanar'){
            if(nev != ''){
                hossz=1
                nevek = nev.split(' ')
                if(nevek.length == 2){
                    vnev = nevek[0]
                    knev = nevek[1]
                    hossz = 2
                }
                if(nevek.length == 3){
                    vnev = nevek[0] +" "+ nevek[1]
                    knev = nevek[2]
                    hossz = 3
                }
            }
        }
        
        /**
         * 
         * 
         * @param {tipus} string tablo/diak/tanar.
         * @param {nev} string Név.
         * @param {vnev} string Vezetéknév, Névből darablova az 0.elem
         * @param {knev} string Keresztnév, Névből darabolva az 1,2. elemek lehetnek elemek között szóköz
         * @param {evszam} int Evszám.
         * @param {osztaly} string Osztály.
         * @param {hossz} int Név mező hosszát mutatja.
         * 
         * Ezeket az adatokat JSON formátumban küldjük a backendre. POST methodusssal.
         * 
         * 
         */
       
        const data = JSON.stringify({tipus:tipus,nev: nev,vnev: vnev,knev: knev,evszam: evszam,osztaly:osztaly, hossz:hossz})
        fetch('/szures', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=utf-8',
                'Content-Length': data.length
            },
            body: data
        }).then(response => response.json()).then((data) => {
            let content = ''
            let contentfej = ''
            adatok = JSON.parse(JSON.stringify(data))

            /**
             * @param {data.hely}   Tabló helyének jelölése számmal.
             * 
             * A backendtől kapott számot meg kell keresni a helyek.json filban és a hozzátartozó helységnevet kell kiiratni a táblázatban.
             * Típus alapján változik a kiiratás ezért külön táblázatok.
             *
             * 
             * Ellenőrzés, hogy jött e vissza adat. Ha nincs adat kkor jelezni.
             *  
             */


            if(tipus == 'tablo' && adatok.length == 0){

                content += `<tr>
                                <td id="nincs">Nincs eredmény. Ellenőrizze a megadott adatokat.</td>
                            </tr>`
                document.getElementById('adatfejkimenet').innerHTML = ''
                document.getElementById('adatkimenet').innerHTML = content

            }else if(tipus == 'tablo' && adatok.length > 0){
                

                contentfej += `<tr>
                                    <th>Kép</th>
                                    <th>Dátum</th>
                                    <th>Osztály</th>
                                    <th>Tabló helye</th>
                                </tr>`
                for (let s of adatok) {
                    content += `<tr>
                                    <td>
                                    <img id="lekerdkepek" src="${"../"+s.kepjpg}">
                                    <div id="modal-container">
                                        <div id="modal-content">
                                            <span class="close">&times;</span>
                                            <img id="modal-image">
                                        </div>
                                    </div>
                                    </td>
                                    <td>${s.kezdet+"-"+s.veg}</td>
                                    <td>${s.osztaly}</td>
                                    <td>${s.helye}</td>
                                </tr>
                                `
                }
                content += '</tr>'
                document.getElementById('adatfejkimenet').innerHTML = contentfej
                document.getElementById('adatkimenet').innerHTML = content



            }else if(tipus == 'diak' && adatok.length == 0){

                content += `<tr>
                                <td id="nincs">Nincs eredmény. Ellenőrizze a megadott adatokat.</td>
                            </tr>`
                document.getElementById('adatfejkimenet').innerHTML = ''
                document.getElementById('adatkimenet').innerHTML = content

            }else if(tipus == 'diak' && adatok.length > 0){

                contentfej += `<tr>
                                    <th>Kép</th>
                                    <th>Név</th>
                                    <th>Dátum</th>
                                    <th>Osztály</th>
                                    <th>Tabló helye</th>
                                    <th>Tablókép</th>
                                </tr>`
                for (let s of adatok) {
                    content += `<tr>
                                <td><img id="lekerdkepek" src="${"../"+s.mappa+s.kepjpg}"</td>
                                <td>${s.vnev+" "+s.knev}</td>
                                <td>${s.veg}</td>
                                <td>${s.osztaly}</td>
                                <td>${s.helye}</td>
                                <td><img id="lekerdkepek" src="${"../"+s.tablojpg}"</td>
                                `
                }
                content += '</tr>'
                document.getElementById('adatfejkimenet').innerHTML = contentfej
                document.getElementById('adatkimenet').innerHTML = content

            }else if(tipus == 'tanar' && adatok.length == 0){

                content += `<tr>
                                <td id="nincs">Nincs eredmény. Ellenőrizze a megadott adatokat.</td>
                            </tr>`
                document.getElementById('adatfejkimenet').innerHTML = ''
                document.getElementById('adatkimenet').innerHTML = content

            }else if(tipus == 'tanar' && adatok.length > 0){

                contentfej += `<tr>
                                    <th>Kép</th>
                                    <th>Név</th>
                                    <th>Beosztás</th>
                                    <th>Tabló helye</th>
                                    <th>Tablókép</th>
                                </tr>`
                for (let s of adatok) {
                    content += `<tr>
                                <td><img id="lekerdkepek" src="${"../"+s.mappa+s.kepjpg}"</td>
                                <td>${s.vnev+" "+s.knev}</td>
                                <td>${s.beosztas}</td>
                                <td>${s.helye}</td>
                                <td><img id="lekerdkepek" src="${"../"+s.tablojpg}"</td>
                                `
                }
                content += '</tr>'
                document.getElementById('adatfejkimenet').innerHTML = contentfej
                document.getElementById('adatkimenet').innerHTML = content

            }

            /**
             * 
             * A táblázat eredménye folyamatossan változhat. Ezért a generálás után mindne képre teszünk egy onclick eseményt.
             * Majd tároljuk az eredeti méreteit kattintás eseménykor.
             * Méreteit felnagyitjuk 100%-ra
             * Majd egy új kattintás eseményt adunk hozzá. Ami a mentett adatokat állitja vissza.
             * 
             */
            const images = document.querySelectorAll('img');
            images.forEach(img => {
                img.addEventListener('click', function() {
                        // Eltároljuk az eredeti kép stílusát, hogy később visszaállíthassuk
                        const originalStyle = img.getAttribute('style');
                        // Kinagyítjuk a képet
                        img.style.width = 'auto';
                        img.style.height = '100%';
                        img.style.position = 'fixed';
                        img.style.border = '3px'
                        img.style.top = 0;
                        img.style.left = 0;
                        img.style.zIndex = 9999;
                        // Hozzáadunk egy új onclick eseményt a képhez, amely visszaállítja az eredeti stílust
                        img.addEventListener('click', function() {
                        img.setAttribute('style', originalStyle);
                    });
                });
            });
        })
        
    }
}
