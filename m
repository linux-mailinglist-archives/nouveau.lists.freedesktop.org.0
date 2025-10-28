Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74697C146B6
	for <lists+nouveau@lfdr.de>; Tue, 28 Oct 2025 12:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED24310E1D9;
	Tue, 28 Oct 2025 11:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kZ71nLJz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010068.outbound.protection.outlook.com [52.101.201.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8357D10E1D9;
 Tue, 28 Oct 2025 11:42:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zox4xMfu6Ezen/WWlVsNkEnVGRc6R4aNcf5i3C2R2NlGH/8O9dJ82haoxqEXUaaZws4vvLNHDqKu2CD/3EtEn0ChDwCH02xUjGahdfEXJC941HUY8qacjVgjYPF6hKZghSgXaIk5P7joctK6/tSu5ZR+jnTgjBAmPZA/8qNk+EDysfql7SByZjv+R60P5cE9DHlhHVOl3R6w/ch0TzSlzb80Gp613Trq8ktFsbIB+WlN+l0H7JAOx8MxF4HanQWdKwdk8/ICG2iq+zl4tYqXXSPUWWYaENV5uwYv0EdUB7m4xKDJ7i618lRgbCFIpY+4ihpNnjqi8Zply7xI1mt5YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7IB2JnRYAyvDOko0CtcZWkwP+ENnBOK0FlS05iJc0ks=;
 b=H0KJO19pQIk0oa9rWmkIhUFCAw20D2kSoEAfP1ZMl0JvNrP5yaarYYNfWxi+IFVd6mIt4qkh374g7mXpGY2DY1EhQshkZC6H1UftfriM+Gh81dwu9OABrxOB0x6UkLU+RF1eZo3QrBcFjk4KCkmBkqAo95pXh/a+oJQ0sYIfGwUYYm2in333G6dPy7EM5jWzQpNpHP2qEYSYILwpw2yln3NVaZntSXsNyUpPG+LvSIpn8FpGSjXS710uTJ1Lnu2xylT1B1i/419TzhyUQeZ7n+rwf9BgVjnOqkLGEwJr7Z0PwQ9jydm1DZtPMJRfGSeHepNxu4RRf7pM2JevgHqM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7IB2JnRYAyvDOko0CtcZWkwP+ENnBOK0FlS05iJc0ks=;
 b=kZ71nLJzu9affXSKljNyO0I6c2ZcFc31wTqaP4chpCtjWG7ewq+JPBhWuG8MCaXYRjDBPqbsWT2Td4qAqwnlH0XvISundf+lvtg+NFsKE8B5PPqV1CSz40dhIMKV6imKJPD7fIsI/awvr6nm3PaXoNqGxqTwzrjXkFu6+nhz055E8OkGEETnmbQF1YlNyaS2TJ70t0QKG0kqdGtTxl2aRtT09EMWBby4hlmey306Oi57wd2DW7S03w1Kv5Fz/uKfIxrFdrR/riNnRqc1NV9iTEBMqiFDovEOa/hTsrxw78fm/32mu6KhI+2z9Y1Bwj6TNyW7+APDZAvj3cKK7WTs1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 11:42:48 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 11:42:47 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Oct 2025 20:42:44 +0900
Message-Id: <DDTXFK7JE59S.19TLPYTWTFHSU@nvidia.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251028023937.1313108-1-jhubbard@nvidia.com>
 <20251028023937.1313108-3-jhubbard@nvidia.com>
In-Reply-To: <20251028023937.1313108-3-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7664fe72-64b7-43a8-80d9-08de16171dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bndybjdaMi83aktvM3pUTHM0MlVXcGJQMytKVGtjNUdWakNBbGRRSVh4blVk?=
 =?utf-8?B?eEl0SldXMEZyMW5iNElKaFR4dG9PRktoMDBGWFlwaEd2SGdwY2hIZWVJeDlG?=
 =?utf-8?B?cWtFbmNrM1Q3Nm0zT1JpZXRjU2RVNmI1MUlUeTJpVGhDcEtpVTh6WGpISmx3?=
 =?utf-8?B?MFZSL1U1b2podlMwTnhPT1dYS3VwYm9vZ2V3UTVwZDZSODM4S2VSNFo3c21L?=
 =?utf-8?B?WEhkWU54MjFTNjdRMkdkVFdieE80T3lueXNvUk9QS2RsRWtLWGdCSEJzNWta?=
 =?utf-8?B?cndGKy9nVVMzZEU5U0l0bzZaSmtWcUdyTm1pYitHY2poeWw2eVdGZDNLbUpW?=
 =?utf-8?B?WlBtK0lleW51djlxL1VVSlNlZWQwbHIwT1ZHaTF0a3JDamlxa0dMRnpGRnkv?=
 =?utf-8?B?M1BDemIySXpCYkdWd1ROOU05N2d5YytjYVMxMTFkMFh3N2Y3SXA1UDk0cEp1?=
 =?utf-8?B?YTF2MnlaaG1sNXZXWjdTN2tMalVPYURiL29kV0t4b3hSTGUwc2FkeUNuQnhR?=
 =?utf-8?B?OHcwOVRrZURHQTdOR3ViaWw2ck5ROGI0RmVQTE9OSFNYaTFWazlNQ0tjZGlq?=
 =?utf-8?B?MlMyWGZDZGF6MTl6eGRIcXdVZ1QvMjlXUG5mc2NFUnlWVzFwYnFqUVM5TE5s?=
 =?utf-8?B?djNXVHNodjYwWWVPVi9qNjBQQlRxMkt5V1hOajFqZ0t0WDgwTXVsYURqTDJj?=
 =?utf-8?B?R04yNGNGNlNHY2JJMTlXTEZDejhhVlg5WXRqQklNZjB0Z1pwQytYbnNMRndQ?=
 =?utf-8?B?TWlid0dSbHpzaHR1SGRVS011VzRWT0VTSHJvaUlQclQvcGZvQlJlNzZpUXNJ?=
 =?utf-8?B?dGhoazdhTGxzMkhWSUtwQkc5Mm1XcnR5aFpTTUJWZGhHOHUrc2VnZkJ0dnZG?=
 =?utf-8?B?TjB4SVcyZWJpR1dmb25pOHZHNUg5allwQTAxQWlaaktJY1dXQVZ5V0tSSUJW?=
 =?utf-8?B?amVXY2hjWFlIaEh3YUdSa0NOV1FDZzBmNlNmSUtsWUd4VWxtMDkveXc5NkRq?=
 =?utf-8?B?b1pzOUtjUXJuZysvWFNKYUZUTllqbXE3aTY1MFgvZUJvdVBsdVdFdXMxOW14?=
 =?utf-8?B?Mkw5Mko2QmRJSmp1L2loYmVZeUdTN2J6Q0ppQXhIcVY0QytEVXJMYS9CSFRZ?=
 =?utf-8?B?WUJHUnJlK1RvdnhiU25EWEdISm9TZmpLQWtvc0tQa2U0TGNqL1RqZVFQWXlj?=
 =?utf-8?B?RzdZLys4MUpWS1ZJVUszYkZoNnExZmJ2RHdTRHhpV2VPUVI2Q0ZaSEdFdGRN?=
 =?utf-8?B?bGdNaEtRV2l4R1VtZXhhUlpGZ0NzdG14YTU3ejY1NGpGb2NlcnhIOS9CWmhs?=
 =?utf-8?B?dVh0OVQzcEhuUVNqOVA4OVlDelRxTGNYd0lnWC9oeUViN2lzMVhFY0l4MW0v?=
 =?utf-8?B?R0RwdjRRajFGRUs2TlIyVUxJZ0tRTUdjSVNkcktha1RuQWY5TWEzb25RalFV?=
 =?utf-8?B?M0Nxd3EzcXFpeDJ0blhnZFY2N3M5V05tS1ZCakUrdFVQY1Vaa2JPckhnTFRM?=
 =?utf-8?B?VHZicjFVYXl6R05vMkRIbFpOQXZwZ3prVElwOW5FcXMrZzBGTGNzTjFPLzE3?=
 =?utf-8?B?UGhOZHVOS2tQR2wxeXEycHFlbmJMRm1lWmd6NnVqWFNrQ052UjZnRFRhTUhK?=
 =?utf-8?B?R0lJSE5mbHJ2YS82THVmbWZkS2QzN3piUUxzUGtVelkwWTFoN0YwT2pTb0pV?=
 =?utf-8?B?SkRPMS9uS1BWbnRrcEp5Q1JSNzZmMWRzVjVsSGVqY21KOGJSM2twNWppa0hy?=
 =?utf-8?B?dGZDanJYeVlvUm5SZDczWlVYaDZhdlhIWWVIaHZIajNqek0veXVuYW5oaGlJ?=
 =?utf-8?B?b1JtWER4OHZxaTY3UjBXbEZVUFJ0QjFjcVUrVDNIamt4Z1RaNDk2dUxJb1o3?=
 =?utf-8?B?Z3QvMkorYUFCdGdXZVhaUjFIYWZ0VHFGOEY1dDVqMUVSdmViWlVvZTdXeEhk?=
 =?utf-8?Q?nN0/5l9K5iwdjggcqkD53oZWNkmGwmsc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBnck5KUXgrbTgwNGdLYmorNUR0Ynl6b0tCTXBESktudXVoS1lQWndVTzRp?=
 =?utf-8?B?S25tT0hoa1BkUHhXNHJSY1hSSzJibFVLR2JYcFJIT1p4QlQ4ZlkyTnJnMWN3?=
 =?utf-8?B?OTVrejVjblVpTURtNHpGS0gyN1lWSCtwN0pUSWM1d2RwdjJGUzQ3aWZObzda?=
 =?utf-8?B?bFVDZ3FOUWZJKzNoK24veTVLYmRncmMrOTdVMHVMRE9UblNrWVVTdG93YXpn?=
 =?utf-8?B?cTJTTDh4TjgvWlBNN3BxOGFVV1NRK3g2U1B4Tks2cExIdW1TanFralJIeUVw?=
 =?utf-8?B?YmFwanRid1NxdndrblFnSjlJTjZmUXUyRTlpQVEySVVtMUkvaHNsbDZJZy9Q?=
 =?utf-8?B?TGhXQUZ1UGRXYU03SExhVkdCSHNlTVhpdzZ1NXJFQ0krb25VelkrOUluak5J?=
 =?utf-8?B?MkN6d3hXV215L1pJakhXc1d0bjZpa3RJUDdKY2x6dUtZQkN2NzBIOWdFU0ly?=
 =?utf-8?B?ekFSQ0pxemRFdk5EWVM4SmJIMHJ3RWxJN2lsNDdZV1pacUE2UVlrZ2RxQU5E?=
 =?utf-8?B?dCtMV2dpbHlwYTZRa3hVcEMvR29qS3UyWjZWZi9QdlhWMVRiWG40dWFZQnFW?=
 =?utf-8?B?QlB1bnZ3eGhwSWQwNzMxNHhjWXhuYkloM1IreGgxRXVMSTg1YWQ5NkFiSzNQ?=
 =?utf-8?B?ZEl5ek4wNW15bys1emtrYno2WTJxZ1lIWnhtancyZE5XNm5Ca2E4SVdxYnNm?=
 =?utf-8?B?SE9NOHpXamk2eDJ3dzhNbVpJMnlzM043aVBObTZhOTNEd1dITlJjdlQ0WVBt?=
 =?utf-8?B?bXAzZ0Q4cXJ6c2dqNjQzQ0JrODk2MVdMMElPb1dVanpxaS9hbFV1cTFhMFl3?=
 =?utf-8?B?Y21mT2wxTmdubTRvSW1UenVzRDNGeFRxTmNzOEpJQjNpOEorcS9KdXphYS9U?=
 =?utf-8?B?YWRUMkVZVktvUVlpcXJ5bTErL0lzbVYwQ0hkdElEaERrMUpSWHFvZEc5R3Bs?=
 =?utf-8?B?MGpGYmEwK2NQOTJJdCtpV2RML0RTWU1rYi9USEFURVlybGlXaHFpaGxBcUJR?=
 =?utf-8?B?RkVId2plS0xxS3NoWHhvQU02aFU0WXNWZlpmcTBGSko0SGVyc20xeENtOGow?=
 =?utf-8?B?NnRMMVd5ekdWNUtNMXp5SXRiMXMyTTZZdUJDNHc5S01CdTA4QWpubDdPakov?=
 =?utf-8?B?N3pIL3kxYkJyaForcUFRdW5xcFp1YVd6Sm15aTFodEYwUW13VzZqMW5xTGpN?=
 =?utf-8?B?MWwwQjdHSi9kNkE4ZEtId2dJVHFnd0xBWnVFOGV5Z0RuRjJaZlVHUlNBL2o2?=
 =?utf-8?B?SEt4OXE0Ym9TaE0vOWlZc0QwOEQ0TFduSUJlcWxKNDFxUGpEajB6YmlSVFJN?=
 =?utf-8?B?L1Q0SGVxam0ya1VBbCsveDQzejh2MXNNY1QzeUc1ZkpSdFp2U01IVXpVVXpZ?=
 =?utf-8?B?VnJ6QXJrbWxXLzFpRlUraEJRUjFJd2hIdUxnKzFvT2JzMUJ0ejR2Q25DQzhC?=
 =?utf-8?B?dUJJVTVJR3RLeVA0aDRXK2RKSFh3ODlDTXhUSVdBaHcyVFNKNDdZSUw2UFJo?=
 =?utf-8?B?a0lGbGoxZ2NmemRhb09Hd05EMzZDRDBPRU5CQXMzZ09Jb2s5RHMvSUlvcys5?=
 =?utf-8?B?VDh2eHloeE95Yng5NmFpVmZaVmFvSDV1MWxpTkhKcnpzNDhXYVV5N1ZPeVBt?=
 =?utf-8?B?bE9kc0RuQmZRTzN1azNwUXpIczRacENibTB4ZHFIY3F5RUNaWXF0MXMvbHlx?=
 =?utf-8?B?dFFCYkZEcE16eDFwRXlBNi8wNXkyUkM5MW91b3JCSmJvUjlJVDBMN1oydVZt?=
 =?utf-8?B?cEpYQWRXUktFVTBLQ2pkM1V6RmF3Ymp4OTcxZGVkaHFSMXc2VzJUZmMxUTgv?=
 =?utf-8?B?VjlVZDBtVm9EYmpiOFA3dHdhUXRVc0hKb2VadTNLWmpOTmUyaUJkY2dnbHFD?=
 =?utf-8?B?UXkvMjJVdnc0SC84NnA3YloxUlNQZWdvaE1BR1I1VmpGVXF6dk1pbU5JaGp6?=
 =?utf-8?B?TG1YZ25VVHpvbldVTVppVTZXUm1qZnlBd2VyUFdvMzVCVGZQRzZsRzVkNTNI?=
 =?utf-8?B?Q2R3TXZrVGlvLzZRZWlYWUdUa0JXNjVLbTRvWTJLelJkNmN1RWxIRXZpMG9K?=
 =?utf-8?B?K0diVml0aWt4WkkrdFZCSXM3bnNkK3kxYUhWUUNrRkdHY0xNNkdLQXR6Szlw?=
 =?utf-8?B?alA5WENMaE9YUlpReHpsYzBGbWJuTGNZdEFPS0t3VkFYRmI2MFVhOVdnTkdm?=
 =?utf-8?Q?t7SKtczQAIALR3fgy2tdaKfzHy7VsWrmpPqqmgMApSCJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7664fe72-64b7-43a8-80d9-08de16171dd0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 11:42:47.8236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuwcqijkkgIezFOkhZaeneeI9/CZa/ed6suvnpz2glgtTLMO4Lkofsa7mMJmSNIkkdzg71LQbO7SfeNuCAKbHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925
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

On Tue Oct 28, 2025 at 11:39 AM JST, John Hubbard wrote:
<snip>
> +        // Now that we know it is something more recent than NV04, use b=
oot42 if we
> +        // previously determined that boot42 was both valid and relevant=
, and boot0
> +        // otherwise.
> +        let (chipset, major_revision, minor_revision) =3D if let Some(bo=
ot42) =3D boot42 {
> +            (
> +                boot42.chipset()?,
> +                boot42.major_revision(),
> +                boot42.minor_revision(),
> +            )
> +        } else {
> +            // Current/older GPU: use BOOT0
> +            (
> +                boot0.chipset()?,
> +                boot0.major_revision(),
> +                boot0.minor_revision(),
> +            )
> +        };
> +
>          Ok(Self {
> -            chipset: boot0.chipset()?,
> -            major_revision: boot0.major_revision(),
> -            minor_revision: boot0.minor_revision(),
> +            chipset,
> +            major_revision,
> +            minor_revision,
>          })

Can we implement `TryFrom<NV_PMC_BOOT_0> for Spec` (and same for
`NV_PMC_BOOT_42`)? That way this code can become:

    boot42.map(Spec::try_from).unwrap_or_else(|| Spec::try_from(boot0))

(untested ; but hopefully not too incorrect)

