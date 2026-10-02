import { Request, Response, NextFunction } from 'express';
import * as dashboardService from './dashboard.service';

export const getDashboardDataHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const userId = (req as any).user?.id;
    const data = await dashboardService.getDashboardMetrics(userId);
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};
