-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2026 at 12:55 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apex_acquire`
--

-- --------------------------------------------------------

--
-- Table structure for table `aiaction`
--

CREATE TABLE `aiaction` (
  `id` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `sourceMessageId` varchar(191) NOT NULL,
  `actionType` varchar(191) NOT NULL,
  `classification` enum('INTERESTED','NOT_INTERESTED','HAS_PROPERTY','QUESTION','WANTS_CALL','OPT_OUT','UNCLEAR') DEFAULT NULL,
  `extractedJson` text DEFAULT NULL,
  `reasoningSummary` text DEFAULT NULL,
  `modelName` varchar(191) NOT NULL,
  `promptVersion` varchar(191) NOT NULL,
  `confidence` double DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignmentlog`
--

CREATE TABLE `assignmentlog` (
  `id` varchar(191) NOT NULL,
  `entityType` varchar(191) NOT NULL,
  `entityId` varchar(191) NOT NULL,
  `assignedFromUserId` varchar(191) DEFAULT NULL,
  `assignedToUserId` varchar(191) NOT NULL,
  `reason` varchar(191) NOT NULL,
  `roundRobinId` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assignmentroundrobin`
--

CREATE TABLE `assignmentroundrobin` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `currentIndex` int(11) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attachment`
--

CREATE TABLE `attachment` (
  `id` varchar(191) NOT NULL,
  `entityType` varchar(191) NOT NULL,
  `entityId` varchar(191) NOT NULL,
  `fileName` varchar(191) NOT NULL,
  `mimeType` varchar(191) NOT NULL,
  `sizeBytes` int(11) NOT NULL,
  `storageKey` varchar(191) NOT NULL,
  `uploadedById` varchar(191) NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE `auditlog` (
  `id` varchar(191) NOT NULL,
  `actorUserId` varchar(191) DEFAULT NULL,
  `action` varchar(191) NOT NULL,
  `entityType` varchar(191) NOT NULL,
  `entityId` varchar(191) NOT NULL,
  `requestId` varchar(191) DEFAULT NULL,
  `oldValuesJson` text DEFAULT NULL,
  `newValuesJson` text DEFAULT NULL,
  `metadataJson` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `authsession`
--

CREATE TABLE `authsession` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `tokenHash` varchar(191) NOT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `revokedAt` datetime(3) DEFAULT NULL,
  `lastUsedAt` datetime(3) DEFAULT NULL,
  `ipAddress` varchar(191) DEFAULT NULL,
  `userAgent` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authsession`
--

INSERT INTO `authsession` (`id`, `userId`, `tokenHash`, `expiresAt`, `revokedAt`, `lastUsedAt`, `ipAddress`, `userAgent`, `createdAt`) VALUES
('6206bc46-5647-4e92-a170-7499972dc065', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', '98f2eee5a805edf5edb80293856ea47edfa6448af5ac65bf662647acbd7f083c', '2026-10-09 10:07:41.781', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:07:41.783'),
('6233921f-ee38-4372-9880-d0df11c59dd3', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', '67b904afb5a6135215225693ffd71754416a659340cca58058c0bb07b3b69371', '2026-10-09 10:05:59.804', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:05:59.806'),
('6497ab89-3486-451a-af1a-9fb585cb0b12', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', '523bcdc448266115b7fabb8433e306c79be661d64dd0d67920b6a037989b9260', '2026-10-09 10:10:56.200', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:10:56.202'),
('676f77c9-542e-4ebb-b0d7-7267ef34977d', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', '7db2a9cb6b76fd4a144db56831315f0fa344250eb557828ae810f458c935ad6e', '2026-10-09 10:18:17.231', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:18:17.233'),
('7ccda5b2-dfb6-49f6-a290-91521158ea03', 'b209ba7c-0052-407e-97bd-e8c1a0955275', '55d9dbeb766f1cde1ac0631fe5855e65842133a63f795dbfb70e4037845ebd00', '2026-10-09 10:05:44.666', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:05:44.668'),
('a059f432-f2e0-4087-8232-f01999d74f8f', 'b209ba7c-0052-407e-97bd-e8c1a0955275', 'd83b02a76a2172124a7187ac7d86b419be57ae94e82946a671433a354bf221e6', '2026-10-09 10:47:35.065', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:47:35.066'),
('a872f697-7263-4547-b849-884798b9f9b5', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', 'e148f4c2abb3db815984bc3c27ec5d3f4212ade2e738d5e50859e7ec9c923482', '2026-10-09 10:20:23.842', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:20:23.844'),
('c676bd35-b0de-4e03-bdd7-b7071fea7f78', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', 'a0225cc6a111b61427c6fdf6f2aab73e6df9ac3e55f232c7a1184bb7032cd665', '2026-10-09 10:16:32.447', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:16:32.448'),
('d9689114-0b57-4055-84f3-26619814beb9', '1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', '3ead540932bc2373034b91a5a28d01ac60499d0fcb94a36c233c4f015d27d31d', '2026-10-09 10:05:24.483', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:05:24.485'),
('e7c1b9a4-9811-48b7-841c-6637eed72ef6', 'f10b48ba-b65f-4e48-9c91-ba7d9f47b266', '99a4c2492a785ca883cc4f42a583f036829d6835dbbd15cb8570e1beeca817fc', '2026-10-09 10:07:22.893', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36', '2026-10-02 10:07:22.894');

-- --------------------------------------------------------

--
-- Table structure for table `cadenceenrollment`
--

CREATE TABLE `cadenceenrollment` (
  `id` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `status` varchar(191) NOT NULL,
  `cadenceStartAt` datetime(3) DEFAULT NULL,
  `lastTouchAt` datetime(3) DEFAULT NULL,
  `lastReplyAt` datetime(3) DEFAULT NULL,
  `nextTouchAt` datetime(3) DEFAULT NULL,
  `touchNumber` int(11) NOT NULL DEFAULT 0,
  `pausedAt` datetime(3) DEFAULT NULL,
  `pauseReason` varchar(191) DEFAULT NULL,
  `resumedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cadencesettings`
--

CREATE TABLE `cadencesettings` (
  `id` varchar(191) NOT NULL,
  `intervalDays` int(11) NOT NULL DEFAULT 30,
  `sendWindowStart` varchar(191) NOT NULL,
  `sendWindowEnd` varchar(191) NOT NULL,
  `maxAutomatedPerChannelPer24h` int(11) NOT NULL DEFAULT 1,
  `providerThrottlePerMinute` int(11) NOT NULL DEFAULT 60,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `updatedById` varchar(191) DEFAULT NULL,
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `calllog`
--

CREATE TABLE `calllog` (
  `id` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `dealId` varchar(191) DEFAULT NULL,
  `userId` varchar(191) NOT NULL,
  `direction` enum('INBOUND','OUTBOUND') NOT NULL,
  `providerCallId` varchar(191) DEFAULT NULL,
  `durationSeconds` int(11) NOT NULL,
  `outcome` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `recordingUrl` varchar(191) DEFAULT NULL,
  `consentNoticeUsed` tinyint(1) NOT NULL DEFAULT 0,
  `startedAt` datetime(3) NOT NULL,
  `endedAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` varchar(191) NOT NULL,
  `fullName` varchar(191) NOT NULL,
  `licenseNumber` varchar(191) DEFAULT NULL,
  `brokerage` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `normalizedEmail` varchar(191) DEFAULT NULL,
  `mobilePhone` varchar(191) DEFAULT NULL,
  `normalizedMobilePhone` varchar(191) DEFAULT NULL,
  `mobileCapable` tinyint(1) NOT NULL DEFAULT 0,
  `market` varchar(191) NOT NULL DEFAULT 'DFW',
  `timezone` varchar(191) DEFAULT NULL,
  `status` enum('QUEUED_FOR_OUTREACH','OUTREACH_SENT','RESPONDED_QUALIFYING','NEEDS_HUMAN_TOUCH','LEAD_CREATED','NURTURE_30_DAY','NOT_INTERESTED','WRONG_NUMBER','OPTED_OUT_DND') NOT NULL DEFAULT 'QUEUED_FOR_OUTREACH',
  `source` varchar(191) DEFAULT NULL,
  `cadenceStartAt` datetime(3) DEFAULT NULL,
  `lastContactedAt` datetime(3) DEFAULT NULL,
  `lastResponseAt` datetime(3) DEFAULT NULL,
  `ownerId` varchar(191) DEFAULT NULL,
  `doNotContact` tinyint(1) NOT NULL DEFAULT 0,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `temperature` enum('HOT','WARM','COLD') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactfieldaudit`
--

CREATE TABLE `contactfieldaudit` (
  `id` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `actorId` varchar(191) DEFAULT NULL,
  `fieldName` varchar(191) NOT NULL,
  `oldValue` text DEFAULT NULL,
  `newValue` text DEFAULT NULL,
  `requestId` varchar(191) DEFAULT NULL,
  `changedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contactnote`
--

CREATE TABLE `contactnote` (
  `id` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `authorId` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacttag`
--

CREATE TABLE `contacttag` (
  `contactId` varchar(191) NOT NULL,
  `tagId` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contractdocument`
--

CREATE TABLE `contractdocument` (
  `id` varchar(191) NOT NULL,
  `dealId` varchar(191) NOT NULL,
  `templateId` varchar(191) NOT NULL,
  `templateVersion` int(11) NOT NULL,
  `generationNumber` int(11) NOT NULL,
  `pdfAttachmentId` varchar(191) DEFAULT NULL,
  `docxAttachmentId` varchar(191) DEFAULT NULL,
  `generatedById` varchar(191) NOT NULL,
  `generatedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `status` varchar(191) NOT NULL,
  `errorMessage` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contractfieldmapping`
--

CREATE TABLE `contractfieldmapping` (
  `id` varchar(191) NOT NULL,
  `templateId` varchar(191) NOT NULL,
  `mergeKey` varchar(191) NOT NULL,
  `sourceEntity` varchar(191) NOT NULL,
  `sourceField` varchar(191) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `defaultValue` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracttemplate`
--

CREATE TABLE `contracttemplate` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `documentType` varchar(191) NOT NULL,
  `version` int(11) NOT NULL DEFAULT 1,
  `sourceFileId` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdById` varchar(191) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `automationMode` enum('AI_ACTIVE','HUMAN_ACTIVE','AI_PAUSED','ESCALATED','CLOSED') NOT NULL DEFAULT 'AI_ACTIVE',
  `aiReplyCountSinceTakeover` int(11) NOT NULL DEFAULT 0,
  `aiReplyCap` int(11) NOT NULL DEFAULT 5,
  `escalatedAt` datetime(3) DEFAULT NULL,
  `escalatedReason` varchar(191) DEFAULT NULL,
  `humanTakeoverAt` datetime(3) DEFAULT NULL,
  `humanTakeoverById` varchar(191) DEFAULT NULL,
  `lastMessageAt` datetime(3) DEFAULT NULL,
  `currentClassification` enum('INTERESTED','NOT_INTERESTED','HAS_PROPERTY','QUESTION','WANTS_CALL','OPT_OUT','UNCLEAR') DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversationgrade`
--

CREATE TABLE `conversationgrade` (
  `id` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `score` double NOT NULL,
  `letterGrade` varchar(191) NOT NULL,
  `criteriaJson` text NOT NULL,
  `calculationVersion` varchar(191) NOT NULL,
  `isManualOverride` tinyint(1) NOT NULL DEFAULT 0,
  `overrideReason` varchar(191) DEFAULT NULL,
  `overriddenById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

CREATE TABLE `deal` (
  `id` varchar(191) NOT NULL,
  `propertyId` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `pipelineId` varchar(191) NOT NULL,
  `stageId` varchar(191) NOT NULL,
  `ownerId` varchar(191) NOT NULL,
  `source` enum('MANUAL','AI_INBOUND') NOT NULL,
  `gradeSnapshot` varchar(191) DEFAULT NULL,
  `status` enum('OPEN','WON','LOST','PARKED','DUPLICATE') NOT NULL DEFAULT 'OPEN',
  `lossReasonId` varchar(191) DEFAULT NULL,
  `originalDealId` varchar(191) DEFAULT NULL,
  `closedAt` datetime(3) DEFAULT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealstagehistory`
--

CREATE TABLE `dealstagehistory` (
  `id` varchar(191) NOT NULL,
  `dealId` varchar(191) NOT NULL,
  `fromStageId` varchar(191) DEFAULT NULL,
  `toStageId` varchar(191) NOT NULL,
  `actorId` varchar(191) DEFAULT NULL,
  `reason` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `idempotencykey`
--

CREATE TABLE `idempotencykey` (
  `id` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  `operation` varchar(191) NOT NULL,
  `requestHash` varchar(191) DEFAULT NULL,
  `responseJson` text DEFAULT NULL,
  `expiresAt` datetime(3) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `importbatch`
--

CREATE TABLE `importbatch` (
  `id` varchar(191) NOT NULL,
  `fileName` varchar(191) NOT NULL,
  `totalRows` int(11) NOT NULL DEFAULT 0,
  `validRows` int(11) NOT NULL DEFAULT 0,
  `invalidRows` int(11) NOT NULL DEFAULT 0,
  `duplicateRows` int(11) NOT NULL DEFAULT 0,
  `status` varchar(191) NOT NULL,
  `uploadedById` varchar(191) NOT NULL,
  `committedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `importrow`
--

CREATE TABLE `importrow` (
  `id` varchar(191) NOT NULL,
  `batchId` varchar(191) NOT NULL,
  `rowNumber` int(11) NOT NULL,
  `rawJson` text NOT NULL,
  `normalizedJson` text DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `duplicateContactId` varchar(191) DEFAULT NULL,
  `errorsJson` text DEFAULT NULL,
  `warningsJson` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `integration`
--

CREATE TABLE `integration` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('TWILIO','MICROSOFT_365','OPENAI','OTHER') NOT NULL,
  `status` enum('CONNECTED','DISCONNECTED','ERROR') NOT NULL DEFAULT 'DISCONNECTED',
  `credentials` text NOT NULL,
  `config` text DEFAULT NULL,
  `lastTestedAt` datetime(3) DEFAULT NULL,
  `lastError` text DEFAULT NULL,
  `createdById` varchar(191) DEFAULT NULL,
  `updatedById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `payloadJson` text NOT NULL,
  `status` enum('PENDING','PROCESSING','SUCCEEDED','FAILED','DEAD_LETTER','CANCELLED') NOT NULL DEFAULT 'PENDING',
  `idempotencyKey` varchar(191) DEFAULT NULL,
  `runAfter` datetime(3) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `maxAttempts` int(11) NOT NULL DEFAULT 3,
  `lockedAt` datetime(3) DEFAULT NULL,
  `completedAt` datetime(3) DEFAULT NULL,
  `lastError` text DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobattempt`
--

CREATE TABLE `jobattempt` (
  `id` varchar(191) NOT NULL,
  `jobId` varchar(191) NOT NULL,
  `attemptNumber` int(11) NOT NULL,
  `startedAt` datetime(3) NOT NULL,
  `endedAt` datetime(3) DEFAULT NULL,
  `status` varchar(191) NOT NULL,
  `error` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lossreason`
--

CREATE TABLE `lossreason` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `orderIndex` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` varchar(191) NOT NULL,
  `conversationId` varchar(191) NOT NULL,
  `contactId` varchar(191) NOT NULL,
  `channel` enum('EMAIL','SMS') NOT NULL,
  `direction` enum('INBOUND','OUTBOUND') NOT NULL,
  `senderType` enum('HUMAN','AI','SYSTEM') NOT NULL,
  `senderUserId` varchar(191) DEFAULT NULL,
  `providerMessageId` varchar(191) DEFAULT NULL,
  `idempotencyKey` varchar(191) DEFAULT NULL,
  `toAddress` varchar(191) NOT NULL,
  `fromAddress` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `status` varchar(191) NOT NULL,
  `segmentCount` int(11) DEFAULT NULL,
  `sentAt` datetime(3) DEFAULT NULL,
  `deliveredAt` datetime(3) DEFAULT NULL,
  `failedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `body` text NOT NULL,
  `entityType` varchar(191) NOT NULL,
  `entityId` varchar(191) NOT NULL,
  `readAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outreachtemplate`
--

CREATE TABLE `outreachtemplate` (
  `id` varchar(191) NOT NULL,
  `channel` enum('EMAIL','SMS') NOT NULL,
  `name` varchar(191) NOT NULL,
  `touchNumber` int(11) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `body` text NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdById` varchar(191) DEFAULT NULL,
  `updatedById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pipeline`
--

CREATE TABLE `pipeline` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` enum('STANDARD','AI_INBOUND') NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pipelinestage`
--

CREATE TABLE `pipelinestage` (
  `id` varchar(191) NOT NULL,
  `pipelineId` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `orderIndex` int(11) NOT NULL,
  `probability` double NOT NULL,
  `isTerminal` tinyint(1) NOT NULL DEFAULT 0,
  `terminalOutcome` enum('OPEN','WON','LOST','PARKED','DUPLICATE') DEFAULT NULL,
  `requiresLossReason` tinyint(1) NOT NULL DEFAULT 0,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `id` varchar(191) NOT NULL,
  `normalizedAddress` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `city` varchar(191) NOT NULL,
  `state` varchar(191) NOT NULL,
  `zip` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `beds` double DEFAULT NULL,
  `baths` double DEFAULT NULL,
  `squareFeet` double DEFAULT NULL,
  `yearBuilt` int(11) DEFAULT NULL,
  `askingPrice` double DEFAULT NULL,
  `listingStatus` varchar(191) DEFAULT NULL,
  `deletedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roundrobinmember`
--

CREATE TABLE `roundrobinmember` (
  `id` varchar(191) NOT NULL,
  `roundRobinId` varchar(191) NOT NULL,
  `userId` varchar(191) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppressionentry`
--

CREATE TABLE `suppressionentry` (
  `id` varchar(191) NOT NULL,
  `channel` enum('EMAIL','SMS') NOT NULL,
  `normalizedAddress` varchar(191) NOT NULL,
  `reason` varchar(191) NOT NULL,
  `source` varchar(191) NOT NULL,
  `contactId` varchar(191) DEFAULT NULL,
  `createdById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemsettings`
--

CREATE TABLE `systemsettings` (
  `id` varchar(191) NOT NULL,
  `aiPersonaInstructions` text NOT NULL,
  `aiConsecutiveReplyCap` int(11) NOT NULL DEFAULT 4,
  `cadenceRetouchIntervalDays` int(11) NOT NULL DEFAULT 3,
  `gradingWeightAddress` int(11) NOT NULL DEFAULT 35,
  `gradingWeightPrice` int(11) NOT NULL DEFAULT 20,
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `systemsettings`
--

INSERT INTO `systemsettings` (`id`, `aiPersonaInstructions`, `aiConsecutiveReplyCap`, `cadenceRetouchIntervalDays`, `gradingWeightAddress`, `gradingWeightPrice`, `updatedAt`) VALUES
('3d19b9ab-fb80-41e7-b2a3-12cc58bdde38', 'You are an institutional acquisition bot...', 4, 30, 35, 20, '2026-10-02 10:45:43.575');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` varchar(191) NOT NULL,
  `title` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `priority` enum('URGENT','HIGH','NORMAL','LOW') NOT NULL DEFAULT 'NORMAL',
  `status` varchar(191) NOT NULL DEFAULT 'PENDING',
  `assignedToId` varchar(191) DEFAULT NULL,
  `contactId` varchar(191) DEFAULT NULL,
  `dealId` varchar(191) DEFAULT NULL,
  `dueAt` datetime(3) DEFAULT NULL,
  `completedAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templateversion`
--

CREATE TABLE `templateversion` (
  `id` varchar(191) NOT NULL,
  `templateId` varchar(191) NOT NULL,
  `version` int(11) NOT NULL,
  `subject` varchar(191) DEFAULT NULL,
  `body` text NOT NULL,
  `createdById` varchar(191) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `passwordHash` varchar(191) NOT NULL,
  `firstName` varchar(191) NOT NULL,
  `lastName` varchar(191) NOT NULL,
  `role` enum('ADMIN','MANAGER','AGENT','READ_ONLY') NOT NULL DEFAULT 'READ_ONLY',
  `isActive` tinyint(1) NOT NULL DEFAULT 1,
  `lastLoginAt` datetime(3) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `deactivatedAt` datetime(3) DEFAULT NULL,
  `status` enum('ACTIVE','DEACTIVATED') NOT NULL DEFAULT 'ACTIVE',
  `avatarUrl` varchar(191) DEFAULT NULL,
  `jobTitle` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `passwordHash`, `firstName`, `lastName`, `role`, `isActive`, `lastLoginAt`, `createdAt`, `updatedAt`, `deactivatedAt`, `status`, `avatarUrl`, `jobTitle`, `phone`) VALUES
('1fffa11c-6004-4c9c-bea9-8576ce2ee2f9', 'alex.vance@apexacquire.com', '$2b$12$45/FOhEP2gVJHJFWF1GJ9eQd9ZJQb63c0qVqXWkI1rLveSVQ7ZWLe', 'Alexander', 'Vance', 'ADMIN', 1, '2026-10-02 10:20:23.848', '2026-10-02 09:47:31.911', '2026-10-02 10:20:23.850', NULL, 'ACTIVE', NULL, NULL, NULL),
('b209ba7c-0052-407e-97bd-e8c1a0955275', 'elena.r@apexacquire.com', '$2b$12$45/FOhEP2gVJHJFWF1GJ9eQd9ZJQb63c0qVqXWkI1rLveSVQ7ZWLe', 'Elena', 'Rostova', 'MANAGER', 1, '2026-10-02 10:47:35.075', '2026-10-02 09:47:32.050', '2026-10-02 10:47:35.077', NULL, 'ACTIVE', NULL, NULL, NULL),
('e728f16a-287c-48e6-956a-cde42220c325', 'marcus.s@apexacquire.com', '$2b$12$45/FOhEP2gVJHJFWF1GJ9eQd9ZJQb63c0qVqXWkI1rLveSVQ7ZWLe', 'Marcus', 'Sterling', 'AGENT', 1, NULL, '2026-10-02 09:47:32.093', '2026-10-02 09:47:32.093', NULL, 'ACTIVE', NULL, NULL, NULL),
('f10b48ba-b65f-4e48-9c91-ba7d9f47b266', 'david.m@apexacquire.com', '$2b$12$45/FOhEP2gVJHJFWF1GJ9eQd9ZJQb63c0qVqXWkI1rLveSVQ7ZWLe', 'David', 'M', 'READ_ONLY', 1, '2026-10-02 10:07:22.909', '2026-10-02 09:47:32.290', '2026-10-02 10:07:22.911', NULL, 'ACTIVE', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aiaction`
--
ALTER TABLE `aiaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AIAction_conversationId_fkey` (`conversationId`),
  ADD KEY `AIAction_sourceMessageId_fkey` (`sourceMessageId`);

--
-- Indexes for table `assignmentlog`
--
ALTER TABLE `assignmentlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AssignmentLog_assignedFromUserId_fkey` (`assignedFromUserId`),
  ADD KEY `AssignmentLog_assignedToUserId_fkey` (`assignedToUserId`);

--
-- Indexes for table `assignmentroundrobin`
--
ALTER TABLE `assignmentroundrobin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attachment`
--
ALTER TABLE `attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AuditLog_actorUserId_fkey` (`actorUserId`);

--
-- Indexes for table `authsession`
--
ALTER TABLE `authsession`
  ADD PRIMARY KEY (`id`),
  ADD KEY `AuthSession_userId_idx` (`userId`),
  ADD KEY `AuthSession_expiresAt_idx` (`expiresAt`),
  ADD KEY `AuthSession_revokedAt_idx` (`revokedAt`);

--
-- Indexes for table `cadenceenrollment`
--
ALTER TABLE `cadenceenrollment`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CadenceEnrollment_contactId_key` (`contactId`),
  ADD KEY `CadenceEnrollment_nextTouchAt_idx` (`nextTouchAt`),
  ADD KEY `CadenceEnrollment_status_idx` (`status`),
  ADD KEY `CadenceEnrollment_contactId_idx` (`contactId`);

--
-- Indexes for table `cadencesettings`
--
ALTER TABLE `cadencesettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calllog`
--
ALTER TABLE `calllog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CallLog_contactId_fkey` (`contactId`),
  ADD KEY `CallLog_dealId_fkey` (`dealId`),
  ADD KEY `CallLog_userId_fkey` (`userId`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Contact_normalizedEmail_idx` (`normalizedEmail`),
  ADD KEY `Contact_normalizedMobilePhone_idx` (`normalizedMobilePhone`),
  ADD KEY `Contact_licenseNumber_idx` (`licenseNumber`),
  ADD KEY `Contact_status_idx` (`status`),
  ADD KEY `Contact_ownerId_idx` (`ownerId`);

--
-- Indexes for table `contactfieldaudit`
--
ALTER TABLE `contactfieldaudit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ContactFieldAudit_contactId_idx` (`contactId`);

--
-- Indexes for table `contactnote`
--
ALTER TABLE `contactnote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ContactNote_contactId_idx` (`contactId`);

--
-- Indexes for table `contacttag`
--
ALTER TABLE `contacttag`
  ADD PRIMARY KEY (`contactId`,`tagId`),
  ADD KEY `ContactTag_tagId_fkey` (`tagId`);

--
-- Indexes for table `contractdocument`
--
ALTER TABLE `contractdocument`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ContractDocument_dealId_fkey` (`dealId`),
  ADD KEY `ContractDocument_templateId_fkey` (`templateId`);

--
-- Indexes for table `contractfieldmapping`
--
ALTER TABLE `contractfieldmapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ContractFieldMapping_templateId_fkey` (`templateId`);

--
-- Indexes for table `contracttemplate`
--
ALTER TABLE `contracttemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Conversation_contactId_idx` (`contactId`),
  ADD KEY `Conversation_automationMode_idx` (`automationMode`),
  ADD KEY `Conversation_lastMessageAt_idx` (`lastMessageAt`),
  ADD KEY `Conversation_currentClassification_idx` (`currentClassification`);

--
-- Indexes for table `conversationgrade`
--
ALTER TABLE `conversationgrade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ConversationGrade_conversationId_fkey` (`conversationId`);

--
-- Indexes for table `deal`
--
ALTER TABLE `deal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Deal_contactId_idx` (`contactId`),
  ADD KEY `Deal_ownerId_idx` (`ownerId`),
  ADD KEY `Deal_pipelineId_stageId_idx` (`pipelineId`,`stageId`),
  ADD KEY `Deal_propertyId_idx` (`propertyId`),
  ADD KEY `Deal_status_idx` (`status`),
  ADD KEY `Deal_createdAt_idx` (`createdAt`),
  ADD KEY `Deal_stageId_fkey` (`stageId`),
  ADD KEY `Deal_lossReasonId_fkey` (`lossReasonId`);

--
-- Indexes for table `dealstagehistory`
--
ALTER TABLE `dealstagehistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DealStageHistory_dealId_fkey` (`dealId`),
  ADD KEY `DealStageHistory_fromStageId_fkey` (`fromStageId`),
  ADD KEY `DealStageHistory_toStageId_fkey` (`toStageId`);

--
-- Indexes for table `idempotencykey`
--
ALTER TABLE `idempotencykey`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IdempotencyKey_key_operation_key` (`key`,`operation`);

--
-- Indexes for table `importbatch`
--
ALTER TABLE `importbatch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `importrow`
--
ALTER TABLE `importrow`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ImportRow_batchId_fkey` (`batchId`);

--
-- Indexes for table `integration`
--
ALTER TABLE `integration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Job_idempotencyKey_key` (`idempotencyKey`),
  ADD KEY `Job_status_runAfter_idx` (`status`,`runAfter`);

--
-- Indexes for table `jobattempt`
--
ALTER TABLE `jobattempt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `JobAttempt_jobId_fkey` (`jobId`);

--
-- Indexes for table `lossreason`
--
ALTER TABLE `lossreason`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Message_providerMessageId_key` (`providerMessageId`),
  ADD UNIQUE KEY `Message_idempotencyKey_key` (`idempotencyKey`),
  ADD KEY `Message_conversationId_createdAt_idx` (`conversationId`,`createdAt`),
  ADD KEY `Message_contactId_createdAt_idx` (`contactId`,`createdAt`),
  ADD KEY `Message_providerMessageId_idx` (`providerMessageId`),
  ADD KEY `Message_status_idx` (`status`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Notification_userId_fkey` (`userId`);

--
-- Indexes for table `outreachtemplate`
--
ALTER TABLE `outreachtemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pipeline`
--
ALTER TABLE `pipeline`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pipelinestage`
--
ALTER TABLE `pipelinestage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `PipelineStage_pipelineId_fkey` (`pipelineId`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Property_normalizedAddress_key` (`normalizedAddress`);

--
-- Indexes for table `roundrobinmember`
--
ALTER TABLE `roundrobinmember`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `RoundRobinMember_roundRobinId_userId_key` (`roundRobinId`,`userId`),
  ADD KEY `RoundRobinMember_userId_fkey` (`userId`);

--
-- Indexes for table `suppressionentry`
--
ALTER TABLE `suppressionentry`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `systemsettings`
--
ALTER TABLE `systemsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Tag_name_key` (`name`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Task_assignedToId_idx` (`assignedToId`),
  ADD KEY `Task_status_idx` (`status`),
  ADD KEY `Task_contactId_idx` (`contactId`),
  ADD KEY `Task_dealId_idx` (`dealId`);

--
-- Indexes for table `templateversion`
--
ALTER TABLE `templateversion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `TemplateVersion_templateId_version_key` (`templateId`,`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `User_email_key` (`email`),
  ADD KEY `User_email_idx` (`email`),
  ADD KEY `User_status_idx` (`status`),
  ADD KEY `User_role_idx` (`role`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aiaction`
--
ALTER TABLE `aiaction`
  ADD CONSTRAINT `AIAction_conversationId_fkey` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `AIAction_sourceMessageId_fkey` FOREIGN KEY (`sourceMessageId`) REFERENCES `message` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignmentlog`
--
ALTER TABLE `assignmentlog`
  ADD CONSTRAINT `AssignmentLog_assignedFromUserId_fkey` FOREIGN KEY (`assignedFromUserId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `AssignmentLog_assignedToUserId_fkey` FOREIGN KEY (`assignedToUserId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD CONSTRAINT `AuditLog_actorUserId_fkey` FOREIGN KEY (`actorUserId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `authsession`
--
ALTER TABLE `authsession`
  ADD CONSTRAINT `AuthSession_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cadenceenrollment`
--
ALTER TABLE `cadenceenrollment`
  ADD CONSTRAINT `CadenceEnrollment_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `calllog`
--
ALTER TABLE `calllog`
  ADD CONSTRAINT `CallLog_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CallLog_dealId_fkey` FOREIGN KEY (`dealId`) REFERENCES `deal` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `CallLog_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `Contact_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contactfieldaudit`
--
ALTER TABLE `contactfieldaudit`
  ADD CONSTRAINT `ContactFieldAudit_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contactnote`
--
ALTER TABLE `contactnote`
  ADD CONSTRAINT `ContactNote_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacttag`
--
ALTER TABLE `contacttag`
  ADD CONSTRAINT `ContactTag_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ContactTag_tagId_fkey` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contractdocument`
--
ALTER TABLE `contractdocument`
  ADD CONSTRAINT `ContractDocument_dealId_fkey` FOREIGN KEY (`dealId`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ContractDocument_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `contracttemplate` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `contractfieldmapping`
--
ALTER TABLE `contractfieldmapping`
  ADD CONSTRAINT `ContractFieldMapping_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `contracttemplate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversation`
--
ALTER TABLE `conversation`
  ADD CONSTRAINT `Conversation_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `conversationgrade`
--
ALTER TABLE `conversationgrade`
  ADD CONSTRAINT `ConversationGrade_conversationId_fkey` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deal`
--
ALTER TABLE `deal`
  ADD CONSTRAINT `Deal_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Deal_lossReasonId_fkey` FOREIGN KEY (`lossReasonId`) REFERENCES `lossreason` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Deal_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `user` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Deal_pipelineId_fkey` FOREIGN KEY (`pipelineId`) REFERENCES `pipeline` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Deal_propertyId_fkey` FOREIGN KEY (`propertyId`) REFERENCES `property` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Deal_stageId_fkey` FOREIGN KEY (`stageId`) REFERENCES `pipelinestage` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `dealstagehistory`
--
ALTER TABLE `dealstagehistory`
  ADD CONSTRAINT `DealStageHistory_dealId_fkey` FOREIGN KEY (`dealId`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `DealStageHistory_fromStageId_fkey` FOREIGN KEY (`fromStageId`) REFERENCES `pipelinestage` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `DealStageHistory_toStageId_fkey` FOREIGN KEY (`toStageId`) REFERENCES `pipelinestage` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `importrow`
--
ALTER TABLE `importrow`
  ADD CONSTRAINT `ImportRow_batchId_fkey` FOREIGN KEY (`batchId`) REFERENCES `importbatch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jobattempt`
--
ALTER TABLE `jobattempt`
  ADD CONSTRAINT `JobAttempt_jobId_fkey` FOREIGN KEY (`jobId`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `Message_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Message_conversationId_fkey` FOREIGN KEY (`conversationId`) REFERENCES `conversation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `Notification_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pipelinestage`
--
ALTER TABLE `pipelinestage`
  ADD CONSTRAINT `PipelineStage_pipelineId_fkey` FOREIGN KEY (`pipelineId`) REFERENCES `pipeline` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roundrobinmember`
--
ALTER TABLE `roundrobinmember`
  ADD CONSTRAINT `RoundRobinMember_roundRobinId_fkey` FOREIGN KEY (`roundRobinId`) REFERENCES `assignmentroundrobin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RoundRobinMember_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `Task_assignedToId_fkey` FOREIGN KEY (`assignedToId`) REFERENCES `user` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Task_contactId_fkey` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Task_dealId_fkey` FOREIGN KEY (`dealId`) REFERENCES `deal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `templateversion`
--
ALTER TABLE `templateversion`
  ADD CONSTRAINT `TemplateVersion_templateId_fkey` FOREIGN KEY (`templateId`) REFERENCES `outreachtemplate` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
