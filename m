Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF09B48F62
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 15:26:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F5810E512;
	Mon,  8 Sep 2025 13:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="U5cTC2bX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE0210E512
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 13:26:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U5PBhBRoWDfhdYfODqqUeE9CcmB+U60TS7syi0HIVNm+NpD4nHllshnul/LTfYBTRIFl3fiwNiVXSbOtnMIDhdWr+EXBVkOOb2bjLv3Tmy0Rg1Ml3U2l+HTk0QJB7i0X2gnWdrR2suKOE7YmgudPl+GGFG6eaTFusOE535t/wkLkDjKCC7Y6sACZmULVm5fqy8FEwuV9Uwks3N7hedWnEicYdo7cJAjByBoqeU4Wuz9iE5xxRnTQNDByZQaWF0VD9y007AbB2rnb8/P5EZmXkBl0WL0T0nbdII4/RrR8r4PsOGt+Z0Wb/kqVBNHNQlRQyoM2Po7XktD8G/r9I/PiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6ETcG441AKSuIfEjqZv9bonLRKiBqsP0WruKtNTLfk=;
 b=bzs0o7yUm4NuqCtwL9OJupDPR2qoSfXBYYb+lTydJxCjovJKE8dDz+KCfR4EkHAnVZVr3IdxUWQkCfSdug73yi6XbSm83Mg8kmCUDZ+rEy8y6MXUHfZqHJUfLgdz0JpG64AMrmHPSUepaIWa4kUo5l95Qt2OLw7u2HydeT/lT3kSbbSAGVSLwfMa0ykhFaMxwrXNI+5bo7FwnjN+WpxI7mlL6YjWn1KeKzD2AySy72GGsAXfgpCUs5h3BmqSvd9OBiW51EwznXYy1X3tNtX+bSEyv70V61Kc3nL10BsrWwPZ0BLohoM3/RWJDY/lzifVQavwzUdB64fqd65lD6vXaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6ETcG441AKSuIfEjqZv9bonLRKiBqsP0WruKtNTLfk=;
 b=U5cTC2bXyOUCf9120H6iNeQ/7uMBfL+naAma1+lyIff1hXKkUgjFVL+4zkAKGUDNso/DRXtBWmiweaVN+E53rqShFmWU4pDSinVEVv0PI+ejJV+ABqCEGLhSfof5W47tGsgwrck+lunAuYnwQuYBsK19AoJHinEphiuyZ61n2qGvwKCBv5bL+5I1AAKqg1YbS7Q+3ALhSzqBCAeBVqBs492MQ/iVkqEe2JEcUofn1RO551c2KfBrX2qwbTJ0rvyvwjmCkrWY6ue2Cp9Mn4OSdtzZIu9AUVBKYxNH36gFZp8zk1u/To3K3bvaoo+ovj0K2FUKwH4HAnLKImrxqfgGug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF3487F9737.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::990) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:26:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:26:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Sep 2025 22:25:54 +0900
Subject: [PATCH v5 1/2] rust: add `Alignment` type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
In-Reply-To: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCPR01CA0128.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF3487F9737:EE_
X-MS-Office365-Filtering-Correlation-Id: c7f8030d-f2ed-4253-a2e1-08ddeedb44cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1NYVUwxakw0UERqYW04YzdyeXBpMjYvS2tveEtEd2FHTzFxRTFrZ0p1MDFO?=
 =?utf-8?B?a2lEbVBCaHU2MkxXMXl4VmtheGNja3NlNW5XTEVOa2ZJTUZUenNUaVFzOGJK?=
 =?utf-8?B?MFRQY0JjKzNkL0x3OUQyM3BzazNPcTU4dkxlLzdMTGxoelpiMGZ4dFBPOVIy?=
 =?utf-8?B?dGdaL1NYTWJ0eG5jT2UwRDdmcUxQR2dYN0MyWjNsWndJRUdJeEQreEx5OGxY?=
 =?utf-8?B?a0tuVHRlZUsyTHhqc2NXc1MzSkxtSkhjVEdPbk5iTWY0ZmdqRlJ1U0dYa1h5?=
 =?utf-8?B?R1JiOUFOVEN0K1g3YkZFaWJLaUxLY3ZFR2lNL1JrdFNYQVFacWNFaFpGbEMr?=
 =?utf-8?B?bngxL3BrTmdWUWRxeGtyRkh0UFp4cTVERTRrN0M4R1RGVmQzT2laN3k1SXhP?=
 =?utf-8?B?clN4ZndkZTVHa1RQcDlUWjhHRXJpakM5RmpNY1JtQXlFakZCZkF0ZFRPUHRn?=
 =?utf-8?B?MkFodDFJVDJZVVBiSVM3OWsrOEtXKzlXUWwxZFFLWk1tK2NlclZ0YzcvODdo?=
 =?utf-8?B?OEs0eFNaUm9QOExIYzVYS0RBdGRlTHNDM213N0htSVJuMjVFYzBCd1Y0VEJy?=
 =?utf-8?B?R3d4QVFWV2xZeElkU1hieXpRdXFCZWNjVzc3WE4yRTlrZytIVHpDQjc4Rnll?=
 =?utf-8?B?c3FJWTdlZnNzeG1GdWtMVWxEZi9yYk1JWW8walNzTG5tUkEreVZ5N1lnbEcy?=
 =?utf-8?B?enVUSDN5d0RYZlRld0Z5SEFlelpmb1lPbFNpbUkrOXAxSTc4WnFjU1lSbG1J?=
 =?utf-8?B?SXRPYUpYK3JtbWwrVHJhc3pYa0tMaHhPMk1GaUxZTnNvREdjMVNOVFB4aXdV?=
 =?utf-8?B?MmdHbEJ0cDhnd0ZRNGxPazZ6RE91S3lnYkN4OEk2eWwzV1NZOXV0RFJPMWc1?=
 =?utf-8?B?dGpZOTVhckl0bGltMlZhOEFCemJVYUpNSEdDYjVhVHlFTHdnQWd5cTNZMndy?=
 =?utf-8?B?N0hBT08vREVZRGtXalErZXNvVWNwY3VuUnIzTlYvOUdydTdUT0duY05IdThZ?=
 =?utf-8?B?cElIZndmWTRBdVVaRGpPK3hvbmZLWVlkNlNEYjBmaTZJc2FTdlY3cDU3Q1ZQ?=
 =?utf-8?B?bDFEY0FRV2d5Q0VGM2NWaTlXS0dndFlvbFdqc0VKbnBOZ2pYMHFLbm4zenNp?=
 =?utf-8?B?TG9CU3Z5TVlWcTZGZW54ZGxTT084MFEveEYrUjlxbHRJdEdwUExIclFaL3Z1?=
 =?utf-8?B?UkU1bmEzM2pFNDk1ZFFIRG1YSm52UEh0dEh3SmlsUlMxTFg2WGQ1ZDZ3YUFq?=
 =?utf-8?B?TTEvYk5Bb2lpYVBzU2hJU3JQM2pQZzFlcjVqNzg4RXNOWFlKUkVtbS9acTd3?=
 =?utf-8?B?NGpKcForVmtDNlhJMWlSc1VKdXRiYjdObEsvcXZadXlqZTlUb0JTTlZFdTFy?=
 =?utf-8?B?NE4rcTZFYyt6TFhwMlY3RDg1R29Nc3JUUHowbjE0Yy92ZGRpMHBJRnoraTNV?=
 =?utf-8?B?Vm02V0FjUEx5VDNIa1VzQVlQUTF3ZVBCK09EYnFiSmovaDFmT2R4aUZhN0U0?=
 =?utf-8?B?cFJLcTJwNGxnNUxjcEhaYWFhRDk5U0JRQW42S0t1bHhaQTVHUkRtVVRabUg1?=
 =?utf-8?B?Tzc4YjEyUk1aenFWNnpWNkJNeWpTRnZqWjNlcU95amh3cno4aDhjRHFMTVda?=
 =?utf-8?B?cVdFZkUxRkxpeEYvYnZLSlVNRXd5R1lYcTJjQ0RGdDNQdWVna3B6UHZJYWVQ?=
 =?utf-8?B?WHpxMlhoUDltOFpDY0pET2JiZklVTGU5R0EyNmxYUUJIMVVEaVpYcWsvbk9V?=
 =?utf-8?B?V1N3SlpZYlo4Szh0d0J6cjZQSkhGc1lTeGtZRWhNWVUvYkZaZm9OQmNDZXRK?=
 =?utf-8?B?RW5adldBYjZNS3NHWnJmTFh4ODlza3VHdEU3RnROR2trb2s2bldkbDVqWDNY?=
 =?utf-8?B?bHIrT2l3QWozWXdMcWJRKzlieThZRW9BRjJETlBFVk1ucCtjb0FDU1ZxQXRW?=
 =?utf-8?B?dWEybDN1blN1WlpQT1NEMTBrSktYcU1NMmV3L1ZpUmhvK0NDVUxrNHlsT2tZ?=
 =?utf-8?B?SGIvZGZmRVF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHJwZHozWTcyQXZsWlUrNDZKQTAvQjNQV09RMXJseFVVR3ZOUkgrQVF2aVVy?=
 =?utf-8?B?cFJyRHI0OE0zaitMSEdWNGVnemwvRTkzUVR6ZVFibnRsK3MxdXNnVDlMUGcz?=
 =?utf-8?B?M0FOTkZJWk5yWGp0bDdjcmZkZW11RDNENjQ2NWNjMzVHVk9yL3U1TnR2OTZW?=
 =?utf-8?B?UWFrMSt2OGhvd3NLNWtLNjJjTy92aXR1bXRjZTVJdXFNOUZsdllTMkRXeUpj?=
 =?utf-8?B?ekJjUkdUaGNoNnZ0VyttbXFRUDBJUmtHbGNyeWtldHZZN3Vxb2thTDkza3lU?=
 =?utf-8?B?L2RYeDBPYnFHdkJST3pqejJGY0Y3YWFWbzR0eVE2cTZidDNDOEwzaVN1K3pw?=
 =?utf-8?B?OFJSeU0wYmwyUmxPYU9IY3MxaHVLMGRoUXJNZ2VwRjRoLzZYN1VyQkxTbVZM?=
 =?utf-8?B?RU1WRlpnWFY2cXdBeVh1ZGxpKzcvVk0zOHdXSzBUa1VoYS9SK1N1Ly9kamhx?=
 =?utf-8?B?a2VCcWRTRHJzSUZkd1BpUVBHNTI0KzRBOHZ5N081bnFidGpWWHdtR29kb2Jv?=
 =?utf-8?B?Ymxza2dHN1lNQm8zOERMV21NbUhFMExZcDFiNElZbzRHMnJ6bXJ5cWtlU2M4?=
 =?utf-8?B?b214ak5IRWQxczZsTlQ5d2lSK1FsREVvVWQ1Nzh0VnlpRGdXK3JEY1Q1NXlK?=
 =?utf-8?B?LzVLY0E1Rk9BUTVFbEVUZ29scUhaS25KclI1V3NSZVMvL1ZEU1FQbWRTSmJR?=
 =?utf-8?B?S25GUC9ZUHVWRVBlb1c3ZGd4STBZMFlZWGJwem1tR0ExSGZzSTB5a2RBVEZj?=
 =?utf-8?B?N0hveDhzYlVuQ2FNQlR1eTlKNEo5UmhmODF6V0hYVWYza08yanN2UmowS2dy?=
 =?utf-8?B?cy9ybnF6QjBUdXpWaTVxcHlQbFRTMU16bHJQcGZiQ1ZWOVlIRThsR0ZINFJ3?=
 =?utf-8?B?eEpFeVR4SGVDci90NnJkeHNmNDFKc0lUSXlUaFJaaDFjOTR2c3EwM0k5YkhH?=
 =?utf-8?B?byswNEZ4QjZOK0R4MHZ6RjZVdDg1QjQ4RERjVnBhbXNySHg1MUJFdGQyOCtE?=
 =?utf-8?B?YmFNS21nZC93K0Rhc056UTRVbmgvQ2FKZGo4MVdJNWpvWmtaMjdZZGN4WVYy?=
 =?utf-8?B?RXN4MS9NckxxRXVJZVBOMDRjMVlMVmE2cGR1RkllYWpWS3RhUDRxR3BSQkZN?=
 =?utf-8?B?QmY5T2xGcEkvTzUram1jMzFqMVFqaVY5ZzgzNERKMjF6NUltemxobm1tTWRO?=
 =?utf-8?B?UXg5L0x0R0s0UlZnT3hYV2c5MmdUSTFtcnBraDR1bXA4SkhCOStxNXA0Wk5M?=
 =?utf-8?B?VSs2WEVLdkFhTGNsRzdnZFd4dGJLSU12MllFWmkrL2RLRFRzaXlNczFVUmc3?=
 =?utf-8?B?MjRBNzlXTVFWRUhDQTBqdlNXZUp5U3VBNjRKa0dlSDB5YnFPRHFVeW5uR2ZE?=
 =?utf-8?B?ZDhlSy93RUdZT0JqRldhYjFLOGRDSkJUb2F1cXdhdmFRL01mdHhNc0gwakpq?=
 =?utf-8?B?NWtJZ2VSWUlPT0J1M2Npd0pRSVJlaEsyM3hkSk9TVUwvTnlyb2JkRzA2WUNC?=
 =?utf-8?B?UUhad2RpZmVzekMwQ0tnL1FndWcweTNlRURMN3R5eUdRYjI5RS8xdkVrQzlR?=
 =?utf-8?B?WXJSeVRoZW0yQVR1UU5NS2dDbTVMMTl3UklrbEVzRlhXWXczOXRpVFg1R25v?=
 =?utf-8?B?SXB2K016UjRTSDUrK2VUMzNyZnpoN2dGTlgrQlRmTXhvanZsR3o4cUZ1WmFO?=
 =?utf-8?B?RGp4NU01by9SbWVPcm9YSmE2eUNaYTNqb2M0Tm9MQ1ZzemxmREdrSm1yVFJ5?=
 =?utf-8?B?c3orbUhRaUMwUU5CVGNGSGFudVlkWlJRcEFyWjAxSWpYNEdua1NOWFo1K3Z0?=
 =?utf-8?B?alVCdkJ5aVhWdTJET2hLQWJ3WUpHZ3pxRmtXZkFvN1Bqb3JabGNOb0RzUkI1?=
 =?utf-8?B?Wm1pRGFlcVdyd2xEc3NvczErdXd4VkVIMDNsN0JCRE9JV3Vzcm5TY28zcEgz?=
 =?utf-8?B?akxJWk05NWx1eVhZSzU0UnYvem1WMGVjc3VxSkYySE93VS9mTVE0di9BTS96?=
 =?utf-8?B?eVhlcHBYWFJsQkR4a3VLTXRqNUlvUjNRa0ZBUy9PcDhhVEE2N2U1eGxJZkhJ?=
 =?utf-8?B?aUFzcHFSckF5ZklWaDE2VzFjL0pYK0VEN2hXeGJvWmFMYzZFemVyZjYycGdS?=
 =?utf-8?B?eXBBa2RTQ1ZoWXk4L09DQitFNVB2N2ZVRy9iVTlTL3RKbTZqNjJiUmdKdG5l?=
 =?utf-8?Q?KbbpvCeikhMaKUsQ1Ui4/gAn0F4BnnK4SjP3oyH6hXLX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7f8030d-f2ed-4253-a2e1-08ddeedb44cf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:26:07.7675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +4Ka9XepXIPc15qGAHkOgOYd8GFemxuaVmFiup6ifXmMoqkkcM47Y6em5k0jAmD3cFQt53ZdSgSb7iVpCxbJyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3487F9737
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/lib.rs |   2 +
 rust/kernel/ptr.rs | 226 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 228 insertions(+)

diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index fcffc3988a90392f1d5fc19f15c75d9ba7104f9a..833bb070e9a6697dad93ba10c61f5dd52da70f35 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -17,6 +17,7 @@
 // the unstable features in use.
 //
 // Stable since Rust 1.79.0.
+#![feature(generic_nonzero)]
 #![feature(inline_const)]
 #![feature(pointer_is_aligned)]
 //
@@ -111,6 +112,7 @@
 pub mod platform;
 pub mod prelude;
 pub mod print;
+pub mod ptr;
 pub mod rbtree;
 pub mod regulator;
 pub mod revocable;
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
new file mode 100644
index 0000000000000000000000000000000000000000..cf419d2ec61d3850b47c4d86ff2132f13b7b60f9
--- /dev/null
+++ b/rust/kernel/ptr.rs
@@ -0,0 +1,226 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Types and functions to work with pointers and addresses.
+
+use core::fmt::Debug;
+use core::mem::align_of;
+use core::num::NonZero;
+
+use crate::build_error;
+
+/// Type representing an alignment, which is always a power of two.
+///
+/// It is used to validate that a given value is a valid alignment, and to perform masking and
+/// alignment operations.
+///
+/// This is a temporary substitute for the [`Alignment`] nightly type from the standard library,
+/// and to be eventually replaced by it.
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
+    /// Validates that `ALIGN` is a power of two at build-time, and returns an [`Alignment`] of the
+    /// same value.
+    ///
+    /// A build error is triggered if `ALIGN` is not a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// let v = Alignment::new::<16>();
+    /// assert_eq!(v.as_usize(), 16);
+    /// ```
+    #[inline(always)]
+    pub const fn new<const ALIGN: usize>() -> Self {
+        if ALIGN.is_power_of_two() {
+            // INVARIANT: `align` is a power of two.
+            // SAFETY: `align` is a power of two, and thus non-zero.
+            Self(unsafe { NonZero::new_unchecked(ALIGN) })
+        } else {
+            build_error!("Provided alignment is not a power of two.");
+        }
+    }
+
+    /// Validates that `align` is a power of two at runtime, and returns an
+    /// [`Alignment`] of the same value.
+    ///
+    /// Returns [`None`] if `align` is not a power of two.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::ptr::Alignment;
+    ///
+    /// assert_eq!(Alignment::new_checked(16), Some(Alignment::new::<16>()));
+    /// assert_eq!(Alignment::new_checked(15), None);
+    /// assert_eq!(Alignment::new_checked(1), Some(Alignment::new::<1>()));
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
+    ///
+    /// This is equivalent to [`align_of`], but with the return value provided as an [`Alignment`].
+    #[inline(always)]
+    pub const fn of<T>() -> Self {
+        // This cannot panic since alignments are always powers of two.
+        //
+        // We unfortunately cannot use `new` as it would require the `generic_const_exprs` feature.
+        const { Alignment::new_checked(align_of::<T>()).unwrap() }
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
+    /// assert_eq!(Alignment::new::<16>().as_usize(), 16);
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
+    /// assert_eq!(Alignment::new::<16>().as_nonzero().get(), 16);
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
+    /// assert_eq!(Alignment::new::<16>().log2(), 4);
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
+    /// assert_eq!(Alignment::new::<0x10>().mask(), !0xf);
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
+    /// assert_eq!(0x2f_usize.align_down(Alignment::new::<0x10>()), 0x20);
+    /// assert_eq!(0x30usize.align_down(Alignment::new::<0x10>()), 0x30);
+    /// assert_eq!(0xf0u8.align_down(Alignment::new::<0x1000>()), 0x0);
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
+    /// assert_eq!(0x4fusize.align_up(Alignment::new::<0x10>()), Some(0x50));
+    /// assert_eq!(0x40usize.align_up(Alignment::new::<0x10>()), Some(0x40));
+    /// assert_eq!(0x0usize.align_up(Alignment::new::<0x10>()), Some(0x0));
+    /// assert_eq!(u8::MAX.align_up(Alignment::new::<0x10>()), None);
+    /// assert_eq!(0x10u8.align_up(Alignment::new::<0x100>()), None);
+    /// assert_eq!(0x0u8.align_up(Alignment::new::<0x100>()), Some(0x0));
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
2.51.0

