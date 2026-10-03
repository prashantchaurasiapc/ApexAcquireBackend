import { Router } from 'express';
import { getDealsPipelineHandler, deleteDealHandler } from './deals.controller';
import { authMiddleware } from '../../middleware/auth.middleware';

const router = Router();

router.use(authMiddleware);

router.get('/pipeline', getDealsPipelineHandler);
router.delete('/:id', deleteDealHandler);

export default router;
