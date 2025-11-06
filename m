Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54635C39633
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 08:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5897710E138;
	Thu,  6 Nov 2025 07:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JTBw+Llg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010003.outbound.protection.outlook.com
 [52.101.193.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9036510E138;
 Thu,  6 Nov 2025 07:24:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJ2PbyOFMCc2xOjSSZ6Ib3QUt4RqJRb0NU6W1yfyCs3tvQgVi7d2h5IHQMuVHfBHjTD/gwRxdu4IF32vWtLGrSJxZlBxiImTb/IO+cB8qkrKoTBKlxtPQWVCQMT6IGKrXMcsPVNNMe9t324WDXvn42ISmLEfrRQlN0UpohNmSv09+YFDQiPv4BUjRoYqb4zWNikqRCF/stNyMLI0v1kYH5i2F2vX3W9LzkFhjTaaKNWe4vjPQ+r9d0omFgrgISkpT6eStFzbZY9RjBuJkkLkjhmhhqBG9OlBWv63veCa8XjQVYdOWbLeHDwV6InB4bVtIKrvoOkbI0MQ5VGj0CLs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXEgMTn2UH4dLlo21Q7q/gvWJxC6Ufg5qEbF/Q5VcS8=;
 b=jsi3K2Wb9wKJEhvpvo0prWMobRSbF7Oou9Gp5NFTAll2HOsCNM9nyV9nM74s2+u0SqDqDT2rvsuE016H0QEiqQoR/vTnjcfzRzt0KJb3/8bDs48NynFKrpMPJaYRjyXH77Jty6PL0lVFiHxO3bRD2izJWbOUkR4ZbGUNkGya+72SWAKCEsRuTz1xNmHzDI1agOltvyMTUl+suGht7Pd3knFUL8IRH8FwmYkUmbZ2y7FpCC7qWl0CnJmD3KdvKfX6MhOGpcI22zPAMt6RbzkmQbUvKp1zsuwww+McqZ24hTEJIvn9iKwP14joxv6FKsIqJV53tz9AcpGorrcxBC4s9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXEgMTn2UH4dLlo21Q7q/gvWJxC6Ufg5qEbF/Q5VcS8=;
 b=JTBw+LlgCA9Tj1PiGvagInT/IilK0AjuteBzO/7A60NiL8diCylHuhJ4RfcuMAf16b671YlxFuRi2lTYrawWODvoBqskmwwTpPnEEHaAq0aW/+yuIJQx5D6lRH+LNhsblsHZpgpfnMHRkrMbc1MfQAfLyuOSUMW/Rp0pp5DqGPVFzlEaS0j/i7Yrc6CvVQvdD39uwEK+tWpjxbp0rdUnTPSFWUsq3MuQQl5/PR08A0niSDzu+0oppWCza7FhHfSu580sSli2DIEdqjMHLqaBcZxDA50wTqtjUglHYl4r8d9J37LKRzLiwBJGcggqkeZLVek90GKCrUhwIxlxEMpRHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4202.namprd12.prod.outlook.com (2603:10b6:5:219::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 07:24:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 07:24:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Nov 2025 16:24:01 +0900
Message-Id: <DE1FKDK4YMH2.31M2ZHUOKEC1I@nvidia.com>
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
Subject: Re: [PATCH v5 3/3] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106012754.139713-1-jhubbard@nvidia.com>
 <20251106012754.139713-4-jhubbard@nvidia.com>
In-Reply-To: <20251106012754.139713-4-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0037.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: 80060af2-ab2d-44e8-c1a9-08de1d05774e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWx4OG1DUGhEekFtWG5zTDBtNkN3TkJReTNFNWZpaytZQmlyZTlxSDVXeE5j?=
 =?utf-8?B?SjhPeFBDSFpMakFQbktRVy9jbENXYStJdnNpVytESU5pcVkxbHBzVTdqT3Bi?=
 =?utf-8?B?RnVJbXo2TU53TGdWbk1Cdk51cGhiR3BlZ3Y5U1FjT2VQVGJpb0NHaFZ4b3JE?=
 =?utf-8?B?cnVpOXBPNDJDWmNXc3R1WGJDZllibkZqNVRrOUhGYWs1SUVQWUFFWklTVlJL?=
 =?utf-8?B?SDIrM21IbFprQjBma0NKZEV3MjdFaUtBZU5HdDhhSnM1MnhETDFoRE9OeTZx?=
 =?utf-8?B?YXVuVUxQT1ZoTlgyUFFLRzR6M21tU2NvUFdoOFJKNXZ5WlBWSk5DK2dLMzNx?=
 =?utf-8?B?bG5TRTJUZVZneURqOU5hL2FzYXZzbFBIUXZYV3RLTHZTZ2JRMjljZFluL2py?=
 =?utf-8?B?cWd4NEdFMGo0em9uUy9BYTh5OUlXQXNmM3o5MWFVa0pUL1Yza243a0hBUkpm?=
 =?utf-8?B?MEx5QkZieFNpNjBYNUwrRkZNY2tIVDlOQTl2dmxvTWo0MXBRdGg4OXJMdktw?=
 =?utf-8?B?Z3R0SW0wWTV0aUNqWU1yTzQ3WTc5K0xDZG9ORW5lUlVZL2hkNmFuMjIzWm9Y?=
 =?utf-8?B?NFlaMEQzSDhVOXlrSXZldEtZc1JOajk3TXdQaG9zMXZIaEpVdEh0bWM1NnBB?=
 =?utf-8?B?dGtRYURmcno1TDF2d0NVbWRNeGlxRi8wbElmb1BIeGVCYzNNYllabHVIclBa?=
 =?utf-8?B?c3g3VnZpTjFnWEFaZjR6Mi9Sd3Viak1YUnNrb3dJZ21DTmo4bWVwYkxaUHpE?=
 =?utf-8?B?R1BEbDZkbzVNSk1WeFJhaFlxV1dTK2VTTzE0RVRYR1FPMklvT3VRNk1OWmZK?=
 =?utf-8?B?bGV4YmgrVGpueXpKUEJGczFRaE0xbVE3OGdOejZ0UDZIVFBhVkVBQmttb2Fh?=
 =?utf-8?B?ZWtsSFNQMHloN1ZUUmZWZDdrZytqaFo0R0FPQ0dIbk5WRmxQSWx4WFMrNWw3?=
 =?utf-8?B?RC81eTdncCtrV2NkeGl2d0J3MUoxeDBzQ2pKYzBaWHhIQ3N2NEtVRzZVaFNt?=
 =?utf-8?B?a2l2c3k0amg2bzlKMnhTeHl4VG1sMmttYkJFc3lCME5uVXdvZkVycVF3N090?=
 =?utf-8?B?ZlJYL1Yyc0xtUkFVR1c4ZnFkNWNreWlEUmxuTUllV3BRYlRqYkZkaFdnaXRV?=
 =?utf-8?B?RTRZd0RpRVFxREE2QUZRaDZ3NmxId1hab2JqUjJZb3BhTXEydm5ucytCVmJx?=
 =?utf-8?B?Wm9OUjZtUEtoQUkyOVBkR0EwK05iRW44bklLbndUUEJaYmNBSDRQdm5xMGhj?=
 =?utf-8?B?Z0JOQWNjNWx5Q2QxallDMU8rc2NHSXF5OWtEUDBQdVQ5TXpJZEZOaUx6M0h1?=
 =?utf-8?B?ZDBBWnAzQmZLc05KaUttSkRtZHNyRTJ1UTJOZXJJSzRCUHlrdWtydmtCNkVK?=
 =?utf-8?B?aVZMWlplVWRWYnFZbEMzZkllYi84RURNQ1AzOEozdDcxMmh5ZUpkYXpoYjgv?=
 =?utf-8?B?QWl1WS9scC9OQ3Z4T2M3MnF3K1pOczVnNUY5ZWlncTZWOHV2T2NocDludXNj?=
 =?utf-8?B?K2J2NVNJbFNXQlhCNWMzUVE1akZNMktzcEorc3FkYlk4NnRKbHdIYS94ZWN3?=
 =?utf-8?B?M0lmTktCMiswQXNNS01DbDg2SjM2YWV2c3FVNGdJZXJSejRiTHEva0JPVW5v?=
 =?utf-8?B?Z25wT21pcEV0Z3lkWlhyN2piMlR6clluMDYxN1R0engzWllEUzA2V0NLZzJQ?=
 =?utf-8?B?dXkyZTQyMGxKSkJOekM2SjlNMFlBR2tjc29BbTRVQzI4bFJLVDlDcStINE55?=
 =?utf-8?B?VU9kdERJTWRNTW9adUxDcmxKU0w2NWlkT1ZiY0w4YVFYbkpwaFprMEdKMWc0?=
 =?utf-8?B?SlBTL3Mwb1k2cHZCa0V5ZEFEbjJreThRVFB2TXRSMzBCVVFGUDJzSmh6NWRv?=
 =?utf-8?B?L3gwQTdoZVVSSHdCNDVRWWlYQkg3cjA5anhBVVRlSHJKZzEwTlNPQ1pOWlpK?=
 =?utf-8?Q?wvc0+7Wbz461QgujqLpd9o1syW7VpDT3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDBUajNKM2pzbzFXcDRCUEtDdkF1OGsvZmRveUQzYW9teWdKRnFHRStSM0VH?=
 =?utf-8?B?S011M3JLL1B6TmpxTjV6cDRKR05pWVFZd0thWEpWN2dOdkZPOHZpa1VZMGlu?=
 =?utf-8?B?MUJob2Y3RElRZ1V6M2NEUk5KZjZPVHB3UGtUUWZ2bnhDb0k4aWR1TkF6aUJk?=
 =?utf-8?B?d05IcWJyUTFubjZWTGlIS3VnR0t4djFXZmxCRHlEd09nb0c0dk1XYy9VR2JW?=
 =?utf-8?B?MEpGMGFnNG9wZlUyMUJqYnNhVWZsbmVVaExEVmFMd25RazlnVk82emhtL05B?=
 =?utf-8?B?UG44ak1Nb1g4RmRIakhMdkVEVzVsZjQwcWtjRGg3ekhuaWxORnlEcEwxV2NK?=
 =?utf-8?B?VGlkajBLMVN3bmVLb0llL2tjZi9ZRkdxSjlObm1TYjgzbGJEcGJjRmxnRk93?=
 =?utf-8?B?RTlORVpKN1FXdkUyVW5zWk9VQkRXdXg0U3J5VGdTY2szYUFyVEliSUhtT3Bm?=
 =?utf-8?B?VFprcURnTVJoNDFLTzBET216YnNlWUtPQ0diWXVUdDU0UjJjN0xDblhhcFB6?=
 =?utf-8?B?SjlBK201ZkJud2NNTzJHM1NqNzE1eW1Cc2haUEpYbTN6R0VwZ0RUTUd1T2F6?=
 =?utf-8?B?aFd2U0ZLSlRWeTFORzA4WGpmYmZBdWhmWEpsekxwamdJWmkxaUtIK0FnT3Ew?=
 =?utf-8?B?MkVBZnFxYy9PUjV0d0RObkJ6djB5QXUzOEFNdXozdmVyNTJhR3diVXVPRkF3?=
 =?utf-8?B?SU9RdDZHMEtObzMzMUNzZVEvbnpBVnFGcXFOM1VJalJWK2xucWV6dVREU2xj?=
 =?utf-8?B?UHg3RUw4akJLTE5YV0R2aVovYzJKckVjMVQzb2NNZXduaDNDWWZMeXhXS2oy?=
 =?utf-8?B?QWxFVmNkTGIvV1VNdDBIejdadGVxUVloVjdNcGZsSWV6dFR5OUFhN2lZR0U3?=
 =?utf-8?B?Uk1zYU1lZ09vTWdhbnJFcXhXZWVMazI5Z0ZvVkJPMHFjMlgrc1JTTXJRaWMz?=
 =?utf-8?B?eUtaQ0VXVzVENTNqU2p4MXNoYldkWU9CajdGSVE0NDVRWEE1Z01UdEJLaXJx?=
 =?utf-8?B?VGNydzI0RXN6K245eTlDZk9LNDBKR0JKOGR6dEhVVVFvQ1R4SzcvVWlTRlVJ?=
 =?utf-8?B?N3FPNHJlL0tJSnU5UnNOTFpkZmtnbnhqaHBwMDRFcEVsWDd2TlRNb2xDNDNI?=
 =?utf-8?B?SVVCSVdBV3Vob3pCdUJDYmwycjlKWlBtc1M5S1UyRDJNbDJ5dXBCNVgzV0ox?=
 =?utf-8?B?YWtvZHpJWHg2ZURUQlY5djFJRUhJUSt6RUpoS2xEcG9rd2M5b0p4eTNZTmda?=
 =?utf-8?B?aENycXQxbVZJaHRyZFFHclVCZmx4ekx3eHpxbTZxVWM1MTZYanVxRXVraVVq?=
 =?utf-8?B?OFJJWW5ES1ZReWlvUHJ5LzRsWGN4cVpDUi9xTUhQT3BlcGxTTkg3aUpzdWJI?=
 =?utf-8?B?SWNpbXJiRy92eHlXQVpKdk82ZUE0eURCc0FoUFpEOGt5c3Vrc05hWTQwZ3Uy?=
 =?utf-8?B?V08vZkFnZCsxL1NQcU8rWGFIYzJJN0dxVHFIQmU1c1RPNjVPQWc5Z29xQ2lr?=
 =?utf-8?B?RlU3blp2dHlrTGdiKytQa2dOWTJBL3NVa2dXYnpQcjlwajc1MUhFaXFtYTdU?=
 =?utf-8?B?Nm1CUy9GSTBXRWhNWGdGRkNOTEVkbWlhQk1reDhnL3NVUG5ETFFlSFQ5NHkr?=
 =?utf-8?B?anZETUNBcFNOTy9BVDd5NXZzbU1HME52elJRTVN6Q0ZreUFwMGlrWFoyZ1Fv?=
 =?utf-8?B?V3dsWGthTmh0N3pLV0ozNkV1TmJRcks3cWViaXRTbmg3ZGtQUzJQUnREUjA0?=
 =?utf-8?B?THQ0dFBaaFFuZVA1NWZ3ZWF0SHZ2c01QUE1SaHhLQUQ3d1pmbjZpVkpYakZS?=
 =?utf-8?B?bGJ0ZVU1WnVzTVNmNTZCWSt2Q0lWYWE2aFpyU1MvNnNzTzdtK1c3cnpSaFN5?=
 =?utf-8?B?Tzlpa1JCSXBEZ0JPV0orYkdRdU5xUm5Ha25qSHV3UDZkYW04d2E5SGRiUzlr?=
 =?utf-8?B?Ly8vb2E2UjhvMFQyV1pGZ2pHWGNQNlVwTDJaZWtJVU1QUldxckIzRmphaHJs?=
 =?utf-8?B?Q3ZHMnkwZEt1LzJPSFZDMlZvNjdJMnJYeFVmOWJGK3M3U3dpZXB2TmRLSVRq?=
 =?utf-8?B?cWo3V1BIcExjc0JpWi9wU0Z0cWNUbEQ5Q1hPWWZCbWpjUUg2UzJ6VFUyaG05?=
 =?utf-8?B?K2l4c2hWQlU4V1ZHYUFyWU5OQWJ4Ym9yNmpDWG01dkV2T3dZN3hTOWtCTmNi?=
 =?utf-8?Q?XzXYkiKR9bgP8tXIgjEZrodyeChokb7aFGKgYjMIYXer?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80060af2-ab2d-44e8-c1a9-08de1d05774e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 07:24:04.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEvO/pKPaUGyfsj8LlUfXfq3f+mndXARM004AKNzAPCc9N6gZDnxhEj9ys/tKhhQxxJYT7pijJcL7ox2d2UZ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4202
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

On Thu Nov 6, 2025 at 10:27 AM JST, John Hubbard wrote:
> NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
> architecture and revision details, and will instead use NV_PMC_BOOT_42
> in the future. NV_PMC_BOOT_0 will contain a specific set of values
> that will mean "go read NV_PMC_BOOT_42 instead".
>
> Change the selection logic in Nova so that it will claim Turing and
> later GPUs. This will work for the foreseeable future, without any
> further code changes here, because all NVIDIA GPUs are considered, from
> the oldest supported on Linux (NV04), through the future GPUs.
>
> Add some comment documentation to explain, chronologically, how boot0
> and boot42 change with the GPU eras, and how that affects the selection
> logic.
>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 38 ++++++++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs | 33 ++++++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 27b8926977da..8d2bad0e27d1 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -154,6 +154,17 @@ fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Se=
lf> {
>      }
>  }
> =20
> +impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
> +    type Error =3D Error;
> +
> +    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
> +        Ok(Self {
> +            chipset: boot42.chipset()?,
> +            revision: boot42.revision(),
> +        })
> +    }
> +}
> +
>  impl fmt::Display for Revision {
>      fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>          write!(f, "{:x}.{:x}", self.major, self.minor)
> @@ -169,9 +180,34 @@ pub(crate) struct Spec {
> =20
>  impl Spec {
>      fn new(bar: &Bar0) -> Result<Spec> {
> +        // Some brief notes about boot0 and boot42, in chronological ord=
er:
> +        //
> +        // NV04 through Volta:
> +        //
> +        //    Not supported by Nova. boot0 is necessary and sufficient t=
o identify these GPUs.
> +        //    boot42 may not even exist on some of these GPUs.
> +        //
> +        // Turing through Blackwell:
> +        //
> +        //     Supported by both Nouveau and Nova. boot0 is still necess=
ary and sufficient to
> +        //     identify these GPUs. boot42 exists on these GPUs but we d=
on't need to use it.
> +        //
> +        // Rubin:
> +        //
> +        //     Only supported by Nova. Need to use boot42 to fully ident=
ify these GPUs.
> +        //
> +        // "Future" (after Rubin) GPUs:
> +        //
> +        //    Only supported by Nova. NV_PMC_BOOT's ARCH_0 (bits 28:24) =
will be zeroed out, and
> +        //    ARCH_1 (bit 8:8) will be set to 1, which will mean, "refer=
 to NV_PMC_BOOT_42".

From the code it looks like Rubin and "Future" GPUs are handled exactly
the same - do we need two paragraphs to describe them, or can we just
have one for "Rubing and future GPUs"?

> +
>          let boot0 =3D regs::NV_PMC_BOOT_0::read(bar);
> =20
> -        Spec::try_from(boot0)
> +        if boot0.use_boot42_instead() {
> +            Spec::try_from(regs::NV_PMC_BOOT_42::read(bar))
> +        } else {
> +            Spec::try_from(boot0)
> +        }
>      }
>  }
> =20
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 207b865335af..8b5ff3858210 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -25,6 +25,13 @@
>  });
> =20
>  impl NV_PMC_BOOT_0 {
> +    pub(crate) fn use_boot42_instead(self) -> bool {
> +        // "Future" GPUs (some time after Rubin) will set `architecture_=
0`
> +        // to 0, and `architecture_1` to 1, and put the architecture det=
ails in
> +        // boot42 instead.

If this is "some time after Rubin", how do we infer that we must use
boot42 for Rubin, as the previous comment suggests?

