Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED63C71B36
	for <lists+nouveau@lfdr.de>; Thu, 20 Nov 2025 02:42:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92B610E6C2;
	Thu, 20 Nov 2025 01:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g1FqAlHA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012046.outbound.protection.outlook.com [40.107.209.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224E310E6C2;
 Thu, 20 Nov 2025 01:42:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7sK9AJArVIQ+kzFgHzU5o/yp6zJNl5DZg1+sm7Vz06p4zxrmA1BU/McaCyxgrAdr3sCvxTJohQDq3zEIy0E20K0L4DEOF4yZSBxH6pQzEAyxtIolZmAGDnUDvzHdUDv7iM27C3CxqGjtR/MJji2tu4DOw/G4AuPaSB4rc6/i8CZh+7MbrWPM5LAWK40Mn6ZKu+8yq8Acu3AIAmqFwEkBtuEP5yMzhaSwV5jWk0yFKJvjY+657vlr0//PNT9IKCiwHvHIRaaxpgcSVKdpz7B1btkdUf3f6D0ynXkuGCW0wM/EZfg7FN+MjG0xWYboeaHHBMG2Ha9NQuYdoCyw0/VpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZKUhqGUA68v8KCf3H4O6w+OwGuvoWixBIOSbplHmI8=;
 b=ogg3vOXFKzQ5JGjCqmvzJ3CYu0dXiS1trnFyt5FRCUvW+BfuuPZIyS2Rgqin4XhBOmlurBzX+iJtgylYgxjnXv7wKvdJv/ZEakp+Kc0l9yqIEBTiyYIiLdH2d0GKzFeZRRIdByKLuXFcxrIWvRNHKYavQcDKkln3wqY9Io51J9EZevyu/aVmtUBJTrmASdjX8J2BA6s50eqyQoRpkT9XRJ+zCBHh4/UuRsShxn0xitdVXG87UAHSeNZfKn1XHCJX8EMs2OR1KCnexJA1itHxVVFQl8iKUtjgTufeVi3qHODaExhAIm2EcD3PucBverfx/DtHu7UJGnyxZpG/TL1L7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZKUhqGUA68v8KCf3H4O6w+OwGuvoWixBIOSbplHmI8=;
 b=g1FqAlHArJ0ymNza8/uWDAmCRIJg3VWVE3jWkKymYUMwJSil6CXEb8s+JizNiTAKgaY3WWkJFCymYVWmNpZJmIIiVw4hJN9aprjn6LAOn2BkCBoXw4JvX3tW14d/A6WgxcMB34Sfx/5hucRCxV4t+80cf/3WfTM5v340NYuShxDrGthjiUwCOr+LC99BYkGGd14Wz8UR2QF4sPDl41jZMoU5yf6F4wacCoiQxqiNVj8R6HjWTLwxBE/gVehWbhin1ZMBNUqxxtUI2/3gPGH0OnCksBk8t6pP4Vm9/gqy63il+cKq74Je5cHVeMeoCn7TaC8yGuJUgKqSgHvezT29VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV0PR12MB999092.namprd12.prod.outlook.com (2603:10b6:408:32e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 01:41:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 01:41:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 20 Nov 2025 10:41:53 +0900
Message-Id: <DED521JSSTQZ.U6RVM1Z3SGRR@nvidia.com>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
 <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
 <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
 <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
 <DECHIL6CZUVR.KJPD43LSJFDE@nvidia.com>
 <6634609d-0377-48b2-b8b4-3a7861258305@nvidia.com>
 <a2bc001ac8b44fba3dc4773169e7cc26cde7a573.camel@nvidia.com>
In-Reply-To: <a2bc001ac8b44fba3dc4773169e7cc26cde7a573.camel@nvidia.com>
X-ClientProxiedBy: TY4P286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV0PR12MB999092:EE_
X-MS-Office365-Filtering-Correlation-Id: cc847a70-bcb6-45c2-50cd-08de27d5fd78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUJxdjc3QVBCNk1OZ2RDVDRyMzA0MWVDV1hCKythb2tsK1lwajF3K3luYmVN?=
 =?utf-8?B?MytORllVZXVsNlRhQWR4cjN5aVhSdzVsL2VEL0NSbnZ2QmFLMEJyeXhlZ0Nx?=
 =?utf-8?B?R0p0Z0YvVlR4YlVZSUl3dENqenpBdTVYdDF1UXY2UzRPajczSzI0VWt0cGU3?=
 =?utf-8?B?eWdKa2tkVVRPb1E2WnhON2RVTUFvOE9yeS9oZVJwa09Jc3lTMElSYjQ3UTNG?=
 =?utf-8?B?SWtadml2RUdkMUFVTG9PaEJuYWVJaG1hd2NVT1hweGVNR3luWmNnVS93OW1I?=
 =?utf-8?B?enhUSDNFYWlJRzUvMEFJUHN1MzZVNDVWWEFvczFabnJIV3ora2pJMlM3c3ht?=
 =?utf-8?B?S204dHJVNUJPM0NhZWUrb3gyUFVPaytHdnVqOXdaZG9wNE1qZy9ycTRzOWdY?=
 =?utf-8?B?MmtWcldjL3Vyak03UzV0Mlp0alJmY1duUThGOG9FRW5YYmxxSWEwbTJNMVlo?=
 =?utf-8?B?OGExaFVQc3Y1V2lNcU0rdlFiQi8wZ2xJSlZNV1RrMUNnZGNGYTM5V3ZVZ21B?=
 =?utf-8?B?WnhCTHhPdFVmbUlEVHJBL04yYUgzZVVPSi9MN2xzNzVBWjV1dzFEcThha0dE?=
 =?utf-8?B?eE9RMGpmZ1NhUXBqTE51T2JDR1A2T1dScjNFbnE5eklVVUpJMVBkc1FyQlAy?=
 =?utf-8?B?cVE3OHU5Rks0aU1STndNdndrYmRpNHNuZjJPZ3FXQmhsZS9UWmo4bnYzMUNT?=
 =?utf-8?B?ZTFqR2Vhckk1a0RWQUUxVnNaSlV6bjJnaGRxamJzMjIxYW9qd2JHcjEvRzM3?=
 =?utf-8?B?cVhLQjR6elFlWmtrVmh1andyUUpoN2VnVkQ4L3BCbzZIa2RyY3BOQzNKWXAz?=
 =?utf-8?B?V3hLSG5oRXBlSFdVOVArVGd3WkVxd2lMZzh0c0RUU3RBaTJ2cERPZ094Mk9H?=
 =?utf-8?B?dHpkTEIxdm9XVHVWTk1pcmplVEdJYS9zTitnMzZZS3FyYWtIZE5QT21hdFc0?=
 =?utf-8?B?cEdlUEtwck1SSEhKNGdCNW5iVk1acGhTbjJseTI5MnBjckV1cGlCTjZxU1lh?=
 =?utf-8?B?TFZ5b0tYR0twczdNTDIxZzF3U0xvTlYwWkxUeEg1amVTandMaUJ3VE1SVXR5?=
 =?utf-8?B?bnVyRy80aDNSRk1RNUtOQ3FvRFlqT2srOVU0RkhyanpSWFhSVFlCTnA4ais4?=
 =?utf-8?B?TlNFeWZUL2g5R2paTDdSNGJOdWRmekRWZjZnSFR4bm0rUi8zVFlPcUJzUmUx?=
 =?utf-8?B?V1pFd1pXTTIyV1hPeEJpTTBSai9qcWlCTUN2NS9xcXJYSS9aN2NzYXkwdDhx?=
 =?utf-8?B?S2FjRXE4RHdhYXRzR3NhTHVRNGpNYWJPQUlJWHRkSC9DS2dOZnhzNTg3WFR1?=
 =?utf-8?B?N3RZQ1pTQlkzMiticHdVdjNhUC9Da2QzM1F3ckcraXpGRlpiSjZ3UlFPM3hD?=
 =?utf-8?B?eUFaRFF2VXhsVTNUVFAyMDRRejFQYzhtL1kxUnVuenBhV0hyNDczVFhOUEwy?=
 =?utf-8?B?U0JNcFlheGM4T0lYZ2U4RHcrMXRKSG1wZzkwcmdRMVM4N3dsM1B1VmUya2pz?=
 =?utf-8?B?TDlKUkF1N3ZNbEV5VHhLVjJoSG02NXk0WDZjVE9zZVVYRDJkYVhacG1EajdN?=
 =?utf-8?B?M1FtOGRzLzlFOHBMb2lpWFBFQzV5VVc4Q3ozZVdicS8xZmt1SjQyQ0dYNDdx?=
 =?utf-8?B?WVd5RVJ4SmpnOW1qUVNOVmxpNldodDg2WmdnQlNjTFREWWZEa25TUG1ocmto?=
 =?utf-8?B?ZklIUEJoR2lBVG9sVDBtZnphdE53UjhYVWRiQW9DWGpNMmdjRk9UWGNVWkFa?=
 =?utf-8?B?eDBkaGwrRFhIVndoYVZ0OWhTaTVGUkxkRC95UDlqSXFrN05tbitxNS82ZUpX?=
 =?utf-8?B?VlNuYUFaSnhUSnQ0TzdIa0VwQzNUdkVvUGxNRHVuT3p3Y0s3S1FEKzZha0Qz?=
 =?utf-8?B?UXozTWVmS0FydlRYN1hsaUpDeDMrbnRMOEZxWXlMaFFXS2o3RE9ybzkwVm5O?=
 =?utf-8?Q?xNd+B6iHuMhWpKuvp9LzUGwr9WEAwTh+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmFpem5hWW9CVnpXL3FIRVp1WnQ2a0duV3ZoMmtsWDdxVUthRnZWbExDS0Zu?=
 =?utf-8?B?c2RHK1BiNTN0S0FWQy9aM3o2N2lHMkR6YWhwZ3c2T3lnbkVpZXFaYUhKUjZK?=
 =?utf-8?B?THV3KzNyaUNWVVVqUFErdk1IaUJSQXFkR2srdXpJYldNZTBRYzBuZHFmLzNC?=
 =?utf-8?B?aFlTQVhtdkcxR2J1S0Z5dUlyMnRMNUFraGpvVkkrejdlWmUyNmFNbmxMYlRO?=
 =?utf-8?B?SlZXVk1Sc2hxWTFkQ2hoRXN6bkJYeG1MOTkzZ2Z6TUFZcFhoTjFCR1k1N05n?=
 =?utf-8?B?b3liQjNKbFRUZ0l4ajZGV3pYb0s0TmVCM1poN2JiNDRYcE4wNVhuNFIyaFpX?=
 =?utf-8?B?VVVPUzhuQkozTDZ1MEJpUlg2Qko0OXNoOGZ6NGpoM0IxWGFCOFkydkZ4R0d2?=
 =?utf-8?B?TXNYdkNGelBMUlVnQ1Y4czBWNWZSMHNkSUV0c2JtaE9jWUF0VEswRExZUk93?=
 =?utf-8?B?TTRPZUxHYVZ1ZzJSZk1HNVFhRVhvTzY0L0FxUC9jTWdEVW1kSklZb1h0cFZ1?=
 =?utf-8?B?ZjZ3UFpXRHVyV2x4SEpRSUg4WGJiZklIMnFLR0FERk5YL3pyblhDNFo4dU1S?=
 =?utf-8?B?QkhmR3ZNVENhejJtU1J2UEV5TXA4VTh4SWRqaGl0U1Q2b1BMMDhqREJUTVhP?=
 =?utf-8?B?czk5L0pVN05PeDZGN0U4Y1VPMEc4OEFOWlFtaWRaTnNHaG45Qm5NSkVBK3RU?=
 =?utf-8?B?ODFoT1Q3dEEvWXMvU3lWcFlkYkV1OWg3ajRUalpvcFNkRTEwLzd3TlFxRVRm?=
 =?utf-8?B?UnFMVzQ5ZXdsS2NVLzFzenNOWWlmWXpxREFobnpEbHgrQ2tUWmRFZVBoZEJo?=
 =?utf-8?B?YnhndHhNbFVwc0FxbTduejlMSE1lT2d6aEZTMzJmVUpKQS9RNThCRi9nYm1l?=
 =?utf-8?B?WDhsZXMzNlMxL1R2RlNIOEdIYmF3dnl5MjlpT3VXaTd0a0FFazFYMmhuamhI?=
 =?utf-8?B?K2paZFpBczZmTEJZNkNGek5EWjNlQWsrU1kza01EaW5JUHEvcDFJNVFXYzNQ?=
 =?utf-8?B?enMrWkQzbXVJbEREK0JGMytIaEQ2UW13ZElDR2hRQ2UzM3NjOFU2aUxsNTEv?=
 =?utf-8?B?aTA0YnNHRzV6UDFTcUs2ZVowK3dpcmhSN3ZZZDdTYytBd3ZiYnRJM281TTRY?=
 =?utf-8?B?b3pKVDh6Z0NyVHNDRTdMYlhySDJiUmwxYVVhQjlpNEdkS0RIbHVTTG1YWEVn?=
 =?utf-8?B?OVNQelRJWVhsRFdFc0pDVWRlOGlhVk05bGoza2VWWUtGQkdLK1hUaVBpMEk4?=
 =?utf-8?B?QUI0MWdDOXh5cnZPNDRIZHNEQWliYVJyZ3phMEFZNTVlbkY4RmRGSG40WW9u?=
 =?utf-8?B?dTdFT2p5d1c3eFBiZHFseGFjemFOTTZYR09CVkM1a3RKY3BTZk1SOVRNaDY0?=
 =?utf-8?B?UWROcXEzUlJiK2w2ZDRYZUw0LzExUXFKQjlUaFZVYmFaalpFMUptY0JVcVJI?=
 =?utf-8?B?Vms2MEdoUUVlUGNMZHcrMWdtbUk3cjQvaFBWMGxBWThQODZDamdvVXJseTAr?=
 =?utf-8?B?VitnU21QUDZuM215bnhRMmxhVVB3THFsUTVLaVY2SGV0T2NJaTJwem4xTjdk?=
 =?utf-8?B?b1drTmJLTVl5Wld3RnhpbUFLblBpNDNWYWphcFg4aUYrY2ZlUWpqZ00xaDdY?=
 =?utf-8?B?Zm9hWjZUNllndlVlZGlTZ0crd3QvT3lLZUtwRWF0WGJSbEZKa3JmN255TUkw?=
 =?utf-8?B?RjIxY0Jmcm0wMTBBdHFmYTNUT29JYzZFRFZ3QVJNUmtPcHVJeVd4a3RhQnp1?=
 =?utf-8?B?WGErTlFNbFVjR0VSUVpzZmpwdHVESHRaUW5oODM3MnRTSC91WHZ0K3JJbGJv?=
 =?utf-8?B?QS9jME9EQmpzUncrTy9laDNWTWUvSjgraDdTaWlUbDRuR25UV0xlNUZXUW1V?=
 =?utf-8?B?ZXMzQmdEVVdLaWtWVVp0cmxkeTREdnpHU3V4OFhQaFR6WWhPRUd4Qzl3QzZR?=
 =?utf-8?B?MlJwTkZ3R3UwUnZYalc0Um9VVDAwbXdGNTR0czNUajMzd2VyZEt4NzhKMFl1?=
 =?utf-8?B?ZytRa2ZLb3RtUW1wRTVHR1FwaWZJRHlMRy9jSC9KbGE5MU0zOWlENUlaZ1NV?=
 =?utf-8?B?Z1k3TFBnQzVZMlBwOVNabXdBUEZHYTZxOS9wZkViNk1BMXdTTG9VNWJzaFc4?=
 =?utf-8?B?eDU3eTBkQUQ3TmU0aldaWmdSSUFNZXdDM3ZtNHBuS0ZZeDRqN1hQZnVzNVNY?=
 =?utf-8?Q?wfEhJ5lz1cvtrjUmjztQZ3XzwYzEBEZR5Ft+/S/lpOJK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc847a70-bcb6-45c2-50cd-08de27d5fd78
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 01:41:56.9670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+JtTKdUdCsfuWfIqAItpv+c/Y+TBV+1rxtVQ3W7BXnXDPQGUAbwSvQbI0AKIB6eEzM+XG3Ibhx97MpiK/z6OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB999092
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

On Thu Nov 20, 2025 at 4:10 AM JST, Timur Tabi wrote:
> On Tue, 2025-11-18 at 23:24 -0800, John Hubbard wrote:
>> > I interpreted the title as "these registers exist on Turing only", but
>> > it is indeed subject to interpretation. In any case it is a
>> > non-important nit, so feel free to ignore if it parses fine.
>>=20
>> Oh, I think I missed your point entirely. I think it's likely that
>> these registers really only apply to Turing, actually, because
>> we know that subsequent chips don't use them. (See: recent boot
>> success on Ampere/Ada, without these registers.)
>>=20
>> Timur can clarify that.
>
> Well, some of them exist only in Turing, and some of them are used only t=
o boot on Turing.
>
> Last I checked, there's no HAL way to specify registers that exist only o=
n some architectures.  Is
> that still the case?  I've added a comments for some registers to indicat=
e that.

There is no way currently to limit register visibility to a given
architecture (except maybe putting them in a sub-module as we did for
`NV_FUSE_STATUS_OPT_DISPLAY`).

Having comments where relevant is adequate imho if there is no name
conflicts between two architectures.
