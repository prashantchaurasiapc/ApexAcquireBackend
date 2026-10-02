import prisma from '../../prisma';

export const getDashboardMetrics = async () => {
  // 1. Total Realtor Contacts
  const totalContacts = await prisma.contact.count();
  const activeContacts = await prisma.contact.count({ where: { status: { not: 'OPTED_OUT_DND' } } });
  const optOutContacts = await prisma.contact.count({ where: { status: 'OPTED_OUT_DND' } });

  // 2. Outreach Dispatched (24h)
  const oneDayAgo = new Date(Date.now() - 24 * 60 * 60 * 1000);
  const outreachDispatched = await prisma.message.count({
    where: { direction: 'OUTBOUND', createdAt: { gte: oneDayAgo } }
  });

  // 3. Inbox Active Dialogs
  const activeThreads = await prisma.conversation.count({
    where: { automationMode: 'AI_ACTIVE' }
  });
  const needsHuman = await prisma.conversation.count({
    where: { automationMode: 'ESCALATED' }
  });

  // 4. Pipeline Active Deals Volume
  const activeDealsList = await prisma.deal.findMany({
    where: { status: 'OPEN' },
    include: { property: true }
  });
  const activeDealsCount = activeDealsList.length;
  const activeDealsVolume = activeDealsList.reduce((acc, deal) => acc + (deal.property.askingPrice || 0), 0);

  // 5. AI Qualification Telemetry
  const gradeA = await prisma.conversationGrade.count({ where: { letterGrade: 'A' } });
  const gradeB = await prisma.conversationGrade.count({ where: { letterGrade: 'B' } });
  const gradeC = await prisma.conversationGrade.count({ where: { letterGrade: 'C' } });
  const gradeD = await prisma.conversationGrade.count({ where: { letterGrade: 'D' } });

  return {
    metrics: {
      totalContacts,
      activeContacts,
      optOutContacts
    },
    activity: {
      outreachDispatched,
      replyRate: 18.4, // Static for now
      smsPercentage: 84
    },
    inbox: {
      activeThreads,
      needsHuman,
      addresses: 1 // Static mock
    },
    pipeline: {
      activeDealsCount,
      activeDealsVolume
    },
    aiTelemetry: {
      gradeA,
      gradeB,
      gradeC,
      gradeD,
      qualifiedCount: gradeA + gradeB
    },
    priorityQueue: [] // To be fetched dynamically
  };
};
