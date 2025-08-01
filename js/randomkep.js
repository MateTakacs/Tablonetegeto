/**
 * 
 * 
 * @param {images} Tömb Képek mappában lévő képek elérési útja.
 * 
 * 
 */

let images= ["../src/kepek/randomkepek/tablo1.jpg","../src/kepek/randomkepek/tablo2.jpg","../src/kepek/randomkepek/tablo3.jpg","../src/kepek/randomkepek/tablo4.jpg","../src/kepek/randomkepek/tablo5.jpg","../src/kepek/randomkepek/tablo6.jpg","../src/kepek/randomkepek/tablo7.jpg","../src/kepek/randomkepek/tablo8.jpg","../src/kepek/randomkepek/tablo9.jpg","../src/kepek/randomkepek/tablo10.jpg","../src/kepek/randomkepek/tablo11.jpg","../src/kepek/randomkepek/tablo12.jpg","../src/kepek/randomkepek/tablo13.jpg","../src/kepek/randomkepek/tablo14.jpg","../src/kepek/randomkepek/tablo15.jpg","../src/kepek/randomkepek/tablo16.jpg","../src/kepek/randomkepek/tablo17.jpg","../src/kepek/randomkepek/tablo18.jpg","../src/kepek/randomkepek/tablo19.jpg","../src/kepek/randomkepek/tablo20.jpg","../src/kepek/randomkepek/tablo21.jpg","../src/kepek/randomkepek/tablo22.jpg","../src/kepek/randomkepek/tablo23.jpg","../src/kepek/randomkepek/tablo24.jpg","../src/kepek/randomkepek/tablo25.jpg","../src/kepek/randomkepek/tablo26.jpg","../src/kepek/randomkepek/tablo27.jpg","../src/kepek/randomkepek/tablo28.jpg"] 
var i = 0;

/**
 * 
 *  @param {randomkep} int random szám 0-12-ig.
 *  @param {randomeleres} int random szám 0-20-ig.
 *  @param {randomforg} int random szám 0-1-ig.
 * 
 * Kezdőképernyőn lévő pár random képk függvénye.
 * 1.randomkep kiválasztása.
 * 2.randomkep elerési útja csere.
 * 3.random forgatás.
 * 
 */

function volgendefoto() {
    
    /**
     * 
     * 
     * Változók létrehozás.
     * 
     *
     */
        let randomkep = Math.floor(Math.random() * 13);
        let randomeleres = Math.floor(Math.random() * 20);
        let randomforg = Math.floor(Math.random() * 2);
        let kepforgat1 = document.getElementById("kepforgat1")
        let kepforgat2 = document.getElementById("kepforgat2")
        let kepforgat3 = document.getElementById("kepforgat3")
        let kepforgat4 = document.getElementById("kepforgat4")
        let kepforgat5 = document.getElementById("kepforgat5")
        let kepforgat6 = document.getElementById("kepforgat6")
        let kepforgat7 = document.getElementById("kepforgat7")
        let kepforgat8 = document.getElementById("kepforgat8")
        let kepforgat9 = document.getElementById("kepforgat9")
        let kepforgat10 = document.getElementById("kepforgat10")
        let kepforgat11 = document.getElementById("kepforgat11")
        let kepforgat12 = document.getElementById("kepforgat12")
        

        if(randomeleres<=images.length){
            if(randomkep == 1){
                kepforgat1.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat1.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat1.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 2){
                kepforgat2.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat2.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat2.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 3){
                kepforgat3.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat3.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat3.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 4){
                kepforgat4.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat4.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat4.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 5){
                kepforgat5.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat5.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat5.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 6){
                kepforgat6.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat6.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat6.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 7){
                kepforgat7.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat7.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat7.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 8){
                kepforgat8.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat8.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat8.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 9){
                kepforgat9.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat9.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat9.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 10){
                kepforgat10.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat10.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat10.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 11){
                kepforgat11.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat11.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat11.style.transform = 'rotate(-25deg)'
                }
            }else if(randomkep == 12){
                kepforgat12.src = images[randomeleres];
                if(randomforg==1){
                    kepforgat12.style.transform = 'rotate(25deg)'
                }else{
                    kepforgat12.style.transform = 'rotate(-25deg)'
                }
            }
    }
}

/**
 * 
 * Függvény mindig újrahívása 1000ms-enként. 
 * 
 */

setInterval(volgendefoto, 1000);
