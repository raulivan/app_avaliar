import { Router} from 'express';
import HomeCotroller from '../controllers/home_controller';

const router = Router();
const controller = new HomeCotroller(); 

router.get('/',controller.index);
router.get('/status',controller.status);

export default router;