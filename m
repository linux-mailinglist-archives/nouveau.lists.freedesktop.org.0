Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5F8C28969
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 03:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7177E10E18C;
	Sun,  2 Nov 2025 02:41:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="on11DmtI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD5F10E18C;
 Sun,  2 Nov 2025 02:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LizV/QEZLxI0G/EZjL2LTvw3MYKm3TJwxlngpB1oge01De6S+Icws7hmCG37JP4AmnxrRQY8/E6DvI7sDRjlB2xvuF8NKuSHo+0CPVXOKv7WpUjJlE75BosA/m6+TYZtoCSg8lWbcKfoOPIUc/rqYf8kHoLQTDjxBougFo+SIEvFg5sjRfZYuGkmz9RMxzQPruMYuW9u76sLkVoRlF5x2DWQ6nnCwxmgCr5ZKhuugpt5jNKBBkwdm2vFepOZt6qlAu8XspjphWGhFaAczG70GFpUErQFCXmiGcT0t4Rq9rk+acpAOMxHEguwt/WrIBBLH7sICWNNMGbDlsAkjZkGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/6z80Re1w+zdEhXOVsFz6Krk1bIoNsu/6HmfBAU6wI=;
 b=B4lSN0inW+sA4qRo2tl744ZIWa/VKeDIgvBJWDWu5EU2JhmXmbonPwj7IkQxvP6PXpguZGVqV7w2OFeM7YfGf4+knkzInZbkw6bDvY3ys3gpx7MsI013J+wN4Itts0I2suUCXkfuFP2F5WE01rfge8rXrWRrxYQiWQYC1WHlD6eJynpFrD9Y7/6yUMBYI4dLulOxbcEIYe8JoUTNu1I1npFsIgfWsNTEBujrb5sTpp5Ek+Vxok4aKtGQqKL1LLx1S1acJtJKi6VGVulNV9Vye44JyetgaVse8I9TzyTgybNjIDxTkKK93h9jOxqYHC1avB298lylZw1bB/pop6ag+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/6z80Re1w+zdEhXOVsFz6Krk1bIoNsu/6HmfBAU6wI=;
 b=on11DmtILREwCq/4Unq660quAdJc6LCLNAvCL/uVWYT/FNkud2Z8Uadh6Mlo8OEdTro6e+Z9GSqv+z7RzcHjXi9gqaZWmUGtu7K8YFa0JVGfkz6kHsU5VBbuAuGRYmb1Mhvio56vcuve9FsU5Fv99do6xqOPSBS+y7m0DwBHr/dGxNIDZHw21IVaEnvKO9oONHbdTZlkN2jNBgGIlO9RoVkHrvvyRbD6fsFHke5RJtFtOumtV+rYd8Jwt2VR6smPs0BTOamH/PsbVErQIdeNPbz8hBiwmM4d34Py/l/j6fYqKQuGTsBRw2jul026f6IhXmj7MSldh8gL5L5LudlUWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6451.namprd12.prod.outlook.com (2603:10b6:208:3ba::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 02:41:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 02:41:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 02 Nov 2025 11:41:23 +0900
Message-Id: <DDXV1SHI0R3A.2A1HQNM843OR0@nvidia.com>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251029030332.514358-1-jhubbard@nvidia.com>
 <20251029030332.514358-3-jhubbard@nvidia.com>
 <DDUV3MZ58O0T.229A7N13MM1HN@nvidia.com>
 <64018a2d-1c0c-4851-95d5-989f041d220d@nvidia.com>
In-Reply-To: <64018a2d-1c0c-4851-95d5-989f041d220d@nvidia.com>
X-ClientProxiedBy: TY4P301CA0063.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6451:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f32042f-f5ff-4092-c43c-08de19b95199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytlS284TXZScEk0UHkwQkV3K1V2V1BHV1VLSHpnZ0pHd0tqNmJoWmNZRkFU?=
 =?utf-8?B?QWF3SGp3MHJza0JIUUluZGQ1dDJXdTRyQ0JWU2UxRmFQZnF3YWJGVms4elh1?=
 =?utf-8?B?cDZmSWYxUDAyZjY3SnN3LzV4a0xzaDhJWmtld3RTSTNja3lFQzlDd2ZmZUtu?=
 =?utf-8?B?bjRzOGVpRFZaZnVFZDdmT05SdS9DNmVIUFF2bWplRXBpODUrL3EyZ0NOeG1N?=
 =?utf-8?B?ajRQNlhyNktUMFUyVHhMbXBnaEpUS2pOaXBHOGt3QVI2cmZQeDNWcmJTUE1w?=
 =?utf-8?B?ME5PQmZ6Q25WVHM4Und2U0JnMzBwY3U5VGhHRWZ5T1FTeHliNEhOZTc1ZEg2?=
 =?utf-8?B?eTlRNnNOUHk2QVNBUjVtZmNrNElBSVJ0SUZsOTltajJXN0FNVEI5QWxROG5F?=
 =?utf-8?B?TmpoK2pianRBaVcxZmduTzBlQitRNGs4Y0pyQnVtWHJqdVl5eFVpSUJIVE1R?=
 =?utf-8?B?OVJrS05OcTI5WlBvNk1MblZTTlVINHEzekZKaDhjSHpnbkJIeDlWTXlWQlRW?=
 =?utf-8?B?ZUs1MVZKUDlvbVJOb3lVZUxDZnBQU1pFbjNEQU5RZnJlanFTVUpERFJZRlBN?=
 =?utf-8?B?MjFnTGdDSlFPKzNhSm1GY1pDTnFkYzNidlEwZXo1ZmdmeDFqZEZDVFVORkZG?=
 =?utf-8?B?WWVjb1YvYk5tUDBCa0tLSDM0TEtOMkhPT3ZKVUl2Yk5HaHYrZG1sRkNNRDht?=
 =?utf-8?B?a1Vsa3ZvZFFHN1lqd2NBWVlKZjQxWE1lOVA0a0ttazNKNDd6cUx1Y2xPeDQw?=
 =?utf-8?B?ZllLVVJsTVNJd3FvQXRsRkIrU2RkbmQ1WStGQ09kZzkxNk5IQUswQVVNNWdj?=
 =?utf-8?B?QmhzUnF4RUtWbEtJczQzOHNYQjdsbnFMa0Q4Tm9HOU15cFlZQ3ZrZnFLcHZm?=
 =?utf-8?B?MXpCZlRoMmVLcm9lemd6NThwVkFFWlNNeWFDUjd6K0Q4RzUwbHU4QzExTitL?=
 =?utf-8?B?Z2VFbThvcURackxJenRVSnVyOUM2RDU1OHNtVVh3RUpqSVZ1bGIrK0FHMnR1?=
 =?utf-8?B?UXE5WXE4eXAvNXZ6UlE0dy92N285cnEyWlF1QzBDOVZUZW1DT2JjT2dNZ3JW?=
 =?utf-8?B?T0hsYXlWN1pXanluMnNOOFpmWEFqNlFJS2xUQVFxM2x1akJtZDIzQzZLTzdQ?=
 =?utf-8?B?cmhZKzlNMmhXdzNlSHJ4M2QzdjVqdnZkQVRtTWliRlFjRk5zbmdGZ0YveXg3?=
 =?utf-8?B?TUxFampaYzFscFJzeTdiRWg2SElqT0hUb2lCbFAzczJrMStUOHl4aXk2Qm51?=
 =?utf-8?B?T3ZndFk1M01Wb0g1Z3dLV3RzOXdYMGtNcEhISXNFdy9OWXdtRWF5aVo2dXZ3?=
 =?utf-8?B?NWpreE8yc05Kb2VVeVVmY2hWT0EyMTlOVlFjTTRqc00rMkVOVHlaSkU5TUFh?=
 =?utf-8?B?Ny8ydlMxQmJkVUxQcUxDbStMc2E3Y2NDbkczQmJxZm00bVJocWJQUk9vOTJC?=
 =?utf-8?B?Z3duR0JpcTdwaGg2U1JRdlZlRzlyYkk3NDVQRFVsOSs3Zjl5dDRKYk9ncEhE?=
 =?utf-8?B?Q2FCemNaeUs3ZXV5YXFOY2RxbEwvZnJTVVRERUUxUmhpYldJQTRaZWVSaHhk?=
 =?utf-8?B?SUsvMGQxVzc5eDR2enFUQXgvb0pBYXJSN2lmYWpDSXY1K2MwZHV4Q0lCcTBR?=
 =?utf-8?B?RHc1b2NGM1E0a1NKdk5iSWYzWVJabFpRYmhDM0NCNWwzUFNHVUlUSGZQUWov?=
 =?utf-8?B?ckdxcnFVZmFDYVdmbzFuTnFhQ0ZGQ3VwQXJWTGlESDBydDFnbTEyQUM1bmcr?=
 =?utf-8?B?WHZxVkRZQlcyV2NYMkl5VmRtZDNrYmJlWlRUTVovUHhodVhQb3EzeFdOcXdy?=
 =?utf-8?B?bXVISlVRTUJyU0Z1QkV5Tk8xRWFWSUc1MEtPdGcxNnZYNHo3K1pGYVVPdm94?=
 =?utf-8?B?bDQ1WTgwTmcvaXJUY0c5ZTlVL1lwSjlkU21vckt4V1FBMjRRRExzK1NBZmtI?=
 =?utf-8?Q?Xql2DQWzWdIK0YuXmnUrPWZUjdkUA+2+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnVsL2hjYzZHUW9VblBrNmpjaGIyY3hGSnJaUkxoWGRhdWJNRm5QMDVaS0Ja?=
 =?utf-8?B?Qkxhb0E2bktUcTJOQ29sM3hKZWd4eXVKT0xOcG8xaHZlem0vUVh5bjl2VUhq?=
 =?utf-8?B?QnRtOTFLUzZqQTFKSWRQMzhGcnZyaHkzZkUreE13Q051QXBVRTJFcDVpeVhZ?=
 =?utf-8?B?a1dVbWN0Z1A2ZUdiTEc5MUI0YS8xai9kc3NJK0k1VnpaVHI0OWtmUERaZWxN?=
 =?utf-8?B?eS96TjNRSktOV3dOamd1T1ZYL3htQll4a1VXYk5kMlArNmx6WkF3clhneGl4?=
 =?utf-8?B?Z0xuSUdNZStJQWJIMkRvK3B3dHBBZUEyYVY0eEpxSUhoV0pXZ2tXYytGMlVH?=
 =?utf-8?B?SXpiSmR4NWVWMlEyeU9sWGQ3akNRcWRZZFhESnRLenpjblV1Q3NzaFJJZlVN?=
 =?utf-8?B?THN1YWVKZHB5bjNqZzBTUnZwcGVDTko3ZUxRRFZ0WmdkWEFDRWh4eGFoWm5t?=
 =?utf-8?B?TGE2WGhjZ0dTamdqcm9zU2Zkcld1R2RyR1B1ZE5DbVVLdmQwRWNaZWdtTG1F?=
 =?utf-8?B?UHdvWi83RGVsK21aeXJiR1VvRkEzb05zLzlWZ2dzbG9mdmo1bHg5V0FLd2Yx?=
 =?utf-8?B?MjJyS3ZzYUdicE9HcXZIZnpLc1J2RmM0LzFsZ2pONXNEaUhEajE5b2FGckRQ?=
 =?utf-8?B?ZHJpQnJIWkZiWXIrMm5SYTF6L3VMVmFHU29tT1VDb1dWY25WcWtldFQ0UHp4?=
 =?utf-8?B?dEhOMGM0Z21LWTlkSGcvWE1CMVBMMEkzcGxRQ3lLYlRTc3RYNGFtajRpTkVV?=
 =?utf-8?B?dzRTMUxLVDRpVkxESkplNW5JSFN6UjRQZkdXRG1DdE5YTzVLZjU3SU9CbzR4?=
 =?utf-8?B?bE93VlpFTHQ3TGhITm1tUjJBeHZyMjY5YU5DeDV0TlBtc1Vqb2tsS1JoWXh5?=
 =?utf-8?B?ZzB1MmJaYmxaQzhpUnZtUDFOY3F4NElFZjMva2p3cTU2c1d2Yk4wNlVTUjhS?=
 =?utf-8?B?VXNGRXZTN24zMEI4KzBhQUFOUHdoWFcrWWdJL0d4dnQzNTljUy8wTlBqS3NV?=
 =?utf-8?B?bzRWNHBzdVNPd2VPTnZwbEhwNjJrVndHOEhJYUdrL2x6byt1NHNiUGRYSDhx?=
 =?utf-8?B?SDVWMzNOZnV2ckg2UURLWGlEZHRBRDdWS1NOdGxkUkFBbWtHRElxaTRCVWl6?=
 =?utf-8?B?MDc4KzVCbDQ5cFJRbEJiNzhMUEYvWnhKVEg5NUNPTzFsK2hhUkZlYXlJOFE0?=
 =?utf-8?B?OXBjQWZFdWdCTzZiV0tHQTIwVlNJd1k4WXJTU0FBaEE2ZjhVVnllekplNzV0?=
 =?utf-8?B?UHphMzlueGFES2pvcHAxMkV4Y3RRK1hJaFloT2pEZDdmNXJMWm5uTUtRc2h1?=
 =?utf-8?B?cDV0ck1oY0tJRGtvbWtDQXp0SlljUzI1QjZtSWFqQTlNZWI2Q1V3d1BZSXlM?=
 =?utf-8?B?aytzWE95bWdWVkNDUGJxbzNYU3VoUmZKTXhkdFk1L3Bjc1FaeFB3QVcwMFZp?=
 =?utf-8?B?WUtvSm12SVAzUEFlRHJyeklLWVFZZUN5bERpT3E1am1DU29QaHhhNXRiZG1q?=
 =?utf-8?B?Y1FxSnk0R0xkbFV4dkhBdmhCd25vdE02cDB2WGdpa1BqeWRvTWpaU2NMTHlm?=
 =?utf-8?B?UlFXQXBSUnlCanB6YkswUENwVHpYbUE1bURxMmQrR1FZeG5OMFlnNFh5R3Y4?=
 =?utf-8?B?Y3lYQWxNMFRJRFVkaVRBTUxEcGZ2d1pDckpxU1dneVY5UkFnR1AxdzlVWUtU?=
 =?utf-8?B?VlV2YzVCUWpubWFuL2xMR3g2RWhrSDV6UVBRWE1XcVVNaTZnY2ZFbURtMXhS?=
 =?utf-8?B?TDNaczhSSHFhOXB6ci9GWmJCc1czSi9ZMUhnc3NJc2VqbVVDV2M2NjhKbGYw?=
 =?utf-8?B?VmdxZi9mc05vQ05JaE5sdDdzTWEvSFUzT0lKMmNBSnFVUnF1czVQSEM4ODla?=
 =?utf-8?B?SEtNTEpaV2VXU0FuVVdqWWtST0J1ckFhZmNlT0JKVXYrbW5aSDZnU1NxVTBs?=
 =?utf-8?B?ekNOZWM2dHp5b2kzVkRKYlh6ZmxnYXZoVWcrNFM5bXZYbmJlOHZOdUJwdkRa?=
 =?utf-8?B?bUdkbnFrc0MybXdQZHJIU3IrYnNFcmRrSXVyWWxwTTZLNHVLQjFFbkFkUGJK?=
 =?utf-8?B?TzdWUUxvanlsZHdjaUlZb2JKSXh1WlE2Ymd6S0EzcStGT3pMTmVCWFdlMk9n?=
 =?utf-8?B?aCtCcTBXWlAwbjhkdUp5Qlg4c3RLZkZrSVE4dVdTNDIxMURYbVdwMW4xKzVw?=
 =?utf-8?Q?e+NzIznppbf8wnxgnphQH9mKqRhcmZgFATKdwx659k8o?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f32042f-f5ff-4092-c43c-08de19b95199
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 02:41:26.4013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +SgZb/yT8cLap8TYL61JcgSPMreT4LuSjreB8I6omaFFABfw6Uf45t/oaz20grP2byxMinUUyUndoVKtcS3xqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6451
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

On Sun Nov 2, 2025 at 9:34 AM JST, John Hubbard wrote:
> On 10/29/25 7:05 AM, Alexandre Courbot wrote:
>> On Wed Oct 29, 2025 at 12:03 PM JST, John Hubbard wrote:
>> <snip>
>> This allows the implementation of `NV_PMC_BOOT_42` to mirror that of
>> `NV_PMC_BOOT_0`:
>>=20
>>   impl NV_PMC_BOOT_42 {
>>       pub(crate) fn chipset(self) -> Result<Chipset> {
>>           self.architecture()
>>               .map(|arch| {
>>                   ((arch as u32) << Self::IMPLEMENTATION_RANGE.len())
>
> A quick note: _RANGE() and related functions are (I think?) deeply,
> madly undocumented. Not only is bitfield a macro within a macro, but
> bitfield itself leaves the user with only the following as "documentation=
":
>
>     ::kernel::macros::paste!(
>     const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =3D $l=
o..=3D$hi;
>
> The net result is that those of us who did not author or carefully
> review register!() and bitfield!() are going to have a rough time
> using these facilities.
>
> I'm not sure of the best way to add documentation here, but just
> thought I'd better give an early warning about this.

We can always add doccomments in the macro, as in the patch below. These
will be displayed by LSP when one highlights or tries to use one of
these constants.

If you think that's adequate, I will send a patch.

--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -249,7 +249,10 @@ impl $name {
             { $process:expr } $prim_type:tt $to_type:ty =3D> $res_type:ty =
$(, $comment:literal)?;
     ) =3D> {
         ::kernel::macros::paste!(
+        /// Inclusive range of the bits covered by this field.
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> =3D=
 $lo..=3D$hi;
+
+        /// Mask of the bits making up this field.
         const [<$field:upper _MASK>]: $storage =3D {
             // Generate mask for shifting
             match ::core::mem::size_of::<$storage>() {
@@ -260,6 +263,8 @@ impl $name {
                 _ =3D> ::kernel::build_error!("Unsupported storage type si=
ze")
             }
         };
+
+        /// Shift to apply to a value to align it with the start of this f=
ield.
         const [<$field:upper _SHIFT>]: u32 =3D $lo;
         );
