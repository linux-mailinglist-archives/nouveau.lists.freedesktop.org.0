Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABB4CC6475
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 07:37:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD41510EBA5;
	Wed, 17 Dec 2025 06:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SpsU7nGA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E163645628;
	Wed, 17 Dec 2025 06:30:26 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765953026;
 b=IOXeGmkyTd7dDrJrV7McAElp9DnTKmnMsg2p0qj6jM7L2ui5am7v72zgjkrWlJ2XLxB5D
 3VDceX3NsCzIsCz/j08gK2HZECNT5knPplniP/fR0BLCuikIOa8UJKeO3vGNdmpP40K3mPG
 FltSmpoG3Umbg504HZ6DsFIsaDbHQ+HxmhCjwOwvsEyoLJyZIU1eMqZtfqV4BKNzcZGUPho
 ez8tRkmS6GxFg0IQh5+u93pPWhkGUbs8ZhLfNdHWDrPWdMS0OX6hECt06Omml9N5W5VtDj0
 4GTwh6UtP3fip8kbdIvPHGKgpt158mlZTP8DwWMW71bvOf/yMbCfnOirX/9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765953026; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WNSpADxXG90377SeuXpKPvC6Y90WIRwOVJHw2TR+O3E=;
 b=Xf6UKhp/+oR1fQJM9IEHg/OsB4K/ejfe7jhixjS9O8HDFbpFgT+EzkJe67SPQLyIucAiM
 xjxB+ZQZ4zSzeYouaGRYBi0X3VF21maK3/MK20XNk1huIuvFJKcUXP5w+qdtvR8c56nZW5W
 K89zi1056sloaYUsNd/rxb5dk45CKTn7fEJKNOd24aiAne/X/GB+ccPBYLLgVFnx80QfYUU
 fKI7Pkfek5BGzWxoHZlR5EuCHNO1C6+to46oruqhGlEuEVIBKbyC/j0+/lj1pnrBkn8BdXI
 WP0m0fCqh4cpFdXPG5s6kvD7lIa8Cna/qXpoe6Vt0kb9EPgCxNRY4pF9rtnA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 385B145623;
	Wed, 17 Dec 2025 06:30:24 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012026.outbound.protection.outlook.com [52.101.48.26])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA32010E19C;
	Wed, 17 Dec 2025 06:37:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYKCy6L0BU9PR0r3rwF4ToGZWGvt8Pf6HiqGscfi8ATOAIutNDGub5Bkp9452EJ3l+a9ena4h7ssTCwn5TEDfNvet5G93tvlFS85doyGxa5qvsSeuON50qk1rGi2IsbXBD0gnWl3XVSn4brte48H4LzmDDyVHPyE7EemnqnIDad8E16HaASijGE7rcMiU208JpR34PYyxI3+9lrMtoopVRW3AUMcO75UhpEzH0F6plK0nH0TCEPaLsd3HYNVAPlxDf6TxuTqsEmuV9343xc7KzGgTpcseuVyZKA1FfIhy0X/B2xW9LsjRdEBWTo4h54mH1SrboRWxkHpgprtvyU3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNSpADxXG90377SeuXpKPvC6Y90WIRwOVJHw2TR+O3E=;
 b=oKc/IbZSFUO+t0ZcO69bePpFrwZN4IuDEtnUX/74uoS1HQWEQfXFnTGWt/ZgUv7CUsc/0GT2OoX/G96oCcy0pXkcAYXH5j5QsnKXIz8K4L2NysheVTtucrNVS+WeQfreCwcxCZAMJFT/bE5UMK8vfwhWbNCcw3RNOdtobXk6ii7XTU5eGsZw49R8hgM7N4eIC+J6++KmgWyiDkNJYNpiZ11E1HwJH7jOp7sjC71X+cRg3kl4Ik9W4nZznuk8mGbeJIURZ1x/ODE0QMKJFDl1Ut3Gj4Cqx/SB/31u+FjEzpgQ06bgE2WJv83Ya6msPlPy9Jf6TAOjDDSo1hJFIOSdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNSpADxXG90377SeuXpKPvC6Y90WIRwOVJHw2TR+O3E=;
 b=SpsU7nGAInR9vs94Kl5qlUyX1XZoaQ5njGaEsA0vr3Hmayd2MwwObTURcSLl3B1EM+lkQ20DT1D61a3aVR+vWCkZQvOq/7m6Ttyq6hjo8AksjdQ9HCQTo6jjqRGwHd6HR1zqSbWFuQI2R7DoJ6x3IQrTbJwtLXTnY3wrOSfiZBkvpcMynEVTGUVpSaK2fWsVXyOPU5cHZGulj4xPM1HkJITUDKAK2n7C2tCAPOVB9rlUrzBBDi1i76G3f+GuNSvWP9ERXw5UytHcW2si5G5v1jFB9kdop5INgw35wubP8zDMpxhff1adgbonJ08CAp09ddxOvZ+oTZVVu2sHPe3fyg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:37:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:37:48 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:37:44 +0900
Message-Id: <DF0A99X079L2.3VXAKTQTJSLJ0@nvidia.com>
Subject: Re: [PATCH v3 00/12] gpu: nova-core: add Turing support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
X-ClientProxiedBy: TYCP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::15) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: e1b81764-60d6-4d8d-6e17-08de3d36cb29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N1BzR0NJR3NhditVQ0tIV3NJL1EvN3ZQQVNpV2pEZ291dHVhQmw2aTIzK0Nz?=
 =?utf-8?B?YXR1RU1pWmJTNFVuV2pBb2FFZEZPRk0rUjBVUVhnb1pHUU9Qb1J5L1ZPQlR2?=
 =?utf-8?B?SnVLdTVRb3l4N1o5ek1tMVBNMEJJM2pBMVRHdnJSTk5XWmljN2ZCTC9NMVRS?=
 =?utf-8?B?K0pXRUMvOWllZUN4TXl6ZEgyYWFXclQ5aDVXakp3L0RmTThSMEN3VHNvSDAw?=
 =?utf-8?B?VXRDNmVPT2ZYemYzWXIrUkowbHIwNXZ2L3FOaU9jb2xCRXI5QUlZOUVuM01N?=
 =?utf-8?B?MFlYWVNRL2NLTkpmSGVZR2tacU95b1pGTVU5dGxCN20yNEdKY3JIaVI2SVA2?=
 =?utf-8?B?UHZRNFZkRjJZMy9VRHhORHFwMDhuNjZqS0lvbXc5T3RneFd2aWQ3Rk1keVox?=
 =?utf-8?B?L1hISjJHZUpFQzNCZGtWcHhvemtMeXhmeXRrZVlDQW1seXdKdnBsdTZCMnlE?=
 =?utf-8?B?OWxoekcyTEc5MHJPRHJUa245b0RDZ3M2OWo1V0FzL3RQbEYzZ3I0OEV0bjZY?=
 =?utf-8?B?T01qTER5UmE5UmJNRHRlcklIUTdVMk8yVmdBZlNJU0pZWlBEZWpIQlRSeEd2?=
 =?utf-8?B?UGdLREV6bDV2K2xVUDloZWxiaTNMdmtsdWxuZ2YxNDhKcnJMY2xRdGplL2U4?=
 =?utf-8?B?TzhnQ3pvSUNCeDZxdmJ5YndNTWQveVZub3RTVmltMW1SZGdINkJXZG5DVlcr?=
 =?utf-8?B?c05WNUk1UXcrcFU4bVBydnVTQ0k1R0VYcWxFeXhZb3c1WGtiWGlPdFE0OE5Y?=
 =?utf-8?B?OWZWb3hELzdvUWl6SlZ0YmZDYngzVlVPWWdVVU5sYTZHVzZINXVuMHNFUmtW?=
 =?utf-8?B?WmlYdW92cHVabGxKaUR0dHNHdWhhTWp4VjJ1L2hyK1A1clJmZFYySUNnTVdZ?=
 =?utf-8?B?MnNHSkVocEIzRGdVN25sNTY4R2R1L2MrR0tHa2pOdEdUS01VRnlOVmNCcmpK?=
 =?utf-8?B?eHhCQVJMaTdMSWxCSlF1V3R5TitmQ0Fub09yR3lvamxqYUlKTHQyWXlxdHlz?=
 =?utf-8?B?L29ZbGpxTHFDT2tmYmtDUnliYWlJa1dhUVBvWXhSRmtsODd0L3JjNTFwYm1v?=
 =?utf-8?B?ZzA0Nm1qVldXU2Jud3NiQTZ3aVJOL1pjMi9zOC85SWVuWW9MTWRkeFYzV242?=
 =?utf-8?B?VlJqTGE1QUdZSXl0dVZpeEczM3RMOE1WWnRremROVHEvRXZ3V0E5VWRmWnRx?=
 =?utf-8?B?WWp4d05sVFFTaWZvMDhBeUV3SStxZ0treHYrMUd0ZFFjR25qbVh0emxnTm11?=
 =?utf-8?B?V2hKZSthcjMrNlgwRk04alFrTWRHR2ZITVRtWWd3Q2NwTjBEK0JHRXJJNThQ?=
 =?utf-8?B?ZG5vR0VRK3haUUFBaUNtV3ZoclNGUzVITml3NU9aU3lVNUFIODB6YkllSmww?=
 =?utf-8?B?MTRsaUNoS2VnRXhmQnZTbGlVMFFVWWJxOUFSUkN2cHBTdHNTZ3VZd1BUZGtY?=
 =?utf-8?B?NDdJNFBCZUF3U2JRYTh3QVNIVVFmQTdZNjZydnlRY2FnVWhaT3k5ZGFJak1r?=
 =?utf-8?B?MmlMWjI2SkNLektQREU1RmpHMCt2c1gwNTNWbXYwTURocy9NajRMQlRVQjEr?=
 =?utf-8?B?SnRvNmR0NlYzdFcyS0lkREtEUURFWXFjZFJtUHZLZGQvSHpCY1FTdzQ0VHo4?=
 =?utf-8?B?dFNxTkFwYTROMHVEejNIM0t3ckF6WEwxMUhoYWVoZFlidGVLWkN1d3dzdmJY?=
 =?utf-8?B?K3Jra3JaWTIrdUV4d0ZSbXFLcDNZZlBKNEZndHlJMWdkY3dnVkVhQzFWWkpa?=
 =?utf-8?B?YW15N1RxS2plSHNOVGl6NmwvcVREaXpEZEZKa0E5bVJ4d25PaHBQUTl3eHV4?=
 =?utf-8?B?TjB6c0ZEVjRCYk5YUFNjaStUWndyaDJmYzVpREtsaGFHYTdvb2dHYURTWkFU?=
 =?utf-8?B?aFBPTzFHem5nNTBJalNwdGlleGpOOUlVMXl2QmFNYllrRktzcXVaU01Pb1gr?=
 =?utf-8?Q?zL9r1ekjFCJZTaCNs7qhTfO05LTZk2mO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QS9RVGo3Z2dlVHUya1JqMkc1ZW9IWmpMRktzanBLUXY3cG5BaVlxQ09GdHJJ?=
 =?utf-8?B?RXR0cWpyZ1JSWDg4K2J1dmI1ZlJVSVV0MkVLY1JjaTVpekZNdkY1a1RzeU9I?=
 =?utf-8?B?V3c5SDdYekY0eXZudVc5TlY2azdiMmg2QTArbGNZc3ZBbzRlNXR1K0hJam9G?=
 =?utf-8?B?bDM4MTIrZHp0OFgwaHY5SHRBNW8wTXIvbk5jSUc4ZmhMQi9aOXo4aThXZTVj?=
 =?utf-8?B?bmtqOS9qSzBoQmNVeGpmL1JLNTBUM25LTCt1QWpaZXVYRjdSZy9pejZ3SDFV?=
 =?utf-8?B?V3RSVFJBS2N4WFF3TUVqbVRsb016ZzlMZ3Vlb2d0MGd6R0luYkFtSzR3UGJK?=
 =?utf-8?B?dkJzcGEwaTdvdmRUT0tiMnBuY1RQcGNPZkNrYS9XK3UvcWQxWWVWNTBBbmpB?=
 =?utf-8?B?eDlGSGtkTXFuZ1haNDEwSWsyYlN6RDdYZXdLQXBRaXIzREloVTJZNTFoMlFU?=
 =?utf-8?B?Z29HTXUxWmZtZjZueGZCTVJWR2NWNS9CMUxhMGcrRE1QRjNzMi90L3BTWjlX?=
 =?utf-8?B?VHplYjE1V21yZU5MV01pRE12bTM3YkhpUmQweCtGT0FUejAvSWVZQ3N3eVBj?=
 =?utf-8?B?UWQ3SUFaVjJpemxFRHFGT3pmZktUUkVFR3lOQWFSYjNwNXBlb0Y2QTUwN2s5?=
 =?utf-8?B?R0R5bnZtS1Z3UUxBc0Q4Sk4vaFRTLytrZEl5Z05Cd0NiNEFVOTFmV3RMcnQz?=
 =?utf-8?B?eTBYZTRnbTNqQXVUK2dDblRhT3JrSnVKSFdNeElMcEs4TXpvQUpSeDE2aGZD?=
 =?utf-8?B?UzFNN0ZPdWpPUVM0VXozLzVabDRLUUlKckdSOXZwMXY2N1k0bzUyNzVCMXZP?=
 =?utf-8?B?ZUZwTldwNWVWSTVJL25SaHBQSzgyUDBvNTlTVms4KzhNdjRoS3hWUmlKcDQy?=
 =?utf-8?B?cnJWU0tObU1ibi93aTRRZ2hYd251TE4zNm1oYlhNNzMzalMwbmY0T2lWSnQz?=
 =?utf-8?B?RXVNbkE4Z3dJbGRQZHdKenI1aGcwTzNFZ29tcmNkNW9VSHppb2dCejFqNnZL?=
 =?utf-8?B?UC9vTE11VlhHRlJ0TVdRR1U1dStPd3FKbGw0eGZWUmFFcEUrWFJTZXJBTjJs?=
 =?utf-8?B?bS8veWlFbU0wTFh2MHYxcytwWW1xSjRmb2lrMEhPbXU2ZkxwWWlmUDNpR1Yy?=
 =?utf-8?B?bGt4Q3RwdXhtd0RYWm5DN3JqcDdHUnhjNmVrZHJkd2FYSlpJa2lickttb0xh?=
 =?utf-8?B?cWo3SHcxNHJ6dEZyeGtBQ1B1S2UrMjlKWm1UYUs2ckdHaHI5RGF3MUVQRVNt?=
 =?utf-8?B?djRKYkRHNnpKOUtFblZkZWVEQTQrcnRIWVlaK3FHU2swTUF1bHFjU2xEQjVT?=
 =?utf-8?B?RHh4L25mL3FSYzBkd3BldkFjWDkzM1A0cWl0V25RZ3BMMzVmVTFvcWQ0Tjc1?=
 =?utf-8?B?eGpVZU1SR2xqVUt6T1R3ek1EMlR2TUh6TENhU1FzNkxPWm9JMysrYnl2endU?=
 =?utf-8?B?a0lQUjFzdUU5dHFMSGVTOEl3V0p3c1dZYkhFSEVKMmZ4cHZoeE14Qk5yMFFF?=
 =?utf-8?B?QzlsOWNOd0twd2g4dVYybCszb3hlZ0hsQ2pxeW9SZVl3RmRkcjFaZzZUbXhv?=
 =?utf-8?B?NnJpL1pxb3NTTVdVYmVtNVNOY3o2TDBvSitFS1U2M0RtVmkwRU84Vk5rNEda?=
 =?utf-8?B?RFdab1c1dFErcTkvcDlkZC8wWGt0SHFtME9DMlhTK2JyZWR4MkFpcEc1N0JE?=
 =?utf-8?B?eWRpbllzclFyb2VpK0NnOTl2RXlCL0dNN2hsMHpLanBEcjhDdzVKSmV1ZDlO?=
 =?utf-8?B?NnVTN2FmSDFZVTIySWNqeW5qNmxxaFQ5MzRUZHliZVZ5N3cxMFg5NWpsRmJi?=
 =?utf-8?B?Y01VSk5qbzVlT0kraW1WZkFkYXJNMkRaTHZJNVhpUjZSLzh0SzFTL1hMUmVq?=
 =?utf-8?B?MEpIMWlISFIrTlcwNzJZcFlkaUR0UEF1Q1dSRG1iWTJqV3FENEtTNXo1bVpC?=
 =?utf-8?B?NlVkNG1Ob3ZDSmpaWUhEMm5HUVZKV0ZVUUN3NG5NTXlzOTRjTEhGS0p3b1FV?=
 =?utf-8?B?aXdxL0hINjdSTDZIN2s5NnJxZENid01NdHdWcVNDWjkxbFc0T2l0UC9TRFNn?=
 =?utf-8?B?YVBtUG1Nd3FBQ3VxQTBFOVdzbzVpeUU0ZkJoWDBjYzNlR0ZVMnRvNk42bWE3?=
 =?utf-8?B?K1dLQlA2ZU4zNW81MXBIREFEQ09aaWdDWGZLQzhxR25nSyswQVpra3hlTmU0?=
 =?utf-8?Q?FbK7p1H5KQ8ol3jv4EgQ86qdLvfSDMP9i4MuA/DgFj0H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e1b81764-60d6-4d8d-6e17-08de3d36cb29
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:37:48.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XJH6iIvgIYiQRn6lw+2+2G8Uh2jYhXfMYXIbzBKUtT3OAqs53HgHokm5QHTIU1iZs+dXCU0wZbiT1aLfeKY9hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
Message-ID-Hash: FU6RFTHD766UQWOLVJHLBV6JIMH4RFNN
X-Message-ID-Hash: FU6RFTHD766UQWOLVJHLBV6JIMH4RFNN
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FU6RFTHD766UQWOLVJHLBV6JIMH4RFNN/>
Archived-At: 
 <https://lore.freedesktop.org/DF0A99X079L2.3VXAKTQTJSLJ0@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 9, 2025 at 8:17 AM JST, Timur Tabi wrote:
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.
>
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
>
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.

I had a pretty large diff after running `make rustfmt` on top of this
series. Please make sure that each patch is properly formatted.

