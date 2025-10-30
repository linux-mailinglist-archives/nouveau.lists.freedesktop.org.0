Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EE7C1DF61
	for <lists+nouveau@lfdr.de>; Thu, 30 Oct 2025 01:54:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D3F10E871;
	Thu, 30 Oct 2025 00:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K3q01x6K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A7510E871;
 Thu, 30 Oct 2025 00:54:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4IG2SkaZFqv3pkmedQy00w3Dc3I2PifDt6dZswLrtl0r7LY0hShH6HKgG6BFlhp/I7PeLCI8fLWS1CxT0hSMmtNKw7IZk6iQzIyAoveED9ATgWRr31hbHa4f9BqekpVoOzy3Iz5wZHK05Ag/uhpnZJRh2HC+YpDFMz9xJQHcOsDGjHOmSRM+g2Ug1SNEs5ecol1S/6cl/DKelghefWRAUDIfNp7XkKmZ6jvn2bTwQDoFvSkyB28LvNx5tG0b6Qo0la+i999fKMcg/qjo44yAthWyZCrn5xQ1fGHRJZjisjzFlivtzuSCwd6JgRdKLHB3sr4xQk2v20L1j9et21m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPn/xMM6/rH+YtdfkCRDakV7cKSqkycl2TE4COtFA98=;
 b=crgzkW++eutv56ec8cozIGOiBr7d/9kx5nI0CHa1rwnAp23OVe4FuDuC/sp8qeELeq33zffFgsWky8PycKwE4y6VKMFkmtQXnmDdzCSRtcK+J/pcKfVlnupRB3ulPoY6IGhc6WjUiP+gm9yT30+ng/B375iSWZ/OXw3L2VH6DVkXGRBW/KOyuDL1RaI/nFzyk2UYVgj1ey2haZrs/C3mI1Jo+XFSJe1oJHpKy8nT3tFP+HUeUM1Ruho6bbkhSq4oKCCwdeBQ5Wkm7UL9llsdOgbkhxi0QQwiWES1h4dYLDISCXnTdlWrVstKv//2DAf1KrCeLZ0J1IH8GgNb8/3jPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPn/xMM6/rH+YtdfkCRDakV7cKSqkycl2TE4COtFA98=;
 b=K3q01x6KaSZXZ8/L+j88xJrHxGQ1k7tmzj7lfbaG1G1Q1zqzoGP/9H1tytXld52Xatqg7b9kk07vcH4T3BIeEU/fmIu4yLeWMlcbgYAUnAXLinYS7FRAluCVlnatdmbjDpeTAqtwg3JxW7JCDVMJIGjqeCpP0w2wHAW34yH1KV8mE/9fxK+si6TU1RtkWVEsYxDHnJ9LwZAVdrq22mrtCxH+7q5DOgeDV6RnKvwhVJwvyW5bnT2N2XB5YJppfPCG05GYZAiu17M3kG0CX5OrfRsoovFhcWWVWabieDCrhLBCdv+HCmHIZ115neEXPSfqzh95j3zcdi3GtepkDofMRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN2PR12MB4160.namprd12.prod.outlook.com (2603:10b6:208:19a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Thu, 30 Oct
 2025 00:54:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 00:54:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Oct 2025 09:54:23 +0900
Message-Id: <DDV8W8QCD59Y.1HXCXMUS42JI5@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen
 GPUs
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDURPPIWWIA7.27RFSM7KRLN7I@kernel.org>
 <DDUUUUL0GXAM.2LNWCIEW124JY@nvidia.com>
 <b0ba09ba-5e28-44c7-b9b3-e199bb968fe6@nvidia.com>
In-Reply-To: <b0ba09ba-5e28-44c7-b9b3-e199bb968fe6@nvidia.com>
X-ClientProxiedBy: TYCP286CA0152.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN2PR12MB4160:EE_
X-MS-Office365-Filtering-Correlation-Id: e4ddf4e1-8f20-4c61-c82b-08de174ee14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWlRZzU4Z1prWERvRG02djZVcVEvU0VOU0dacFoyQ0g1UXpuTXNIODk4N3c1?=
 =?utf-8?B?SWJTQ2U5clY0cE5vRTRmV3U0bnhDS2dHVjBQK3BZcyt4QXR5L20xK2Z0SlY1?=
 =?utf-8?B?cmd1M0QwRExVK2hCSHZKbFRrWmxXaGlvOHdzaXphQUx6SHROM3Mxb3k1anhL?=
 =?utf-8?B?ZGxkbExjRmlzbGRHWU5ZN0ZMc0F6TTk3dzhnQVBjTFEvdzlWRGZOTVdrNTNz?=
 =?utf-8?B?SFBndHZCSmJMd2F2dmJSRG9UeDBFUVFGdEEvOUQrcmQwT1dTOWZhT1NYRVlm?=
 =?utf-8?B?SlhpMk43c2NEMnhWYkQ2QU9oQXRIUXp3MHQ0eG10akpxUGtUK05KOEtnWWhI?=
 =?utf-8?B?alNqaGRlS3UwRWZXTk1RNHl4M1Frc1l0djBVeHFNNktYTzFLTE1Pcm8zek93?=
 =?utf-8?B?aG1mVGE0UXAwb3orNUlEVzFBY0lpemdscys0VEpJWkVXL3NweXJQSUQ1NTZU?=
 =?utf-8?B?OE5xMVYvc1F4cGZRYXc4RmxxUnVtVmVYc3J3TzQ3aTJXUmpzS0dDSDNkOXA4?=
 =?utf-8?B?d3lQU3dvOFFNZEwxeFpVZVdmWEdacWxuc3RwZldRYkhJS3Rrb1dqQm41TEFF?=
 =?utf-8?B?TWcxSkNpeDlCcHV1R3lxdFdXSzVXNEpxV3lSVmdhL0loTUtLUFJXdTVuQXo4?=
 =?utf-8?B?L2JQVWovTmFCQS8vdzErK2JVUXdlWlp3M25xQ1ZrMGxUeldZeWppR1N3bnVi?=
 =?utf-8?B?dGp2N1VWQlM1eVpXc3VDazcrQ09wZU40Vk1LcmNhcTd6QS9abDliL0FvS01u?=
 =?utf-8?B?NjFpallBNlBwcXNzRS9aNlIrR29jMjZYeTFmSDNlZU5nREl2Zk53M1lmQnpM?=
 =?utf-8?B?OFN2YmdQUVdDZHdPNm4xYXh3MlZYZU1rR0thTVNzNWZ1ekhFZlNkaE9LQS8r?=
 =?utf-8?B?NmJBQ3IrbHdhWnl4TFZqUys3MzNwU0JtamdkZDVweFZaSVVtbktxU1owNkll?=
 =?utf-8?B?czZQSzBNY0JjTVpNb0ZHZjRJMHhqMFJjOXlVUE9HVWorMndtWnV5T0VJM2pz?=
 =?utf-8?B?ODZrU0I0UW9EdnFZODdSS1hWQnIwNTFET3U4ejd0WjM3T3VvZ1hEdFlKcWVO?=
 =?utf-8?B?eWVjbi9yZkozUGxvUWp4dmZTVGhQMmZSQjRjWFRWMEFwL0xSZjlrYUZlVUNq?=
 =?utf-8?B?U3NQWTdIRU13Sjd2Y25uWFNFN00xaUliR3NyRTl4b3MwblcwSHByNUdmc2xu?=
 =?utf-8?B?bTJPRkxMcnhOVGFuc2l2NjVPNnkxOEs3Y3dyVHpEQUR1T2RQUDVKVC9SV2I5?=
 =?utf-8?B?S0JSYjJnOTNGNWVuSXBtM09qdEZQbXBaRllzRnhSK0FnNWtxbzR5bEcybTdq?=
 =?utf-8?B?c1pUOW1YODJxc3htVjNCOVZaeWpBZDgvaWVUUk5Oa2V0UDgxWitoc2RQVldU?=
 =?utf-8?B?YlF2eFcyZnU5eTc5SzdHWktWOHM2Z3gvMjErclNnMTZadkJyL3pwT29sOVZr?=
 =?utf-8?B?SVJoRUkvL3VxczFFa0p6ejdrYUxSQWI5b3phZ0s5K1dZLzhwRmliQzExelVO?=
 =?utf-8?B?WE5FMHBaSjUxMU5MZll2YmJZWEJ6VnMwSWZkV3pHaTd6aCtnZ0E3eXlUWUpJ?=
 =?utf-8?B?d1h4ZXI1bm9pWWpoSkRUTEJvdDhsbGIzaFFQb2xFak1vMGtrZ3BDbUdwNHAv?=
 =?utf-8?B?R1JmdkJiSVozSFRRUW54eGRqVVZISWJtc0NGeWloRWRtcmo3elRvT3lNdGlK?=
 =?utf-8?B?a21ZMWxiWEJmVWdQY2piUHBpSE0vUGdpRTVIN1hPSnJXcWR6OXJWK2hzYXds?=
 =?utf-8?B?eGtKVm0wMWhBeTY0blJ6ZkluNnpzRzA5S1RQSTZrckRkSWd6YTV6NWhKUnhX?=
 =?utf-8?B?Y0dob251bE96ekEwUDA4b0xBUVRQMXFSQnRaUTJwMko3QUhZYi93dGhxV3Bn?=
 =?utf-8?B?Tnc5SElGVmhPRm9rK2dSK2xVbEdUSjU3Zmkybk1uWG95RWZZMlNtSC9zaStO?=
 =?utf-8?Q?Q3hZW/J8zaujnOsAI56hpxlB8l6BVaIY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUR0UnpzdkcwY1VGekNBL0dwMGxqT2JpR1Q3WEh0TjFuUDI2RXhjRUQreERM?=
 =?utf-8?B?cEZhMFdTRlBkZmgyUjJwVnlwQi94VS83SUxBazErRTRPWCsyVUw3QnNsTUlM?=
 =?utf-8?B?ZTF6SnhwYllIUnhxeklhWkZOa3lqTk1KSnpLN0NBZ3NYNk1RVVB0Mkl6a25X?=
 =?utf-8?B?YUFhamJLcXQzUTNleG5vSzI1SEZZQXYwa3RiNmZqSmlQRjBNU0kxeUFVSmVX?=
 =?utf-8?B?cGxwVFh3MXpaeFBUclRMNG9EUzkxTVEyejFUZk5PdmhEMDY3K3pROU12RDYv?=
 =?utf-8?B?SlE3Zi9PMUV4NnQ5azZwRkE4cnlaTXU1VmQ1SFQ0M0VOb3FTRnFEQUZJdTNW?=
 =?utf-8?B?VFg1ZkJWejFTZVFYSjNOeXgzcXFjWlBwYWpPank2MEF2L281aXg4eW9SUElQ?=
 =?utf-8?B?WFk1WEx0RFdZWGRGMHBoZWNPem5rb1hUckU1U0Vlb1QzQkMxejdUa3lRWWRz?=
 =?utf-8?B?M3FNOGtRZXhBa0Z4Y0tZOW9IdnY4R2xFTitkZzJxLzNaVytNMFdNWkMzdzdy?=
 =?utf-8?B?SWRaNHRqT2gzbmYwb1NLZ0RWMExBY2E1VERJZ1Q4WkdrREVtblBDUjlqVUg1?=
 =?utf-8?B?dGNkVXRoU0pLc1puWXF5dmI1S3BVdDZveSszNEhxNm9qUkp2NURGYUE1bjFD?=
 =?utf-8?B?d1FJM1BJYW1lazZ5V0h3SVk1T3M4U1JONE10U2szSzM0K3ExVkZGVVR4SVI2?=
 =?utf-8?B?OEl0NXF2dWkrSnpRejVHTkVpU0tKMzN3M3QzRm1YUk94VDcyWGhKWVJOYnNW?=
 =?utf-8?B?WlBQYllnN0JJcWFDMDY2UXArM3VwSFIwRWUwVlRUUExGaVA0a0xtN0wrYkIv?=
 =?utf-8?B?bm1UTXlIZnF0OE9aRDByNUVkK0ZwWTRUc0JhMmV4Tk1XSU5aU0FtTVBHRVQz?=
 =?utf-8?B?WnpXRStubndUNTk3RDdTWWM0bUNXVXdZNE1XNnFOT1pKaTJ0OTluM1NwRFZo?=
 =?utf-8?B?anlqSHY3WWdkOW5QTTR1anFRMDhZbmNESFlVQ2hxUk9sTjFvUUFMQzlWMkZn?=
 =?utf-8?B?ci9KekJMM3FWTVE3ZEZyZkw1ZEpCeFZwVTBUUGVkc1NvZmsrUnlxSWVpc2ll?=
 =?utf-8?B?R0d0SG85Y2ZFR1dOSlB4QVVNci9UR0VsYVFadzZpL0VrL3lOTG45RWRJMXAx?=
 =?utf-8?B?d1VsaVZpK0s5SG5URXdJUzNRajZkNFIwKzJkQUFYSGlBK2diODEyMEtPUHFZ?=
 =?utf-8?B?dVhlQmxXMWJjUUoxamJDRmQ0b2o3bm1iZWd0Qk1SRVJXU2tWSVNJUUtUYXJJ?=
 =?utf-8?B?MFlZN0k3NDU2Y2FDeHhtNG9VUysyNEtJRFlQTWwwU05jS2xlbVpYY2RGU0hi?=
 =?utf-8?B?c0hYaWtNVVdHQ0xvVmNkSDZPRzVyMEpXdTVVejVaVnNkaXU3cVpwOGZUTXJH?=
 =?utf-8?B?UUNtNUlpeFVYNnVWNlMzWlRwYmc4UVI4aVhXMXFOeUcyWXNaMGxOZEJ4NEFW?=
 =?utf-8?B?aXFCMlNFUmp6UFhMM1FJWDRhVXZESlQzd3lvV0FHU1hiN0NDY21SYnhwZWhy?=
 =?utf-8?B?L3YvNWRyWGUySkszbmlJbDhITENNSHdiOGwxbGlZakVtQ1Y3THhzcUc4WTVO?=
 =?utf-8?B?ZnZpMXpicE1Vc3RjTitMb3JodkNYT3hHTEZxb3Ziaks5VWNoWko5ZERqRDBI?=
 =?utf-8?B?OWFDYU1BQUh5N3pIWi9pb3JGYkVTN1dZRkc3VnowcGN6M2Vjcm95ZlJPbXlm?=
 =?utf-8?B?UUxMVENwdzlIN25wVndReWk0VnZZMXR0cEtuRDVLeTVuNEhvZHBwNW10azdJ?=
 =?utf-8?B?NUNZS21mUGI0QVdZYWh4Q1Z2QklmcTlUMVk2bkNxMzJaRi93b3ExNFJYc0lZ?=
 =?utf-8?B?ajIrUXBqbzhiOEdWZDdkd0VLY1Vxa2wyQUw4VDlWK3R3cjBrV3pzdUhEQ0hB?=
 =?utf-8?B?TUFlYXM3dlRPclhtQ3lOSW0wY3VLR3NVVGlDOUFmNzJZSDdvaG9aVkdlVkJF?=
 =?utf-8?B?dk5sQlk3MmhvQVRUQWJWbmtYUnNIYnlabytudjEyM1pORmxGRUk2SHZCbDZU?=
 =?utf-8?B?SFl0bUZ4UXVvS3U4bnl5dWJqNDIyZ1RQMjRqem1XUy9EajVTUkRxbjlDakZy?=
 =?utf-8?B?VG1aVU1SWEFJMGdBa05oTk9uZHVsbXNOZTV0ZDJFQVplWXZZcENnMWtMeXdj?=
 =?utf-8?B?dk9qWFhHeWUvdlZJUzJGek8xd0VCajU4YTV1Qkg4T1psTU5sZlRuS3JZL3NU?=
 =?utf-8?Q?SO6dCqvfuVtZB98Xm5ltSb/JhDu+pEzWt7erb271oKZl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4ddf4e1-8f20-4c61-c82b-08de174ee14a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 00:54:28.9273 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODyQ0Yy7K5JPbVjItitVZ25qtRGBjm0lQ5NLGJj1v1X46TywtlvjgqUIGG8QSe6As3T8yPh00YqMrNP46DrbJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4160
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

On Thu Oct 30, 2025 at 9:37 AM JST, John Hubbard wrote:
> On 10/29/25 6:54 AM, Alexandre Courbot wrote:
>> On Wed Oct 29, 2025 at 8:26 PM JST, Danilo Krummrich wrote:
>> <snip>
> ...
>> I don't think this will work because `NV_PMC_BOOT_0` and
>> `NV_PMC_BOOT_42` are different types, so we cannot alternate them in the
>> same call to `try_from`. But the following should:
>>=20
>>     let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>>     ...
>>=20
>>     if boot0.is_nv04() {
>>         Err(ENODEV)?
>>     }
>>=20
>>     if boot0.is_next_gen() {
>>         Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>>     } else {
>>         Spec::try_from(boot0)
>>     }
>>=20
>
> Done. Final code snippet looks like this:
>
>         let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
>
>         if boot0.use_boot42_instead() {
>             Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
>         } else {
>             Spec::try_from(boot0)
>         }

The previous code was returning `ENODEV` in case of NV04, aren't we
losing this? Or is it moved to BOOT0's `try_from`?
