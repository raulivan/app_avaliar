import { Router} from 'express';
import AvaliadorCotroller from '../controllers/avaliador_controller';

const router = Router();
const controller = new AvaliadorCotroller(); 

router.get('/status',controller.status);
router.get('/:id',controller.get);
router.get('/',controller.index);


router.post('/',controller.post);
router.put('/:id',controller.put);
router.delete('/:id',controller.delete);

export default router;