Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C36C6D0A1
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402A910E58A;
	Wed, 19 Nov 2025 07:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i8MrUc9i";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011009.outbound.protection.outlook.com [52.101.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2660A10E58A;
 Wed, 19 Nov 2025 07:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUBkxLc5YMMpK3f3P6ldpMdWGLjLsAcjDN+YllqiMc/0ZcPqqKCKpAp+8QmPusKPmLnbjrFghqZhkv0boRQJMwoNmyLlfCINobpGVAEpBbf24VWAC/DyUfS7f9SavxgX+3KQTuutLGshgM9PhIUVl0IAwQudwDVvBLZnV6V0oEYdNM5vO2CFVLBLHZ99Fp5AvAIPUsYAIj7X1yJZNmhD7LhVPt9Iri059tyb/k1Sn51fh6gk7krTSgdpRH4l+imqTMMiwgImEBFxwKW/rx1dH0Gt0tXroAICG8bgKaw4wnyMGxcuA9JbblWNJbxdN0SonbMZlQ8BRx4ksJEZlFa2xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DuzlGLk4D9lqskg1YDVWVCE88GC45hGNKCCNaDHRLM=;
 b=OKrtSGwq1HQv3li+PzjFAdJefZPUc/aJPPbstAxFFy+zgZrFGvLJtFdKMXSsmZ6S5FDUWo6HKN2xN1vsSS9Sp4mmsijti2wZvCiJDf1QmzuKC4tNJb3UKRmu86AZkYrnLAl97HEzTXiZnx853g26S8uWm+Lq0opuVeH9qRIP+4Q2yrXZbeziN0tdS7ETP4rLPW7Lk1qkGHnFxyDUORJhY3pUHUmwP/dnAQZlCvgKzoaGjitynEW4dC5Xq+roXfBXQV3Gl7+rJr2QDER4JGkfNvdVYKBI8PSnqVBK3gzRU5QbXMk82S5kJJHam6ryuBDOcA7DyznqX5Hxo0CxTP04jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DuzlGLk4D9lqskg1YDVWVCE88GC45hGNKCCNaDHRLM=;
 b=i8MrUc9iZsTPooVroMRNBn+PE8YPTxcsOmL0dzzejJK22x8d0BlkNcppW1xnU6z3OAFzIV8lKcNyqucUGzCJ2faERY4f9Uqb5G5xdmj/EtfCgtwP3kLXkUnb9QI6Dgv7xxbeulFf64RJ8rMFHiDTrNNVtKbEYmNd5h1mskNTKaSU4OpG+3fW1e/gYCn6crLGft2N7DVN7nW7ZNNkMF1TUXam4sR8H2W8HlF4HdvZquhnzfiXYiIZ74ElGxb8C7VleAnFGxfH5JtLgtO/199C581irCn+0FXSspeA8za41cXBNusSL20RFCzxvU2+/eO1nvQadozqgDpDbfK0suniig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8db) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 07:11:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:11:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 16:11:56 +0900
Message-Id: <DECHG7EBKJM1.104GLFJIRJ0MR@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Lyude Paul"
 <lyude@redhat.com>, "John Hubbard" <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100
 fwsignature
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-5-ttabi@nvidia.com>
 <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
In-Reply-To: <DECC2NFSLDLN.236BCLPYHUVNI@nvidia.com>
X-ClientProxiedBy: TYCP286CA0265.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a977fe9-d652-405c-9dfb-08de273aee49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGNEUFdzM1dsdW4wdUZMb0NkVnE2aHNuSkFKWE5pTG84bUNDWjdvQkJqelR2?=
 =?utf-8?B?VXlGSmxrckFra0UvZ0Rzd1JNQm5yRkdWajA1YjVTdzBwRUsxV0ZPQVJVbks0?=
 =?utf-8?B?NmhLY0lSWmR0bER0U2hQZFVxa0lmcUZSenpmQ0ZMbks3cVd3NjJmSytQS1JQ?=
 =?utf-8?B?ZHZkQzUwWjB0bjdGOFg4Z3hVOGVMeDlxM0liL1RlMFdjR0gyaEtVL3NVSlZ0?=
 =?utf-8?B?dFNpYXphYnQ0V2JpdFhWQ0F5QXY0SDMvWEErVVdpYW1yd1R5dndVcXJVRHdi?=
 =?utf-8?B?bEJkd3V1ZHJVMDJqV0FLaXhWNjlFS3dRV2ZCV2hZM0ptQXhPV0dDcTYvV0d6?=
 =?utf-8?B?bkZLVGc4UWJ5WjBwNXlJQXpvZFZkUElyVURVZjRHMzhWZTN2Z29PSGFDSzRV?=
 =?utf-8?B?RDk3dGN4OTdETVVRYlFqb0UxNExqRDl2c3VndHFQeUMwbm9rQjZISVh6d3p1?=
 =?utf-8?B?YWhYK2pUY1cxTHd6QVdpNEhFNkM2VVpkYTNvd3VZNC9rQWszWS9jVEl3TUZw?=
 =?utf-8?B?Y09EQnh4YWk1ZmRpRzhFWlZaL1hzV3owYjUwbkcxc0xSWUUxTTZJK3NPNmtP?=
 =?utf-8?B?U2hmaEx4dnRSTGJzRGpWYUV5NlcrOE1uVEZoZkxTR3BReTd3VHpnTlpqeDEy?=
 =?utf-8?B?K04ydWpCbnNmamloYWNKdGxJeWUrVjYrWnVKSCtpbXJXeFdkNWRzenEyZjQ1?=
 =?utf-8?B?bENaUDh3cFZ2emdzajFZSTNyZHNXTjdXZTRXdVhacWVPckRUeDkvdlYwemZC?=
 =?utf-8?B?VkM2RmdKaGozdWFlbkEzTU5lR3k0M1BMQWE1TEEzaUtZMXU0cXUxR08yTXc5?=
 =?utf-8?B?bXkrcko0b0NvU28xNmFEc2cxN0FhVUozNWx2Vlc2UTVPTWs4V3E5U3pFYVAy?=
 =?utf-8?B?Y1FkTXdxRXFnbXpKelIzRUNmWjhPZ1hYR1JJZmhaTEZQektyNEFoelh1a0t2?=
 =?utf-8?B?bnpWeGh1bVMxNWZGRW9nNnRZM0lQRm84RUVuVnFQbmliVXJLdzZwUFZXZWtM?=
 =?utf-8?B?NXBWUHc3d2gyd3c0VzlHZmJXQjJxMkh0elhGQURkSkV6bVBBVjFNWHJObWFw?=
 =?utf-8?B?NU5NbzB2djMvOXJIM0h0OXRpSjBYYXlhUkEyeVFNaGZ2ZmFlTEE5bDNYYlY1?=
 =?utf-8?B?YlVrY1ArdmFDZVNYN21wVGdJeXM0TjJGTlZwMUtZeHl6ak8yQmxod3FwWU5l?=
 =?utf-8?B?R3g1Wk5NU2laRHR3YkM5RHJrSE1DRHQxNENiSHliaUw1bUwzdERPaEZuRXNN?=
 =?utf-8?B?NlppV2NIcW9xRktiS2xDN1FvMU1rWEFWZXdqRTljcTZxcUJsZjFMa0JvSXF0?=
 =?utf-8?B?RURaeVpiK0M4NGdZSkNSTTNPNHhWc3FmRmdyMVNybVVRR0t0citBYU5OZUVn?=
 =?utf-8?B?aE9sMmptMDFEZTJxb2dBTkJrWTBMNm1SSGxVelpIZXkvNTFENU5yREh0U3lG?=
 =?utf-8?B?S2tVRkNjaUh4ekFKeFJsdi9Kd3YzcHFzR3NubkhEU3JnVllrQURmdVpnL2NO?=
 =?utf-8?B?VnY3aW5nQWRTVWFBbmIzYTF4bHFOZ3VtTXh5c05NcEovQk9qRjYwV3FJTTFD?=
 =?utf-8?B?NWsybkxCQmlGZ29Gb1c1cVNUUGM5LytYME94NC9KRVhKTSs0TjlKRGowMzJh?=
 =?utf-8?B?cnhHT3RDMGpaMXF4bFFnVjY4am9JSWd5TXJyVXNBYkpqQkVUZDVTd0t2L0h4?=
 =?utf-8?B?MlJ4UTNTN21idDdtUlhZaDR3RlplRVZGK0x0WjJnZE5UcHczdEZwblZ6U1ln?=
 =?utf-8?B?VVFzWTBvazhvdjlISDJBQ0hFY1BwL1B0NHhBaUtCOHNKNlorZHdNa0lZbDlT?=
 =?utf-8?B?ZE1vZGR0eGtCaHc0VkJLMnpCdW5ncUtzajZGbDhpdWpvQTk2clRta1hsbkRk?=
 =?utf-8?B?UDJMemRLZi9icFF2QXZpR0VHNjdEYU5hYWxZcnFyN2pKRm04ak0zQVM5YkEy?=
 =?utf-8?Q?0A2VALjzA/+/9cDOhSKWqMSnCkzxatii?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nlg5RERIeDBMOVZEVlNDUFdCNHRpdnpzd05jNDN5TTZaalZLbm5kMkU2VWFh?=
 =?utf-8?B?d3hsL3M1d1c5dG1ERFE5WEwwMDRULytPRVpWUGhDd0U5WU1LbkRxUVBlR0JC?=
 =?utf-8?B?eXNHa0FwYzhQMHBadC9aZ0JPTzdWOG9YM1R4Q0EzTDdNMUpkWFNYTTUxVVBo?=
 =?utf-8?B?WVdpTEtkMkFWR2JaMTZpQm00SnlCWk1MV3hRTXdXb2NOSXRuZUQxTENpUWZM?=
 =?utf-8?B?ZUlRMjJiUkVjWUFpZmVWamhNWVlOZ2FIZEdwUXByVWk3L1lWZnJldlIrNkdB?=
 =?utf-8?B?Qm5YZkNUbUE4MGZidy92eStieXl5YURkRm1Bei9qcjBXazBTNGk5MXFOaDB1?=
 =?utf-8?B?UjFiMGVVeW1jYkRkTWhFWVpLK1ZqRVBEd1dEZ1ZYWlhCbWM3UkJLMjc0RzhK?=
 =?utf-8?B?YXptZDZmblVzdWpDdmxTclFBRkF0ak1hKzJMaTlEMWhvSG1oU0pOS2VlNU0v?=
 =?utf-8?B?ekwrQzZJK01wWXBWR1Vha1E1b3dEV05lUVlMS0FhbTFjaHBRbURVRTlmTm5y?=
 =?utf-8?B?V1h5Ri9FRE9RaGhyTFlNU09IK05UdmVnMC9EbmxleUI1YUNqVTdnN3AzMkpE?=
 =?utf-8?B?OC9iME54OUNtWUdZTm9PR3dyR2VBS21rR3RBOW1tZjNoVVgwK0FqV3NNSVN1?=
 =?utf-8?B?SERRSm0yTjduMHIrQTBJaEswdnJBWnNDWXBHd2JxUXpjdXIxM1Z6VzNocUlQ?=
 =?utf-8?B?cGoySlRXZHd1RExQMnY2V1NRS2NEWE9uTTBmVkhUWnZYTlNiT1pPZEtxcXpw?=
 =?utf-8?B?Tmhrb2hvOUYyMVJacDZKY0hQd1RXUXVRb2U0amxBVmthSGd6YThBU2pwT0lx?=
 =?utf-8?B?ZFkzOHJOZUVSQXBqQ3RpNGNUZHBzNTJnOVhmQnRiK01TTUFrdFdzNTFyMGkx?=
 =?utf-8?B?SWNFUGZVMUNsWXlpeGM0L1E1VGFQV2c1QVdOTWJvZC9haDFybk5oN3VDWHNi?=
 =?utf-8?B?cUJXaDBYWURybGdmVG0vOVRIMkZtQ3hnaytUWU1NdVZoT1NtRUtyRWVqMWlr?=
 =?utf-8?B?TUlPM0MyTUViUVgrK0JFVCtWV0hNQU9qQmxpQmRhRVJ1eDFnWVpKa3QzV2pY?=
 =?utf-8?B?LzcwVUpEMUh2bEk3YnQwUHlTbGhLK3FJVXc3OHowd3lYRlRwSHJRQ210d21J?=
 =?utf-8?B?bmlIR08xZjVRQ0hLMXRaWHhrY29uSG95UU1mbU81R1VLQmVuUmJlMmRkaUVL?=
 =?utf-8?B?N0Q5cUZGci9EWWVHa0pqN0dKVDd1cXFIS0I2Sjl1UURwZkQ0NWhNUnJ4enRW?=
 =?utf-8?B?bUtIS1EzM01TdWNzdCtDZzg3THVIUk10MVBEbWhiODlDMncxRVFGM2lGTnhq?=
 =?utf-8?B?V3FTcGVlSis4OFFyYmROa0hSMVMvK01ubFY4MFMrdXVpRXFHVkVGR2MvZWx5?=
 =?utf-8?B?Wm1aMzVFZlJSeE92MnFoUXpjU096d0xPam9laGdrY1hkbmt6bU9DOU5hbzBB?=
 =?utf-8?B?NjJXYTBxMWlvbTBlZENvYmxrcmYvVzZ0bVBMUE1OL3NnOVBzRTkzc2pwOTRm?=
 =?utf-8?B?U3dKbnFvOXdPOTNwb21MM0M0TWV2cXY3V01HanBsK1NJTGh5MGhyb1hTck10?=
 =?utf-8?B?NEZlNmN2anA0NkNNcHluVU96K3pxaHNYdFQzcUxvc3NsTGVNQmdtU2lFdVVz?=
 =?utf-8?B?VlJ1V0NoekVSck90bXNEZ20xMXFVdXF4aElncy9QYi9nQlQrTWtGT0Zac3Z5?=
 =?utf-8?B?emlRWWl3TlFCSllzbUlYZkpsMWIyWHVhZ0daSlpqdmEwSWpoRUJpVEpVbC8r?=
 =?utf-8?B?QjB4QUZSSmxPbWRKSHNQL2ltejRVSm1Ga3dYbGhmbGVMbmlwRXgvZ2cyalk4?=
 =?utf-8?B?VkVXMVJyK1A2S3Z5WTd0WVRYcnVhNWVVVXlqR1lPdUdYWVRzdStqcytXeTlS?=
 =?utf-8?B?Z1JnY1VHSDlDZHRXUHB5NzgyRTEwMmtPdko2RjBXM1hCM0VjeTlHaWFIcy8y?=
 =?utf-8?B?bzdnbDE5T05XT2RGazFTc0FidXBCeGM2dHZHVXgrZWczWVdENnJmaGJJbUZ0?=
 =?utf-8?B?OVZWTlRBQWJuUDZZQXhNRnkzc1dVNHZtZUFSNkEwNmFSeFFnUmRWeWlVMEh6?=
 =?utf-8?B?L0QrSlkyU25NemFERlF0UkxwcU5TcW1lYVRCa0xyc1A3NmU0cXBWUWFxeDFQ?=
 =?utf-8?B?VVJzZHBFMkc3aFpwK0NUcUQ1VHZweHhPamdHL3cxbE91c29XMk5sVW45d3pW?=
 =?utf-8?Q?Q7BKvREafGgzwDFDjiG8bphB3TEL3QHdzN20QDDoLr5y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a977fe9-d652-405c-9dfb-08de273aee49
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:11:59.5381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G///kXJzCVbUv/dR+0jZ5q/E7zXOizJ0iSOknh+7EXdj7AdixMyb2Osz6wMaz5gr4aZ8sM4pd6MEAWECHj9FYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8
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

On Wed Nov 19, 2025 at 11:59 AM JST, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>> Turing and GA100 share the same GSP-RM firmware binary, and the
>> signature ELF section is labeled ".fwsignature_tu10x".
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-co=
re/firmware/gsp.rs
>> index 0549805282ab..aa5a6433c377 100644
>> --- a/drivers/gpu/nova-core/firmware/gsp.rs
>> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
>> @@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
>>          let fw_section =3D elf::elf64_section(fw.data(), ".fwimage").ok=
_or(EINVAL)?;
>> =20
>>          let sigs_section =3D match chipset.arch() {
>> -            Architecture::Ampere =3D> ".fwsignature_ga10x",
>> +            Architecture::Turing | Architecture::Ampere =3D>
>> +                if chipset > Chipset::GA100 {
>> +                    ".fwsignature_ga10x"
>> +                } else {
>> +                    // GA100 uses the same firmware as Turing
>> +                    ".fwsignature_tu10x"
>> +                },
>
> Following up the point I raised on patch 3, this could be another site
> where we use a potential `Chipset::has_bootloader_thing` or any more
> fittingly named method.

Ah right, that's unrelated. In this case can we just express the
exception as follows:

    let sigs_section =3D match chipset.arch() {
        Architecture::Turing =3D> ".fwsignature_tu10x",
        // GA100 uses the same firmware name as Turing
        Architecture::Ampere if chipset > Chipset::GA100 =3D> ".fwsignature=
_tu10x",
        Architecture::Ampere =3D> ".fwsignature_ga10x",
        Architecture::Ada =3D> ".fwsignature_ad10x",
    };

It treats GA100 as an exception instead of complicating the match for
both Turing and Ampere.
