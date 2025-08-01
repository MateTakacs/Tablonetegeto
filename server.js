/**
 * Express csomagok betöltése.
 */
const express = require('express')

/**
 * Adatbázishoz való kacsolódás
 */

const SQL = require('./sql.js')
var kapcsolat =  new SQL()

/**
 * Átváltásokhoz szükséges JSON fileok.
 */

const osztjson = require('./public/src/json/osztaly.json') // Osztályt jelelölő betűk átváltása számra.
const helyek = require('./public/src/json/helyek.json') // Helyek átváltásához szükséges json file.

/**
 * Statikus fileok elérése és szerver beállítások.
 */
const app = express()
app.use(express.static('public'))       
const router = express.Router()
const port = 3000                       
app.use(express.json())

/**
 * 
 * @param {adat.osztaly} x Kapott osztály a Frontendről. (1,2,3....)
 * @returns {valtosztaly} A kapott osztály átváltba (1-A,2-B...)
 * @import {osztjson} Tartalmazza az osztályok átváltásához szükséges adatokat.
 * 
 * A fügvény átváltja a kapott számot  betűre.
 */
function osztvalt(x){
  let kaposztaly = x
  let valtosztaly
  for (let i of osztjson){
    if(i.osztaly === kaposztaly){
      valtosztaly = i.ertek
    }
  }
  return valtosztaly
}

/**
 * 
 * @param {y} Mysql lekérdezásből visszakapott "sor"
 * @returns {y} Kicserélt sor visszaküldése.
 *  Megviszgáljuk a számot amit kaptunk és a hozzá tartozó helységnévre cseréljük.
 */
function helyvalt(y){
  y.forEach((row) => {
    for(let i of helyek){
      if(row.helye == i.szam)
        row.helye = i.helye
    }
  })
  return y
}

/**
 * @param {z} Mysql lekérdezésből visszakapott "sor".
 * @returns {z} Kicserélt sor visszaküldése.
 *  Megvizsgáljuk a kapott számot és a hozzátartozó osztályra cseréljük.
 */

function osztalyvisszavalt(z){
  z.forEach((row) => {
    for(let i of osztjson){
      if(row.osztaly == i.ertek)
        row.osztaly = i.osztaly
    }
  })
  return z
}

/**
 * 
 *  @param {/szures} Api Frontenden hivodik meg adatokat küld a szűréshez.
 * 
 *  Adatok: Tipus, Név, Évszám, Osztály
 * 
 */
app.post('/szures', (req, res)=>{
  const adat = req.body             
 

/**
 * 
 * Lekérdezések:  - Lekérdezés ami az osszes tablót lekérdezi.
 *                - Lekérdezés ami a tablókat évszám szerint szűri.
 *                - Lekérdezés ami a tablókat évszám és osztály szerint szűri.
 *                - Lekérdezés ami a tablókat osztály szerint szűri.
 * 
 * 
 * Szűrés folyamata: 
 *  1. Bejövő adatok fogadása és ellenőrzése, hogy melyik mezőből jött adat.
 *  2. Név mező esetén ellenőrzi, hogy hány tagból áll a név.
 *  3. Szükséges átváltások
 *  4. Megfelelő mysql lekérdezést lefuttatja.
 *  5. szükséges átváltások
 *  6. Json formátumban visszaküldés Frontend-re.
 */


  if(adat.tipus=='tablo' && adat.nev=='' && adat.evszam=='' && adat.osztaly==''){

    // lekérdezés ami az osszes tablót lekérdezi

    sql = `select kezdet, veg, osztaly, helye, keppng, kepjpg, van from tablok where eng = true and torol = false order by kezdet asc;`
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.json(kuld)
      }
    })
  }else if(adat.tipus=='tablo' && adat.nev=='' && adat.evszam!='' && adat.osztaly==''){

    // lekérdezés ami a tablókat évszám szer szűri

    sql = `select kezdet, veg, osztaly, helye, keppng, kepjpg, van from tablok where eng = true and torol = false and veg = ${adat.evszam} order by kezdet asc;`
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='tablo' && adat.nev=='' && adat.evszam!='' && adat.osztaly!=''){

    // lekérdezés ami a tablókat évszám és osztály szer szűri

    let osztaly = osztvalt(adat.osztaly)
    sql = `select kezdet, veg, osztaly, helye, keppng, kepjpg, van from tablok where eng = true and torol = false and osztaly = ${osztaly} and veg = ${adat.evszam} order by kezdet asc; ` //osztály konvertálása - betűből szám (A-1)
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='tablo' && adat.nev=='' && adat.evszam=='' && adat.osztaly!=''){

     // lekérdezés ami a tablókat osztály szerint szűri

    let osztaly = osztvalt(adat.osztaly)
    console.log(osztaly)
    sql = `select kezdet, veg, osztaly, helye, keppng, kepjpg, van from tablok where eng = true and torol = false and osztaly = ${osztaly} order by kezdet asc; ` //osztály konvertálása - betűből szám (A-1)
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })


/**
 * 
 * Lekérdezések:  -lekérdezés ami az összes diákot lekérdezi
 * 
 *                -Lekérdezés ami a diákokat név szerint szűri. Egy név esetén
 *                -Lekérdezés ami a diákokat név szerint szűri. Két név esetén
 *                -Lekérdezés ami a diákokat név szerint szűri. Három név esetén
 *              
 *                -Lekérdezés ami a diákokat név és évszám szerint szűri. Egy név esetén
 *                -Lekérdezés ami a diákokat név és évszám szerint szűri. Két név esetén
 *                -Lekérdezés ami a diákokat név és évszám szerint szűri. Három név esetén
 * 
 *                -Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Egy név esetén
 *                -Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Két név esetén
 *                -Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Három név esetén
 * 
 *                -Lekérdezés ami a diákokat évszám és osztály szerint szűri.
 *                -lekérdezés ami a diákokat osztály szerint szűri.
 *                -lekérdezés ami a diákokat évszám szerint szűri.
 * 
 *                -Lekérdezés ami a diákokat név és osztály szerint szűri. Egy név esetén
 *                -Lekérdezés ami a diákokat név és osztály szerint szűri. Két név esetén
 *                -Lekérdezés ami a diákokat név és osztály szerint szűri. Három név esetén
 *   
 * 
 * 
 */


  }else if(adat.tipus=='diak' && adat.nev=='' && adat.evszam=='' && adat.osztaly==''){
    sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false order by vnev asc;` //mappa és keppng együtt az elérési út
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='diak' && adat.nev!='' && adat.evszam=='' && adat.osztaly==''){
    if(adat.hossz === 1){
      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and (vnev = "${adat.nev}" or knev = "${adat.nev}") order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz===2){
      sql = `	select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}"and knev = "${adat.knev}" order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz==3){
      sql = `	select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
  }else{
    res.status(500)
    res.send('Status: Internal Server Error')
}
}else if(adat.tipus=='diak' && adat.nev!='' && adat.evszam!='' && adat.osztaly==''){

     // lekérdezés ami a diákokat név és évszám szerint szűri

    if(adat.hossz === 1){

      // lekérdezés ami a diákokat név és évszám szerint szűri Egy név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and (vnev = "${adat.nev}" or knev = "${adat.nev}") and tablok.veg = ${adat.evszam} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz===2){

      // lekérdezés ami a diákokat név és évszám szerint szűri Két név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.veg = "${adat.evszam}" order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz==3){

      // lekérdezés ami a diákokat név és évszám szerint szűri Három név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.veg = ${adat.evszam} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
      }else{
        res.status(500)
        res.send('Status: Internal Server Error')
      }
  }else if(adat.tipus=='diak' && adat.nev!='' && adat.evszam!='' && adat.osztaly!=''){

    // Lekérdezés ami a diákokat név és évszám és osztály szerint szűri

    let osztaly = osztvalt(adat.osztaly)
    if(adat.hossz === 1){

      // Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Egy név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and (vnev = "${adat.nev}" or knev = "${adat.nev}") and tablok.veg = ${adat.evszam} AND tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz===2){

     // Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Két név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.veg = ${adat.evszam} AND tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz==3){

      // Lekérdezés ami a diákokat név és évszám és osztály szerint szűri. Három név esetén

      sql = `	select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.veg = ${adat.evszam} AND tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
      }else{
        res.status(500)
        res.send('Status: Internal Server Error')
      }
  }else if(adat.tipus=='diak' && adat.nev=='' && adat.evszam!='' && adat.osztaly!=''){

     // lekérdezés ami a diákokat évszám és osztály szerint szűri

    let osztaly = osztvalt(adat.osztaly)
    sql = `	select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false AND tablok.veg = ${adat.evszam} and tablok.osztaly = ${osztaly} order by vnev asc;` //osztály konvertálása (A-1)
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='diak' && adat.nev=='' && adat.evszam=='' && adat.osztaly!=''){

     // lekérdezés ami a diákokat osztály szerint szűri

    let osztaly = osztvalt(adat.osztaly)
    sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false AND tablok.osztaly = ${osztaly} order by veg asc, vnev asc;` //osztály konvertálása (A-1)
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='diak' && adat.nev=='' && adat.evszam!='' && adat.osztaly==''){

     // lekérdezés ami a diákokat évszám szerint szűri

    sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false AND tablok.veg = ${adat.evszam} order by vnev asc;` //osztály konvertálása (A-1)
    kapcsolat.runSQL(sql, (result, error)=>{
      if(error){
        res.status(500)
        res.send('Status: Internal Server Error')
      }else{
        let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
        res.status(200)
        res.send(kuld)
      }
    })
  }else if(adat.tipus=='diak' && adat.nev!='' && adat.evszam=='' && adat.osztaly!=''){

     // Lekérdezés ami a diákokat név és osztály szerint szűri.

    let osztaly = osztvalt(adat.osztaly)
    if(adat.hossz === 1){

      //Lekérdezés ami a diákokat név és osztály szerint szűri. Egy név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid and diakok.eng = true and diakok.torol = false and (vnev = "${adat.nev}" or knev = "${adat.nev}") and tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz===2){

      // Lekérdezés ami a diákokat név és osztály szerint szűri. Két név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz==3){

      // Lekérdezés ami a diákokat név és osztály szerint szűri. Három név esetén

      sql = `select vnev, knev, mappa, diakok.keppng, diakok.kepjpg, diakok.van, tablok.keppng as tablopng, tablok.kepjpg as tablojpg, tablok.veg, tablok.osztaly, tablok.helye from diakok, tablok where tablok.id = diakok.tabid AND diakok.eng = true and diakok.torol = false and vnev = "${adat.vnev}" and knev = "${adat.knev}" AND tablok.osztaly = ${osztaly} order by vnev asc;`//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result))))
          res.status(200)
          res.send(kuld)
        }
      })
      }else{
        res.status(500)
        res.send('Status: Internal Server Error')
      }



/**
 * 
 * 
 * Lekérdezések: -lekérdezés ami a tanárokat név szerint szűri
 * 
 * 
 */



  }else if(adat.tipus=='tanar' && adat.nev!='' && adat.evszam=='' && adat.osztaly==''){

    // lekérdezés ami a tanárokat név szerint szűri

    if(adat.hossz === 1){

      //Lekérdezés ami a tanárokat név szerint szűri. Egy név esetén

      sql = `select tanarkepek.beosztas, tanarkepek.mappa, tanarkepek.keppng, tanarkepek.kepjpg, tanarok.vnev, tanarok.knev, tablok.helye, tablok.keppng as tablopng, tablok.kepjpg as tablojpg from tanarok, tanarkepek, tablok where tanarkepek.tanarid = tanarok.id and tanarkepek.tabid = tablok.id and (tanarok.vnev = "${adat.nev}" or tanarok.knev = "${adat.nev}") and tanarkepek.eng = true and tanarkepek.torol = false order by tanarok.vnev asc;`
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz===2){

      //Lekérdezés ami a tanárokat névszerint szűri. Két név esetén

      sql = `select tanarkepek.beosztas, tanarkepek.mappa, tanarkepek.keppng, tanarkepek.kepjpg, tanarok.vnev, tanarok.knev, tablok.helye, tablok.keppng as tablopng, tablok.kepjpg as tablojpg from tanarok, tanarkepek, tablok where tanarkepek.tanarid = tanarok.id and tanarkepek.tabid = tablok.id and (tanarok.vnev = "${adat.vnev}" and tanarok.knev = "${adat.knev}") and tanarkepek.eng = true and tanarkepek.torol = false order by tanarok.vnev asc;`
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
    }else if(adat.hossz==3){

      //Lekérdezés ami a tanárokat név szerint szűri. Három név esetén

      sql = `select tanarkepek.beosztas, tanarkepek.mappa, tanarkepek.keppng, tanarkepek.kepjpg, tanarok.vnev, tanarok.knev, tablok.helye, tablok.keppng as tablopng, tablok.kepjpg as tablojpg from tanarok, tanarkepek, tablok where tanarkepek.tanarid = tanarok.id and tanarkepek.tabid = tablok.id and (tanarok.vnev = "${adat.vnev}" and tanarok.knev = "${adat.knev}") and tanarkepek.eng = true and tanarkepek.torol = false order by tanarok.vnev asc;`
      kapcsolat.runSQL(sql, (result, error)=>{
        if(error){
          res.status(500)
          res.send('Status: Internal Server Error')
        }else{
          let kuld = osztalyvisszavalt(helyvalt(JSON.parse(JSON.stringify(result)))) 
          res.status(200)
          res.send(kuld)
        }
      })
      }else{
        res.status(500)
        res.send('Status: Internal Server Error')
      }
  }else{

        res.status(500)
          res.send('Status: Internal Server Error')

  }
})

/**
 * 
 * Szerver indítása a 3000-es porton.
 * 
 */

app.listen(port, () => {                                      
  console.log(`Example app listening on port ${port}`)
})