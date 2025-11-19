Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F33FC6CF2F
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:34:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E37D10E57C;
	Wed, 19 Nov 2025 06:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dvEHrXdU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012024.outbound.protection.outlook.com
 [40.93.195.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C2510E57C;
 Wed, 19 Nov 2025 06:34:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuvtLHs7+iTNb8Q04ksCIhnwUfzAE3fupgilcil7xVvfEwd+BVynQ5f9B+D85MQtFyHaIwnO30rPeC1SEDMjvNTL10mO2sinJRtuWNOM4PWgNMuRSoN9E3ORsvGf28i922fXjvpOhALXG8ryvmAG/Pb17go8qbRoJCXLLeg7CQBp8z30DVfIEtwh+Ks0QkRHkBquksLZp8D5uDt9sOyjdWNL+dK+3KymS6Xv/BBFIdjhaukSPHIc5pUVz+Ur9cjZmWSzurCK0DFuTMUXtDe0l0UbHPcWrM5RjqlGEt1b4EUyFHGk/ss/0thf7BIcY8tu+CXlONKu7eYg4nMNjAInew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EY2dRqtSjIth14AmhIlHzwioa4wulg4AQ6s0yCQ5l0g=;
 b=mOeqCZpeyoJk3NYgkUNbcKakbNoUK62pF5rWfm9Eox4CMpKgI6mkKbTvYhoQLI3gzV+xMkLS1XVl3KnAVODSbvyPim5X5MMnSoh7Kip31YF7U8aqk0YBhGBmvWN1Cx/5jxljz2aE6fjoIEVNcQSBRJRByHfQIn/IYHgM1DMePD7yeJ/usB85axVRhOro0sPrD8KAo6ZdUki7rsTV8NWrIK2Lsya7dYFdZ15l4h+d/kmyNKs3mP0KmWIsiWpcnrtfCBoOtO5jyWkw1zD0Ywei309HS+QOSBjrmy3OOa2vcgtmmEexq6LZ0msRauyY14ij6IFTGAkk2WclJv9uWyzGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY2dRqtSjIth14AmhIlHzwioa4wulg4AQ6s0yCQ5l0g=;
 b=dvEHrXdUSjEWVkD0mfJ3Q3rD76Syoa96SZJYza7KabtL0NE7GzoQVItBTBCTf/J3veatEBDMJHTdHhgbazzliL99STzzQDScK+mZrLOraCobAoe62/VuWDBqj5aA+2NytZRIKvnWhv0AbmlRU+c3X7wPdj3b1ZB0kinwGB0TpY5/0tONuUbHo+oNGr2Z5KfeLfOQodhhJBkwOYDDqVXoo4uKBrgj8rA5ylirdnJlene2dje/b5AAXUU9bFuXFf5L/z7pp5deMm8iGf3bcgGToanq6qZL30z1HgKfrQ3m9gBUWPJCv6EX7bqgyMl3GrL5u8vVMxNqAeIZtX8i+ZYe/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH1PR12MB9647.namprd12.prod.outlook.com (2603:10b6:610:2b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:34:14 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:34:14 +0000
Message-ID: <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
Date: Tue, 18 Nov 2025 22:34:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
To: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Cc: Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::17) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH1PR12MB9647:EE_
X-MS-Office365-Filtering-Correlation-Id: ddef60e4-0180-46ec-7abb-08de2735a837
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzRKL0lSV1RXWHJFckRuVmJxZUF4WVhFTUozY3Vob2IrM1A3YkFIbktCdFNz?=
 =?utf-8?B?eFZCNkViWC9ORkdzUVNwcU5qV2phM1duS09NdXV4bk0yRFpOZTFzZFNma0pm?=
 =?utf-8?B?K0JQNEs0dGkycjRjdElQTFNubG5IcVZ0cFFCTTR5TmpmNVV0am4zbDZlNElT?=
 =?utf-8?B?aDNyZHp0RmpKOWZCcmVyS2pBeFp6a0NiMUd1WDF0Z25iL2ZRejgvVTJxRkpV?=
 =?utf-8?B?R3ppYjFyemVnbUU4V1ZCZFFkMkxmSHNMcG9zaUJ1L3JCenZnc3pNUUo1MnpG?=
 =?utf-8?B?a25tUXJNTnlPVHRHRlBSYXBuNUFjL2gycFZ4cmRpU0wvK1FUYVpRWmx0ZThP?=
 =?utf-8?B?dTJVV2k0OVgzbnBPYk8vZ2JyVmRrWkI0KzQvQ1ZsYkRqRFhpYnRqRHZtbUNq?=
 =?utf-8?B?U1ptcnJUMjZtcnhRc05BYmpEOGp3WWpVZXpTRW5Ob2dxZjBCTCtEclRDM09R?=
 =?utf-8?B?QjREWG1FbVBwaFVOU2M5MVQxR1pPQzVEZVYvVlhLak9BUmxub2hHUEFGTUFJ?=
 =?utf-8?B?ZWl3QW83UnBKOWxHNmtpTDk4NGwrVEEyeXlFTmJSMXhpVDNWWUk2UUxEWHZu?=
 =?utf-8?B?ZXdiSFpQWWo5cml3blFTKytVcitvUWZNVzJpaERublJQM0VxQVRjekpPMlhw?=
 =?utf-8?B?eG55ZG9qMzh5WStIVVNrWDJPL0s5MkNKYVhGa1JYcWdnNVk0SUhyRE01ZFg5?=
 =?utf-8?B?WkRjbnpKcTkxcUZlNzJONnpUbTAyaS9NTkhIYVBRZ0lsSE9PQVZ1a0FnYldy?=
 =?utf-8?B?NjAyNDhNZkdlTU5hV2h1WEtzZWlycVdwcHBVb1JiT1Z4a3I0RFRLbm12dis3?=
 =?utf-8?B?d3dwcDFoUWNIQlRwR2FVQXU4TXJZSzE1MEtiZnFNYnRKM0xSa0kyS1lYNUhR?=
 =?utf-8?B?c2ppWHcrVG9NZHVqZEFRK1dRSEZ0c05iL1N5Q242clBlRnVSRlpZbnMybjNa?=
 =?utf-8?B?REhIem9tMHpMekFQWVJjL3pqWUtJZWtkTXJGbUZWQlZlaCthRzBPU3BKWjA4?=
 =?utf-8?B?Q2pQeXcrVEo2WjNMTEgzeTdKR2h1NUt5Q3BUUGJnZWRscGpBNkMvM2tuNUxJ?=
 =?utf-8?B?NHRrWDVXSnltZnBYdlNhWkNRK2ZYNGt2ZlZTTUNzbGRiRlJKUC9WbW01eURY?=
 =?utf-8?B?VSt1VkRyNzd4TGdLeTBrR0JleklhMjNBRTV1NXpwdlA3RTlQeGlTVlBtSkpM?=
 =?utf-8?B?bWc0czYxZjNVZGc2NG1SeHN3dzJveEpsN2g1UUN4a2ZZUEcyN0VCU29hL3Rr?=
 =?utf-8?B?cFZrZHY2amF6SjMvd0V2RnV5OTlJSHVDd0lKRURBakI3N0RHSGhQRmhRdC9o?=
 =?utf-8?B?aDk3aGtkZWZBaW1PblJzTEx2YmNOU3VzNXVKdmVxUW16djV2V2syK1R1SGdO?=
 =?utf-8?B?enppbDlvTXN2L3BKdEkvNk1TeFZJRnU3aU9DWE15azVja0JqMldYdWJHRUcz?=
 =?utf-8?B?YUovNkViclVMZVFxSDhEam9rNVd2L3NhWEhGWkRLWFVJV0VMTm40d0c4NkJH?=
 =?utf-8?B?NHZNQ0hGV3FrQkF5WHdiSDVabVR3Z20rR0RNMWNRUE12SzJrR2JEc1N0NEpv?=
 =?utf-8?B?M2E3SmIreWtGWHRXS05RdksySUl1aVdDR2ppZTcrSVVPdVhPMC9BZ1pMYlBD?=
 =?utf-8?B?eGJtcFl6ci8yRWYySFU2QnRobDUxVkpiVFhqY21kazM2ZDUzTXg3NE9xRng1?=
 =?utf-8?B?WWFWeW1abFFtL2ZxcHV1azNrUzlXMWNwa2xDWk4zZlJmV21uY3ZaQnhmUlV1?=
 =?utf-8?B?eFZ6cEh2ZEZ2OHkzVzg5Nk5xWjJ0eXFMQVRlZEVkR0hwUEZvYXpkdjZRUkpy?=
 =?utf-8?B?WmNDOWF6Tkl3dHJ4Tng1V0t1d1dKNVk1eVgvSzA4U2lSRlFPMDNkemswdER6?=
 =?utf-8?B?dVlLRCs3Rk1lN0tHNVBiMnFEK1pMNlRvUUJvRStLNlE4M1hqUTl6YjJsaWJK?=
 =?utf-8?Q?/5gDVxtiUjTvYsdOm8xA6rCmD41ZIcjg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVgzUFJRNmo3eXk2SWg0anprMTk5cEtRZkd2RUc2S2NwRFVGYXl6N3JYWnF3?=
 =?utf-8?B?R0ZGYmVjZHdrV0R4VE40ZEhZSmlCaUVEb09SU3FubERITUZnRWJ4ZEhEb3gr?=
 =?utf-8?B?MStKUFZlcTZGTWdCSEFOUkhWTGRTTDdRUnM3TXhwckhDNTJZcmhIczNpNkhH?=
 =?utf-8?B?YmYrSGhDRkZNMFR6U2xMR3kxcG9JdHFlVDFxSU9VSElvakJVeUFuNzB5dys4?=
 =?utf-8?B?U0RLbXFhN25kcGliVnFobEsxeHRaT3BDeDJhY09ER0oreFVtQjQ3ZFB5MCt4?=
 =?utf-8?B?ekhRYXRpZ3FlVzZYak9OM1AvOTMraDBPL01RbzQ5UnB5QzJHYVMwM2dudnpD?=
 =?utf-8?B?cWh3cXlkcTBlMTByT0xNWHN4VHppYzhjSjNtNWNqLzF5Q1hEbFFnYytnQnNM?=
 =?utf-8?B?eWNqcnNiWS9HK2lhQ1VkZDNNQklrYldwejBpYVprcldGYzlhTWkrMDFnWkVz?=
 =?utf-8?B?SUNha3d0S0VvVWtoMWFEbXJLUU5LaXQ4eTRIUTNnazFCZVNwZkFpTW9YSmtW?=
 =?utf-8?B?K2JpQUFLN1BtdlZSV014UExHM1ZHbjJsdlRpbEJlbnRsNnYreVQxZmZ2TlJ5?=
 =?utf-8?B?RlhlMWlLbmowMW0zSGlhOUdpR0JzaWppNjdLWU5FYXFmSmZSMGdIemNBSGdR?=
 =?utf-8?B?MklLeTJQNnZpbnRid1BRRVcrZVdhRkxvcEZtV2NOcXptOFdCUDkyc3NWUXJM?=
 =?utf-8?B?S056ZDM0dWRRSXY5M2N4MTBjRG5UQ3c5TXdDU29RT2ZIQW1idUxJZFJoUlp2?=
 =?utf-8?B?bCtCeU1GNWFlY0IrM1Q5WmpxMllWNkd0V3VkZnp5c1ZyRHpXS3ltU1IrcDJ2?=
 =?utf-8?B?eTNuc2ZUMnFKVmZ1K05DazdIZGxEREh0VEE3R2pzN2QwbHNKbG5mcXVsN01u?=
 =?utf-8?B?VHlMd2tUMTdwVTdadjQvNVNkVGhrdXJoV0dsRTB5T0xjSSt5SU1Fd2xndmJl?=
 =?utf-8?B?QUxXOVJjWDdxU0NISmN5YUU0OGFPbTdZVTZCdDFtVEE4VFBYY0V2N2ZjNDRl?=
 =?utf-8?B?NmNmUG9GM2k5SytVck1PTURVZGI5UkN0UG1nNmJsZjF3eE85dVZ3YzR2UkxY?=
 =?utf-8?B?cVBpSzZXZzRETmRTR0U3ckxaUGdMSGZIM0ZsRzNyZ2dZSFd6WDcxMGlveWJy?=
 =?utf-8?B?ekJoSG52NUJla2JlNnp5MTFKRGZ2eU1NRERySFZ5TmxFcnBNMWUvayt5OGpB?=
 =?utf-8?B?RHVmdWVSWkhBb2tyS0d1cytGTzlpRzJiQnNtbWtzaTF4UU53WTZYVjJxenoz?=
 =?utf-8?B?NUdYRnR5MnJYemVhZVVIeW5wb1NKQ2tlaXJ3ZTZIS2VwNVFvUWpWSTcwNUlJ?=
 =?utf-8?B?Sk5nbnVyOC9xM3BHYlp5N2VXT3RPZkNLcVFnRitkTUc1VnQ1dnVTUjFnTHlU?=
 =?utf-8?B?YnJSOStBMU9tcjhaOEhiS0x2bjlvR01RQzBTRFM3ekw3QkZQWlE4MTc0QmFu?=
 =?utf-8?B?S2hkdDFqN0ovVDNwckV5TGlHaFdBdTVFeE53OG1GWGVPZ1NYYm92Q3cybXpm?=
 =?utf-8?B?VkZCeXBwUlM1RHMwWE83L0tITkViUGtGalZqSHdhcmtXcTlhYmdKcVh1Ukp2?=
 =?utf-8?B?L2k2dnArQnJtbGVVSHBQRDhobm95OTB0by9pNXlOb2lRUDJuakV3YlBwb3pD?=
 =?utf-8?B?T3ZqVmhURjZqd0xaUlI4Tmt0SVBpNVN3cUF2U1phSGQ1TTJLaXZNMHpLdG1L?=
 =?utf-8?B?TFVWdjdSaTdKT21TTW1teE5pV1YxaS81UTJweWQ2eEw1QVlOM2c5QVNoRGlR?=
 =?utf-8?B?dDg0VFZDR1VLdUJwUCtNR3dUaE9MclJHenR4bWNRVTNQWk5hU3BweGVLTlpq?=
 =?utf-8?B?bW5lMHF4YVV1Qk1aOTJyZGFERHNia29qVGdNVWhmWDJnWnBZYjZqcTBIb3FL?=
 =?utf-8?B?aEJOOWU2N25CUzcvWkIxK1hiZmFnL084VSszYjEwZ2xibExHYkxSL2dXNnBq?=
 =?utf-8?B?VjJCQU5lVk5jUXdFUWdKWWZOMCsyWlI1dS9ZenZaTUY0M0hKb3FLMExualBW?=
 =?utf-8?B?UzRpWkQrd003UzRnRjBJTG5HcGh3elNrQTQ3dFg2TmM3enNUN3UxYmN3ZkFh?=
 =?utf-8?B?U2dTS1BsNUpnYmZIUnRMNWJhNzMwM2ZPSXpoY3B0em91NTlONVNGQ3RrVVI2?=
 =?utf-8?B?THlYenhNRmh4Uy9QdXZFYlhQZXRVelExM2duZnZ5TThmUGFkaER1MnB5RXMx?=
 =?utf-8?Q?K+1hlPO6yehakeQetCcASlA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddef60e4-0180-46ec-7abb-08de2735a837
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:34:14.3789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNenby9zOthOKn0o861u6ZuJ3etegAvaP326YKmu4wzrhH7cBwTGhPILHhjaS1wpU800Y8vhnUA/XFXrBsB8fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9647
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

On 11/18/25 6:17 PM, Alexandre Courbot wrote:
> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
> 
> Nit (for the patch title): these are falcon registers, we just happen to
> use them for booting the GSP. Also IIUC most of them also exist outside
> of Turing.

hmmm, falcon registers are *also* GPU registers, though. You arrive here
via the GPU's PCIe BAR0. So I'm not sure there is anything wrong with
Timur's patch title, right?

thanks,
-- 
John Hubbard

