import express, { request, response } from 'express';

const routes = express.Router();

routes.get('/', (request, response) => {
    console.log('Chegou aqui')
    return response.status(200).json({
        message: 'Servidor Online'
    });
});

export default routes;