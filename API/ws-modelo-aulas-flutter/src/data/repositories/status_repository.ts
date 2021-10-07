import database from '../conexao';
import StatusModel from '../models/status_model';

const StatusRepository = {
    
    selecionarTodos: (callback: (data?: StatusModel) => void) => {
        const sql = `SELECT COUNT(Select Id from AVALIACOES) as total_avaliacoes,
                    COUNT(Select Id from AVALIADOS) as total_avaliados,
                    COUNT(Select Id from AVALIADORES) as total_avaliadores`
        const params: any[] = []
        database.get(sql, params, (_err, row) => callback(row))
    },
}
export default StatusRepository;