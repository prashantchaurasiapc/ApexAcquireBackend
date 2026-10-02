import prisma from '../../prisma';

export const getOutreachPipeline = async () => {
  const contacts = await prisma.contact.findMany({
    include: {
      cadenceEnrollments: { orderBy: { createdAt: 'desc' }, take: 1 },
      conversations: { orderBy: { createdAt: 'desc' }, take: 1, include: { grades: { orderBy: { createdAt: 'desc' }, take: 1 } } }
    },
    orderBy: { updatedAt: 'desc' }
  });

  const mapContactStatus = (status: string) => {
    if (status === 'QUEUED_FOR_OUTREACH') return 'Queued for Outreach';
    if (status === 'OUTREACH_SENT') return 'Outreach Sent';
    if (status === 'RESPONDED_QUALIFYING') return 'Responded/Qualifying';
    if (status === 'NEEDS_HUMAN_TOUCH') return 'Needs Human Touch';
    if (status === 'OPTED_OUT_DND' || status === 'NOT_INTERESTED' || status === 'WRONG_NUMBER') return 'Opted Out';
    return status;
  };

  return contacts.map(c => {
    const cad = c.cadenceEnrollments[0];
    const conv = c.conversations[0];
    const grade = conv?.grades[0];

    return {
      id: c.id,
      name: c.fullName,
      phone: c.mobilePhone || '(Unmapped)',
      brokerage: c.brokerage || 'Unknown Brokerage',
      temperature: c.temperature || 'Cold',
      outreachStage: mapContactStatus(c.status),
      grade: grade ? grade.letterGrade : null,
      score: grade ? grade.score : null,
      sequenceInfo: {
        currentTouch: cad ? cad.touchNumber : 0,
        recycleCount: 0,
        nurtureDay: 18
      }
    };
  });
};
