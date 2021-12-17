var mysql = require('mysql');

function createCon(){
    var connection  = mysql.createPool({
        connectionLimit: 4000,
        queueLimit: 3000,
        host: 'localhost',
        user: 'root',
        password: 'root',
        database: 'encontact',
        port: 3306,
        insecureAuth: true
    });

    return connection;
}

module.exports = createCon;
