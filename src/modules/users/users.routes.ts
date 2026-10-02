import { Router } from 'express';
import { listUsersHandler, createUserHandler, changeRoleHandler } from './users.controller';
import { authMiddleware } from '../../middleware/auth.middleware';
import { requireAdmin, blockReadOnly } from '../../middleware/rbac.middleware';

const router = Router();

router.get('/', authMiddleware, requireAdmin, listUsersHandler);
router.post('/', authMiddleware, requireAdmin, createUserHandler);
router.patch('/:id/role', authMiddleware, requireAdmin, changeRoleHandler);

export default router;
