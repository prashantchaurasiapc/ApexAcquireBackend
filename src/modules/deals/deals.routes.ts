import { Router } from 'express';
import { getDealsPipelineHandler } from './deals.controller';
import { authMiddleware } from '../../middleware/auth.middleware';

const router = Router();

router.use(authMiddleware);

router.get('/pipeline', getDealsPipelineHandler);

export default router;
