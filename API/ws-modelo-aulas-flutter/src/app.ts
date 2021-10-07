import express, { Express, request } from 'express';
import homeRoutes from './routes/home_route';
import loginRoute from './routes/login_route';
import avaliadorRoute from './routes/avaliador_route';

import cors from 'cors';

const corsOptions: cors.CorsOptions = {
    origin: ['https://search-parasite.web.app',  
            'https://raulivan.com.br', 
            'http://localhost:3000',
            '*'], 
    optionsSuccessStatus: 200
};


class App {

    app: Express;

    constructor() {
        this.app = express();
        this.middlewares();
        this.routes();
    }

    middlewares() {
        this.app.use(express.json());
        this.app.use(express.urlencoded({ extended: true }));
    }

    routes() {
        this.app.use(cors(corsOptions));
        this.app.use('/', homeRoutes);
        this.app.use('/auth', loginRoute);
        this.app.use('/avaliador', avaliadorRoute);
        
    }
}

export default new App().app;