import prisma from '../../prisma';

export const getContactsList = async () => {
  const contacts = await prisma.contact.findMany({
    include: {
      cadenceEnrollments: true,
      conversations: { include: { grades: true } },
      deals: true
    },
    orderBy: { createdAt: 'desc' }
  });

  const mapContactStatus = (status: string) => {
    if (status === 'QUEUED_FOR_OUTREACH') return 'Queued for Outreach';
    if (status === 'OUTREACH_SENT') return 'Outreach Sent';
    if (status === 'RESPONDED_QUALIFYING') return 'Responded/Qualifying';
    if (status === 'NEEDS_HUMAN_TOUCH') return 'Needs Human Touch';
    if (status === 'OPTED_OUT_DND' || status === 'NOT_INTERESTED' || status === 'WRONG_NUMBER') return 'Opted Out';
    return status;
  };

  return contacts.map(c => ({
    id: c.id,
    name: c.fullName,
    brokerage: c.brokerage || 'Unknown',
    license: c.licenseNumber || 'Unverified',
    email: c.email || 'N/A',
    phone: c.mobilePhone || 'N/A',
    market: c.market,
    outreachStage: mapContactStatus(c.status),
    temperature: c.temperature || 'Cold',
    tags: ['Realtor', c.market],
    lastContactDate: c.lastContactedAt ? c.lastContactedAt.toISOString().split('T')[0] : 'Never',
    sequenceInfo: {
      currentTouch: c.cadenceEnrollments[0]?.touchNumber || 0,
      recycleCount: 0,
      nurtureDay: 18
    },
    grade: c.conversations[0]?.grades[0]?.letterGrade || null,
    score: c.conversations[0]?.grades[0]?.score || null,
    propertyDealIds: c.deals.map(d => d.id)
  }));
};
