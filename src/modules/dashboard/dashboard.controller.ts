import { Request, Response, NextFunction } from 'express';
import * as dashboardService from './dashboard.service';

export const getDashboardDataHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const data = await dashboardService.getDashboardMetrics();
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};
