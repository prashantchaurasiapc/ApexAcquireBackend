import { Request, Response, NextFunction } from 'express';
import * as tasksService from './tasks.service';

export const getTasksListHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const data = await tasksService.getTasksList();
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};
