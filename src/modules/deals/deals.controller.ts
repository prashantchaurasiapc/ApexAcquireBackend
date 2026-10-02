import { Request, Response, NextFunction } from 'express';
import * as dealsService from './deals.service';

export const getDealsPipelineHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const data = await dealsService.getDealsPipeline();
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};
