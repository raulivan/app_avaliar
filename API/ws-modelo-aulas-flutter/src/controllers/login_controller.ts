import {Request, Response} from 'express';

class LoginCotroller{

    async post(request:Request, response:Response){

        try{
            const {login, senha} = request.body;

            console.log(request.body);

            if (login == 'admin' && senha == '2021')
                return response.status(200).json({
                    id:10,
                    nome:'Administrador',
                    email:'admin@avaliar.com.br'

                });
            else
                return response.status(403).json({
                    message:'Usuário e ou senha inválidos'
                });
        }catch (ex) {
            return response.status(500).json({
                message: 'Ocorreu um erro',
                error: ex
            });
        }
    }
}

export default LoginCotroller;