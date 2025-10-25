Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FA0C08AA9
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 06:09:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40A4810E248;
	Sat, 25 Oct 2025 04:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JzTNNH75";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010010.outbound.protection.outlook.com
 [40.93.198.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15DC10E248;
 Sat, 25 Oct 2025 04:09:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRLhWzgpiYdy1IxeJeNCgm7xa3STtKO6gdUxiX/DmBjO2lsEJ3DL5QeNBD16lOWY50gwS4ksMAiCW67V2u7YHdxVgfOuvWcO1GGiUQUGdzL0v7/h2LPtT2iH8igQv4wmTlfLrYjapGLRiHHuHHvCwBqm94RydPreNXNVhmp8Nu04IbxOH+MWdKQcciW70P2UfV1mE6o9jIX9eo/P/QVU/Zita3qihCgwBb9+0ahU0PnfEMtZDDrc8ALhpZoVIZOPC6I6oJKIwHHtvTXwfmzL1oQW0O1q7KkrvzpkGeYAfWkWUK4hsj2uwZSZKvV1PjW3hgMTCLyMoShhh9aHXAr/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgvxbDg5141cgAemz5D8vNRRP1P8hF7c1CRqvgamZys=;
 b=LT93vZxO9SqaaIwGWzSens7qyVu37zu97grrX4o1CtwSChjdvMpPXsWsmcXKqM4vCps6f/p1AKX1HEO4gnZS7oZJDqeuNb4EjqJF9ziG2znIuiCAxW55Pe6DVz3v6snaIS+vGaUDdIc45nJj2PLGstGQQ3eNwSzU6JZ3WbhdRie08rfIv5ipWD4+Zi0ZqCzZmGDuediaz05gwVDkkyfp3CT8SYopgU6qK1ha1mgQ4ZRmj4IB5HZd6XhJKfpkpEVB1naFv+GwD45vxrMDcWpdjhNdSlwX4Ky9erdFHYHaUdsziDYdxZrOdGMZVZR2KaVHPAtKTqqjZe/sVj22dBR2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgvxbDg5141cgAemz5D8vNRRP1P8hF7c1CRqvgamZys=;
 b=JzTNNH75EOzpryNo9qy4wCx8ns+IE07rJo+glNW2/NDMDFTTCUt0rsfNFu/NfBsi2GcNdIIg/cneN9WRF/Sq6rEKos40miW55qiH87hwZpNad1IpSCckqANL9B26xJiyeLSDydNNNicSgBPSrqp0xxktRTvwBIhIMnb0y4Tab3LqRit/DV5hThrgjDeiiNRnt2hu8QmT/VsYeM08GA5XBjdikgo5CPC9PepNNMVLLe54q5QLx0wWV+lhuMK/kAnvuy7tLHPxJ14vTdRpITW95TEMjN01fOCq/+/5rF6PrijCG97RB4XGY1tvhUu4/azzzyZRP1R9TDxx2e7AKK5N4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 04:09:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 04:09:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 13:09:04 +0900
Message-Id: <DDR3WKTS74HK.2CK3P227O4XD0@nvidia.com>
Subject: Re: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
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
 "Trevor Gross" <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251025010815.566909-1-jhubbard@nvidia.com>
 <20251025010815.566909-2-jhubbard@nvidia.com>
 <DDR36ZDIVQR1.1W43G99PEGVQS@nvidia.com>
 <BY5PR12MB4116A592F878470656329A9DA8FEA@BY5PR12MB4116.namprd12.prod.outlook.com>
In-Reply-To: <BY5PR12MB4116A592F878470656329A9DA8FEA@BY5PR12MB4116.namprd12.prod.outlook.com>
X-ClientProxiedBy: TYCP286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a1d1fdc-0c52-485c-e435-08de137c3e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjI3Y21Md1hUc3dNK3hlS3dkTmhHNldqQnhDWXhVOUdaRnBXU2ZKeDhoYzRZ?=
 =?utf-8?B?c1E5WnE3amF3NGhBVWpWakxiUml5YVU3K1dOZDY4WUI2OFhZZXF3S0tTZFBV?=
 =?utf-8?B?dzd4TzZMZHBIdFVjMlBucmw0MWNncDlHUGZSMGlRUDhyUjRVVVVjbkd4UlVW?=
 =?utf-8?B?UmRVNDZ4aStzL0xiSTl3Q1ZQRnBRcytrWTByL3NQNUFPUDVaeEZvVk1Za0kw?=
 =?utf-8?B?QUQwTlFBblZkUmRnRDRZMTBuZk9WeXhFT3c4OHF1SUdGOVlxaXE5bHBZR091?=
 =?utf-8?B?MHZLRTl2eWhqclM4WUMrMmJBR3JwajdKVnZxeTU4eHJ0N09UY2JUVk9EcElz?=
 =?utf-8?B?ekFNTEJIOVZ5N2M3a0N1dGNKNnJYQ1lyZlJYWHRGbkdqZjd2aFJndjFkdlI1?=
 =?utf-8?B?UzJSUDlqcFYxK0J2Q3RXMEwxVUN6bDg3cm42enMxWDVVeEFEbnBYdC8ydUVr?=
 =?utf-8?B?TTA4U2dtalAzMlpkeUNmWjR6MjRoQTNlK0xwczJyS0VvY1BXcDd3SGFIdzFC?=
 =?utf-8?B?ZC8rQTJSM3BDMWJXdXBjMVcycjdKY01RSGpaRW1OOEF4eG9YOVJvTy9xYjF4?=
 =?utf-8?B?UGptVmtaejJISEtoME5vN3EvNGlyMEZXZlpmdktRaHlJb0grUUxzMVVhOERn?=
 =?utf-8?B?ZTdsdkFMa2o5UXI3aVNWR2JzcG95MkZHdEpZdVFsamN2YUw0M3Y2eGdVd3Qz?=
 =?utf-8?B?cUFBSEpwekJERmpzVE9ZTXFWL21DTEVwUW5MOE9xaHlORGlJQlpmMEhHUXV5?=
 =?utf-8?B?bFZGUitWNFYyNkRsYmgzNlZpWit6RE0wWGdXWlJ2ekw5TEt3bmtlQnhtRWVk?=
 =?utf-8?B?cE1HVHFhNEpPWUNET0tzNlRtZXNWMkVsWUsrV3BuaGFmeXVMUWtXTWhjS2pX?=
 =?utf-8?B?dmlvSXk0ZWRJT1RwOCtsVk5rb3F5OEdKcnpwbEpZL2tObEFJcHBibnVkeGF4?=
 =?utf-8?B?NENyZ0dXbEVmSWViQ1J1NU9JbWZPL2xIRjdWNGh5MmhNNW8yVU4yakd0TjFQ?=
 =?utf-8?B?ZVIyOTJMbWNiTmxQalJIY1l3dTAwWW5Bc1Ftcncremp0NWRXOXlaS3F4SHo3?=
 =?utf-8?B?UlQyOXI2aDhqTWdCbE9DRVdpdWJVclNYUEhUeGd2djQvem1LcDRzSWFsOVUx?=
 =?utf-8?B?ajY3MkRpenkzR3BwejBEcVRwZlp5ZktkOUVpSVArbUhJQmFPS0NpekNNOFk5?=
 =?utf-8?B?VENJd0cwVkNKRzUvS0svMzJ1WDFQUUJNWWlhZUhGeE40UWRtaDVzSkk2WGsy?=
 =?utf-8?B?WERxeEhjTW4xd1V3eHhBZzB6djZuTENZdDhGOHhubjA1QkMvSjZ4YjRtSUJj?=
 =?utf-8?B?YldjTnRsSW01Nm1lQWI3d0FhdTZzMGFpekNobG92MXlIa1BCUGplbkVPUDJP?=
 =?utf-8?B?WkNIRzgrNnorZElWMHpCaFpCWjJYRkxVYUE2aDBJWFJKSDEzdmxLWEJGOWRy?=
 =?utf-8?B?c0pjTU9MTk1uZDFURThFUHhZUGtpdTEwVXdNZW9jQmxHRUZySGxOclhWaG5N?=
 =?utf-8?B?QVpDMUw0enNBVG1oOVUxeVg5UXpSUUdNZkdJR3Fqb2hIdlQ3Sy9jRzh3d2dL?=
 =?utf-8?B?Q2ZEWGJzSVBXZGJWSUNwMVlzUmVzRXlUVVdWcHhkeEx2U0RIcWxYajE0YVBH?=
 =?utf-8?B?UlpqczBVVDdFL2VDNWZDRm5vVzY5TSswZWN5RGdPY3BTSm50SFdRYS9oVmhN?=
 =?utf-8?B?Z3QwUDd5WnFVSkxURy9iUDBBbnUvUWxQQ2djM1R2NEx4azVGR0J5V242Rlpi?=
 =?utf-8?B?djloNm1HQTgxOEJCUm54cEk0L3RmbjRyUXc5b0VCSm1KWERmMHl1VmhEbnpL?=
 =?utf-8?B?QUlVNXFjaTBVeTBhdldQdkNqeDRrYjkvNFRtK2JCdXpPNDlwQllocGpvanAz?=
 =?utf-8?B?UlM5ZnYybnljODZPTzNWQjlBUXQwWjZNZnpWM210MlVlZDdhTUFBVTlhTjg0?=
 =?utf-8?Q?7Zot+kTCGllIH09XbaAc+NpaKwGefOzv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnVQS1BTL05nZzF6OEQ3YWZ3RVY4aEFjclBjN00zYVNGQ1F6Ynp1Q0FJNXhq?=
 =?utf-8?B?SnV0TVFldjVFcFhtN2pIcit1eG85M0NzVkROb3EyUnhIcEJBcU14Q1ZkS1R5?=
 =?utf-8?B?Q2xEVnhhWXRhVkhUS0Z2RjFCcUZvZ1JVakZ1bmZuUFRXMTRxdVNkRTlzSWpM?=
 =?utf-8?B?eHowblRmZnE0SzhZQU92bXRGNjQ1UTNNTkpORXA5YlB6SHVIUXVUeEM0YTBT?=
 =?utf-8?B?L2lVbmFFTUtkeXhJUjI4TWdxVlkxazVmWUtJM3RqODhhYTJ4WlJERnFCZG5B?=
 =?utf-8?B?R1R3RVpRdGsvRWl3cjlvLzdDSXMwMS9meXhPZHZ3ajd6aFhDaXlnbU9td004?=
 =?utf-8?B?ckNOR09Td1VtZGpZZWY5M0tUd2tFNm15Smx3R1RKSlVHRGtrZG1GNmxiTlhv?=
 =?utf-8?B?WlU1dHk3UkdhcHFuUXpScXdHYkpaeHNqVFJrK2tHZzVXdm5nS3g3MHY0cVhy?=
 =?utf-8?B?N1E2RHlJYVJpbGNuSWR4MGR6a0MrekdQSWpaemR1dkhoVGJFL2JiZ0Z0SzRG?=
 =?utf-8?B?alhBQkdsMWwvbkM1aS8rOVBwdDFsLzhtc0d5SVhlYWxHaytsRUxMZ0dtRSs1?=
 =?utf-8?B?RzN2VE10bmhBMXVUY3VyS0t3eVJBS0RPRVdROHZpRjRpZmx4Vzd3NysrNFdz?=
 =?utf-8?B?eHdzTFZtbW9EMENrQUNZZlo2T3ppZWhWQ0pYNEFDMFdkeXRiR21HVkR0SnZr?=
 =?utf-8?B?SlJ2REdVSTVpSHo0TE9lQm5oNkNCUWd0YVlqR29UMDB0YkFLYllSSTR1VGV2?=
 =?utf-8?B?ZlY3b1poN1JQNmdKYjdLRzFzTS9DZ0ZtY3ZSSWt5N2QrWnBKTTZaVzJjKzlE?=
 =?utf-8?B?N1FrQUdIYnIxeFIyUXZyZGhiNWJTRm1hVUtUM0M4d1RCdGZUdzJWR2gwdkpV?=
 =?utf-8?B?RnZnTm1lWHVBOW1mUFArQTJqQXByWE91ellHV0RVNDdHUXp1Rkdvck1jZ3cy?=
 =?utf-8?B?aDZXTTQwN3VlVUFKcW12SEhOcDk4c3FRa1JZL2JtZUk4TFc5NnJxTVU5SEhX?=
 =?utf-8?B?dVJRMXR3UUhvcXNveHVtL0ZTMlNpZllvRGNQMlVBSEVmODhPaHBnSmcvQnRu?=
 =?utf-8?B?aVoyYjd3SzdHdmZ0enhCeEw2TWtiUFN5VUhUeVJXM1grQjJNWDY5YXRiT2ZO?=
 =?utf-8?B?ZWlSUlN3ZnFqZ3gwbUhLY2NuN1h5YVNKQ2pWcGtFVEE5V1RUaldYRkwwU3Z3?=
 =?utf-8?B?aHU0M3JUNHYraDNONitGTUlMWk0zL1EweUptSVRFU3lJT2d1U1FYSVRLeks4?=
 =?utf-8?B?dUFNRDVOWitGL2NZWWZwciswZTNaSExNZmpDQXU2WVFaTzlmUGlZbTlaOWVh?=
 =?utf-8?B?Y1dKbFpCV2lPNFcyWThSSzhTOFptQmtuQnFJSnJZL2JvRVF3NTB5VS85SGxV?=
 =?utf-8?B?L2t3SnczMFhNQkpVOEo5L0VaMWdPbDl4WjV2OURPK0IrK1RhTWpNaEUybyt5?=
 =?utf-8?B?cTFOL2RnYW1WTTRVUWVVM0NiVVhmUGU0dmdPdVNReThvMFgrU0lydy94anRw?=
 =?utf-8?B?TER0VzZWejFobjROQUpwNm5ZRUlhUXJMbzBwaEo1VEpMZjRNdnE3Uk9uNVJy?=
 =?utf-8?B?N3FtS3B6Qi9aRzhiSWtoaHU3MDh0RUU0UlhtOVhBUFpRK0ljYVBQSFRjS0hJ?=
 =?utf-8?B?VzZpVXhKUHhQL2NpVEl5ejUyRzRTNDFua0hVclVPWHpIMFFmSzVSOXJKODd0?=
 =?utf-8?B?TmZ1K24rTTJZNE54VVRBRGJkd2pncFc5WDRCZDQwN3JxeXEwZ095UFY2bm1l?=
 =?utf-8?B?eHZ6cWxCdlhHdTE3OTh5OUFqSHU4MzgzNnlwTTVlbjhUeEVTa0VQUWpubUJT?=
 =?utf-8?B?WU1DRVZTTVczWTFQV1A0SGhEcTF5UWtsd0dXbEpZbFhzbWJHZzA0MVh0Z1k4?=
 =?utf-8?B?Y0ltVzF6S3NWNlJ4M2dYdmI2c0lwRjArVzFBWXoyNWZidytRR2RuTHpFb1JT?=
 =?utf-8?B?SVhnck9vdVF6MjEvZGk1VVJlNXV1eHBVbDByRU1tMkw3TnpEVFBaWDd6NnIv?=
 =?utf-8?B?VE84eUlpZC9uYWhxZ2pkQ3g5UHpRWWJWbk9RMi8zN2xjakppMjVTWUcwRDk0?=
 =?utf-8?B?UkhSbjZsYTd2ZXBDNlAvdTBhWnBmY01RblVPWVBab2poSWFEWU1HWFVGOStT?=
 =?utf-8?B?Z2ZQTlZ0czhEdU9pd2VuekZsU3d4WlpVNFpUMEhzeFJsMnk5OG94RG84aDJ2?=
 =?utf-8?Q?CGklS/CkH1/ghGi1OXbL1EfQGskuexzA59apRjM57oiI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1d1fdc-0c52-485c-e435-08de137c3e5a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 04:09:07.8167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQjpQ/h3FjT/b6lEA8Dxj8fMAAs75WmjqcjWRsYtw3WF252KJhPeRZk50RVVejdA5TEgIZEBwAHzy/r3NNMCjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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

On Sat Oct 25, 2025 at 12:45 PM JST, John Hubbard wrote:
> Sounds good!

Ah, just one last nit: the prefix for nova-core so far has been "gpu:
nova-core:", so I'd like to keep it that way for consistency. I will fix
when applying your patches.
