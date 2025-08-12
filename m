Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08B8B21C12
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 06:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE4610E578;
	Tue, 12 Aug 2025 04:24:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SXuFZL3g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2088.outbound.protection.outlook.com [40.107.101.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EAE10E578
 for <nouveau@lists.freedesktop.org>; Tue, 12 Aug 2025 04:24:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBsBMmUlfPF/V1O9iINvoe7BFPopVyu8P8G/TxgSXfh4dpZI5IyT6in8jrVblwwC7DWC7KCfIP6OVAyBa3JIVjHtV8XG/lJThoRaOG/vBwjkmhLMqXRNk4hhdXdRTanb3ruZyi6nJ6QGpJ8fioYwoyIpi13ThcxkjVWsL2/ZnKoqc9EIpvpghklu8/8nK2uyCtw+nXcD3BEyVhn12wv7hSDH/CZExytb3S+NOtVdZgH0IdMlgFh8HKj9Ij5/mkrqG4NyPc8Mv6jtV++qt/8T5ujWJXF12WJ3xw9BClfLmavsmMJOu186Af6FnbIguPOB/glcVAjIoSUu72vHb2Fktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bcxxm5fpdUJJb7fzlkr/idQK/7I+hCwOS3VRDbjHCXw=;
 b=ZG0tX4UK7/X9uh9ueOsJkdEzPOCg6UdI5fXu4/B25vC7GsXaoKSvP0EDl5+I5nzfvJWeDju+Ghs/0dNqf1Alyimaenv+AU47WtQ4BfIpgnBCpqGmV/dmKpWSKaO2jTRo761lr08j+RpUl0hIByWbiDOErWL2NwqrDmY9YYSYTdzsqFFoWZqIQGIb/8wyBgpedyBO2l+ePfkne/kKLzHDNLv5A1slCnNfW+kN3IQc3+ABNj8St5AeUKciEXXMB4s+UIYImiF3w9YKp90P5+b+8mMZAv7HRpo6vr13D6+rCuPAs3oHVF7Jck7Fo62DrFt+FDhCN3Ef7HYOTiEd0yEPcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bcxxm5fpdUJJb7fzlkr/idQK/7I+hCwOS3VRDbjHCXw=;
 b=SXuFZL3gN2YqhHvId0CQ99ph2ymEOa2ViiAnNd/tlUu0Ielsp/TF3AmoDQ+s8vsli8knVuQYRTGHz0i/DTlT1fgEBtKNiMYGwP8Sb5MnQ9m96DCyIPqSZ5F3W5SB19ZrKQJL9fAFUw74eMakgUqGNK3m15GfXFOLHo4+iMO/7jDQJhacfJVSohjgUaV8J15srAtCKmKE5MtAu6RbWG4BPUlz831k0ViTlNkiBr/zX3JkOpjWYtnGfxnywx2PdiWR5AJUjicmmjYDjcqmc827QIUG1IF6pgkRKImbFivWaCS4qu8P6JsXACGCcngL2TVCJq0vqDM7vcSebz/GY3Kwxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 04:24:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 04:24:06 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 12 Aug 2025 13:23:55 +0900
Subject: [PATCH v3 1/2] rust: add `Alignment` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-num-v3-1-569d6fe1839f@nvidia.com>
References: <20250812-num-v3-0-569d6fe1839f@nvidia.com>
In-Reply-To: <20250812-num-v3-0-569d6fe1839f@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0130.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 77cb5f8c-f4ee-4364-9ca6-08ddd958137b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1gwWG10cWxsQk5QdGM0aVlLT01VYmZsNkY2OFRuSG5jNTRKNFo5Ly9LcHBB?=
 =?utf-8?B?czZ3dnJKcVBGc2w2YU12RzNIN3JvMExPNWppNGthaEtoRWQvQVIwQ1prRW5j?=
 =?utf-8?B?TkZwb29PdWFuelJEYkNZMmVVYnRZUTM5ZkN1TmNrek1sM1BKU3BOYi9SZ3pO?=
 =?utf-8?B?YUNVTnBzNnVvSkhFNTBMaDdTQTVRMERaWWdMV0FQSkp2SlBHaFFyZUhXaHRS?=
 =?utf-8?B?cVVFMDB4amdqR1NtRjZLc1U0am9YSHNNUVl0YWVKVTAwY1dXR24rYkYyYURF?=
 =?utf-8?B?ZUdkdS93N3EwdmFsUVJXV1h2YnBNMTVYK2M5Z0d3djQ1cWVzMFpVemIrVy90?=
 =?utf-8?B?UnZ3VzdmTnBndTQ5UUMyS2RpSFlyMERQQVFKS1FBbjlzUmZrMUVyVHhVUmJQ?=
 =?utf-8?B?QlJtVmxXeTZUVGpwNVNaMGNiRmU2c0UrdnRacGd2aDRraHFiakswMXhlS2Zj?=
 =?utf-8?B?VlpJNGw4UElza1FpWVoyUWJYbDJzaW5MSURwQ1V4bzV2Znh2bGx1VzA5K2NM?=
 =?utf-8?B?NzVVclRpV3ZybnlGdWt6eFF1eXJGZzBlckdpbTZmMEkxRTFlL0FXYTZCWjhY?=
 =?utf-8?B?dUh1T1VLY0tIckhIZTFQWVdoYVgxUE95c1hVSUcyVFNmdkNFMnc0b2wwdVdm?=
 =?utf-8?B?QlUrQ0JQcFlNQkd5dlk1em9nSmZGdmgrb1p6MitYQlBLMmpGRExEV2VMYk1p?=
 =?utf-8?B?SXRsU2NHb2pyQWVqcnNCcksyODRhTmJTclJyR25sKzNsd0VZU05PRm0zdk82?=
 =?utf-8?B?c2pRLzZFSHB0QXZ3MTZHSmRJN0w1QTV1UlQzZ1FFTjZnMG9TT0lIZzRDdXVp?=
 =?utf-8?B?MjdyaFZScVFYQmFHWkpYeVUzV2VYQXBVWUFRdDRnNXlJU0o2SC8zTnczSGly?=
 =?utf-8?B?S2tGL2E3aHozZ0lsb1NDdXMxYjQ0QVQxODVVRjRSTTJUb2J0V2grZ3ZvRDRT?=
 =?utf-8?B?b0l3QUdsNUFJYjEvdHNJeDdpdUI1LzU0MGZ2V0U5RElCS3ZvejNhV0NLZlZs?=
 =?utf-8?B?TFMrTWxJWWRsWjdueDd4OW13bThWMGRUeXdndTNWWFpaMFlaL055bmJTRkIw?=
 =?utf-8?B?eks5a3BUbDYzSUZkanM4YW44bGZDZXZyOGY1bENsbktZMHpOam50SWprUU5q?=
 =?utf-8?B?ZlZ0aml5QlhDa0lYN2JKdXhEOVErajJtWXNsREFEdUNFb3Rteno0Yi8zRXNx?=
 =?utf-8?B?aTBGWlgxN3ZZbjJOMk1vWnpESExBYUpSOEUvWkJFZUR1M25OeEhDZHdjTjda?=
 =?utf-8?B?OVZNaUpPMG1BUWRrM3hkZy9GcjhYcWg5Q3RYR2J3THM3azhSRlZoelhJa1ho?=
 =?utf-8?B?bVJ2SjBRS0gzdjAvK2RaRkJUL1BmMlovbncwTmVvMi9MajdaTVFRZlJwc1B5?=
 =?utf-8?B?YVZsdkRMUCtRb0pMVUtubzgxdzN3Z1dOemh3WU0rRS9LNDVQTW0vbVJLTDJm?=
 =?utf-8?B?VnlSd09UOFVvWG0yYmM3MVNCWjc4YW91ek5KRXZWU3o5SzRIbUczTXJ5ZnpI?=
 =?utf-8?B?azJHdyt2VlZ5b0lxTDdtY1FVcFlWeVg2U2V0ZTByRnNJVnhpZ1VBVHBTTVd3?=
 =?utf-8?B?ZnZzdk9oaW9EbXpzQSt4ZWNjbUZNQzZLaXJyTURma05SVkNhbkRha0hRRTZW?=
 =?utf-8?B?NVV4K0NFUGwzNTB5VG5Kam5pSzAyZVhIeEpnVGRxVWROUEhGRmI0VS9YYTdQ?=
 =?utf-8?B?bnlGaEYrcFVwb1dlUTJOTGxKQ3paYmxtaDFuZjVhbHBpc0VFS0laVnBFeDlK?=
 =?utf-8?B?SjVwZTk1RUNzYmFDN0pXT2VoTmhtL1lxTU5NK0NqUWU1ZDBwcXhHaEpPZ2Qv?=
 =?utf-8?B?N1dBY3JyZXdFTXQ4SDYycEU2MUdoNDZuelBGT0dWNDF3RnNiS3VOcUQ4dU9y?=
 =?utf-8?B?TnFva1NtTEIrSEhVQUJwbGZ3ZEdvVFkvVmJzVlhwYVpUZjNjaWJnYjFDdDBF?=
 =?utf-8?B?TTI2UjQrZTQ1QU5wTFV3dXE3eUxPb2ZxN1NVaDBxbm90SGx6ZlkxcjYxdjE5?=
 =?utf-8?B?THJ3QU9jSlh3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGd6eENkaU1vTmxFQUZIUHlhMkVWczcvaGZjTVBwZWZNemNFMWZxY1l5OVl6?=
 =?utf-8?B?M2hVaGZYK213K1doK2M5WFY5MXd1WVVtZ3UzMWNvNVpVcDdlMjBNeVpyN0Jr?=
 =?utf-8?B?Uk41bDFTYnprb2pNaGZrdjRPcS8vdmVJcEMwV2lvT2ZOWVV6eVZDdkFRWDVv?=
 =?utf-8?B?UUZuaEJSdjVaT3hlVitmb3dZRjFRbDR5ODM3bDFWblFFUjFaeVNRT2s1TDJJ?=
 =?utf-8?B?aGV0MllEbTB0MFRGOFZycHJ2d1Q1dC9scm5ta3NIUFRjV1RBbmZUL3dTS2tC?=
 =?utf-8?B?c3NkWjcvYkkxdytlSkpkS1hBVWVlT21vSlhBaEpoeU9lbmZyKytuNFZKc014?=
 =?utf-8?B?eGVYbjR5Tld4OGxkaHE2aUhleElkaXZ0SWNySCtVSFJ0bW9RcnNhYWo5bkU5?=
 =?utf-8?B?U2JWTTlKWW5OUzlMNTRqZEs3RTBnQWI5eDBkcSs4OEZLcTMzNXhvSXB2WGRH?=
 =?utf-8?B?ai91emdTNDN4TVd6Y3M5NlQ2eEhkZXFONHM5K1ZNc3FObDREVmRaT0FqcTFW?=
 =?utf-8?B?UHVRSzFJVU00aUR2QUtNeHNVeURtb2hsaVdkOVF2K1I1bk1SK21CeU5FVG8w?=
 =?utf-8?B?UE45Y2VRV0wxa2RMNlNPajUrU0t5bkVOWncrejBvN0ZncC9EWkVZWDdUVnl5?=
 =?utf-8?B?R2JYd0pEOUF0R2VZZ09ubGFwd0dyVjhyT0gyTWdKVGFXV29ZaHd6N1pFazg2?=
 =?utf-8?B?QTkzMUlKcnlEWGM0QUdKTEVXVForMmhQTXFxOU9VdUZIaHphU2ZXTlpRL3h5?=
 =?utf-8?B?REZiZmhQMmE1R0xZdDBoVEgrSysvZFJCRlA4WDNHQTczOVdPdnQ3dCtPVFZ0?=
 =?utf-8?B?OGZGUVNOeSs5WE9sbTQ5U3JwYnorbGQ3a0N2dnNZb2hubS8vcUVJeHQxMWpS?=
 =?utf-8?B?UXZza2UzUDR3K3BMc2FZN1lXbytLRXlaa2h1RmVKL1FWakhvNU9OVTl2alNL?=
 =?utf-8?B?azF1ZDZVU1J3M2JMUkZDUHhPWkRWSXNxZDhJL0Z2bzdGanRaNVBRU09YQWdn?=
 =?utf-8?B?dnNuV2xLKzdoV3Y3c0VCM3NXTEpZdy8zRzgwWGhscVJpMXFQZmhLWkQwT1FZ?=
 =?utf-8?B?aUt6SkMra2t2b0IvM0NGNkJBQTRORWFmdnZlS0V3TDRrUkpWQzBqRXhKUTQx?=
 =?utf-8?B?ckhJYldlTEd4ZXE1UnNadDBka05pa2NPeVJpaGxmbnhPUVJRZG9sTk1YK0E0?=
 =?utf-8?B?QnFxVllZbmxPOUdLR3B3NGpsajMxRndqVDhZM1V2Vk8wUHNDUzcwZHVoNW5P?=
 =?utf-8?B?SFhTWUJZK29OYmF3d25KTWZ0c1Bwc0hRN3o1R3gyL3VvK1dXNUttTkhncUlI?=
 =?utf-8?B?OFVZZ09icGVWN2hsd05wb1FxcW5PVVd3Rnl6dzRlYm14Y1d3RW5TTUwrYjhP?=
 =?utf-8?B?T2dnRUNZdG91S1h3UXZjcEdEWnY0QS9ZUExaVXgwaTNEanMwaE8vdi83S3NN?=
 =?utf-8?B?QnFpdWFNZnl4OWp5ZGF6RG85TnFlNTNRQ2ZnTncxdUZrMzFoMmNsanRSWGZ3?=
 =?utf-8?B?UVFsdVMzRnYxOHo3eHhYSHExbWpseXh5TklkSTg0SEhLTlhwd1NSM0ZpdVNh?=
 =?utf-8?B?bldhQWRrcTVJYnEzd0tKRndiWTkwR1NITjh5cW9LSG1xMEI4OG1DMFU2QW5M?=
 =?utf-8?B?aU9mc1Mrc3l3eFloN2FCK2hYNExRUDlIRUxDZ2ZXM3Rib3oxSkxlcm9Jak5G?=
 =?utf-8?B?eEZZRkFkeGpPbkxJY3pieng0eW5UK1JUWExlWGJIKzRNTE10T3BkK2UwUmJl?=
 =?utf-8?B?VUloU0FLcVJ0dGZqWXhUSGR6MjBLeUxoZUJrUFpsZmRyUmF0Zm1IRGN2RzJx?=
 =?utf-8?B?cG5EalVDWTF5bmVTcWx4QWJ6aUVjMEZXcGhTaTlSR1huMjUxTkVlaGpGR3FY?=
 =?utf-8?B?cW1ZOE9HbDR2YTdoMXV1ZW44UlBvRjM5bFBxcWtxWmNEQmNUTFluSnVpSlNM?=
 =?utf-8?B?Q3JicXpGRU5NNHY1WW9hR3JzWjRpSVBHOHBsVjR5NEJWanBUSHRyWk9rdFNn?=
 =?utf-8?B?SDBjUlFRNTRDL3liK2hqZ3pFMHRkdXpsZTdpTmpBYmlQYkxDcXYydExGRHVk?=
 =?utf-8?B?bFdjZ0VWN2gvZHZ5czZsaTIrN2hadzZYbm9MMGxXaFNXSmlaK2VJRjBIMUtC?=
 =?utf-8?B?RmFBZVRDeUt1Y1MxT2EyL1J0Z2xyWS80a1FvdlUvK0N5Q0JKZnpjWkpQMHFC?=
 =?utf-8?Q?GlOMO74XkiYnGpxO7r4iTEdomcsALUPm/Tn1ob5DtYVR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77cb5f8c-f4ee-4364-9ca6-08ddd958137b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 04:24:06.6386 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVYQNzUw1QDoPIyDtxMKqF6vVTSHVEU3aFzXef9L1sKhWpicHvD+T/gGB52jFBGVD2WCSmy1ga2xNy3WkPknxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
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

Alignment operations are very common in the kernel. Since they are
always performed using a power-of-two value, enforcing this invariant
through a dedicated type leads to fewer bugs and can improve the
generated code.

Introduce the `Alignment` type, inspired by the nightly Rust type of the
same name and providing the same interface, and a new `Alignable` trait
allowing unsigned integers to be aligned up or down.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   1 +
 rust/kernel/ptr.rs | 218 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index ed53169e795c0badf548025a57f946fa18bc73e3..65586b8bd3f7ddef5f398b12796716fc192c507e 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -110,6 +110,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod ptr;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..b2b3ea18bb2782c8ccb69f2ccce3fd217879c7b5
--- /dev/null
+++ b/rust/kernel/ptr.rs
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and functions to work with pointers and addresses.
+
+use core::fmt::Debug;
+use core::num::NonZero;
+
+use crate::build_assert;
+
+/// Type representing an alignment, which is always a power of two.
+///
+/// It is used to validate that a given value is a valid alignment, and to perform masking and
+/// alignment operations.
+///
+/// TODO: Temporary substitute for the [`Alignment`] nightly type from the standard library, and to
+/// be eventually replaced by it.
+///
+/// [`Alignment`]: https://github.com/rust-lang/rust/issues/102070
+///
+/// # Invariants
+///
+/// An alignment is always a power of two.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
+pub struct Alignment(NonZero<usize>);
+
+impl Alignment {
+    /// Validates that `align` is a power of two at build-time, and returns an [`Alignment`] of the
+    /// same value.
+    ///
+    /// A build error is triggered if `align` cannot be asserted to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// let v = Alignment::new(16);
+    /// assert_eq!(v.as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn new(align: usize) -> Self {
+        build_assert!(align.is_power_of_two());
+
+        // INVARIANT: `align` is a power of two.
+        // SAFETY: `align` is a power of two, and thus non-zero.
+        Self(unsafe { NonZero::new_unchecked(align) })
+    }
+
+    /// Validates that `align` is a power of two at runtime, and returns an
+    /// [`Alignment`] of the same value.
+    ///
+    /// [`None`] is returned if `align` is not a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new_checked(16), Some(Alignment::new(16)));
+    /// assert_eq!(Alignment::new_checked(15), None);
+    /// assert_eq!(Alignment::new_checked(1), Some(Alignment::new(1)));
+    /// assert_eq!(Alignment::new_checked(0), None);
+    /// ```
+    #[inline(always)]
+    pub const fn new_checked(align: usize) -> Option<Self> {
+        if align.is_power_of_two() {
+            // INVARIANT: `align` is a power of two.
+            // SAFETY: `align` is a power of two, and thus non-zero.
+            Some(Self(unsafe { NonZero::new_unchecked(align) }))
+        } else {
+            None
+        }
+    }
+
+    /// Returns the alignment of `T`.
+    #[inline(always)]
+    pub const fn of<T>() -> Self {
+        Self::new(align_of::<T>())
+    }
+
+    /// Returns this alignment as a `usize`.
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_usize(self) -> usize {
+        self.as_nonzero().get()
+    }
+
+    /// Returns this alignment as a [`NonZero`].
+    ///
+    /// It is guaranteed to be a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(16).as_nonzero().get(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn as_nonzero(self) -> NonZero<usize> {
+        // Allow the compiler to know that the value is indeed a power of two. This can help
+        // optimize some operations down the line, like e.g. replacing divisions by bit shifts.
+        if !self.0.is_power_of_two() {
+            // SAFETY: per the invariants, `self.0` is always a power of two so this block will
+            // never be reached.
+            unsafe { core::hint::unreachable_unchecked() }
+        }
+        self.0
+    }
+
+    /// Returns the base-2 logarithm of the alignment.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::of::<u8>().log2(), 0);
+    /// assert_eq!(Alignment::new(16).log2(), 4);
+    /// ```
+    #[inline(always)]
+    pub const fn log2(self) -> u32 {
+        self.0.ilog2()
+    }
+
+    /// Returns the mask for this alignment.
+    ///
+    /// This is equivalent to `!(self.as_usize() - 1)`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new(0x10).mask(), !0xf);
+    /// ```
+    #[inline(always)]
+    pub const fn mask(self) -> usize {
+        // No underflow can occur as the alignment is guaranteed to be a power of two, and thus is
+        // non-zero.
+        !(self.as_usize() - 1)
+    }
+}
+
+/// Trait for items that can be aligned against an [`Alignment`].
+pub trait Alignable: Sized {
+    /// Aligns `self` down to `alignment`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::{Alignable, Alignment};
+    ///
+    /// assert_eq!(0x2f_usize.align_down(Alignment::new(0x10)), 0x20);
+    /// assert_eq!(0x30usize.align_down(Alignment::new(0x10)), 0x30);
+    /// assert_eq!(0xf0u8.align_down(Alignment::new(0x1000)), 0x0);
+    /// ```
+    fn align_down(self, alignment: Alignment) -> Self;
+
+    /// Aligns `self` up to `alignment`, returning `None` if aligning would result in an overflow.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::{Alignable, Alignment};
+    ///
+    /// assert_eq!(0x4fusize.align_up(Alignment::new(0x10)), Some(0x50));
+    /// assert_eq!(0x40usize.align_up(Alignment::new(0x10)), Some(0x40));
+    /// assert_eq!(0x0usize.align_up(Alignment::new(0x10)), Some(0x0));
+    /// assert_eq!(u8::MAX.align_up(Alignment::new(0x10)), None);
+    /// assert_eq!(0x10u8.align_up(Alignment::new(0x100)), None);
+    /// assert_eq!(0x0u8.align_up(Alignment::new(0x100)), Some(0x0));
+    /// ```
+    fn align_up(self, alignment: Alignment) -> Option<Self>;
+}
+
+/// Implement [`Alignable`] for unsigned integer types.
+macro_rules! impl_alignable_uint {
+    ($($t:ty),*) => {
+        $(
+        impl Alignable for $t {
+            #[inline(always)]
+            fn align_down(self, alignment: Alignment) -> Self {
+                // The operands of `&` need to be of the same type so convert the alignment to
+                // `Self`. This means we need to compute the mask ourselves.
+                ::core::num::NonZero::<Self>::try_from(alignment.as_nonzero())
+                    .map(|align| self & !(align.get() - 1))
+                    // An alignment larger than `Self` always aligns down to `0`.
+                    .unwrap_or(0)
+            }
+
+            #[inline(always)]
+            fn align_up(self, alignment: Alignment) -> Option<Self> {
+                let aligned_down = self.align_down(alignment);
+                if self == aligned_down {
+                    Some(aligned_down)
+                } else {
+                    Self::try_from(alignment.as_usize())
+                        .ok()
+                        .and_then(|align| aligned_down.checked_add(align))
+                }
+            }
+        }
+        )*
+    };
+}
+
+impl_alignable_uint!(u8, u16, u32, u64, usize);

-- 
2.50.1

