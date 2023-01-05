
//funtion for show the asnwer of the query 
const queryXDigital = async =>{
    try {
        let asnwerOfQueries;
        //variable of the data to access to the sql server database vuelos
        const config = {
            connectionSQL: "Data Source=DESKTOP-L9K1OC7;Initial Catalog=vuelos;Persist Security Info=True;User ID=sa;Password=1234;"
        }
        //making the first query of the question 1 of SQL part
        const mssqlOne = new sql.ConnectionPool(config);
        //method to connect to make the query
        //query 1
        mssqlOne.connect().then(function(){
        let req = new sqlDb.Request(conn);
        req.query(`SELECT TOP 1 aeropuertos.nombre_aeropuerto, Count(aeropuertos.nombre_aeropuerto) AS cantidad
                    FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
                    GROUP BY aeropuertos.nombre_aeropuerto
                    ORDER BY Count(aeropuertos.nombre_aeropuerto) DESC;`).then(function(res){
            console.table(res);
        });//if not works 
        }).catch(function(err){
            console.log(err);
        });

        //making the Second query that belongs question 2 of SQL part
        const mssqlTwo = new sql.ConnectionPool(config);
        //method to connect to make the query
        //query 2
        mssqlTwo.connect().then(function(){
        let req = new sqlDb.Request(conn);
        req.query(`SELECT TOP 1 aerolineas.nombre_aerolinea, Count(*) AS cantidad
                    FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
                    WHERE vuelos.id_movimiento=1
                    GROUP BY aerolineas.nombre_aerolinea
                    ORDER BY Count(*) DESC;`).then(function(res){
            console.table(res);
        });//if not works 
        }).catch(function(err){
            console.log(err);
        });
        
        //making the Third query that belongs question 3 of SQL part
        const mssqlThird = new sql.ConnectionPool(config);
        //method to connect to make the query
        //query 3
        mssqlThird.connect().then(function(){
        let req = new sqlDb.Request(conn);
        req.query(`SELECT TOP 1 vuelos.dia, Count(*) AS cantidad
                    FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
                    GROUP BY vuelos.dia
                    ORDER BY Count(*) DESC;`).then(function(res){
            console.table(res);
        });//if not works 
        }).catch(function(err){
            console.log(err);
        });

        //making the fourth query that belongs question 4 of SQL part
        const mssqlFourth = new sql.ConnectionPool(config);
        //method to connect to make the query
        //query 4
        mssqlFourth.connect().then(function(){
        let req = new sqlDb.Request(conn);
        req.query(`SELECT TOP 1 vuelos.dia, Count(*) AS cantidad
                    FROM movimientos INNER JOIN (aeropuertos INNER JOIN (aerolineas INNER JOIN vuelos ON aerolineas.id_aerolinea = vuelos.id_aerolinea) ON aeropuertos.id_aeropuerto=vuelos.[id_aeropuerto]) ON movimientos.id_movimientos = vuelos.id_movimiento
                    GROUP BY vuelos.dia
                    ORDER BY Count(*) DESC;`).then(function(res){
            console.table(res);
        });//if not works 
        }).catch(function(err){
            console.log(err);
        });
        document.getElementById("resSQL").innerHTML = `
        <div>
          <b>Looks like the data base is connected! :) check the console log to see the queries</b>
        </div>`;

    } catch (error) {
        //error or database is not connected 
        document.getElementById("resSQL").innerHTML = `
        <div>
          <b>Looks like the data base is not connect! :(</b>
        </div>`;
    }
}
queryXDigital();