import sqlite3 from 'sqlite3';

const DBSOURCE = './database/banco.db';

const SQL_AVALIACOES_CREATE = `
    CREATE TABLE AVALIACOES (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        idAvaliado INTEGER,
        criterio01 TEXT,
        criterio02 TEXT,
        criterio03 TEXT,
        criterio04 TEXT,
        criterio05 TEXT
    )`

const SQL_AVALIADOS_CREATE = `
    CREATE TABLE AVALIADOS (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT
    )`

const SQL_AVALIADORES_CREATE = `
    CREATE TABLE AVALIADORES (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nome TEXT
    )`

const database = new sqlite3.Database(DBSOURCE, (err) => {
        if (err) {
            console.error(err.message)
            throw err
        } else {
            console.log('Base de dados conectada com sucesso.')
            database.run(SQL_AVALIACOES_CREATE, (err) => {
                if (err) {

                    if (err.message != 'SQLITE_ERROR: table AVALIACOES already exists')
                        console.log(err.message );
                   
                } else {
                    console.log('Tabela criada.');
                }
            });

            database.run(SQL_AVALIADOS_CREATE, (err) => {
                if (err) {
                    if (err.message != 'SQLITE_ERROR: table AVALIADOS already exists')
                        console.log(err.message );
                } else {
                    console.log('Tabela criada.');
                }
            });

            database.run(SQL_AVALIADORES_CREATE, (err) => {
                if (err) {
                    if (err.message != 'SQLITE_ERROR: table AVALIADORES already exists')
                        console.log(err.message );
                } else {
                    console.log('Tabela criada.');
                }
            });
        }
    })

export default database