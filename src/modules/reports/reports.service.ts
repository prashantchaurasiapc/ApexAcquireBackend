import prisma from '../../prisma';

export const getReportsDashboard = async () => {
  const auditLogs = await prisma.auditLog.findMany({
    include: {
      actor: true
    },
    orderBy: { createdAt: 'desc' },
    take: 50
  });

  const formattedLogs = auditLogs.map(log => ({
    id: log.id,
    actor: log.actor ? log.actor.firstName + ' ' + log.actor.lastName : 'System Bot',
    action: log.action,
    affectedRecord: log.entityType + ' ' + log.entityId,
    timestamp: log.createdAt.toISOString()
  }));

  // Dummy metrics for now, since we don't have deep historic analytics stored in simple tables
  const metrics = {
    totalSmsSent: '12,490',
    totalSmsTrend: '↑ 14% vs last period',
    emailTouchpoints: '8,120',
    emailTrend: '↑ 8% vs last period',
    avgResponseTime: '14 Mins',
    avgResponseSubtext: 'AI bot responds in < 2s',
    dealConversion: '4.2%',
    dealConversionSubtext: 'High conversion in DFW North'
  };

  return { metrics, auditLogs: formattedLogs };
};
