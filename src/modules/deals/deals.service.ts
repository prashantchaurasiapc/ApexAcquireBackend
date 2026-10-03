import prisma from '../../prisma';

export const getDealsPipeline = async (user?: { id: string; role: string }) => {
  const whereClause: any = {};
  
  if (user && user.role === 'AGENT') {
    whereClause.ownerId = user.id;
  }

  const deals = await prisma.deal.findMany({
    where: whereClause,
    include: {
      property: true,
      contact: true,
      stage: true
    },
    orderBy: { updatedAt: 'desc' }
  });

  return deals.map(d => ({
    id: d.id,
    address: d.property.address,
    city: d.property.city,
    state: d.property.state,
    zip: d.property.zip,
    askingPrice: d.property.askingPrice || 0,
    contactName: d.contact.fullName,
    realtorBrokerage: d.contact.brokerage || 'Unknown',
    stage: d.stage.name,
    grade: d.gradeSnapshot || 'C',
    isArchived: d.status !== 'OPEN',
    propertyDetails: {
      beds: d.property.beds,
      baths: d.property.baths,
      sqft: d.property.squareFeet,
      yearBuilt: d.property.yearBuilt,
      condition: 'Unknown'
    }
  }));
};

export const deleteDeal = async (id: string) => {
  return await prisma.deal.update({
    where: { id },
    data: { 
      status: 'LOST',
      deletedAt: new Date()
    }
  });
};
