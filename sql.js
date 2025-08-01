/**
 * 
 * Mysql csomagok betöltése.
 * 
 */
const mysql = require('mysql');

/**
 * 
 * Osztály létrehozás és kapcsolat kiépítés.
 * 
 */
class SQL{
    runSQL(sql, callback){
        const connection = mysql.createConnection({
            host: 'localhost',
            port: 3306,
            user: 'root',
            password: '1234',
            database: 'tabloadatok'
        })
        connection.connect(()=>{
            connection.query(sql, (error, rows) =>{
                if(error){
                    console.log(error)
                }else{
                    connection.end(() =>{
                        callback(rows)
                    })
                }
            })
        })
    }
}
/**
 * 
 * Modulok exportálása. Hogy máshonnan elérhető legyen.
 * 
 */
module.exports = SQL