Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB61C1DA8E
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 00:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C30910E013;
	Wed, 29 Oct 2025 23:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CldskZRs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010009.outbound.protection.outlook.com [52.101.61.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8A10E013
 for <nouveau@lists.freedesktop.org>; Wed, 29 Oct 2025 23:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZs2nn131G9kNWxOnL27CMJENFCh+OGjbjDxBBluPTn+mA87BH/HHabGFMI9Ffim4Ii+FbcMfA+XDgeO4+3V3AJOPMDwqGkAfAhei/mDAdzn+rHHPgjQXbeNW55SJPg6oEsZYW/U0lCdBxuX3t1qUmqP6KdsUZKxWxtz/LvHwjzamff/H33T8iAGqBknMgFw49XvKiZXDVPug7ZtiMyE6jiYj11ioz91rTacvmoir2G8cZlWjwvuM6aCVOBlNv7pN61+6x2QTe3hMeeTB4+1q1HtQZLsU8nbOoQvgJZWqEW1v+GA8LLesmPZd6GSpB2uYEbO5gG6OIrv/e+UOAMBaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuTgA7wVPORPgkgkwC/Mjuf9WRSHjnFdjtAzjcyG8xw=;
 b=i6Uzl7MmyP8Y2XoEs80RilwtsWcAbUp60/DTVS4niC0YE88yasu+UR/Zfs5h13xXlD8IAjaXUJSw35G3RBitRwyYxoCuVkEeGIuhzG6S/Ukhp8WNY4hcQKIYSxJMZIanykhItnCWjDl/rQohbgGXkTUkelWQJ/whUkYg/4EBqapy0atiAbavkN+oLB1e1uGVswJBuQqGf32uR+meudG6wZeJaNtqu3qJcjrUZG9srlyAV0zc3SfHiLOU+tvRTDnxhpPXJzUWaCoMn84fhoPmtpwwiUpR50tiseiOT3xFIvp2TSjN9lrsWTJ90dpv/TwHo3UxYwZbYKXfdCXv2FQ0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuTgA7wVPORPgkgkwC/Mjuf9WRSHjnFdjtAzjcyG8xw=;
 b=CldskZRsirFXi1806zUOZAmU0zkOTkvi88T4VpaOMobgyhCAgch33RmMeNQywl9on7UKJ24zcpuc5CM/X8whFUZ1P2gjPiubowTHFLNJTzuRAAfzy54dnw/D5fFXcyJQFU7zaYA2JqqGFfEGygnXwWpJ0fX6pQulbJa6refcG1PLK4NmI2CeNuKuxRDayaqpnq6a62qR+rl+fQeOOHJoATzrSoqa+qy6g2bwi9DIqagMAf4dvpUguhptLmnIPUEh1tdSL6b3WWZkUZR97x9QIgDLMv0dD9QAnTngRUms9n1JXLtJpjTLWpWqyBBVeQN4gABSKOV+8VnDetPJrzFHYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CYYPR12MB8890.namprd12.prod.outlook.com (2603:10b6:930:c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 23:15:08 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 23:15:07 +0000
Message-ID: <f2301249-1a92-489a-b1ad-2e174980297c@nvidia.com>
Date: Wed, 29 Oct 2025 16:15:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <38c110253990a02066d59a4979070f5110f6eb7e.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <38c110253990a02066d59a4979070f5110f6eb7e.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::33) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CYYPR12MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 691df5a5-2842-4187-7d8b-08de1740ffe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGx2MmpodzJLQkZGVVNaODBLSzNLREk5UHlxT3VKaDlETnRMY202V2pIVUo1?=
 =?utf-8?B?a0MrWmZvRDNFVzBMNVFmRUZ6SEthRlpaeHJ3VE53Wm0xd2hoWmxtSFArMnpR?=
 =?utf-8?B?WCtpZE10RTdpY0wwemp4bkJWRVhLbHBxMDhnTEcvSk1nL3JSZ1NhTVJEbHF2?=
 =?utf-8?B?OTZMZlhabjdqbndFTTFUT2VoRzBpWldmWElqNk5pRTg2YTZrQ2VkRUl4ZGdh?=
 =?utf-8?B?a0lTbFF3ZTBaZnlUMXdSYkdVbURGaFJTWW9BNVJCVk5qeWduSThGUmhnVEVl?=
 =?utf-8?B?blFEdGNEWDJ5U3VmTzB2VE5ISHM1NmJCK1I2bThoK3NIOVlVUHR4OElDY09x?=
 =?utf-8?B?L2Y3T1dFK0IzSXVpWG1TYnNvaGNUeE5SaWs0aGVxbUsybkR1ZHhjWFNJb3ps?=
 =?utf-8?B?M29Kdyt2cTRCelB3VzVId3p1R0lTZWQ1RG0vRzgwTzZ0bFJJWGVyVERYMVZt?=
 =?utf-8?B?QXd2dENuaHIrdlcxamVlVzhDbUdvc1ZyNzhLOHprMS9SRjlBRks0UDgvSnVT?=
 =?utf-8?B?U3VReUZhaDYwWVNtUzNyWjhkQytmQzEzUHRjVXBwM1NzU0d3cDVuN1U0YUFh?=
 =?utf-8?B?bnI3bDd0MlRWbVltNEFsY3I3bzR0Um9SS3g4Zk1ZUzQwemhKcjlUam96Ry9h?=
 =?utf-8?B?dnAycGlsN2lsc2FXSEdaZjdiVVkvM09XblE0Z0pQTllXSFlpWmUwNVVJM0hp?=
 =?utf-8?B?MVFEWDlramZWbXNmQU1KRUNSbjlsRXVLcnVNTWJEMXFJY29QNU1renJOTGZq?=
 =?utf-8?B?TG9JNEhRRzJnYUoxcUdQMzJQVndlMk1qS3QyRk9mekhucFlGTmtUNTdiZjJs?=
 =?utf-8?B?ZVhmZkdoclRtWjZHNUR5SXNvRjMva3c4QXNJTFJUdGhSYkNDRUYwVytwNDNs?=
 =?utf-8?B?QjczZmNPRnprL0xrcUtpNDdQRnRtK2hWMmV6UUxOYlNjVjUrb1NJT1hacHNs?=
 =?utf-8?B?LzRYNmYyZWNqREMxSEFSbkNZbnN6a0dwR3pWTWNZeHA4bkt4Smx5T3lDSkow?=
 =?utf-8?B?dmpTSEN5M0dGU2VPK1NpN0JGNytJTHNNeHBDeFFjM3lzZkdjQzZkRzlTa1V5?=
 =?utf-8?B?aEFWdTJlVERBN1UvOTErSnFBU2gwZE0zcnBMZG9RSEhLZUxnMGFXeC90eEZO?=
 =?utf-8?B?emxPRjhUWCtiRmZzbWRycitNaWtsZWlhWnZ2U1FvQzVuRFgwMHJCSkhEVjNp?=
 =?utf-8?B?a1kzUVp5UnVDeUEzRTkrTktMMitHSWZ3VE5pQm0wOEovZ29SdW9ZVXd0OUNC?=
 =?utf-8?B?b3p3ZnBoeFJ5QStDQXdlUGMwQ25pcXVyMFZZNzlSUlliY2kvdE5hOERVUnNs?=
 =?utf-8?B?RjJyK2lDYjk2eTFVWlAwSDh3ZFNxVUh5dlo2RVJUemlibHp6NlgxUUFvS0ov?=
 =?utf-8?B?engzR1pEM2xtRCswVC9DVm5NUGxYRVNlNEpJY1cxQktySTFoZWJhT3k3RjF3?=
 =?utf-8?B?NUV0VE5jL000Tlk4QVMyNzZFSlZHQ01EYmNScWUxeGlZUTRmQmhnR2RFdTVY?=
 =?utf-8?B?RWpRc0RkOHlYVithYjM1T2IxSmZsMkZIT0VuUlo0VzhYOUp1eG5IVlB4aDZo?=
 =?utf-8?B?WjRhd2QvVG5oSGJjVEkxNUdPUGhIZXlmS3p2TWNvS296bStSNnZ0Yzc1ejg5?=
 =?utf-8?B?R3ZkWlhwNE5LUUZ1T1YrazJiZmRsY2hYaGVTZHdWaGFSRjFuUHhTOE5RNjR3?=
 =?utf-8?B?ZFZrVUhpa1AwSjhLVVdJMlBwZ1dXcGk0WGxxcVN3UG9XbXRYcjFlc0FpaWNv?=
 =?utf-8?B?d0tETDlQOGh1QmU0TGdLb2dMTWxHdWNxN0hTRkkrMEx6V0ZyOGppdWpTK3hx?=
 =?utf-8?B?R3VpMXFzSE5lWTlaM3hFYnd6all2bUhqejFKRlV0dzdsVWo2UVJpY0Z1UVJ1?=
 =?utf-8?B?K0svNmtlRzFONjZqbVF5ZTZDclUvVEl6TjZFL2lvd0J5MFFLTlkxQzdUWlk0?=
 =?utf-8?Q?E0YComFw9ADtLddlTCw/Fp/b9Y9uuj1q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anc2eE1uM0pFOGxaU1dabC9kOFZaMFFGem12SjdGelc3VzZtK2NGN1dmUnR6?=
 =?utf-8?B?OTVEamJSTWVsa0ZFbjdkWGhUWVNramsxRUtzL1VCOENYdWhQWStmWG4rK21q?=
 =?utf-8?B?Q3FsbWhrMm5xKytxRDcralBnSGZRT0lCa2ltUnZxTGNaQW5sdUUwRGxoeXh0?=
 =?utf-8?B?Q3pDVlVyUERCblpmbmVCVzJ6RVJTYTFqdHExV05RNk94WjBOZ2dyL1ZSOElD?=
 =?utf-8?B?RGZQT0Z5dWxoYTFwdExXWU95NmxuYU92RktiU0xqdnN3SGlKbDNnaTdUTGUr?=
 =?utf-8?B?R28rQ0ZPZ05zU0xTS2NQVjhGTXpGa21EL3JzbzJLZUpsN1kyZTF5dTRYbHRT?=
 =?utf-8?B?clBiS0VsQmNWT3pNcEpNR2phZC9jWmxpVVVNVi8vOWx1YWplU3psSTJzTGw1?=
 =?utf-8?B?TmhNajFaNkhMUWpqK2FyZlIvZUdiMkJuZFBaWHpVYW0vZktnN1poSFlwRWZW?=
 =?utf-8?B?OTgvYXB1aWVSZnR0Y2Q2c0hGdUQ2QnlWejZwaEQ5djY3SzRJaXVvVDdPTExN?=
 =?utf-8?B?Um8rQktiOWhhWm9kNjZNbDVnSzUxVGwxL21PdW14RE5lRHp3aFU0K1VyUVBY?=
 =?utf-8?B?c2NjNDJnMHdqTU9FdmRlSzRpSEd2TXh1V1hOdDlQWFIzdG1WNlZqNTFUYUlq?=
 =?utf-8?B?aW40M29OdTcxTnJoL053a2Zyb0ZvVUkydUtBd1d0T2hBR3JscElhVU8zKzVs?=
 =?utf-8?B?dDdPUVM1dDR4RUJtdHlSMkpIVlBhY3V1c0paK0VxaUo3ZUJzR0JHbGZBOEIv?=
 =?utf-8?B?cWZ0NkFWVk05QUtXMGc5RDJ4ZVI2Y2tTcXJ3NmErdlRVWEJtM2llQUwrWDlr?=
 =?utf-8?B?NHNlMWRUUy80QW8yalQ4RlI2MURmUW1KakVXTFlIN01meVJPY3M0a0pwaWNX?=
 =?utf-8?B?SEpjTkZzRVlKdGFMMTh1VW9EdENjai9PMTdNY20zcytuY0ZyQkI3a1pOUXhw?=
 =?utf-8?B?MzA1WVE5Q3FqWEdhUytHZERERHBiempLRlFFTWlDRXJTcGNuMnF6ckJ3Nkhr?=
 =?utf-8?B?eTU0OWUvT0lRN1hhL2MwMUhiQk44a2wxenNlUHNaVFBOV2ZtdEZzSWRuTUpl?=
 =?utf-8?B?aVoxMnViUitNU09Qay83bFdmZU0rWTZVWjdIKzQ3VGhubjk0RDRhdDBkT0lE?=
 =?utf-8?B?R1NJNFRBWHhxSFFIV2U0ZUtHTzR3b2NlbXRSUUxVcE1haTdCYU9LS25hQXcy?=
 =?utf-8?B?NTBiUEdjVjhKcWtRemxrU081eDZPdFV1Qzg0V1E2SWo3ejRRSHgrWEQyQ29o?=
 =?utf-8?B?RWVoK0Voa3daeTVoTlRrR0cyUGZBaHhvOENncGh6MHVUZnJBN3JwSGl5ekVW?=
 =?utf-8?B?M1E4VGxsMFMxdDlxTXNmZnZRWHo3ZEs5YmZCSGRzR1RnZDlMUWdUNy9mR0JB?=
 =?utf-8?B?YnU3aU5TalpSdE5rZkZSbnk2TkNTWUVqSjJMV1duQkdyTzV5T2w1NHBUUDRL?=
 =?utf-8?B?dkd4cmNVOGlYZDBrc2V0U0huUlFXbCtxZG0vZFB4K3RiaUF0cGNQT1YwK283?=
 =?utf-8?B?SGREeUVjUHJGTnA4a2pUZklyNWJITGJGc0t6TWVPeG1LbWZRQ3JYK0FjYyta?=
 =?utf-8?B?bFF2QVBLUHRjUFFzKzMrZ3E3cFhCSkhsYmZSYS9FNzM4N0phdEY4VEV2TGlU?=
 =?utf-8?B?cFFKRlpUR3JEYW1EUFovdVpJa0kvS29YSWlSUE5oRTdQU0JaSU5iTkl0MWwv?=
 =?utf-8?B?SXB3VklickYxdHpjcGhPVk1BKy85cFloRTFOcEdxSkJoU25mdkFtK3NYTlkv?=
 =?utf-8?B?NXAzZnRvamMvbWpaa29PelVyZC9Vb05FaGx6ZndmL0w2VTMzTDVuNGJtdmNC?=
 =?utf-8?B?QXBYb0xKTGtkRmVuQUhYd0ZhSUpoY1hUZmFCQjJMYU1jdE5DZS9sNDBYSXRj?=
 =?utf-8?B?VUt2dTJwa3JKS3JYQzhrcXkwVlRNdDBodFYwY09zcE51WXhOT080dlN0bEJ6?=
 =?utf-8?B?NW9OSGVuS1lNS0hzb2ZyajRBRWlTVFhoRUllSnFqRjFWL1FHWFZDczJRZE53?=
 =?utf-8?B?VVpDT3U5STlBMmlmTmdNZGRhQkhWcnhwT3dSamZkVC9nRVBxRFZZTnBUSlUy?=
 =?utf-8?B?TVZ2eVNtcHNkNWRsSHNnWWh2WmJSTWtnNjdPVjFodkFUZHl1RmlkSlE1UHVW?=
 =?utf-8?Q?ZUsguLfygdiRDLfp2Kro1s6OY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 691df5a5-2842-4187-7d8b-08de1740ffe0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 23:15:07.3530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ruNWq2g9AsNyiBATU8CG9D1qAmdTOxWpqgSwbs/HKKRVlJNQWjnHwElQ/v8/+ALsfx9NmHx79OxwlApSGtSfRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8890
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

On 10/29/25 8:02 AM, Timur Tabi wrote:
> On Tue, 2025-10-28 at 20:03 -0700, John Hubbard wrote:
>> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
>> architecture and revision details, and will instead use NV_PMC_BOOT_42
>> in the future. NV_PMC_BOOT_0 will be zeroed out.
> 
> I don't think this is correct.  ARCH_1 in PMC_BOOT_0 will be set to 1 in future GPUs.

ah right, thanks Timur! I can change it to:

NV_PMC_BOOT's ARCH_0 (bits 28:24) will be zeroed out, and ARCH_1 (bit 8:8)
will be set to 1, which means, "refer to NV_PMC_BOOT_42".


thanks,
-- 
John Hubbard

