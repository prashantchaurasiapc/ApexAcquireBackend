import { Router } from 'express';
import { getContactsListHandler } from './contacts.controller';
import { authMiddleware } from '../../middleware/auth.middleware';

const router = Router();

router.use(authMiddleware);

router.get('/', getContactsListHandler);

export default router;
