import { Request, Response, NextFunction } from 'express';
import * as dealsService from './deals.service';

export const getDealsPipelineHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const user = (req as any).user;
    const data = await dealsService.getDealsPipeline(user);
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};

export const deleteDealHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const { id } = req.params;
    await dealsService.deleteDeal(id);
    res.status(200).json({ success: true, message: 'Deal archived successfully' });
  } catch (error) {
    next(error);
  }
};
