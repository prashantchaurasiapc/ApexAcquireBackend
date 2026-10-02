import { Router } from 'express';
import { getTasksListHandler } from './tasks.controller';
import { authMiddleware } from '../../middleware/auth.middleware';

const router = Router();

router.use(authMiddleware);

router.get('/', getTasksListHandler);

export default router;
