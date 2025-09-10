Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E649B50A1E
	for <lists+nouveau@lfdr.de>; Wed, 10 Sep 2025 03:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA32010E34B;
	Wed, 10 Sep 2025 01:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ILk5oJJM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF09210E34B
 for <nouveau@lists.freedesktop.org>; Wed, 10 Sep 2025 01:13:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgKSdyqYfjZqxJqkfbf2p44bkQ0yaWHJdewRl3rF5Jrc5U56pYbolKc25XSXrDuF1mdbz7jkrxyfYn+LR3VOwI7SDD8+EVOICVabDu9Gvz/5/688Swvi+XM9cDAqgK9jQ33qO5oyYEkH7Nf1FpkqXq4rd7jI32GWgtw5IcSrA9Q80loVyYU2hrQOvSxYaK5RbO8rONodVQp2th9i0uvKQxwTN67t3mV74m7bOQI5QE6ufGT/usaKk+yxkfU1Qe5Pg+TKDYyKvrKe5D/SzA1UhCDBkHeMS6BnYed3dhshJ3UwptdOgazefTduoKYRrNTJjGWdEpgo3yd4dj6O2Plx6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nVVtPOoTtWEKMLffxKr1twUTiEekKPp1kvGwXXUHA0=;
 b=cE+Ax+a3WgoM9YHKgDiTWecFmjj4YVww0LzUI8JBgZiQv5bbu4XgKsQNklo9psKcJv78kQQoi7Pdpe6OOB+Rrxb9LZtxTyCXoskAfStLlkFRF180l+eEJeJ3FisWGSi59gLnfQNc3df7g7ZY+XIu5xzBJFotlYiwqkdzJNssXqyrBSQXTfQ5YWM+bJg7lp+EgPkvpYXqn9IjcJp820mODI63KrAU+06gjgMosiEJUvvmZzYhUduQeGlXRm2v8UY0beri/aImITQoOaSqZV9sedojLUkrCDqG0ladac8CTeG5qFpbo5tuWok0ql5sB/f+3IKkxgbxwdhTtVIiuEYFag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nVVtPOoTtWEKMLffxKr1twUTiEekKPp1kvGwXXUHA0=;
 b=ILk5oJJMrEgq9APbJtgefrRAT9F3ip7ub7xYoGW6G75/PnS5sYaebfHjlDWz0k2CAnqD7klSA63WoxaBiS/drfeEff85Fc8J2NpjNPcJgNyu1ghb1DMTfbsLTAzZ+5VSbhlRLgmLgld1piqVeNaBTPbkL6rz2ARAaW8fI0ffRA2UKSnPH25DR9n8Ab2X8e7a8HSdpBIHFoG9oXneShMhmBg8CrFF7YBcSFmLTwdsknj+P2L6DQHQy4UL454e2KcS48FtycOcfTG7AfhoPzkmCN0TgtD15fVGRk4y5tX/kau2OYKR8dSg65QmImCIyGm5XNthrVCI10NmCIIiQIWFaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ1PR12MB6337.namprd12.prod.outlook.com (2603:10b6:a03:456::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 01:13:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 01:13:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 10 Sep 2025 10:13:31 +0900
Message-Id: <DCOPZN5K1NLO.3419N564OCX2P@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 0/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <CANiq72mYzgx0dB+yO4BFBRCNEKBcONx56Jp=h7HKVXzkbRn_Sg@mail.gmail.com>
In-Reply-To: <CANiq72mYzgx0dB+yO4BFBRCNEKBcONx56Jp=h7HKVXzkbRn_Sg@mail.gmail.com>
X-ClientProxiedBy: OS7P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26d::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ1PR12MB6337:EE_
X-MS-Office365-Filtering-Correlation-Id: 1263e55e-3bac-4584-e4a8-08ddf007439e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RkJrNGlxRXdLTno5WE1uZ2tmTXZiZ3N4dTZMUUVkb0szTlF5bUNYeWdlUFdw?=
 =?utf-8?B?cmxiaXV4OEpra2paTjU2RE4yRnhUSndFZHk4dGFyZnE4ak0yZGRMUzl3WWwy?=
 =?utf-8?B?VnRNTXhpWWZ6ZWY3WlM3WEVuSnNlQ2tVM2RTK3VVMTVoODd0Z2E2MzFPZm9N?=
 =?utf-8?B?WDl1ckMvc0V2bitseEJkRXhUY1pGcmNIZ044b0FabnVnN1pQeDA0RGl3SDRU?=
 =?utf-8?B?d1hVcFdaTzI1OUdwUXVXeExMb1oyeEI2T1E3YWo5ZkVvcStyWGRuNE11TFRv?=
 =?utf-8?B?SGc2UXRNTEpyK3VwTWdjclN5d2g0TG9wRitWcnN4dVcvYzRiNUVCWWJISmdI?=
 =?utf-8?B?Q0NLeWJpWVc2MmRETzRyeTBOSG84VGFvRUNwbmVyVEd5N2Q5VkU3S1JqdHMx?=
 =?utf-8?B?QWNHbTB2RFhLOTZGWTJCUFNzUS9BOEZ1WTJmMHNGUFh2U3g3UFlWSVphOGtM?=
 =?utf-8?B?MDZEMzJKbFNyNDBORWl3SE5GUWhkYWNpQ1d6Z1Qwb0RSTXg4R0ExNDRoS202?=
 =?utf-8?B?VnVQNmNoVCt5c0h5RkpzVS9NQ3dDMnpiQktpdGY3S1Q3VUVQYjNTUDBOZkdI?=
 =?utf-8?B?WUNBMEJMeTdIN0p5T0JiNUJhRERKWFltU2ZmYUk4OEdoYUIvWG5IdForR3hu?=
 =?utf-8?B?T0dGQzhXek9YdDdSdTNncWlvclRPNWw2ZTkzRzJxaVpLRVA4bnArdDhBdjRU?=
 =?utf-8?B?RmJPbnUvSHRySkVwK0pnS1FwaWx6M1lEWlBNQUF5OTBGeW1QcjZwTjZlY280?=
 =?utf-8?B?dEhaVDRrWG82UkRwWjFJK0lNeFloc2g4Mm9WbWI2QkNHWFlzaXhLMC8yL1VI?=
 =?utf-8?B?TTNoZjdsS090REpLMFpoaG04ayt6TGR4b0xLbDV6YmVGcjdwZ3ZzTFNEV0VR?=
 =?utf-8?B?WXU3dG4za1ZGU3k0NDR4NGJjSXpTbDM0RXRQYjhxNmxyYlNmZlZMQ0E0OVcx?=
 =?utf-8?B?b0V0eGh0V1E3MVZJZG42TmJGYUhyektjNnR6UWF3NlMvcVdtM0pBdlYvZmNh?=
 =?utf-8?B?SU9rUldEVmVVa215bWI3TC9CVEpVbjFTcU5HTGhHUFFEVFFMbFprVVhRSU5F?=
 =?utf-8?B?a09ncTVERGFhbGdvMElzc3pBaVJTS0JiZkRTNW0yeUw5SFYwd0RPL2J3Wm00?=
 =?utf-8?B?UDBDK3hQczFJRkFzMWJpT3VpUERDZ1pMRGcyWmtUa1NjcGdOZmVZRjBTWFZ0?=
 =?utf-8?B?dFdjcm9jUjc1Z3haMTdCMVJkSnZwc1BDVXZRMUo5WEJsMTJJRmRVZG9OQUZj?=
 =?utf-8?B?bWdKNzZTbG5VSDhUV01WZzRnYnUybFdIaXZ5enR3RHcrcUJnZkFjNkV2ZmlV?=
 =?utf-8?B?OEJhU1RCT1lWNVpnNzgrcjF0QTZiL25UT0c2em80YWJ2b1dueUZBRENNR2R6?=
 =?utf-8?B?L1VnWkd0Qlc5WnViYXE4cTdaOVV0cTc2NGdtcFF3cnVhbmh0WVNYcnQ2TWtv?=
 =?utf-8?B?d2M5d1NsMXFKa2JyaEY4YmlqV1VTZGFoR1Y4aGorcUV5azhxTUFqeis0bTJx?=
 =?utf-8?B?bEJueXZiWmFZR0hNUVFGa3psVE1kQWlBajJnbGgySVFoOWRLSlZlb21lc1Qx?=
 =?utf-8?B?aEVRODA1OHptY1ZzSUM3R3BlMlkwOFRsWTZCNmFyUTFjZnhlK1VYQ3lUTUxB?=
 =?utf-8?B?U3NDZ2N2elZKcW0xNDUxalgrS1RWeGZvbGVYMnBGS3orTEpseDJOQUs2ZmJs?=
 =?utf-8?B?UjJ6NFJXVC9Td3ZxemVSUTQvb0hzTEl6TlNoUzJKMmRUczM4OTJxb1ZsdkFo?=
 =?utf-8?B?ZlZTR0FxQ3NJQ3FxajE2NzJHbXlqMDkxT0pjR1dtbVVPb0RFTkJ1WktELzZH?=
 =?utf-8?B?cXZLajQ1OFNTOEVPVVdxTCs1dFFXcHd1SXZjakpNdm43bXlYOFVPTXR1dXIy?=
 =?utf-8?B?TG53aTVKUmxFdjMwTm4xR2F0aUZZTm9wb3ZWRDZyL0ZvREdFcW9ySTFYL1Rz?=
 =?utf-8?Q?rYYtaZM3bIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG53NzREY1B1SXVVVGpjUDBCWFo5aGlnMDZhdmFwTC9PNFhNQ0czbWVROVlk?=
 =?utf-8?B?SWd6L21wYWl0VUN6QXA5WFIzeFU2VkpwWW9HM0tsZytETjh0Wk82OVBxKzRx?=
 =?utf-8?B?OTVjSVBYRkMxM09PZWNJYWpzK2hlMnBHRHRRZmlkV2VhVnNoR2diQ1E2ODZn?=
 =?utf-8?B?d0dLQXFrVk9oMFlYdmtIVWxGRVNUbVcxVTBicmVxc1dPUzh0VGpmNGFBbHpO?=
 =?utf-8?B?SEIvNXRoUkppT1Q5VmNnTnFGVlJHZGxwLzMrL0I5OGhoS3Q5emxnNHNjK044?=
 =?utf-8?B?Z2R2WVh3SmhiQmpOdzNNdU1JdlBiU2w0MVVlU3NldnJ3RGZUOXJTaVFvRlZD?=
 =?utf-8?B?SlVSeTdNeGE1TVVTWkczViszNHdRZXQ2RFVSblQrdTREV3NRQzdUd3VvZEVR?=
 =?utf-8?B?dXQ0ejRTNExDc3VOS01RQ3B5UlVWSjQ1SlhkMFhtRk5QeTUwd0kvLzB4UFdF?=
 =?utf-8?B?UXA2bGNFNWY2b0dGZUpxVTlvTXVKc2YwM1RlMytVVUU2dHVPaVN1cmtoUG8z?=
 =?utf-8?B?RkFMMWNyNGcyVDQ3R1VVOVRCMWRFTUMrRGk0NmZSeGw4R1B5R1hvbWgxbHkz?=
 =?utf-8?B?T0RoU0tGaDI5MG5GeHdXYXI1ZTd2NmloZnNJdjMvRndsb094czVRVGIvR3Vr?=
 =?utf-8?B?aUtOeW5tT0ExMmtISHlOTHRrdjJuVkNxS3pyZEsxUUhiUVlvdk5OOXlOa2p3?=
 =?utf-8?B?emFpYzVzY0ljV3B5YmRMeCttRGJqei9iMGdLdzcvTTJ4bHdwdUlHUDdsREVF?=
 =?utf-8?B?OU4ybFd5bnd1amtjZVhrTVM1TmN0VmZ5SGdZQWhzbFdtZS9IcGlhVHo1VEhM?=
 =?utf-8?B?RGRkK2ZobDZKNHRIUnB5bHdtd0Z3RkV6ZkhZM01LRnlROEU3ZDZtZ0hEKzE4?=
 =?utf-8?B?cEZDWElvaWlabHpNN2hiY3ZWRXNqMDUrY21TM2NmVUJMNWc1MXBzS0EzU0Zw?=
 =?utf-8?B?c1M0aFY5bzNTdjM1M0R6QU1PcDhiS1R2aHYxdXN0S1R6Zmp6MXVxQjNIUFI4?=
 =?utf-8?B?RUxIZGdnSlkxTkQ1YUJtc01JbzhqSlNLK05WMWZFVU1JUHQvelIvamF3UlF3?=
 =?utf-8?B?dlFoMVowU1JJZTlnVC9Pdkp0R0RNQU9vTU5yNmk2Ykl3NTI5bHZZMHo4RUs0?=
 =?utf-8?B?RFE4NytiUlh0VUhPZ3pseERmWFo5QWhtdG0zUkhVOEVuQWQ2R0swdXlKZ2NN?=
 =?utf-8?B?ejgvK1E1bzNkVVJzZnVFOWZOQVdsYXNCMjFudzFWcFJ2b1dMZkNkRUVnQzBl?=
 =?utf-8?B?ZzdMc2UxYnFUSWVDamRUWEg5cUI1T1F3RHFvQjg1QTc1cFl3ZFh5OUs5Z2lX?=
 =?utf-8?B?SjJJVTR3L01xcGpHdlhiYmlHTlFSMDl6RmlvQWdvQk90Y2tQcUJZYlF5YWMr?=
 =?utf-8?B?cVhKc1pkQXRnajFSQmZXOGp6VHJQazVSMWV2YzZSSHcyeitEVEs0M3JBUFEv?=
 =?utf-8?B?VFRwWVRHdVNCVFdQc2d5OHRibWZrWituMUYxdWJEQ1JSZzhMOVRjZFhJR1Rr?=
 =?utf-8?B?TUJxQjBPRm04SlVGY0FOeUdSK0xTVEgvWnptQit4OVRNU2pwMmoydXBaL01M?=
 =?utf-8?B?YTB2cTNsVU0vOFpVV2l6L01QZnBjdDhUczUzVXVMWVgxMlZaYWtqR3hub2N6?=
 =?utf-8?B?Vkh4dC9VbnU5dldNeFBOTU5TL2FnMzFLbkd6MG9yRk8zK2RnUU1oc2FhM0Zn?=
 =?utf-8?B?K0ZjTkZFUkxwTUZjS2ZNamxjcTBZaFlwZldRSk1GVUNZZTBsTzNUbjdIT1Iy?=
 =?utf-8?B?RzR6bmFSQUFFa3NWTnE0MTd6eDJKZ0UrNkNKNGl3MllnWFlRbmltV04wVUo1?=
 =?utf-8?B?YUlxLzlia2tFbjhOTnFqcEcyUm5qaGlJMVorSXZqZ20rY3g2MWlrQ2t1aTND?=
 =?utf-8?B?ampUZ2hqMXNrSFBaeUtYQVFMNzlTQ3BYckN1Rml2MlNvRDd3SWZZcmFmZ0xL?=
 =?utf-8?B?RWxrZHdoalZ6R3VCUGFDRXJNb0ZyR1kzNW1oWmc2WGptb3VQQTJzdFFNc1RR?=
 =?utf-8?B?QzdZTmFCaVNRQTVUbFVZeU9vUHl0bzZHalZxcEpualptQ2hoVlpqOFpUUHBn?=
 =?utf-8?B?R1pOM0d0NENVVURtaXVTTGhwY3R4TUtMTDVpRVkzYkdHK1VOT3IybEpoS0Zu?=
 =?utf-8?B?ZTYxbnRYb0N3S2d2UFpUK2gxSVZOYWg0ajVYVGJ2dHNGendncURJdlA3VytT?=
 =?utf-8?Q?VbEh5+Wwd+vyrfTxHdsyzH3/89dK2bbOwGH85iiOhv+y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1263e55e-3bac-4584-e4a8-08ddf007439e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 01:13:34.9012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PawF6px6EYr8V+0D1tVC1ml8OuQV2qpG4BeHMz0Ul0EDsn+BS42bFqu2WFfed2+YG8+E8NCKJy2skC5BgT+pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6337
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

On Wed Sep 10, 2025 at 7:04 AM JST, Miguel Ojeda wrote:
> On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> prerequisite-message-id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvid=
ia.com>
>> prerequisite-patch-id: 2439f5f9b560ee4867716f0018b5326dcd72cda3
>
> I guess you had this in your branch but is not actually needed, right?

Right, that will leave one potential use site for `Alignment` but it
will be removed as that patch will land, so it should not be a problem.
