Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF25C56275
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 09:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6A610E14C;
	Thu, 13 Nov 2025 08:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uErSYnGh";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011022.outbound.protection.outlook.com
 [40.93.194.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA9610E14C;
 Thu, 13 Nov 2025 08:05:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoE7eoaXW7+FFIudPTTIU66GJtOpXZzxlPs80ssZCNax1S256XIBj1Ll3TkM7SNd5W7kzDuB9kS7idEJnxHp3lZSjvHmjLvXkiOmY8T8sm0DxaG/PzOzKLbnEoTUK+3rOvQdaOLmJMA7DRsTxphSizRPHkUnl+yzEIKzpFWCogzkZ+gHA51oM6njtMXrdIau9AQfawxVJCCyY+ff2KPKtjL/RR7d/ZRFnw7fGNYmd/7YX6or34ljq3tAWzGRbyhuDpCyXXOr1luVDH1iZ36zH95ztU0OzvgwGQNPsBmH+lAprGAUucK051UlFiH8HwnL2prySeFpY6HYUcxX6hMxDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUR45T5/K3SF70/VPS0q61R35jQkPmbw4G9F8P8E2Co=;
 b=u7zdpF9u7Z9peeBKVVboarOeA5x9Se6gu0XWQvyvFUT7LN0WMc1fSZsGhgbdoBpvvHLSRDtB90ohsBzgqXx1XCQcaSqmMT2Hd/+IWkRIlNo3DTwj+GYWQcSE5UD0TMIZmdGYpSH7HiQMXqW/I0VfnBiPc0e+/9MEEaI3FRlRBjUaAAAg5QhRdUTN5HOf6Ue76QDH+eKX17MwH6Fftx5o5lBz4+agT+njuhzDDGnkVV3yL2wisRR6Am7lso+Pb9LKCfsedHcZ2WfDcJTEZMNDh+yXP4GvqgwjmE7GcDxmqJR7PsvenK2J4sELGY5K5441cYIBmz4CupeJJp+8JpQdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUR45T5/K3SF70/VPS0q61R35jQkPmbw4G9F8P8E2Co=;
 b=uErSYnGhyjkyTCnhYugyHd8w2w8PHU1Ru/6I3JzNVJ52zQnE0EkUizUZS/rOmwg9lsU3+oxIlEtQ6lsu6SBQuo0hTI4QiQ3f7+nCtdCPiftZ/1ZYrDEl/0vjOwodJUDmUqgaGDNUK6bpqzDzWXM810fN0HI+xnEp4K2Qq6ypL3m4e+6esQPoxePVBUKNp8hSQUn9olrNEniu/18ZQkaBuZSI5YOYNzb/a8eJ40cBmnFuyc/5j8+YNCQ8jLIuwiYXp/TWPlDuVLFx+V00giMnxgxt/L7URsGdxyzx7vms/2tbd2oUr/eGIjvvyWfsXpUZspb6ci74gujSgHHOqiVKqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB5867.namprd12.prod.outlook.com (2603:10b6:8:66::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 08:03:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:03:47 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Nov 2025 17:03:44 +0900
Message-Id: <DE7ESLFYKP2I.MD5ABO05Q2O7@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
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
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-5-jhubbard@nvidia.com>
In-Reply-To: <20251112043000.83071-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: fbc66553-0079-428d-a2ba-08de228b2c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2lwOUZnQ2lrZjI5UldpL2dNUklBQjNYb3pWQ3Q3Y3hHblBWOFo3Wnlhanlv?=
 =?utf-8?B?Sm9TMFBDTExoMHhvdXRYam1sRzdhK1ZOT3ZGSFlSQlROMFNVVXI4ME1EalFW?=
 =?utf-8?B?MzQvR1lubkdJRUNrNk9hbVBkSWZEQTVUTFNXVGx3d1liNnJYbm5lK0NTc3Ry?=
 =?utf-8?B?anNUQnV2R0hFdHUzOTVPK2dQWW9reDRCNnJsUnkvZUxZMzZJRUhPMllsMGYr?=
 =?utf-8?B?Z1JESDZKa1ZaZkVYQ2twQm0weU9vWVBGdjNkN3liNURqbmhUM1NwQ0dBS0lw?=
 =?utf-8?B?dXpaOVdXWXdEOFlrYzlaQnlmQzZSb3dQa1V0cXhaOTd2ZkR1d0FtSXBPYjE1?=
 =?utf-8?B?am9MNEIxTE9zdkdvOUtWNnFHYzgwOUNtc0tjSUxOUU5YajlJY0w5T2VOWGRm?=
 =?utf-8?B?ZHhRdHVjQnQ4c1hET2RIaU5qeEU4Zk11Wm5XQlg0L1hzUXJtMlcvRlhXVkU0?=
 =?utf-8?B?UXNySHcxeFBveFp0TS90aXNLY05mSGREelhXTWdKVUprM2ZKUElEQlZGWnQz?=
 =?utf-8?B?ODU1eUtUNVc3NnBFKzNhVUFsWnI1N1pMakErYlJiT2J1a05ZQVhpOW9jclcw?=
 =?utf-8?B?cTdkUEs2a0JXNFJIUmpBQStPUkRrRk9RSFlwSXhIVStQcU1kaGFaMGV1Q2Zk?=
 =?utf-8?B?RVVKUHlkVWJHZGYzbjhvTkhJWG8rSlpnUXRyNVp5c3cwbnF3ODFyS2Z0T3BN?=
 =?utf-8?B?WG9qczZvVHNCc3h6cnlrMTNRRDljK1pvZU1WSmFvN0liVnZCSnpHSForRFE5?=
 =?utf-8?B?MkNQbHo3aWUxQVNrdERTakcvRFVPWVd4dTFramhpcHBOR2I4MlJlUkdHd2Rn?=
 =?utf-8?B?dEtQTXlkdE44YVZhUjBIZFE0cmRQa29wSSsrRmVzazM4c3pTQ0hya1V5ZFk3?=
 =?utf-8?B?cVIwbzVDdktOMUhPc0RUN2pDakgxQVBpUTF0UHpvSWRhUFRVUHkrUUc1YjlG?=
 =?utf-8?B?ZWltRXl2cHNSRXM3UkJEdFcwWWVwbTFkOTdUNjZZNWg5VjNYU0hDMUVONzR0?=
 =?utf-8?B?NU5SVjdkdWJiMWlLMFMzSHNpM0ZENWwvNHp3bi9WeDNjZlZjMjI1SGJCUjBJ?=
 =?utf-8?B?RVFCdUMwWTVzcTJRMXVwc2ZFZnN4M3hsclgrN2xsb3MyYlBobEY4SkplTHZj?=
 =?utf-8?B?bXNYY0c1ak9uakt2c0s4R0Zob243SllMa2xxc2h3NU1SYXltSlZWZ01sNnVv?=
 =?utf-8?B?elkzZEtIUkxlSFJjM1hSVnovNjhoZEU0YkFEM1lDcmhsaTVrUk00WStUUDB1?=
 =?utf-8?B?Zjg3ekp0LzRIT2RYQ1RUVGdVZGw3cldpZUwxUHJ6NlRQSkNnb1RmWlVLYm5w?=
 =?utf-8?B?SUs5ajQwMU1mbWlHVHQ2RzFZN2ptYyt3OVNXUndMYnRsVjU0TVlIN2VWUmN3?=
 =?utf-8?B?bG0xU1JFWnRoV0l4OUdiU3ZtNGtGTGJJM29RMDFJZlpqV1E5OWgxaXY1eFY5?=
 =?utf-8?B?YWhCSWQrQzRka05ZazZCRmNjeTJuU2c4dE5XMGVEQzNITzZic0dXQWl6dzRl?=
 =?utf-8?B?Q2xDNjBwYWZHQ0pjeHVXMW5XR3JyM2p1di9oVGJhdDRsUnFMZXczQXBGZjFs?=
 =?utf-8?B?Uk9SQXVmU1hyRU5IZ2FQUTlqaHBubFJZNGd0d2JuTVp4UCtCclBmSy8rOHZi?=
 =?utf-8?B?WWdmbUdXRC9ZbS9CTGNsWFcvSmhYVE9YU2tVSDZHbUNTRUxIamNUTDBrcjk4?=
 =?utf-8?B?ZU9XTS92NnFRM00vOHBKeFBUcWN4S2g5UjRMYVl5OGpLYnpwWlJ5YTRnS3dl?=
 =?utf-8?B?SjIvL09aN1F1N0ZZTER5anJiYncrN1E1U2VyUjQ3MzhmSVpMNit6MmFnNE1Q?=
 =?utf-8?B?Mi9ZcGs4azE2Qjl2MUdZdEtEelRLS1VXMXhZNFM5REhmSm1VdVVHeCt6bkNH?=
 =?utf-8?B?U3ozYWJIZTdnMjhOU3JYWVZGeWtqQkJIbmI4ck9ydnlrRFlCRENPRWRTeGJa?=
 =?utf-8?B?UDR1U0NZeDhYQm9NaXFycXFZbHpPM0pPK3I4bzVHWEZnS2M4R2Rvd0RSeXdk?=
 =?utf-8?B?b0t5MUNQbjNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWt2aXlNOFdKRlZCeHhwckg2L29INEsxcmt6UGliZDRwdU90UldTd2o0TldY?=
 =?utf-8?B?REpERjM5Q3gvdHFNSnRQdGhDd2VieGtpMG5BQW1KSnYvOXRGK0tydGFWQUlZ?=
 =?utf-8?B?aVN6TFBpMnh6ZHdNeWRvbHZzcTc3cURiQ3VvN0JhbFJHa0JDV3JDSmpHZTVw?=
 =?utf-8?B?dCt2bkZ2WVNneklLL0VaODZ3T0Y0eVJjT1A3bW0wKzI1YzJyQlYxL1FDY1E4?=
 =?utf-8?B?MisvZnRTWklsNGc1SDdiMXFSdXBJa0ZoVFV1cHhhNTFCZVdpSVBOeldrYUk5?=
 =?utf-8?B?dCtadTFUQWUvdWc2c29aUDRPcjZUZXMrYXNwTk5ZUGEvZVhXVmxKRkUrdXYz?=
 =?utf-8?B?ZzlKSW9FRytYaTV5ODhkTnFwdmxpdUdrZFZaZEh6ZVNMcGV3U2VrUSsvRzUy?=
 =?utf-8?B?bmFuNmFxOXlIdmR2SWY4RzlrcjFtUnlpbEdJM3NTL1Y1TDg5eVYxa2tib0o0?=
 =?utf-8?B?MlJyZVg1UjVSY0hOWE10bEtkVktmcWtkT2YyNUhsWmxiakZMUklDUWRHUGxP?=
 =?utf-8?B?TW9OeUlESTJZQ0E2Qi83WEFML2ZHb2YrYk1OOXZSdEREV0t0Q2FPQVQ0V3dp?=
 =?utf-8?B?Vlk3TzZRVXpGeXZUTjN3WmpjazZLSTVqeTJzTmFMaFhYcEVYelpoYitLZSs1?=
 =?utf-8?B?MGNPTTFTNzRydm1zSVU4U3VxRHRwZXFmVUlrNU13a0ZhR2swZWxZN241VFRU?=
 =?utf-8?B?T2gyY1p2TkxKSW5rN1ZyOEJPK1F2UEZHMGJXY3Fjbk90dXJUYVYwbDlyNWhh?=
 =?utf-8?B?NXVkd29UanRqSUVtUTR5QjU0SjFXbHpENjllKzREZjZxdnEvQmpUZW9sbFkx?=
 =?utf-8?B?U0ZGd3R6QTZQcGVydWhNRUZYa3lrM1pvYlN1OWovYS9SeXpTclUrZVFucTlH?=
 =?utf-8?B?SGF2TEpXTis5RExmbkc3T0Z2alR2eWJkWFVxaWVMeEZZTjdFaGRiNDFqakpZ?=
 =?utf-8?B?V1Y0aElJaWsxNklHZmJXTlpmblRNU0ZCaEJsNEp4ZHZ5bFRnUWl5Mk1GWWJw?=
 =?utf-8?B?NFkxeFdLbzc0QUNmZEVRdnV2OVh5a0QrQS94TXgzM2x4ZkpVR0FhNHorVWJl?=
 =?utf-8?B?dU1OUVg1Z2JHWUJpbjYrSXd5Sk9pUFUwQTF3Rmw5elAyRGNyZVBCTDJaVzZz?=
 =?utf-8?B?eUJBbW5hYmJRYy9wZmhWbDFsayt1Vld3UFk4TDBTNkZBaVRYVWVHYk95ejE4?=
 =?utf-8?B?bDZwNjNwODhoTWFzYzR2aFA3azgxL3ZPZXhBSExwQzBnKzU2ckd5bDRTUlpw?=
 =?utf-8?B?cE9tZE5CZ1diTldxSlZSZEN3T21mcUJEcHFyVDNYNCtDV293U2o1UzdlT0Zy?=
 =?utf-8?B?ZWVJTWlsYk4wMU1qaGl4YzJaSmQwZytvR1BadUVmTTJWSmZKQjVFNmVqem5u?=
 =?utf-8?B?dUdsdzR1N3UrTTJIUi93UUxDLy9LQUNSazZHY0g1eFFjcTNUN0xHMHhFRDUx?=
 =?utf-8?B?a200aW9FVC9IanppOHRieHMyRUIzYWRuV25OSS81NEJ2dkUxRnlVazJSYW4v?=
 =?utf-8?B?NXdoOVJ0OUF3cE5BZVc1a3JOTEdyVTNiMysxemxjNWI0WWpNalc1MC82SWtv?=
 =?utf-8?B?WS9BeUxtdDkzQWI0eThwMmNZTm52NzlTN3ZIcnNrRmdwcUovcjZMMWtUeXgy?=
 =?utf-8?B?SWRWYW9TQXVkbWgwZXZGYk9qc3ZmTnhiTnVxLzRvVnB3cmlXM3Y3aENMaXJD?=
 =?utf-8?B?UmNPTktETnREMWhacnFlM3prVitESytEY1Q1V2RJbWlBYnJiVXZ4VUo2ZVdH?=
 =?utf-8?B?T3kybmZWZDdYbDdvQXplZjZpVDFEV1JET05qQ0dJc0Rkem1JSTQ2NEtCSVFi?=
 =?utf-8?B?WDZBbnJzUTZSN2xDVnJGenQ1RjREWXpFZ1hjWHdvYXJvandsYjIyZkc0MnlH?=
 =?utf-8?B?K3hTc3FDOUNlMHhUZ2pKVW1tK2xvYWF0clowNDdCMjMvdnlPNDZiMk53cERZ?=
 =?utf-8?B?UHJWOEdoV2MwSjFqU2J4L3RWbmN4NTdNYS9HVmdhT3VBYWJqOC9remh6My9i?=
 =?utf-8?B?ZnZnTTNnczRWa3VUNjFTS240RGdINHNaVStPNlRaK2V2NUFPNmNxVFZJY01Q?=
 =?utf-8?B?OXFobG9lZnpYMExiQnU1V3V1NEJqQy9IV2F1Um5tK3dMQXRYeFA4ZHhLS25X?=
 =?utf-8?B?d0pvZUpqSUxuMkdhVFNURlBaVkl0TDQ2YUdKOEEwQ1lYYkI5b1FEZ0RselZW?=
 =?utf-8?Q?70bNCw79CPV4dAjd963psKKZKlwAx5DzSTTk47FKrVrr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbc66553-0079-428d-a2ba-08de228b2c1e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:03:47.0741 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGKb3TE/4eAk6TAMUODWOpsS33u+fezdG62DVeh9i78SBbgFmcHzQbQk8zYTxFvyEfq9Hq5SgzYuF8kredkwrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5867
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

On Wed Nov 12, 2025 at 1:30 PM JST, John Hubbard wrote:
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

Love it, it's super simple now. :)

<snip>
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.r=
s
> index 8c9af3c59708..81097e83c276 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -41,14 +41,24 @@
>  });
> =20
>  impl NV_PMC_BOOT_0 {
> -    /// Combines `architecture_0` and `architecture_1` to obtain the arc=
hitecture of the chip.
> -    pub(crate) fn architecture(self) -> Result<Architecture> {
> -        Architecture::try_from(
> -            self.architecture_0() | (self.architecture_1() << Self::ARCH=
ITECTURE_0_RANGE.len()),
> -        )
> +    pub(crate) fn is_older_than_fermi(self) -> bool {
> +        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/manua=
ls :
> +        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 =3D 0xc;
> +
> +        // Older chips left arch1 zeroed out. That, combined with an arc=
h0 value that is less than
> +        // GF100, means "older than Fermi".
> +        self.architecture_1() =3D=3D 0 && self.architecture_0() < NV_PMC=
_BOOT_0_ARCHITECTURE_GF100

We could also keep `architecture` (making it private) and just test for
`self.architecture < NV_PMC_BOOT_0_ARCHITECTURE_GF100`. John, I can do
that when applying the series if you think that makes sense.

Considering that the series has been extensively reviewed during the
previous iterations, I think we can safely apply it for 6.19, so will
proceed once I have an answer.
