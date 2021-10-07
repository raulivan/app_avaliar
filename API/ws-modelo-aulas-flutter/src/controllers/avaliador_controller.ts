import {Request, Response} from 'express';
import repository from '../data/repositories/avaliadores_repository';
import tipo from '../data/models/avaliador_model';

function sleep(ms:number) {
    return new Promise((resolve) => {
        setTimeout(resolve, ms);
    });
}

class AvaliadorCotroller{

    async index(request:Request, response:Response){
        console.log('Avaliador index')
        repository.selecionarTodos((data) => {
            if (data) {
                return response.status(200).json({
                    message:'sucesso!',
                    data: data
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao listar'
                });
            }
        })
    }

    async post(request:Request, response:Response){
        console.log('Avaliador post')
        console.log(request.body)
        const registro: tipo = request.body;
        console.log(registro);
        repository.incluir(registro, (id) => {
            if (id) {
                return response.status(200).json({
                    message:'Incluido com sucesso!',
                    id: id
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao incluir'
                });
            }
        })

        
    }

    async get(request:Request, response:Response){
        console.log('Avaliador get')
        const { id } = request.params;

        repository.selecionar(Number(id),(data) => {
            if (data) {
                return response.status(200).json({
                    message:'sucesso!',
                    data: data
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao listar'
                });
            }
        })
    }

    async put(request:Request, response:Response){
        console.log('Avaliador put')
        const registro: tipo = request.body;
        const { id } = request.params;
        console.log(id)
        console.log(registro);
        repository.alterar(registro, (id) => {
            if (id) {
                return response.status(200).json({
                    message:'Alterado com sucesso!',
                    id: id
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao alterar'
                });
            }
        })
    }

    async delete(request:Request, response:Response){
        console.log('Avaliador delete')
        const { id } = request.params;
        
        console.log(id);
        repository.excluir(Number(id), (sucesso) => {
            if (sucesso) {
                return response.status(200).json({
                    message:'Excluído com sucesso!',
                    id: id
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao excluir'
                });
            }
        })
    }

    async status(request:Request, response:Response){
        //console.log('Avaliador status')
        await sleep(5000);

        repository.contar((total) => {
            if (total) {
                return response.status(200).json({
                    message:'sucesso!',
                    data: total
                });
            } else {
                return response.status(400).json({
                    message:'Falha ao contar'
                });
            }
        })
    }
}

export default AvaliadorCotroller;