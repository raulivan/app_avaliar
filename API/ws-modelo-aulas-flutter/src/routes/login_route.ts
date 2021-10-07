import { Router} from 'express';
import LoginCotroller from '../controllers/login_controller';

const router = Router();
const controller = new LoginCotroller(); 

router.post('/',controller.post);

export default router;