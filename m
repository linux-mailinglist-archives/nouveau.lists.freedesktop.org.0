Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AADBC9B82
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 17:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114110EA90;
	Thu,  9 Oct 2025 15:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rppS60wY";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4D610EA8E
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 15:17:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v39bFEt4F1xdTrBvabMn0MVIo+5vQK1h1PhFKwEMjweobyUPWFZfsAvEN/WZi5Co/dgyDfj43nobQy0sMu0wNQ0zKlUnH3y9guhmxFpgXzkzx5d93wihdQJAD0e2C5jz+1qA1xr23eUaLndDt9zsF8/dex4Js61dng5SvKCY/+u3IZ6RNvTWXrLb5IkEIIv4ppnE7pJgAjvBzllucbUc4TQYrwrtvn0mkZ8Pa1dyjJmgBCoC6pfNF/P3ODZ5PgbDyjDPm6n2EmureTDjfsUeU6MoHDLCG2Zm9L2utKoTuy8beF3nP3wXEn9N7LqoBB8XeJ3XFWPaXdSCPBYZlyWOog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzvUjgcgh9uOHneW5g6rPv1vcYNv4b9Y4ZojRgBcLLU=;
 b=EXYb3KUQvYaQrlKJzYTynSdZkGvY1WGQH/6KLw0KFZjdkf35tmTF/yrRfeF+tbyQWXT9tycFj00TmfSmupbDZFc2CKOXqstG/XViCkTCw5xUGKpdvmb/qYvWFpDVLYJGOz1UYKjRFxwsJXHJ3ZgzJB8LytvvSa10uKu/JhFx18EanmmsmM1/jw/xGxddpNzJRrYmnI9zUom/bytWlcBxL4NgjgNwpsybFmXUMlXBVV3ermEgLvfuaDD1y/Kmxk3sPhdsauro9mxNObPKQwjABYSME54xqVTk89Yg/cEluExxN/uJd0w+WjfqRZhlMtDn3c3LTWs4PVYFPl6Kd1zqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzvUjgcgh9uOHneW5g6rPv1vcYNv4b9Y4ZojRgBcLLU=;
 b=rppS60wYihQUvscR4yY58lGP+pTTOvz8CyCtSb2jxAV4bCDKjX3Y4EpDQnjw7dBNY9kP8d4+DzQazDy1iSSTCOI0fklPF/2rgixny/VvUEVeat6+x1fJ8zAfeFZqkMbdMOTwuA+zHTWxMWRzieaiT+R0JlgLV7UnFtUgKGs0m+nQ1EyYGKMF2u4jxG9hK0OVYKjH88RLigK1IFAswGTH2ZAgPxTNtozw2ciUmc056H9A7PE8peh7JW0hSnLjbQxGexav5Wz5WARZWFzlfViuSwW4IvJHZjEG+WPu8fcNS5SuD2tr9ahOTTYsUfztjdghCTD4+4uoFaV9+mtYLd5pVA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7934.namprd12.prod.outlook.com (2603:10b6:806:346::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 15:17:26 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 15:17:26 +0000
Message-ID: <1ba060e1-a3ca-4570-a641-e1f09026b13b@nvidia.com>
Date: Thu, 9 Oct 2025 11:17:23 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/3] gpu: nova-core: register: use field type for
 Into implementation
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Edwin Peer <epeer@nvidia.com>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
 <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20251009-bounded_ints-v2-1-ff3d7fee3ffd@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:208:32b::17) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7934:EE_
X-MS-Office365-Filtering-Correlation-Id: 40077364-3050-4515-1219-08de0746f41d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWQrRVkzYThZa0lCeFMwNDZ0ODNEZ3NEOGZTZExhdGdXTmVBYmw4Z2ZtQkFn?=
 =?utf-8?B?Y3grUE5JWEkyanMvMWl0aGhFamZwTFlKdU5DNDhmRkhJa2tVRVByQ3Vnd01B?=
 =?utf-8?B?Z09LZWhhNmFRTzVhTXBZYTI1aVp5a0M4OG9jK1FRdHhlMWVCWXduRVNSaHNx?=
 =?utf-8?B?ZzVqb2QrTHNYQlN0aFdWelZKNVN0VGdWUmhqYXRnbkphclhoWE55R3ArS0hS?=
 =?utf-8?B?UlltbTV5d0MwNkpMRWRBc3YwSFplMjBaU3AzazRjaDFlUUN4Mm5qZTZXSklS?=
 =?utf-8?B?V3VWY0Z6dTluZ1FkV0xtN0dOQ2lvTFJYUS9Ba1N5RGpuekZhRVpmTER0V2lJ?=
 =?utf-8?B?U0pvYlI4ZTV2OVBUaURWTmFhWUxzajl2NmwrWDRBNmFPZGg4Z1JnWEdGamJk?=
 =?utf-8?B?VDA2NW1vUHl1SXBTMC9yNml3WVAveWpaTGN5VmFkQ3lncXBtUlQwUUs2enR2?=
 =?utf-8?B?bTBvbitQbmFRS3NGTmtCcTdMbzEwcVFoTFQ4TE5TQzhvUjVJVHBCallIcmZI?=
 =?utf-8?B?S1FYcnlLZUhrdDkzdHpGVHcrc05wYUlCanlkbnF3ZkNpS28yRWxpYnIrMHIw?=
 =?utf-8?B?UDE3QTZjdlloRlEwcWczQlN1a2lOS0VIMmxaVnVYNzZyZlhvTzhNSGpQTm9T?=
 =?utf-8?B?RGFrVWUrOTVHN29JTTdhblhRYWsxalFkc0pNR0dVUXFIMUV0OTVKVkllTWor?=
 =?utf-8?B?RDFNQ1c4S21qRC9yRk9YZFJhSk5vTVIveGNlODY0ZndMajhqU0JLWUd5VjN4?=
 =?utf-8?B?MjhBSzZuOU5CUE9YNmgxcStRczdPVXJPeDRhbjF3WE9FZkpCMHVFQ2VEYXlX?=
 =?utf-8?B?WkRobk9JbTZSeTJIM1k3SVkzaElmbU4ycW95eVBrUzBiV281a2o2OTg5QVpp?=
 =?utf-8?B?RjdCYmJaY2ZZNk1hQlh0RW10OWxGRjA0ejNraTBJV2FzbWxRbDRSL2pWYW5s?=
 =?utf-8?B?andMRjkzNWx2V0tsK25rNGJXRllzaHJVWXNKSWh2elFJaS8vSmdSak14dzBr?=
 =?utf-8?B?NENURTJuYm5ObDNOejl3L0hDOEwweDJNYStzZEtqRlVvalNzNFRUeDBLWGlk?=
 =?utf-8?B?NUJlaW1PRjNjKzl0NW11NWY0QWRyVDNtSFNoNTFnUnR1cHg3cmZBdjVhcExa?=
 =?utf-8?B?aHVwZmVuWVBqOC95MU9PelE2TXdUUDc1NUNVVmRxcVh0akExbnNpRHpYV1Ev?=
 =?utf-8?B?M3FjTlo3NEs3bVJ3aTZMc1ZrNHNCRzNCZEg0MUxqbTRtc0daOEdhMkVVZkFp?=
 =?utf-8?B?ZE1nWGp0MjhIWkRHZnZUOUVWNXpjM3dTeFB2UnFMS1NTNjBNbWJRS2cvWVdB?=
 =?utf-8?B?V0grRjFxYTJUWkJ5MDNhak9nZGxGSzlzTFNBK01jdWIvSDdPMW9SNjhKMHhM?=
 =?utf-8?B?STltWkJ5a1pqMXVYaU9rRkQ5QkVhdmVJR3JlV085cHZVSFpzWTREUWxRTXFo?=
 =?utf-8?B?dTdQbnROeG1tWHdKUXd3L3BhRTVQT1ZVZFFkVnpON1M2QnpWVzFpcU50WG13?=
 =?utf-8?B?WjUrOFF6UnpZZ0Jrb01xRzVKdVAyU1ZCanVsKzlONzJOMmtoWlJYZjU3R2gz?=
 =?utf-8?B?RFdBV240T3ZXYm1VeGxLdkg1WGlRTXhGeFV2MkpsWUFyYzRQNlM5eGVROVp2?=
 =?utf-8?B?NlRoZjZ4VWIyRGtRMDVXMWZCcjVLb2o1YUdNSGpKTUkvSUdhekJLdzhTcUZo?=
 =?utf-8?B?bkpRTUtKdExqUzlWRSszeWc0cUlFRFJnS0Mzb3ovMmNlOTljSEs4V1lNQUpq?=
 =?utf-8?B?bVhSdnBCZFk5ZnB2Z0g0SEdaRjByTkRwdFNmUTB2d1RCQWFRVWUzaWdBZ3pY?=
 =?utf-8?B?cENqTVNXTE9rZmVZQzk1YTNaYzd0NHIxbW96eWdpNDVjUko3MHpiSFNnUTRE?=
 =?utf-8?B?Y00xU2RlUEs5SWwxdW81RmtDS0lIdjgzRW4vMkRoQzBrenFMWVhhbW1jOUE5?=
 =?utf-8?B?TVBuMTFUdXZqeFVYdVRtb2E3S3FpRVJJVHBsVHVNeGpQM1NaamlyS2VzLzhi?=
 =?utf-8?B?SkVVclZvTk41TjJhNy9jKzkyV3Y3SkxKQ09pR1lkZ25vZkU1SzRsMEd5QTIx?=
 =?utf-8?Q?5ziUR0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1lNTjdRQTk3RTJEKzZDajEyMnJhL2NSOERGU0VZWHhPOHRhK2VBUFJpVDlG?=
 =?utf-8?B?V0ovdmp2ZEhEVUswcVVWOThkVlN1eGZMYVNISUFnVzZXZjQrRktady84ZmVR?=
 =?utf-8?B?QXVQSFNub1owZ0pJeEQ3NCttaFA3dEovQ0NtTS8vL2REMGFYRlFKWHdoWFJn?=
 =?utf-8?B?WHpqQ1Vlbnl5MTF1N2xsb0hUOE5zc0UzMUVYQ3dqQXc0RnFjUVpaZDJ2MjBL?=
 =?utf-8?B?QjlIS2ZSQnN6cGZVb1JQS2RzZTVXREozZ2VsMDJLWmdacThIV3F1SXJrT3Ja?=
 =?utf-8?B?eXpoWi9KVjg3c3lkVEY0bU1HcEJObTRqRy8xb3JNZ2hlUjRodEgwdFdtamxB?=
 =?utf-8?B?Tmh6cXhsdDI0SkYrRURMOFBnSWU0UVdxcCtKNXFXZUZxYitNSFhxYURtaFlQ?=
 =?utf-8?B?OEZLcWNERUZUM0ZHZytDTmp3c1N5R3VXQ28wNjZzWjhUKzg3Sm5FcEpiajBa?=
 =?utf-8?B?ZU9rRkRPVXdaZytLeTY2ZmxJSEVwblYyZWJXdU13YzBNYW83Y0ZLc2FmYnNZ?=
 =?utf-8?B?UDhhWGhBdG50TGVDRkUrQ0kzaytzU0tNaDFlRzVJZ2RIUjZxMkxJVytiWFQ3?=
 =?utf-8?B?cGVKcU53UjlVamVyNUxpaXVMWVYwU0NmYTB6ejl0OHhqa1Awbjc3dWszR3Jx?=
 =?utf-8?B?NTFOaFd0UFZENGRKTGRteUsvWG5NeVdQY3ZWZzBOZXBBZ011WWJIcFhvYm9u?=
 =?utf-8?B?cktIRWJMb2ZmWlFhVWVnb2JOR1F2SERuRUREUXNLUm9xcnhROTJmR250ZWNL?=
 =?utf-8?B?TlZvNGtDMmF0OU9oYkNRRHhPdjVCL1BOc2lvMHBSZ2M5UUg5dTlMUTdTR3Fx?=
 =?utf-8?B?SkI2RFRBYVhPVUNkVW5zTGhVVkpPN0t5MUJKaEI1Szg4bDdTZk13Y1FaS2Qx?=
 =?utf-8?B?dnhNQjRReWQzOVVrOURadDhaQ3ZvOHlZaU93QlBnT2dvZTU0bUNzQUc5SUJx?=
 =?utf-8?B?MVo5cFZDNlRwREl3VU03KzhWUzdsYnZTSEoxa2JlbHdtQ2lLWU45UStXMWRN?=
 =?utf-8?B?VllJZVhCczhiWFZvYjZYNnFnNjFhRzVZR1RRSjUrSWlMK0JhYWF3ZUcwaXhy?=
 =?utf-8?B?U1MrUHlVRnFMSGVnMzJ3NE1YcmF0OFdXTEt5Mi9yVEYrN3BqMncvd1ozSmpj?=
 =?utf-8?B?YzRpbk5EbFZlYnhWOFJUNmJWbHpGWUl0N2pJK253MkZqR1dMR2c2bHBSZnNO?=
 =?utf-8?B?Q2pmU3QwZGRrVyttQ0VuQU01NVVaWjk3Qjd0dTlzVWJ5dUFOUnhtVUtOakdy?=
 =?utf-8?B?WVRqQ1JwRTBpSGJMZUp4clJoNUllaVRmRCsyQ1l2ajFrcmRzSEo5N1hSOXRa?=
 =?utf-8?B?dWxLaXZJVE5oSzlMS1BIM2ZDNHdHdTNxamFrdE1KVmFsVm8zakNDNkVkalpY?=
 =?utf-8?B?eVFnbGdBWkowQlZmYXAvT3V2UE9sZ2pza2M1aW5jZVRBaFcvbHVSNTlkRy9z?=
 =?utf-8?B?TnFwb3lzZjNGSUVseG1JZTJvWUFjT2Y5dzF2Szd5eVpDWjVGa0VDNHdETytI?=
 =?utf-8?B?MTVlV2t2dmJzNmFoOW5rSVNYcEl0Mkk2ZmFLbTk4amx4d09Qam9EUmZsNFVZ?=
 =?utf-8?B?NS9jb1MwMXJzNkY0UC9OSE83ZVYzWUJpR2JDL1hrOCsvMktNV0tYU01jTjVO?=
 =?utf-8?B?U2xHV3U2Tm52K1RLMTZrUGdRRWs0aFdEMjljV0wxcGUzUC9SWnovcTk1cTB3?=
 =?utf-8?B?elg5MnlNWW9xVS9INzVoWE9rQkxFa3grSXF0TXhDQVNiUTMxSG93RGlyMng0?=
 =?utf-8?B?c084RlpNM081c0pIaHZEeHFRRUJRQzVXbUpLNjh6dTRmeHRLN2FqRXpWRzVj?=
 =?utf-8?B?YWtGNGczSFhTU1c3blpMZzZqb2pieXpYbGp2Y0t3TW1jVFZBMTNzclZ3YnpW?=
 =?utf-8?B?M0RvbnQwSlJKbjJFUmxvNXgxa1R2V3E4SGpLZ2dZZ3ZRL05NTFhaRFpLSVJw?=
 =?utf-8?B?YTBYSS8zYUFJdDFNcFJNTnh1RUdWbUF5SGYvbTI1bHRJa0pOa0xnWmpSSFJ1?=
 =?utf-8?B?ZXJFcTd3ZTFMMDFMUmo4VW40NUR3bkowb0lUdmQyMllhc056cVNjNmdTZmNn?=
 =?utf-8?B?SHlrZENBS2ZwUzZJL0QzRElWN1dXNStqeUJRamlDSFd5a3VUeTFud3hFOGFV?=
 =?utf-8?B?N0F1aEFDTXlUZGp6Mzd6VnppQlJ3YjdPMlk2UmpiQ1hXbU96U2FMUWp3OXVC?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40077364-3050-4515-1219-08de0746f41d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 15:17:26.0040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAcz1OIP9rOE1WAcCj7HYa0M2PbJthpc7uStFZEn9rzYuzitsE1PyZyMSiCC0gu+Pf1WYYFw+uFFgafHfe53ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7934
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

Hi Alex,

On 10/9/2025 8:37 AM, Alexandre Courbot wrote:
> The getter method of a field works with the field type, but its setter
> expects the type of the register. This leads to an asymmetry in the
> From/Into implementations required for a field with a dedicated type.
> For instance, a field declared as
> 
>     pub struct ControlReg(u32) {
>         3:0 mode as u8 ?=> Mode;
>         ...
>     }
> 
> currently requires the following implementations:
> 
>     impl TryFrom<u8> for Mode {
>       ...
>     }
> 
>     impl From<Mode> for u32 {
>       ...
>     }
> 
> Change this so the `From<Mode>` now needs to be implemented for `u8`,
> i.e. the primitive type of the field. This is more consistent, and will
> become a requirement once we start using the TryFrom/Into derive macros
> to implement these automatically.
> 
> Reported-by: Edwin Peer <epeer@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

As these are incremental improvements, could you please rebase on top of the v6
bitfield series so it does not conflict?

https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=nova.dev.bitfield.submitted.v6

Thanks.
