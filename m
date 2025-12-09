Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE018CAEC1C
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 03:53:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B953E10E1AA;
	Tue,  9 Dec 2025 02:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="thQoJZBP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C5910E1AA;
 Tue,  9 Dec 2025 02:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFhVGopsKclp/aMF6AroUyIpOZjXnk5bWDCnmwgHIl/PC1F4Jj2d3ZCI62bzRl+0oGOAtT3MDkhRyN3plbrKJYKis0aa/D7DTg83o6GDau1S3PI6Y8HTOXR1mtV5vtyLxUTKnu3EDVsKhnve480mJJc+ukHIMNhCbsQixDV0lW6T10viUnskt1KwkGJqeY/EWH+TTssPPiNeBszG42n+bEM5s7wbYDDorSmnFCJYlgs+toSiMp6fh7IbMcQiuCapEr+rrHntbzQxhNijnRR/fYfDyqXlMJLKJslWiXPPSww1TN+opZisUYYUhhLewDSSwh6gcs7G295oKg6uR02ZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfLTWkrcLaNssBrtDkjT8wGIDd+ejjskZMnTlWl9gm4=;
 b=H+dqwk4Q4AdNQvYpr54xUOTEtkmkKCabWuZnbweoKqr/5c6aN4+A7WURSG+ennkXE50dFWJDbhmjpT/Ym6FfLAxk5PbYlJxhh8QaXAKq93YRPLQO30KuQbupGWx5r7DsSuhBxE5SMXjg5YqnsRJhK5kjTzwQX3o/JrRIZXPia13EJmdZ7EE6xLb6x3OUKmsJ+/scfFSwtmymASCyjyC5WBtZyNNHx24JrSNbFjlJObUhaUpnUt2zTXrzPkcS5aawHqgKFTwV/fQRzr6zIReduQ8ZmSSlTJZm2HKaTtTWqpniikGKO6jsT8Fwz9ZLXbjt+OSoHHsE62whTPnBGZWJJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfLTWkrcLaNssBrtDkjT8wGIDd+ejjskZMnTlWl9gm4=;
 b=thQoJZBPo120YnDjO4qILqRbOZQcuePoil3eHVn+6eayOxN/3eh96W89R3s/J/oEIT7HjKLSdNPWINOYf5+gQxOyTH7aDtnU6M5W3yJAHzS0Td13mrpKw0UHZU0Al9y0GN7/qGf5Kv8SaLL+h1kTGjdcIw0vf/z5aaZjjqWMUK5srmqPytRsQqZrN7SlGVhPf1+ctOqdwz98KODsTQZYLbKwDxivKWIS/Ce99EQabqF5bEFddjgsgoXt9GCvk6fnQxGMzJcnsjsvX/D0uoJky5hdvV3yB043fxxe+MoZOtmMXCWozTn/kSlrAcLfYhHO5TDoWRRSdRWKfNi75Q9XoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB6309.namprd12.prod.outlook.com (2603:10b6:8:96::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:53:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Tue, 9 Dec 2025
 02:53:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Dec 2025 11:53:40 +0900
Message-Id: <DETCHCWISEON.66RX2YZU0IPM@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument
 size must be page aligned
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
 <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
 <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
 <658210754254b59e0a7efeaa1e0efee1c3fb5c41.camel@nvidia.com>
In-Reply-To: <658210754254b59e0a7efeaa1e0efee1c3fb5c41.camel@nvidia.com>
X-ClientProxiedBy: TYCP301CA0014.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB6309:EE_
X-MS-Office365-Filtering-Correlation-Id: a210f19e-b93d-419d-7e01-08de36ce2a67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1BzOVpDdTZpMUtIalJZWXVZa0lmRmJGNTg3OGVGOVMwMnVLYUZVdGVOTG1s?=
 =?utf-8?B?ZVpVd0tMWHpxa3lwUUNzMlRkV3ByL3ZxNWV1VnFNbXBVRUNSNURwOFZQNjgw?=
 =?utf-8?B?bmtMbStoeGk3RnBJNXZLMXVnY2Y2ajhoNTRMT2hFQ3lmVEg5bU9HYXJibGh6?=
 =?utf-8?B?WHVOWFBoMm1lRjgrWGwxLzkrSDBXT2lzeFNxZEl6SDl1SW9HWndrUFM2aTRo?=
 =?utf-8?B?UTlSeUkrNEIvVW9tMnU0Wis2dHNqYU1UQlF1S3pudzd5b0ExRUM0SUNYODNT?=
 =?utf-8?B?L2diZk9sUUlGeHVYaG1oVnlEQ2tPc0h1M0pJbVR2M0NGbUlaOE40dlMrdnRj?=
 =?utf-8?B?NEd5QlRWRzc5NG11dlNlUStqV0V0TkJ4eXBnVHcyNm9LVm8ySXp4UXhoUUhT?=
 =?utf-8?B?Z0QzT3JLcys5WUFibFUvdnVqMmZ3M1Iwczc4dUk2RXY5MFdtK3pnZHl3RUxM?=
 =?utf-8?B?MHpFVnVHWEtLZWE5TFphTTBoQW03OFpUY0ZwOFRQbjRkc0lXRWhVN0hGZ09O?=
 =?utf-8?B?ODgzMjNXZWsyT3lQN2lFVTA5VmlCR3IzWUlqeGJsaTg4WVFlKzFXbU5GbVZv?=
 =?utf-8?B?T3ZzNFZLdkhpajF0RTVNSEpCRTRINVV3Ym9NenpndEdVNm9ya1VMdDU0VWpL?=
 =?utf-8?B?KzRjZy9ncndVckFYZFZ5Z2Z4b010cUI5NzJuTEt0VTJqNnJaQ0NCZUQ4OXpD?=
 =?utf-8?B?WXRVVU1KMzVla1U0QUx3cy84SU9scXlmT1c2QVhwSHlMT1M1bm5NK2hzdXls?=
 =?utf-8?B?Rm5mMjFEdVFFU0ZuQldZMGNNS3VxNVhHN092NkFqdUJXTXQ3cklxblRvcWs0?=
 =?utf-8?B?MFJxVWNuTGh1dUc3QkRBd2pMMU1ZK3M3QllhYmxxMjk0NnlSOVVYdmoxbzc0?=
 =?utf-8?B?L1h5YWtxNTAzRmFwQUp5TWV0YmZnK3hPalk3UGtGT0FBNWtpZlFRTnNWU1I0?=
 =?utf-8?B?b0tKZUg0dnZjWktURWhabGhGTTFZMzZ1Qy9icUluZmJBdW5BOThTMmx3eDVG?=
 =?utf-8?B?TXFxOUZjSXczOUkwalQ0UUcwelBPM3Q4YzEzb29oK3hFaE5iQ25pc2FOMGxH?=
 =?utf-8?B?bjdrTnNLcUZsR0djdFBpanpkcm9oRWdrRTBaNTlKK0MwSXM1aE8zdWdYbHlu?=
 =?utf-8?B?L3lwbEV4OFlSM2k2NTlkbHRvRHBsWitDK3RIWjJTYis4VjRYZHJLYlB2UDVT?=
 =?utf-8?B?RklRT0k4ZUZNTHFzcDNwSE9aWnpPZWovZEVvQWdiVlU3K2EvVG1qbXN1UHZa?=
 =?utf-8?B?Uy8xT3BVeEs4dklkMC9qaWpBbFFqaVRvRG9tV0ZHRWNLNWVMTVNLdDdRa1By?=
 =?utf-8?B?L1dCTHhhalZkclhMZ0psS1EyM2EwWWNJUGZQM3FYbTFNV1I2R0l0QjZYR1NR?=
 =?utf-8?B?T2VicVNmUEk0RGJ6bldwM0JlVityTkx1djRNUmtlUElNWnl4MHdzZHBwQ25x?=
 =?utf-8?B?c09wZUFOT3o5eE54Zm5iaGx1UUIySzNVdUhnR1luZDk3UnlBbXdaTWxEYjlP?=
 =?utf-8?B?b1VqSm14aVo4Y0hNb0crR05PWFlrZFp2UzI0S0lFcG56dDFvb2xXMzhhNS9y?=
 =?utf-8?B?Qzl5VEpjZHJTYWszVVc4clB1cGY0ei91OXBJVHlXVDdZd2c5VWkxdncxL01E?=
 =?utf-8?B?L1ZiWi9iSHFNVkRVZ0lka0pUNitaV3FYM1Q0bERRRTgzUlIrU3NFL0F1UUdm?=
 =?utf-8?B?ZHpYbmMvcmxNb1BTd05lV01vNWRUYWo2V0NMUVZuTE1Pa05ZV093Nm9IempM?=
 =?utf-8?B?cDRGWENzdEVHa0N5eUM0ZWlhbEhvdlZ4NCtuMkVVMjdiamU4aUlLdC92NjFp?=
 =?utf-8?B?MFNncEVNR2RZQUpGNXduSVBoQjh5VnR2SSs4dC9YZW9wY2NTeTdTMFFuWGE2?=
 =?utf-8?B?b2w4ek5vWVdWRzZRZ3E3bFN1SEFycXYrcUFlc000MDkwYUE1RVl1NHZoZktu?=
 =?utf-8?Q?RLxmy56RrZyzvxdnByLBwrPLOIsQJOoi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3c1aStkREp4cTdLNm5PdldtZUZmWHQ0eCttbHgvbmMvdGtLQ1hXdTFxTzVS?=
 =?utf-8?B?TDJNcTJHWnE5elEyTVIrTms5T1puekFRY3lTWHZGKzBLKzltOG81WjV0OWY2?=
 =?utf-8?B?eHVKZ0xYMk1EanpEM2kvN05BeEgwSG5nWTNNWVZYdWhtaE15c1VPaElrRmxi?=
 =?utf-8?B?TkQ3eGFEUnRqRUY2ZFp5eUpHWndsN0JZcytqVjI3QVJUeDV0eG9WNUtoK3BP?=
 =?utf-8?B?bXNuUFRwd0VyQVFQRkVRcy9RODBtcVF1MHRwOWRRRjdYYTBLMGcyWDJzS2c2?=
 =?utf-8?B?ZEFpYkhBdHZoZ3NSdUxSc0tRS25USTUzYTZSeGJxR3N2NXJEdDVqaW5XMTJk?=
 =?utf-8?B?Q3JWZmE4blRFUTgrczhFVTFmQVJqbnZqMTk4MzFvaFVmdlVyb3dLdVorcWJl?=
 =?utf-8?B?YWJwbXJ0bFE2MFM4WWFqampTL1FxV0NPdXFyeDN0c0YwMWpRYm5FV05JVllm?=
 =?utf-8?B?M0hBaTVRZlhBWnVKOFRIWU1QdDZZQ01tVXZaaUsyWVdGMW1WMXFVWmovYTZo?=
 =?utf-8?B?dUNYMWlpU01xTkxacmtSYWpiUXU0MTFYcFM2V2FEa01sd29sRkcwVThXYUI0?=
 =?utf-8?B?OEtiNGZpcnZFNlFQK3FvdUJlQ1pjdWViVGxFbEttQUVRUWtJVCtycEZCaE1t?=
 =?utf-8?B?bjA3MUpoL2ZkbmM5MmNmdDBjT2VmY2ZtZTFCSGFPTithOU93ZEpveHpBY295?=
 =?utf-8?B?M1lraXNLWDBMbjFMcW5MakJPVEdCME15cVhJdEJ5RmVZaWVzWFhYQmlnZmhr?=
 =?utf-8?B?bHo4WHBKSmRGdXIrSWRvR1hESklkd3pCbUVnZkxaZHVGRkpiL2ZYMTFaeVQ1?=
 =?utf-8?B?V2ZUWVNURGNKbFBjcVRjdDZiKytmTDV6bnlwSXk3NVB4Vzd0YWdnRFJRSmFN?=
 =?utf-8?B?WVh3OGVkN1hVVFJzUUlhWG1XaExHVUgzdUUwa1dHSlZiYUNxQlozNng4NVM3?=
 =?utf-8?B?a1N4d0xnZnBqb1U5VXZYamJaMzBDQXRmRjlDdWc0cHRPK2ZqME11eW9CYUZM?=
 =?utf-8?B?VHVoc3VlKzhlRjRQWTZvWkkycElPeGNRSGZETi8vUHhLOHE4bW52eDdXSjZs?=
 =?utf-8?B?VGsyT1FLV0pXeFVsdTNUbEdreEs1TkF6d3NtZ3BZclp4cGlZSnRjTFVJbGlX?=
 =?utf-8?B?Q3dJbXA5Y2VvWDlCN000MjRrR1lJOUdBTHoyQmViQ01QYTdQUDd2TUVXTUpF?=
 =?utf-8?B?Uis2WHdDK0E1NUhtTDk3dTNkT1VRakMzeHorMVZRY2FjeVhtTHZZM3ArNTJG?=
 =?utf-8?B?Tko3RWtOZGlqNisvcFYwdVRjL1IrQjdSdmloVnB6NFB1RXRzU0dMSFFaeXQr?=
 =?utf-8?B?TTJVRE1RczZUZzdndkc3c3dTZHBPNmVIZHloT3JnbTk1R0ZzR0VibWVxQkhR?=
 =?utf-8?B?a3hMVlQrczd3cVMrRGdOYVVGTzB2VEMxSFR2WTExUTFrOTZwVCtGWnlKMThT?=
 =?utf-8?B?TVBPd2tsQUZ3MnAxV1hNQnZHd3V2RkQ3RWtyaEtyVjFucW1jc2lnbUo2Nlpi?=
 =?utf-8?B?Z1pkRmV6NGw2eUIyakFWd1JmMUxZbkxWMXMwbkJYNnlVMi91Mkx1UHBDaW9D?=
 =?utf-8?B?U1k5eVNuRmFWRGpwNE1ZdHhMM3hVallGN3ZTU2drcWZjSVErZWJoVzFyRnpo?=
 =?utf-8?B?bzdOLy9MbTBiZks1UE5WRG1aZGFjVEFQdWp4OWpCeWtEcWNTVjNiZi94N1d1?=
 =?utf-8?B?QTVFbVd0SklHTzF4TENaeFZLeVNYKzFoVndSWWxWNmhjVURMR0dmZWRXaTF0?=
 =?utf-8?B?TFc4MVpuTTRXVUloKzJJQUYzeDV5aUlmcFhFSjNoWUZwLzI3aGt3WXErSnNj?=
 =?utf-8?B?ZE54N29rU21hRmFRN2pYRWJXL0NlOVdySDRwREtMUG1tcGFDYnBWRy85T0FZ?=
 =?utf-8?B?UVdndDNsMGk2c2M4bmdjczBjYzVqc0tkcWdTcWNsUUVWT0xPbHNjRUJzc1Vp?=
 =?utf-8?B?dUlkbk55L040d2RlMDRoNlUycHVUUk5TdmFWUWp1cGRXU1IxT2pya3hCdG8z?=
 =?utf-8?B?WFU2VGVXWkg1ckNsblVxV3BKTHlUOXRHeVdnWkZzQndyWXFaendrekdiQmtJ?=
 =?utf-8?B?M0xkL3RPTXd0SC9oVTV1WjZ5V2lUODZ0eDVYNkZldGlHZ1ZySnBKMXVHTFoz?=
 =?utf-8?B?dDk0OFdsRTNXZFZ1OE12MUpDbVRnRU5Fa1R6L1U3UnV2NDJwMmNIRFZCaTVV?=
 =?utf-8?Q?u27E0FDLNt4O1btCG7fDh9MNLheGFfs/eVhGjJMT1VMA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a210f19e-b93d-419d-7e01-08de36ce2a67
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 02:53:43.9425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiLOJcUKRkl/QZPAlXB4CcLgWrl3YJTHfZ+nSNjv44qAVmvg+q/TpMPcLMynT7BYDln1oq8GIcbi+6SpxUzNdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6309
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat Dec 6, 2025 at 5:22 AM JST, Timur Tabi wrote:
> On Fri, 2025-12-05 at 09:35 +0900, Alexandre Courbot wrote:
>>=20
>> With one caveat: `new` now returns a 4K object on the stack, which we
>> definitely want to avoid. So maybe we can have a wrapper for things we
>> want to align the 4K:
>>=20
>> =C2=A0 #[repr(C)]
>> =C2=A0 pub(crate) struct GspPageAligned<T> {
>> =C2=A0=C2=A0=C2=A0 pub(crate) inner: T,
>> =C2=A0=C2=A0=C2=A0 padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<T>=
()],
>> =C2=A0 }
>>=20
>> We would then allocate the CoherentAllocation using a
>> `GspPageAligned<GspArgumentsCached>`, and initialize its useful data
>> with:
>>=20
>> =C2=A0 dma_write!(rmargs[0].inner =3D fw::GspArgumentsCached::new(&cmdq)=
)?;
>
> I'm confused.  Aren't we already avoiding the stack?  This is the code to=
day:
>
>         let rmargs =3D CoherentAllocation::<GspArgumentsCached>::alloc_co=
herent(
>             dev,
>             1,
>             GFP_KERNEL | __GFP_ZERO,
>         )?;
>         dma_write!(rmargs[0] =3D fw::GspArgumentsCached::new(&cmdq))?;
>
> The only difference with what's there today vs what you suggest is the ".=
inner", and I think I can
> avoid even that if I make GspPageAligned a tuple instead of a named struc=
t.

`fw::GspArgumentsCached::new(&cmdq)` does return the value on the stack
before it is stored in the coherent allocation by `dma_write`.

>
>>=20
>> > I had to remove the #[repr(transparent)].=C2=A0 Is that
>> > okay?=C2=A0 The code compiles and seems to work.
>>=20
>> As long as the struct is `repr(C)`, the layout will be what we expect.
>> Actually this made me realize that `repr(C)` is technically what we want=
 for our
>> bindings abstractions, not `repr(transparent)` - both happen to have the
>> same effect since the wrapper struct is `repr(C)` anyway, but the latter
>> is more restrictive than we need.
>>=20
>> Glad we found an elegant way to address this!
>
> Actually, I think a more elegant solution would be a new variant of
> CoherentAllocation::alloc_coherent() that takes a size to allocate instea=
d of using size_of::<T>. =20
>
> In fact, I wonder if it makes sense to always grow the size of the alloca=
tion to the nearest page,
> since dma_alloc_attrs() always allocates whole pages anyway.  Perhaps Coh=
erentAllocation<T> needs an
> allocated() method in addition to a size() method.  size() returns count*=
sizeof as today, and
> allocated() returns that value rounded up to the nearest PAGE_SIZE.

Technically coherent allocations are always page-aligned, but that's an
implementation detail. Callers should explicitly align if they have that
requirement.
