import { Request, Response } from 'express';
import AvaliadorRepository from '../data/repositories/avaliadores_repository';

class HomeCotroller {

    async index(request: Request, response: Response) {
        return response.status(200).json({
            message: 'API para aulas de Desenvolvimento Mobile',
            version: '1.0',
            last_update: '24/09/2021'
        });
    }

    async status(request: Request, response: Response) {
        let status = {
            total_avaliacoes: 0,
            total_pendentes: 0,
            total_avaliados: 0,
            total_avaliadores: 0,
        }

        let consulta1 = new Promise(() => {
            console.log('1')
            status.total_avaliacoes = 10
        });
        let consulta2 = new Promise(() => {
            console.log('2')
            AvaliadorRepository.contar((total) => {
                if (total) {
                    status.total_avaliadores = Number(total)
                    console.log('Dentro')
                    console.log(status.total_avaliadores)
                } else {
                    status.total_avaliadores = 0
                }
            })
            
        });
        let consulta3 = new Promise(() => {
            console.log('3')
            status.total_avaliados = 30
        });
        let consulta4 = new Promise(() => {
            console.log('4')
            status.total_pendentes = 40
        });

        let resultados = new Promise(() => {
            console.log('5')

            return response.status(200).json({
                message: 'Status',
                data: status
            });
        });

        Promise.all([consulta1, consulta2, consulta3, consulta4,resultados]).catch(error => {
            console.log('6')
            return response.status(500).json({
                message: 'Erro',
                data: status
            });
        })

    }
}

export default HomeCotroller;