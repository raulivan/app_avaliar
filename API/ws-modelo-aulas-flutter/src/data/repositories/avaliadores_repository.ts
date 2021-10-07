import Avaliador from '../models/avaliador_model';
import database from '../conexao';

const AvaliadorRepository = {
    incluir: (item: Avaliador, callback: (id?: number) => void) => {
        const sql = 'INSERT INTO AVALIADORES (nome) VALUES (?)'
        const params = [item.nome]
        database.run(sql, params, function(_err) {
            callback(this?.lastID)
        })
    },

    alterar: (item: Avaliador, callback: (id?: number) => void) => {
        const sql = 'UPDATE AVALIADORES SET nome = ? where id = ?'
        const params = [item.nome, item.id]
        database.run(sql, params, function(_err) {
            callback(item.id)
        })
    },

    excluir: (id: number, callback: (sucesso: boolean) => void) => {
        const sql = 'DELETE FROM AVALIADORES where id = ?'
        const params = [id]
        database.run(sql, params, function(_err) {
            callback(_err == null)
        })
    },

    selecionar: (id: number, callback: (registro?: Avaliador) => void) => {
        const sql = 'SELECT * FROM AVALIADORES where id = ?'
        const params = [id]
        database.get(sql, params, (_err, row) => callback(row))
    },

    selecionarTodos: (callback: (data?: Avaliador[]) => void) => {
        const sql = 'SELECT * FROM AVALIADORES order by nome'
        const params: any[] = []
        database.all(sql, params, (_err, rows) => callback(rows))
    },

    contar: (callback: (quantidade?: number) => void) => {
        const sql = 'SELECT COUNT(id) as total from AVALIADORES'
        const params: any[] = []
        database.get(sql, params, (_err, row) => {
            callback(row.total)
        })
    },
}
export default AvaliadorRepository;