import { Request, Response, NextFunction } from 'express';
import * as contactsService from './contacts.service';

export const getContactsListHandler = async (req: Request, res: Response, next: NextFunction) => {
  try {
    const data = await contactsService.getContactsList();
    res.status(200).json({ success: true, data });
  } catch (error) {
    next(error);
  }
};
