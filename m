Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB92C59E3C
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 21:01:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C212510E93A;
	Thu, 13 Nov 2025 20:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XW4FGjc1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013028.outbound.protection.outlook.com
 [40.93.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E5310E93A
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 20:00:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GR73rWmTQrjfqw0jHYvOeUiz7Z1xv6MoibEW2vJoOuAvCBLCT0Ts+eBMgg9OWl6inwNgg+LUa5mYrm+KlX30McKaEZEZhzfELI7/ZMs5lLPKktSn6wgOd22eYxkwfVCzCLs6YTkZT/coeNjp3RVRK2AYSV2gnK1lUokYBxR8qP3s2ZRAKgYDyOf9AYAqjgGnel3s4S27hVf7msK8Pum/N5fWnpFKELcZ8cuEpYEzf9HJ+w0HQW0ponfg/z1VrQB5iSSgL+1bxgbI7pBR/LwtS339YCvtgBPiuaPXyJgCNH0diEQpj4gvskjsIU0RFgids1Rub1llp0x3UF/CqJGR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2j899CAqC3LSSa6UuTB+NFlxqQOPIzMuc7L4SgGLjBE=;
 b=GOd1W3rHZ5vsF8rYB9HONt3vmq0n2y2ARi8Cbd8hfOhCKbwSXTVyNLNm6UXhz943jHiMDscJdGKX18qbwP27pDS/tsSa3D3KphyswiN9W3n+/fsR3ilzP5oI7CES2RSiT89O2QfHprNqwMQioJMc1ls/L7rZgnhDN/fNE0VWuYioWBAyWClLcWqiJKfNOzCgDdPNQL4tjoPBD15HAmOl7Vl9a9rsKM/NclSKHxY0nizWHE/z+AdPcgu22LSyiVNJhFVmjkmzqnVeyoTqsq6HAhkUDi573AJ5FLsa8fujpfZrgxXjZozLf2PJYeazxuDW44eSjZRO846VGBc4smJQWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2j899CAqC3LSSa6UuTB+NFlxqQOPIzMuc7L4SgGLjBE=;
 b=XW4FGjc13e9FlV4FvMKU0CUdWVvPBLM14zLNVTpqAeyCpgzz9E8uTXLGjkHbRbFtDwtgvMH8R8C8qKA2HD/Kge+yCC2t9oRbQF0KSo48xvoMZ3MnU+GL81NYQhXnyun2IO2oVkhAnq5NeVYlPM1gBPboZnvXbjnXaQdmHRPImJmgSOL7O076GWfLqxUxn7yjn8Q/80LCdOXVzhcr589A/F0qqQmJmsj1LjFM5uYeg1tloSYbafXOmecVcUCCAPRAgtFNcYKaiMsSM8gSSJlJgrHGPkdKug2hjifPRfGLyWkxkLKVZQZrQqPoy99lHHlQvcKiiacr+hDpn92NEshSIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8571.namprd12.prod.outlook.com (2603:10b6:8:187::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 20:00:50 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:00:50 +0000
Message-ID: <15ec55ee-1ea8-4879-87c2-2895731c2545@nvidia.com>
Date: Thu, 13 Nov 2025 15:00:47 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-3-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251112043000.83071-3-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR19CA0059.namprd19.prod.outlook.com
 (2603:10b6:208:19b::36) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 95469d22-5037-4df7-d63f-08de22ef57f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzY0c3pmd0x0ZFBkMmpiMWRDOFAvSGhocWRHMlY1MWlIVllXOVZ4Tm9PY25T?=
 =?utf-8?B?NWRDdTlwZ1VRUHQ5UDluOTF4Z3lzZlRQMXRDclE4QkM2M0ZhTk5hK0hFRWlI?=
 =?utf-8?B?SlJYajNFMEpzZm14eVMvWFdjYVhyK0Rmb1NoU0ZkMEt6MjZrUStCWkhXMGFT?=
 =?utf-8?B?NHh5WVBuczdnanFDSjZ1V25EeW5seUxlQTUwcmYzSUtlVENSUVNIS3ljb2kz?=
 =?utf-8?B?Y3ZsYUk4dnAvZ25JNEFmMmttdFFFZ044SkZWVkMvYWtlemdZbERzMVMxYmJw?=
 =?utf-8?B?ZnlpTHpseWpBTG0rTG5JN0pxSENhenBVdTI4U3FWZkkzUktyU2Vqc2NFaWxw?=
 =?utf-8?B?T3RHeHV6ZGtnOGVHbTkxK2FaMzl0d1M4ZUtPZXFaM2c3ZmFXbGFVaXlvd2FH?=
 =?utf-8?B?ajNiQTduR3ZzQUtCVlplS25iejVnNllkczZSVzZ0cksxRHZVaU80SlpNRkZH?=
 =?utf-8?B?blZsTjIvclJaamRKazdONGNnbS9vYURId1JOOWdvZ2RnR044TVNTZlRLa2FY?=
 =?utf-8?B?VHZJdStqUXg2U1dGZVVjUmhUNGI5SGQ0WkFTVEtXWjhHMkRkV0FMbE9iSnNS?=
 =?utf-8?B?Qmxzd05HS2VQWGk1T3JsUS9PK0FSN0hVckVBZVZPbXZFdlRJWGJzMnAyVW1R?=
 =?utf-8?B?bHUrVjBaUDQ5V0wwSXpubUxHRzAwVVFQS2YrSmUzVFBvbUlYb09OQ3I2WmRw?=
 =?utf-8?B?NHdaRUd3b1grd284V2V3ci8wYnJBaHdDdzNRLzl4L1BONjNmY01xK2tEeFl4?=
 =?utf-8?B?a0l4SHNYc2kxZlhINDRDRXZ2WWRxQTNvU0xzQkpNM2NHajZyakt3OExXRk05?=
 =?utf-8?B?NUlnd1pVRnkrei9CMFhSS0p4UXlPYS83TVNFVW1OM2kyTzFlQjJidHdiS0VF?=
 =?utf-8?B?UVliM0tMUzNJSU5PK3graE9VdGhNTWN4TGhyTGx3RGx5TGMzQkZBOGlmbEd3?=
 =?utf-8?B?STBjVVFMUlRIdUF0K01sV2s2QVpuQTlWSVVTTXNIckJlV05ZNHdLZTgzdU5n?=
 =?utf-8?B?MEJWSHVjVnZxSXM5UmlYNjdXMVJUU2hYODA3UjZMSWF0Q09xY21MU2tacnBn?=
 =?utf-8?B?U0xWeTVQTGlWRXNhMUhtbCs0emlkbTVwN1Rpb0Z2TlNuMFBpekJwTmYzQTE4?=
 =?utf-8?B?YUJjT3FmQkczSnRiWDEwdDJMYmMra2x5Vm5pTHdLNE5Pd3I2bWhvbzJCMGo3?=
 =?utf-8?B?R1Ywa3BGMFRvc2lvVjVkYmZ4Q3F1VE9VODJBdU1KNUpSRE0wR2ovcE8vSkg3?=
 =?utf-8?B?ekM3SjVKU09jL2tXYVBIM3VsZkFkenlnQ3ZpVW03NDBqSXVQdU50ckpkQmNJ?=
 =?utf-8?B?ci80L1ZaNjVzNGlkNWRSaFE2SE0vVGpZdjlpNWRzMFNOeXJLTGVLaFM4NTBi?=
 =?utf-8?B?VUJCRVBjUGJocXc1R2ovTlkyVG9KdnA3cUs1ZVN0WWh4eCtROWpDSGtiYjhV?=
 =?utf-8?B?Zm1TNFpJSnNYRlBUUWRyTU5sS3pja3VCMUc0Rm0wK3d5blp5MWdWQXNIN2Ev?=
 =?utf-8?B?cU9jS2VEdEhPZXFvMC9WR1RNNEo1V21tb2dvRmtWd1k2cjJ0VklpNGEzcmp2?=
 =?utf-8?B?Y0lKc3FSWjEvTDVuQVljWmxXRFJmblZwcUF1eThSTVdtNkdDbkhoekl0UE5k?=
 =?utf-8?B?ZmZmTTMybHZBM0lHTjRMbmZsVnJtUSsrYTNVWTVsM3JMV1pGV3B5TFVjQ21W?=
 =?utf-8?B?Y0UyTWdvYUNYanpKOGRLOC9oMFRqcm5TVEpnQ0JtKzRVMXZzVncrVVB0NFJ4?=
 =?utf-8?B?NEpWUmlOL3g2a1UrMWRxNDFYb21JMU1iankxSkFZbVJYZjdBbzdPdjhGNmFI?=
 =?utf-8?B?QkNLdzgwVEZ4UDdZaXNjazNEWEUyS3lXTnc2ZFhZY3hja3hEZXNzUm5aeTVP?=
 =?utf-8?B?MlE1aXpHTGJ6U0h2YW5sT04vWmpRSnBOYXEzbEgyR0ZLcURyY2dMK0lxM3Zq?=
 =?utf-8?Q?mRBYSlKb9CJ2xufMxddZIvlCI/P+DPt+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBjQjVWOG1ka3JTT3AwaEx5NUQvOUZ1TjFOS1N0WUVLcUNHMUk5MlNLcCtC?=
 =?utf-8?B?S09QRW8zb3AwL1kvd0dwWDc3cHFxWXZwbGN3a2RVRDNOdUxkcFRzNW9aZi95?=
 =?utf-8?B?bEVIZWZwK3UzMnNTSVFXSk1yaXNYSlhzM2F0MnZPZEhrRWhPR0crc0RDSG9U?=
 =?utf-8?B?UE55c2MwSjNMR1pvaEhEaEpsZ05ZT0trbk1hbkFSRDJmdmU3TWg3SXhhTFRh?=
 =?utf-8?B?U1ROSjZaZWQ0WUFraDB4bHNPUFFRSWRtZ2ZDUWZGaVBjQ0VmOVhNdCtCbzFh?=
 =?utf-8?B?RTFWeU9zQmJMVlMxN2ZmNnZrTFZEL3ZUeFdyemxtZDMrYW44NGZYZEpKWjlY?=
 =?utf-8?B?K0x0QUpjRUhKZENHWlV2TnBwNHBvalZidGkybXM3bnBpMDhlS1R6dGV5YTFC?=
 =?utf-8?B?THVRRnBXdkhJbk5mRTdBYXBJRnM1TXl4aWg5QU1FVW1CbVAvQm1XemdQb09Q?=
 =?utf-8?B?cDZiNUZibjZoNGdZMGl1VkFiU0VRZjBwV1RmeHo1SFIyQ2VjaWsxTmFjSHB5?=
 =?utf-8?B?NEVCK1UzdmZ4bEhTc3dRM0ExTzJaTkpwNEFiR2VXb0c3SnFDZWZIRE9FSTE0?=
 =?utf-8?B?TXV5YzlCTW1tVjU1VHNWelVTanVZNVBvM3FieDJDcmtJVGJFRWU5cS9NYnMx?=
 =?utf-8?B?anZnR2w3QjdCcEZaVDFKNmJBWGhkcmFFVW93aUdxNGl3NmJXZENXN3Z6MVp1?=
 =?utf-8?B?WGZsdDdTZUowdlRWaHNxcU5TYURQSmNybFJPRnkreWYwbVJ4SFJ1eU5oenQr?=
 =?utf-8?B?K01YMXRRY2JBUFNmdExBL1hXUlUxY1NQSWRBblE2dXZ2MEc2aHlmQ2pNU3JS?=
 =?utf-8?B?N2czb085ZVh6MWptSmhMeDU4eFFlb0F4MHl5dk95STlrODBTVncxSEtjUHcr?=
 =?utf-8?B?UHZ1eDJMNE9GbERZMXVpUU5IQWZYU21rdzJVWlI3Sno2dXp1L29FQVZNZGUy?=
 =?utf-8?B?UEJVVC80Rkwwbkk0cm9ZaHB6ckx3UjNkZG4rS21HZGpRL0NpdGN3RFNTWFVu?=
 =?utf-8?B?Y1hhakNlZlVadS9nb0RHeU9uSmJ1QUVGMHUwYURiU0Z1WFFVVzRaelI2RXVx?=
 =?utf-8?B?Zy9UUmNJbjUvcGhpZ2Q3eUlVdUZNN2JnZVRCRGEzVFI5dDArLzhhYkQvby9n?=
 =?utf-8?B?U3lKbWNpRW9oRjczVXVxdFF4U2ZQTExpd2NmVCsrZFNLdU1VZ2VoVDhPU01z?=
 =?utf-8?B?cnNZSjR1WnFZd0EyRFpQSnQzZWg1YlJDUzZZNW96UVJsbkxLNVRjVEJKaFB2?=
 =?utf-8?B?L0JsU2VHKzBNckVuVGhqWm1WMGRFZVNBUEZwV1JBUVlMOWdLN0pJRmZnVzE3?=
 =?utf-8?B?aVI3cGxYcWtsdXlUam5ZL09WckVzQVJpSHoycEI2UnpGeUZBa0dWNG9sVEE4?=
 =?utf-8?B?R2V5aFpKL2xTTHVtVGdIbnNYdndjZzg3ZXhIK3EvRXlyc0Y1R2xraUZYa1RN?=
 =?utf-8?B?bFpCYlg2cGRJTkFNMGNHTDluVjV5RTRoS2JsVjlxRlBRYWFIaW5WbysxRWMv?=
 =?utf-8?B?Um8rdVRxa2QrT0FEeFRWb0hqYUpEMlUvYk16bDlzTWFweW4zNlVyM21tMUlm?=
 =?utf-8?B?ek96SVVWZ0pxUXd4bGxiZVdVMmFSSllUME9QMm9yV1lHdWx4RXdiL3cxbkE3?=
 =?utf-8?B?WE9KVGNpNEwvYUpQT3BQK09oNXhwd0NHenM0aXgzazlzQXE4bXZVbFIzNVlM?=
 =?utf-8?B?dUk3ejJkTnk5dU5ENEdUOVV2S2hiS1FYSm5GL0FwNFNGZHNGL1o1SmF3VDZ6?=
 =?utf-8?B?azd1cDFlNjBWV2hBTjU5MFRqUC93bkJQakdxOXNhN20vU0RmeHVoeU9mU0Vq?=
 =?utf-8?B?M0xsT09CNDFHa2ZOc2h3d1RPZmdJeXBqZmp6SXpwVlM4OEs3V3N0dUE4SnNT?=
 =?utf-8?B?ZklPcDdXNkM0SVdaR3AxU2haazY5ZHJ3SGRtam05RkY0SUgrRm9hUFRLdmRX?=
 =?utf-8?B?THV4U0hMSVRKNEZJNkx5ZFBPbUQrbGZzTkdQWTFFWStyT05EVlJhZTNhTU1y?=
 =?utf-8?B?UlBFbS83bTd1SEZ2YUtsc2w0em1kNEIzc0YraE9mbk94dzVSQUNWeFFZNW1o?=
 =?utf-8?B?enF6YzRZdGdVZ0ZxT0hHVzBTWUxEOFlvM0hoRUpodVp6SSttajFSa2VlanM2?=
 =?utf-8?B?ZFR1VTlJWU1HM2FJWDYwdm4vaWVYdVc3ZXlFTGF5QUxWa3ZNTnJWUFNjR3ZL?=
 =?utf-8?B?NEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95469d22-5037-4df7-d63f-08de22ef57f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:00:50.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOkMtxYpEOVenSbtJn9hCYJgh4MHSeHh5atoYlrBgJX+I3RFmMiBBzT8uWnuvUDmu5SSoINg0fxtYFup9O3axw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8571
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



On 11/11/2025 11:29 PM, John Hubbard wrote:
> 1) Decouple Revision from boot0.
> 
> 2) Enhance Revision, which in turn simplifies Spec::new().
> 
> 3) Also, slightly enhance the comment about Spec, to be more precise.
> 
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/gpu.rs  | 25 ++++++++++++-------------
>  drivers/gpu/nova-core/regs.rs | 11 ++++++++++-
>  2 files changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 7fd9e91771a6..acf564fee9c8 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -143,17 +143,8 @@ fn try_from(value: u8) -> Result<Self> {
>  }
>  
>  pub(crate) struct Revision {
> -    major: u8,
> -    minor: u8,
> -}
> -
> -impl Revision {
> -    fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
> -        Self {
> -            major: boot0.major_revision(),
> -            minor: boot0.minor_revision(),
> -        }
> -    }
> +    pub(crate) major: u8,
> +    pub(crate) minor: u8,
>  }
>  
>  impl fmt::Display for Revision {
> @@ -162,7 +153,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>      }
>  }
>  
> -/// Structure holding the metadata of the GPU.
> +/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.

nit: Can befixed on apply, but the types in the comment need backticks:
`Architecture`, `Chipset` and `Revision`.

thanks,

 - Joel

[...]

