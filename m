Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99358C9D91D
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 03:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ECBE10E084;
	Wed,  3 Dec 2025 02:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AnSN0MVs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE49010E084
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 02:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDUylBHqD8k5Q5T9w0Fl9k+lamS+DRJYRCtUuQ6R9hl4N+XbkvUcfM0KMbjW3fW2DJm5jdF+hpA+PrjMXodrfa4ZbqpZMCghX/LmcN9jnLFHevGFsRaoAiS43h6NmiEXxrc0eOQuzH8V3S/97lGI/WI0u855DvASTC3FYzKofMzHSILCVScU5NWJN4YysmH3dFD1UGfR4AtT2E0UYFUlvczGYV6Jg9Rs7YuDLXDJz+J6dCcD45ICSTUuo3vx/iV5VdPEsfY9WK3OI09x7Zfr0tqDaIY8T0vSHrDOUskeZvpd6U6lWcRGcxNzf2+efndk7OBeI/ZAwJlu/mIuRqZ/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVwnW60mHamNljwI7RCxb1XXf+h4enGnG//egijbh1A=;
 b=IRcYI7+gdfvEBtDs3dzEKPfqq+7NWmP65UFWhVHnB/AFOqK1oyZ1XQElaMPuiAEH/mDhimToZ4lPjs4JcpdMWxbeh6oxc2DepDbOCx+7g6p33qJEMspTr5p69342+wSt9rYB4LJ1hoyjkAvxmjwJZYb7I/UaHUcn1BM265ms+J9Y8f4gePVAnFplK+0SgWtTCtEQV73gfw91qaXmjEZeAZH8A0xiXZv4HlGLHQiZXhqPW2VWUt6wF5B54r1fOwtgNDMcTrE4fZLqoCGY37mUTuAVe5DWUqMQQl9UrP7UmC/dOEKUihb5aC6zcN1KgIe+dW5JO1wUIXNjGdoKFqLI8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVwnW60mHamNljwI7RCxb1XXf+h4enGnG//egijbh1A=;
 b=AnSN0MVsHnEdHl6vwS8NZ6gEP194zlkiQBQ/LvYV5Ycpu1ZuGES19EwnYGEaNqWLV+RhPUqfWP5i66EjknCxD+PVUXSSNDAj36QHXtmaXBp/iv4zZlb/QYEI3uP5GSjaqzDYbaQObPoiwwiZLxcDP8PzlWUZIAFMJd5AGb0EuQzTj4mBjQHRwxdFbUCF+BeTNccNj3J2Lg6qP4lCxOFff66+3ufOJvo0KGQRCekWAFo5U93f1QGS9TSdSbrzVxCx+ODQPsEeOk5bhtLELldB2rTKxYDHPorJLFabbFXFiFUCDr1pJQx3LV981/R2I+MUpnSW/4f8IdStyOXAHLMvkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 02:22:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 02:22:27 +0000
Message-ID: <729bf4ea-0a1e-4f09-a4e8-1f5c9ba48a92@nvidia.com>
Date: Tue, 2 Dec 2025 18:21:29 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
 <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
 <d94e68d7-84a7-4540-8de8-5f163d22d763@nvidia.com>
 <5f107927d9ee9dcc1ef02fd09f5e2e5ece3f13fa.camel@nvidia.com>
 <2a4a6fd3-05e6-4291-a0e8-65db73ae78e9@nvidia.com>
 <126CBF5C-01B9-43D7-B4D7-FD32E2D6D9C4@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <126CBF5C-01B9-43D7-B4D7-FD32E2D6D9C4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR21CA0011.namprd21.prod.outlook.com
 (2603:10b6:a03:114::21) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: 36bb2677-6640-4885-88dd-08de3212cd7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QldralR5Q3h6UnNtcjlWZzVqQ3dQS1ovMnZVT0prejlpSVpPYjB5WTJzMUNI?=
 =?utf-8?B?ejRoMC8yYVBIZmV5TEI5YlZxNFpuYkFlSTlwaFlDcktzRFIyQ1piaENVd3B4?=
 =?utf-8?B?QkxsbTNRUjFXZklDcEFxRE1xRkhIME9vb3VVamgzUXJkUnV0UVZRODI2Sitk?=
 =?utf-8?B?VCtzbk9DSGdHb05ja2J5TldaVTh2a0pxR3hhL3d3djZqdWI0aFRHOTNQaldC?=
 =?utf-8?B?R0lXOGVUQmVPdXIxUkhaNHNTdkNXazBzRTV2K1d3ZUdKNHpZNG4rd0VJTThJ?=
 =?utf-8?B?NHliYWxpNXdkMVBEZTk1T01wSXladXRxK2o2N05BWnd1VThKalk1OUNJak12?=
 =?utf-8?B?MjVvMUJNYmNxWXdaZlBpekFIck1WcFdvbUFVcUUvNDFMdXFxZktXdUdMTEho?=
 =?utf-8?B?L21OdENtTXoxcGIxaFgzb2FhV1pnYkFzRkZNMTVEMG5qQytRclNtdDdyYXpz?=
 =?utf-8?B?TzlMRUVFOHV5ZDJja1hJN2hQR012K3plWm9NVlZ3bkp6aUlBL0NVUXEzU1pQ?=
 =?utf-8?B?blM4Wk1Ma2xGeGhTMSt5MDIzWWRiOENqaFZEczMzc1JjMUM3clVyVlFTaHVr?=
 =?utf-8?B?YVI0czFEZTY4Y0FHSXRrdmpRTlZyNlNZdEVibnZFSlY0aFNxU0RTTGNqTmY2?=
 =?utf-8?B?TTM1cDF1bkd1RlAvME90Z1h6NTN3S2x5cC9ibHNzdUh4YWdYeXp6Tnk2MjV4?=
 =?utf-8?B?ZjJkZE5LNHdxRHVpOUpIMDlZV012K3R5Z0lPdjJuckJrQUNINHFwSmdjSG80?=
 =?utf-8?B?KzNlSmNZRmc2Qklab2FjR3VtbW1jL3VGUktHOWlpSUs4OTZIM0k2bXlsWnFr?=
 =?utf-8?B?U29xYVFTRENhcUFGeGFwd1VOVzd5cXdSblVKVGVXNWZUME9OWUJlNXZYa3cz?=
 =?utf-8?B?Y2pQRkFvRHlTemw5ZlRxbW8xSzdWMnNOTUZqTS8zRGpQaXRMbmZqblRmaG9v?=
 =?utf-8?B?NThVYzhRRXB1ZkczU240aDVwUnpwZXRrVVFOVStlVUZMWmgzQWxza241K1gy?=
 =?utf-8?B?NUhyZ0FscHBuY2gzNzFEbExTbzlHQ3VHQXk2RjdhOHdaejVlU29vZ2FkKzVW?=
 =?utf-8?B?OGh5ZllCWTZQTktMLzRSKytIdHNoTC9hZkVHcE4zU0FJUm9aQnM1MkVZM0hp?=
 =?utf-8?B?ZjZwb0l3WWRlSWdIdWhXbGRNK2dNNi9rUi91OVFSTXdKa3dNSCs3OVZYaXFM?=
 =?utf-8?B?ME5DalNIdmlndjZnUmF0bjgyZExFVElTN3ZvQy9iMHdxZ1BESTQxZlBzSC9R?=
 =?utf-8?B?MnBaM0EwUHVvanJGZ1hVZXAzdkZnNURWSmFmQ0RIanRNV2pmRnk5L3ZiU2pG?=
 =?utf-8?B?SndjQzRUZUtiMVJyemwyaWZNMlplYlhBVTZRZVJMSnhzdk1TMWM1bDFHTHdV?=
 =?utf-8?B?ZEpEWm5TY3o0cnBYa0p5U2pKeFR6Q0V5dFp6U3pjaDAwU1pRZGFmNTMrdDhY?=
 =?utf-8?B?c0swMDVsVTdqL3BXbUlhS3dSTDRqdTNSTWFWd0g0cUc4dHM4b3FEZCswa0x6?=
 =?utf-8?B?QU9mNlhScURZSFF4aUxNOXNJUlYwQ1BiekJIbU9jMk4vVVZBS2taVkVlbTN4?=
 =?utf-8?B?SGhlWEhkUGlGN0ZjMWwvdFlVd00vNFhmYzlZNXQwM1NBRm1oeE4yRHg5SUR6?=
 =?utf-8?B?VzgrdEJ5VEVhWk1QbDBlbDBuUzlUNmc0Wk14TUllU2p6NHYydnlKRjhEVE1I?=
 =?utf-8?B?K21kbGsrTUNWcDBENm15Q0xJR0VjT0VmSmpya2ZKTTBMamZ5dWR1VDlvYUIz?=
 =?utf-8?B?SmxvWFVWVWgvWUxORkJ4RFVEcjMxeG43b3hUdHI3M3lWcFBrWlR5cEZBY3Ew?=
 =?utf-8?B?emM4Yy9Mb3B3UVBSN29FWkIxOWEvTzdKR1QxcWtBSEZYU1lxZUNYU2lqcEI1?=
 =?utf-8?B?YmtXK2JSME1FdWJkZEc5ZStZc0F6ck1aeGFuMEs4TXpXMERnMTJ2a0ZCUVkw?=
 =?utf-8?Q?/jUkrC57qFzvZ8kaxZj6X2xamiMYIYGO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0FxSjM0VzJ4cXpsWGpPQW1TTU94VVpieHFaWWlLQStJN29aa0pFWnhTSGdS?=
 =?utf-8?B?NUZoVGp0Z1lLL1NnaFplYmxTbEZrOU5pS2Vua3RsSjFPUDIxdzMyTkNOYUk4?=
 =?utf-8?B?WWk4cFloSEg2WjlDQ1o5UXMvekhhKytsQ1dUa255b2FCZmpQQzFjNDFnRWhC?=
 =?utf-8?B?SUQzMEpuVDFRaDBuZUN1K21qNW81VDduOStpblVJcE13cE9qM1k0NHh1WTFF?=
 =?utf-8?B?RXhvU2FuVGVXS2xGVnZSaGdLZnZoRk5mSnp2dTFsK3NuUWp6MmJGR20zTUs2?=
 =?utf-8?B?cXdHdWM3VmdzRVczQWlPSVVTYm9XdDBacXB2NEhROUsxSjZkdTdnZGdURlJj?=
 =?utf-8?B?REVHdEtXTEdZVWVDdjk1RVg0bit5RkthcGdpNE5Mams5dmhWSUhmNE9vaytr?=
 =?utf-8?B?RkhnN0ppdXkyUVpwSVJNYnZtcSs4SFlqMFBZRVMxKzZVTE93ZFI4RFVXT1J0?=
 =?utf-8?B?K3VNbjJOREZsSVRqOHJ5ek4yOGFGSzQ1TWxkOC9TRmQzUzdoNGM2aHdLMkxz?=
 =?utf-8?B?OTYzTjd6aGJCSEJuQVZZZEJ2ck1JcXdpbGFza2tCTjV6SWJqZ1FsR3hLN0l4?=
 =?utf-8?B?RkFqVWxWYU03QmsvYmY1UzRnMW5WUFozajRIT2t6My9OV1RmQTY0aEU1WEhV?=
 =?utf-8?B?NlB0VkkzWDFHZWhVdTNPbld2Rkg4R3hwQUZvT3Yvd25Qa1c5bUQvNUptMUlW?=
 =?utf-8?B?RndXVWlDZmtqVGtORi9SdlE2NHBDdlZjcVZERVJXK1VkZWxUNDFpTXBhdzBk?=
 =?utf-8?B?dWpDbTNMZkxBNHc1Y0ZPV0RESHpGUGp4c1ZVdkxHVGpLa1hHUXB0b3I1MGlD?=
 =?utf-8?B?Y2cvODhaZGFpOWE4ejh0THJlS3M5cGhMMTFPNjJTeXJ1d01TeXFSTUcxTXpT?=
 =?utf-8?B?U3dDSGlxcFJidGpiUHJiYnU0QXV5dXRQSmRDQWU1eVVsdk9QUFVpN2NKTmJI?=
 =?utf-8?B?UDZzUDhVdWZyTkN3bE9ZbUI0WEhiMUorVFNHdEUzbHZpL1ZCRnp4RXFRck9q?=
 =?utf-8?B?bHA3WDRaTU90U2RCTnNOVXhFZjNPMXljWEJGcEtRUWZzMnlDM1V5NUJnNnNZ?=
 =?utf-8?B?U1NmQTc4Yk5nUTB5anNKU0U4aS9acmNLdHZvdGg0RzVsT0J6djF0RmpaRjV5?=
 =?utf-8?B?SlY4MVM2L2hYaUtCcXdqeGJZdy9iMy9aV0xTbE9mdHg4ejJxZnBTcmNCTjFa?=
 =?utf-8?B?ZWJKbmdaLzBKVFFnd2pRbFZJOHhpQWJiR29la1NXQ0ZjeTB1Y0NtK1N5a1pn?=
 =?utf-8?B?dmV0eDR5QXRzL3VvZUpXd3A0WHFSZXFyUlQ3L290QjRPeTVKcDROMDNlZllF?=
 =?utf-8?B?ZytrUFpLVkY1M0RUNHlFZHQyd29iTS9EZzVJRTFsVENSZjlCMTZwV3JRM3RQ?=
 =?utf-8?B?VGg5aFhkU1R6S1psR2QwZm5JTFFoMVRUUDdMNTVheUZlVFBvMmdDQ1p6SjZX?=
 =?utf-8?B?eVZOOFRsMjlPYk40cm1FRE5nTkFtTjR2L1Z2TWl6eU1vRkYrRVhRMVRUd0Vy?=
 =?utf-8?B?T3kyWDdVem1kblNVRjcyUXk4eCtYaVBPZlNsV05NbDUvaFRSZTdBUHZmNlZn?=
 =?utf-8?B?Ulk1ZjRMdm1NS3JpVWxCVk93NmlDTmFoc1VzQmRzak1BWjhXQS9XL2xjVmRE?=
 =?utf-8?B?NTVFdmx4QXFhTGFWYU82VkZ5MDdGRmQ2SmRIVml2cVoxV2VFNjJJc2FQU2tY?=
 =?utf-8?B?aDlad1MzVzZ2cmFKRmdtZHBsTlJOc0J1VzZYL3Zoejl6RkRhQ01PSDNrTnNC?=
 =?utf-8?B?SE83TzdBVDRxNWZtdXVON1BQUEorTU5pbkJSZGd0OU5oTWFPbzhLLytiVnhw?=
 =?utf-8?B?ZW5DdUxoQVVIVFpvd0lncDNrZTdkTjdpYXZ3OVQ0ZUdkdlV1VXh0TlgzMHpx?=
 =?utf-8?B?UnhjbmRuaVJSODFKZXhHR2Jub0NycDhtbmdzRjlwOXlWTVVuVEdXVkpWZHla?=
 =?utf-8?B?Mm1uTW1qUWV2QmdFK1VSUEdJNjNlRDZsbVBYTmtMTytaakxTb3ZaQmxzenlK?=
 =?utf-8?B?aldmbHp6b2xsYUN6TWRLZGs4QWpacmZsYVZTbzRYYVEwTVZYMlpyVmh1MEp2?=
 =?utf-8?B?MitsTnpiL2hjRjdOM0V2b21WaEJMUTdTSE14aFh0L1d2bGJycGJNUWZkdWMv?=
 =?utf-8?Q?ZyIUYBW5rLsIsrZiKawHAn6WX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bb2677-6640-4885-88dd-08de3212cd7a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 02:22:27.3065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO7kMOu3QDyEo/bVRu3SlJ+YdOELrjR8fpwCy0JHLfYUyAqpZmAtqSIzzJx9qJ9MGFKiXaBzBH9qULXcfsz4tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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

On 12/2/25 6:14 PM, Joel Fernandes wrote:
>> On Dec 2, 2025, at 7:46 PM, John Hubbard <jhubbard@nvidia.com> wrote:
...
>>> suspect that in both cases, the compiler cannot tell that each chunk is always 4 bytes and
>>> try_into() will never panic.  In my case, word[3] always exists and will never panic either.  So I'm
>>> guess that the compiler will still emit code to check for panic.  I don't know.
>>>
>>
>> Good question. Maybe someone with Rust experience can enlighten us on
>> that one.
> 
> If the optimizer could not eliminate the dead code, IMO that is a bug, pretty much like how we rely on dead code elimination optimization for build_assert.
> 
> It is worth compiling and checking but I am almost certain the dead code for an unreachable case (in this case, panicking, will be eliminated).
> 

Well yes, but the question remains: is the compiler able to even identify
this as dead code? Because it depends on the early -EINVAL return, in
order to be correct. Is rustc able to figure out that kind of situation?

thanks,
-- 
John Hubbard

