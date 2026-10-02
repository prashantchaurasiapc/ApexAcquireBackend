import prisma from '../../prisma';

export const getTasksList = async () => {
  const tasks = await prisma.task.findMany({
    include: {
      assignedTo: true,
      deal: { include: { property: true } },
      contact: true
    },
    orderBy: { dueAt: 'asc' }
  });

  return tasks.map(t => ({
    id: t.id,
    title: t.title,
    description: t.description,
    status: t.status === 'PENDING' ? 'Open' : (t.status === 'IN_PROGRESS' ? 'In Progress' : 'Completed'),
    priority: t.priority === 'HIGH' || t.priority === 'URGENT' ? 'High' : (t.priority === 'NORMAL' ? 'Medium' : 'Low'),
    dueDate: t.dueAt ? t.dueAt.toISOString() : null,
    category: t.type === 'CALL' ? 'deal_offers' : (t.type === 'SMS' ? '5_touch_cadence' : 'general'),
    relatedDealId: t.dealId,
    relatedDealAddress: t.deal?.property?.address,
    relatedContactId: t.contactId,
    relatedContactName: t.contact?.fullName,
    assignedToId: t.assignedToId,
    assignedToName: t.assignedTo ? t.assignedTo.firstName + ' ' + t.assignedTo.lastName : 'Unassigned'
  }));
};
