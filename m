Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC6AC3D752
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 22:12:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F3E10E252;
	Thu,  6 Nov 2025 21:12:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a5ibXJDb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E6410E252;
 Thu,  6 Nov 2025 21:12:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+GtEEhILYPHFNxrk+VRmBhOFEqJxZr83fXEq6RE+wde8lNC+UEclW4RGqd1MQQfIalL4JcdVcxOQ+hXezkV0k11GgPp6cEUOlyzQUZAaC/u/12D/gQcOvL9iabpq6eGga1c7MJ6NSia/WYk96AtUUKvonNrDret7ZWCvdQ9xBxJZfMo6Dla/bvQTNHNGtRH3FOR4NdFqpCXZK4g9Jv2h/ACWYy5uAf0yx8wGLNNjfyW1uQGkGbsZxWnP1oIvQadVIgEMPAgfzQMxHxmGXoTnZ/RCBZZ0eEGsQwZ/9wthfL1ycbt60udJ2SzKoZllUKdUHDsVHYzWyvSwTkY45Wm3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sECWeo6pOVkYgPrIYDTIP6Y1Y7akMeediyWM55U3+gQ=;
 b=RDiu+LKf4PWX8gvHiGwjZvC88OMW58uZ1qaT0L05+rwlJdTWpQAULrsz0exb1Cx/6F/Advttr0LifNyvjQktBCUQ0LyljDJOERaaag8QImLBsfx0bSn2ehY6wVj9Vi0cyeWiSUzhZUMNJv+bNndlJDZV9WjoSkI5PpC2xDWNoANDm3yt1OP9OPciINg22DG3caZCSNKXisBggrct2kstg9iutvlsbbOchQ2jeYH0npwB+cD3gpV5nIOl+XoSIRvgwmHR1AA+o8AhKFN2EDP3VB991s658JX/sJuwJzz4ndRB1/WTT3ktKrTZyqza1/wSPFa7ADJcKg53T+W/uNwoTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sECWeo6pOVkYgPrIYDTIP6Y1Y7akMeediyWM55U3+gQ=;
 b=a5ibXJDbTY4K3Wnc8mfqL2aXIQrrmPUxLd7vHiH3N2xIJt+Ul7geUo3cCJ8VrMojQIpsnGKSr55Dn6UiDnh7Jfh7/vZLqepGrFuZj1Ul0j+iTRmP2ymqjFw8W3+IwnLQRu88/OZ7UBFVL7Jddu9xuuDM712qP6vNFeWtQNN3uNCUzytPKus0J+IfU9Mwcc0NTTTCUcjh60pwvH/6YIaerVhy6bgyNxR3/kI7KStfv8PnQIaomfVwMsMVLQcvn+8BdzTIaeD8ufjOiBAB2wAPnnF3ry3nJu5dhlVrSYREs52feyoosOqu5VtJeGUdTCtMPUcIQhJw94BqXSr5UgLI8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by BL3PR12MB6403.namprd12.prod.outlook.com (2603:10b6:208:3b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 21:12:15 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 21:12:15 +0000
Message-ID: <2c381df5-de8c-4f2b-ad2d-9cce9569a956@nvidia.com>
Date: Thu, 6 Nov 2025 13:12:12 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251106012754.139713-1-jhubbard@nvidia.com>
 <20251106012754.139713-2-jhubbard@nvidia.com>
 <DE1G0R9W3JS9.INLIKG0AXGES@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DE1G0R9W3JS9.INLIKG0AXGES@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:a03:100::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|BL3PR12MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d86630c-5a49-402f-d09d-08de1d79294f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c29Fdi9KRGFEeTBiQ2JOb2QwQnJTMzZvSlZId2FkN3MrNG9MaGdXNXgyeGY5?=
 =?utf-8?B?K1BSeWdsTDNCU0wwQWszdFY1TEtVRVZFdnozMDZPVEdGekJ6NmZ5N2c3S3NV?=
 =?utf-8?B?YjJ4N0JLMVQvL2o5Ri9QSDY1SHJFQjZPaTZIc3dSMFJMa1ZOSzZFV2dGT0lq?=
 =?utf-8?B?eUlhK296L0I2MFA1MGNGdFRNOElPREQwcG5OTmExM2wwTnpUZStuMk9JRnFT?=
 =?utf-8?B?a1FjRTI5NTdEMmRuWU5qeGp3SlpxQzg0Wk5uTENoUFd5L056eS9MbFV0TFZa?=
 =?utf-8?B?ejF1eFJ1MkxlT0FsMjB4eUFabGVuVkI5SlBCSVAyTzJrY0NTV3VDVzdzYWpV?=
 =?utf-8?B?bkVhaDFyUEpSazFSclJNcFBielZ2ZGtSWmJXSlpQTUJQZUN1di8zRTBpUDY1?=
 =?utf-8?B?elpaaWtGRkNjNWdXWlFQVEtsSGZORkRmNndxdzRhajFObW1OUG1RZmZHLzZv?=
 =?utf-8?B?MzJ6T3BLZXZWWFRvRjNvZHB5NHlxTEdXUEhYV2dRTlJNd3pyVTZIQzZENGpT?=
 =?utf-8?B?cDZMaHlReVFrVjNkbkZ3Nm54aFlpYmh6WkRwU3pCVEN0QkNud1dKUGlGcWlo?=
 =?utf-8?B?VEt6TG9SNDl3TGtSVFB3a0JjNXRZVlZzeFFhNldjdThZOEFlUVJvY0xWTW5L?=
 =?utf-8?B?RUVJRGpJY1FTRENPSGpKNFlnZ2FoZS96eFV1VE1TK0J1NSt1ZDk4T3F5S2Q5?=
 =?utf-8?B?dUtWYnVxdWlhY2tFRXhXanNvdFBNWm5UYWJNQW0vVEtHL3VkajlkQjZ1SVlt?=
 =?utf-8?B?RjNxWFVhWFp2SVo3ZDN0OExtcEhISlROeU11dzVvbmpLem9kcHhwUzZkeUtK?=
 =?utf-8?B?ZDh4d1R2SEhwYU93VlNFSDF4MHZ4eW9QdCt5ZCtCU2VDcGhYeHFlMzE1bVYy?=
 =?utf-8?B?WXFPOTJLckxETm1uQXU4NnlOWWJqL1ZaYnVjV0ZCU0ZoL0pEeXd3cXUxOWFq?=
 =?utf-8?B?MEEyT3VJNk9adG1RSzZ4cEE2bVY4ckdzQVRLdTdEV1JDMS85TWV2UWl6TUFV?=
 =?utf-8?B?eXJrd0JXdGpOQXpORkk1TUwxRnppR0p5N3crQmM3bmNMOUczU010Z2xNZEVQ?=
 =?utf-8?B?Z1BlNXM2SjR1N2ZvR2hGT0F4M1U3S2xTeUw2TTI3eWNjYzRPVWtjQ0w1b29L?=
 =?utf-8?B?VTVlYUUxb3piSWNRLzJ2K1krL0hZZE40UVBYMFcrV2VWTXpjQXRpVmRGdFF5?=
 =?utf-8?B?eHVaYlNTNlZaYWVIelNVMXhiVDQzUjJZa3JnZkd5VExqdHBicHJiRFo1eHV0?=
 =?utf-8?B?cjE2NVA1a28vVWs0YlphQmdXR2lwNzF3S1NFek5jOTFOYm1KZWRxRG9SeEhI?=
 =?utf-8?B?WURtcnp4SGVQN3hPcmdjQ0pmTjdXaUNBSFVGV1hOUEhZRmlsWDJXYkRIR0dr?=
 =?utf-8?B?Q09VemNtSWFKSWR5RldQTE42ejRHRlVvV3EvTHdmdHllS2s1d0JUd01LWk5G?=
 =?utf-8?B?QUtpbkNtWW51cjhWMFo3SEJyTjZuaWFqeVpQM2RMR3UzMkZJRXIwUmI3U2VK?=
 =?utf-8?B?eXZmUUN5bXI4amVEWFFGMTdFV3liZHQ4bEVvZklaS2hIUDVJaFp2RjlpSlUv?=
 =?utf-8?B?ODl0WVljVzU3d01zRTBIT3lGVGhhTzJaOGlTa1djN1lzVFA2WGc4M1JSOGRL?=
 =?utf-8?B?eE9abHZsdDBMSzZpMjRhSkFLWEtzQVpnamozQlhySmRQWTBSYXlCMWtjckdw?=
 =?utf-8?B?aUNWTzhkZmhLc2xzNkhSYzJWM25RTFI3R0g4R2R4dEdHTFowMTZzU0NsVXZ2?=
 =?utf-8?B?a29GNkRST0N3UkV1R253aXBOY0N6WEpld1lqUkdMcUViNUdJY0lOUlhmQ0ZJ?=
 =?utf-8?B?WTFKVjdlb3JrTTBubXJIbGJxVFpaK2FPNkpSMGVjZUw0Z0pZUmY5VGxZOW1Y?=
 =?utf-8?B?Q1NYRSticHU1YUQwR2p2cjlPVGVPNlBzcjNUbVpWUXM2QVNHbUtPeWxwYUpu?=
 =?utf-8?Q?kJ/EeLXQl4bqwynhEiFBk7ypC+SwFvyR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1KMEtuMWhiWkpZVnZaSnZkYnBJaHlvUjR5RVZIUks1WUVtTVlLMS84ZFA5?=
 =?utf-8?B?NG4yL2xMTDBkZHBIblBxNWJFcVdjb2xPTE1GU3JrTDRQcGdNUE1pTEtPZnRT?=
 =?utf-8?B?YXB2Y1pvRkd4Y2lSTU11Wm9COER2SERvYTZsdFptMkNVdDNVSTZraFg1ZnVH?=
 =?utf-8?B?RUxJVndQL2hBM0NNa2VQcHJZL2x3TjRqS3c5VmsybForMVlGYVFDU0VIMk1L?=
 =?utf-8?B?ZFR0OGJDQVRPZ3QyS281TXFDRkczOWlLVHNrU1NHdDZKMlFXN3JWbWRFRU03?=
 =?utf-8?B?dmlzeXlpQ0JoNnJtNkUzYXpiYzRsUm1SaWVBdlAxQi80alUvK0JTT3YvUGxW?=
 =?utf-8?B?RjJ5WURPK1dEdEdCTzNXMlRoWEtxMWloY3VxOXN1WUprYlp4VERSa1BRVnZu?=
 =?utf-8?B?WDJHTWVUVStZOFhJS2VSY291VWRwU2w1TVkvT29HY2pHQUo2cTlCVkhlYytH?=
 =?utf-8?B?NHIrSWpKRWpLYnFheVJMMmhlZVZTKzNhaUhQamo3Q0V1NzZqMWQrd21LQ3k5?=
 =?utf-8?B?SzRaU0YrRFZoM0RSTUEwWnFVQlI0eVFxQWFmMVpsaWZmU1NDYjhZa1U2M1N0?=
 =?utf-8?B?TUR4Q2w1YlNBYkMxRjdvN0MxVmtJZTNEWVpCVXNicGpBa2R3MTNBSG5mWlBl?=
 =?utf-8?B?WFRLVDNjTHZhbHh4SFZaNUZtU3lvL0gzM083Z0dWaTBmdENvZlk0b1NuYzRG?=
 =?utf-8?B?cWJsNnJIaG9VSmJWZjY4V29qYzhuVHdOeldXcWs1aHppYUdBSEZsNVVxckk0?=
 =?utf-8?B?aStPdFM4TUZ2akQwYkd2aE9JOUxOM2IrTW9qMjdxNXVDajk4b3BTTWw2eGVR?=
 =?utf-8?B?QzdpYzdaVkFJZ1g2ai9FZjJidVZIdk9CZG0vR3NFUGFPVTlkcXZ0UlFEemJD?=
 =?utf-8?B?cThjVXprK3FWSG1aSStnOXFNWUdhN0ZoMjU4bEdhZ2xQV1BFK0tONFZDTjNG?=
 =?utf-8?B?OFhXVWk0MjJuSlAvM01hUFRPY2RVVXlWL2tlTngvSEhvbUlDWERwTTcyOU1y?=
 =?utf-8?B?eW5kVklXM2dnVEV2N0czMTE3d0VnREpmYitHTWU2NUdkbUpRUU1FZjdnd2pW?=
 =?utf-8?B?TXJlRmJwRHlCSnBaMjJlSndqWFdWMEtUbFJzbG9ROUVOdVBIanFpYmhnWVJl?=
 =?utf-8?B?TkxuZ2xtME9tNTRCUWRNRnFSQjBLbnl1aDRLRmxrSEhMZXE4Sm9MbVU4cXVH?=
 =?utf-8?B?YWhPWDBhUGN6QW8xelB4S2Jyb2xaQStxWktJQWpYc2xTcTJrRU1iS3Npd1hW?=
 =?utf-8?B?OGZmcTNYeitDY3IxZ29XMWQ2WHd1TFhoSkF0Y2RORWxaQXRXc2FLUmlMa2tT?=
 =?utf-8?B?ckwzbk5LSGc5OTBsZDdoVkp0VFgvbUFMYmtLQnBlekZUK2o3ano0WHB4ZElT?=
 =?utf-8?B?Rm9Nbkk0cE1kQ0lXOG0wdjQrNWhIMVJYNTdtRE5WU1BraWFYZmdSWm5URjIy?=
 =?utf-8?B?ZE9zSDMzVTIrSWJZMXpYdEFGaWFqZCtSVTZMbzUvb2ZxVHg0Snk1dGcxTktx?=
 =?utf-8?B?MnJIY1k3LzFRc1UzdEVRdzZQK1g1N1FnTmZObVA0RXkyK0VreWRvSThxSjFt?=
 =?utf-8?B?QlgyYkcrNThmeFZHV2U0YnhXNjdtamVTM2lhcjNxcERpbmN1K25pT05yaGU1?=
 =?utf-8?B?bUNLUmZJMjRrY0NlWHFVKzI3bUVPRFlka1hvUWpKNXB6N0hocmVkZVg2ejN6?=
 =?utf-8?B?UUdDQUVWazFzQ3ZNZnlGazVVZ3ZMUENhSkZwK2YzUnE4MW1wcHZlayt1azdW?=
 =?utf-8?B?U2JRaVYrV1RacjUvVDdXYmRQT0dJNWd5TEZtZFRQUTI5bEVud0lEcFNmYnl6?=
 =?utf-8?B?OTNGL3k5YzNMYzVVSndML25qbDJyRXZxQUd1QnFrU21PL2NpaWdGSk5qRUtT?=
 =?utf-8?B?RXFmUjAwM2JuQTlPazRySHNDV3JXRGsrZVNRWGVZeGFYUUw5SnhHaUFXYTRB?=
 =?utf-8?B?VXBOM3oyT1lnNnNQeXBEQ1lrSXlyeXM4Q0RkeHkyaWZiYXRSeTdEa3J3VDJC?=
 =?utf-8?B?cWc4QUtCdHdlY1FJSFZUOEc4VXBoMWQyTkxyMmEza1Z0NnZGRGhhS0R4NGpl?=
 =?utf-8?B?RDhhZlVvQjNIVldEVEg2UGo3LzZhWTMxK0Fyb0V3anBua1YyZlNsemVta0tQ?=
 =?utf-8?Q?tOvTUfrKFdlx2upOQuT1/f4e9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d86630c-5a49-402f-d09d-08de1d79294f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 21:12:15.5916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XMX9YpzzvEp40maIFTfPuPDDdU8rCuTIwbDeXvSpTO93iwhwHWSfw3JGFTQzyZPL+nBFlo57bC25L5jz1DTgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6403
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

On 11/5/25 11:45 PM, Alexandre Courbot wrote:
> On Thu Nov 6, 2025 at 10:27 AM JST, John Hubbard wrote:
>> 1) Implement Display for Spec. This simplifies the dev_info!() code for
>>    printing banners such as:
>>
>>     NVIDIA (Chipset: GA104, Architecture: Ampere, Revision: a.1)
>>
>> 2) Decouple Revision from boot0.
>>
>> 3) Enhance Revision, which in turn simplifies Spec::new().
>>
>> 4) Also, slightly enhance the comment about Spec, to be more precise.
> 
> A bullet-list in a patch description is a sure sign you will be asked to
> split things up. :)

Yes. That is an eternal truth, which I foolishly ignored here. haha

> 
> And in this case I think it makes all the more sense, since all these
> things taken separately ought to be simple, but having them in the same
> diff makes it confusing to review.
> 
> Although it's mostly the `Display` implementation that at the very least
> should be its own patch, the rest can probably be kept together as it is
> related, and adding an intermediate patch would require temporary code
> to build Revision. The diff becomes much clearer once the impl blocks
> are moved where they should be (please see below).
> 
> The comment update can be squashed together with the Revision/Spec
> patch.
> 

Will do.

>>
>> Cc: Alexandre Courbot <acourbot@nvidia.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: Timur Tabi <ttabi@nvidia.com>
>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++----------------
>>  drivers/gpu/nova-core/regs.rs |  8 +++++++
>>  2 files changed, 33 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
>> index 9d182bffe8b4..8173cdcd8378 100644
>> --- a/drivers/gpu/nova-core/gpu.rs
>> +++ b/drivers/gpu/nova-core/gpu.rs
>> @@ -130,16 +130,18 @@ fn try_from(value: u8) -> Result<Self> {
>>  }
>>  
>>  pub(crate) struct Revision {
>> -    major: u8,
>> -    minor: u8,
>> +    pub(crate) major: u8,
>> +    pub(crate) minor: u8,
>>  }
>>  
>> -impl Revision {
>> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
>> -        Self {
>> -            major: boot0.major_revision(),
>> -            minor: boot0.minor_revision(),
>> -        }
>> +impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
>> +    type Error = Error;
>> +
>> +    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
>> +        Ok(Self {
>> +            chipset: boot0.chipset()?,
>> +            revision: boot0.revision(),
>> +        })
> 
> This impl block for `Revision` gets replaced by a block for `Spec`,
> which is only declared later. Can you move it (and the one for BOOT_42
> in the third patch) to the right place, next to the other impl blocks
> for `Spec`?

Yes.

> 
>>      }
>>  }
>>  
>> @@ -149,7 +151,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>>      }
>>  }
>>  
>> -/// Structure holding the metadata of the GPU.
>> +/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
>>  pub(crate) struct Spec {
>>      chipset: Chipset,
>>      /// The revision of the chipset.
>> @@ -160,10 +162,19 @@ impl Spec {
>>      fn new(bar: &Bar0) -> Result<Spec> {
>>          let boot0 = regs::NV_PMC_BOOT_0::read(bar);
>>  
>> -        Ok(Self {
>> -            chipset: boot0.chipset()?,
>> -            revision: Revision::from_boot0(boot0),
>> -        })
>> +        Spec::try_from(boot0)
>> +    }
>> +}
>> +
>> +impl fmt::Display for Spec {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        write!(
>> +            f,
>> +            "Chipset: {}, Architecture: {:?}, Revision: {}",
>> +            self.chipset,
>> +            self.chipset.arch(),
>> +            self.revision
>> +        )
>>      }
>>  }
>>  
>> @@ -193,13 +204,7 @@ pub(crate) fn new<'a>(
>>      ) -> impl PinInit<Self, Error> + 'a {
>>          try_pin_init!(Self {
>>              spec: Spec::new(bar).inspect(|spec| {
>> -                dev_info!(
>> -                    pdev.as_ref(),
>> -                    "NVIDIA (Chipset: {}, Architecture: {:?}, Revision: {})\n",
>> -                    spec.chipset,
>> -                    spec.chipset.arch(),
>> -                    spec.revision
>> -                );
>> +                dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
>>              })?,
>>  
>>              // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
>> index 206dab2e1335..207b865335af 100644
>> --- a/drivers/gpu/nova-core/regs.rs
>> +++ b/drivers/gpu/nova-core/regs.rs
>> @@ -41,6 +41,14 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
>>              })
>>              .and_then(Chipset::try_from)
>>      }
>> +
>> +    /// Returns the revision information of the chip.
>> +    pub(crate) fn revision(self) -> crate::gpu::Revision {
>> +        crate::gpu::Revision {
> 
> nit: let's import `Revision`, or at least `gpu`, to align with what we
> do with the other structures.

Yes.

thanks,
-- 
John Hubbard

