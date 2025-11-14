Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE662C5D755
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 15:01:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7103110EA71;
	Fri, 14 Nov 2025 14:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PgajXeYq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBEF110EA71;
 Fri, 14 Nov 2025 14:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcGnKudG9cUGOpa31M9EH9tmaa3ifBsspqR3E8Qor7UmYL2yXsJWuoj2mbPDo5OiW8P8o0A5iUKps0S/wlK1ZIK3+jPS0Aeo6gGVsqaQEwq76XIXyB8fQiaZqAEfc3Q/53oLnwh+EmhdnA05LLktEGNA259s9GIENYF9peWqAx2gEgXmF448ebvVmkxy5ypE7apL0enfgG02PzX+pjYL1/9xRRvUexmxqNyV2pny9upH58C2boVvoAr53liqmUBrBZFAaDZITfqjo/u/Z51psSkV+m6XhDDrf1bYfaRtJYYwkhnEXjccgIDhffeoUbEiiKLe6n7O/UefFMf9U6nJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZ+R6LOZEzB7SvEC/Qccx2uHWQ09Wqlg5hc9zm7iBDA=;
 b=p1dlpJfeaT2EScZqIHLeV2YPmN35FXRMBpDwbr/dILrzfd2/jEs/c4wMPh90tjy9nHEFRNX5YLsi6Eiwhc6eLW9rTue0GgzNclwzSA1L+7tz7Qb5PY69QKPJSpVEkNRHfBu/6TDpMEDLfSzdgAqn9jhw4GfG8H3b82EvrgcZlsry8QCv/l6qsyZoHvtXjRSvnZwjaiCB5RX8b5geoihEzplBr5BTFHMGjf2G6TfjypON18bDIYfPJHZ3hNtTcnhwtt7dJNqwwemR5H6iqJqwfE8c/v9fQUsGU1y9z4/eGe3uMT1LhrkHHjM14cTiblc+zJhQsCMyR55/yOmfa5rpnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZ+R6LOZEzB7SvEC/Qccx2uHWQ09Wqlg5hc9zm7iBDA=;
 b=PgajXeYquIDPIMPydqyoJQ9ONEE4Hc0jeo1RsriQyFH9ww1rbzqHyXocys5WYLXGxv1fPnfP9BWQ+nVGjw6k84rI2GyOsnkkGKU47oy/++waFu3TsYbS57OMNmFHrKjS2eQ/RkcZU/RBaQDOpb2AIWnfedy7xTVNCuLG61B/iFkfW06UAKXoxKXdrR1w89FkS3FYj/1oomPnAh+KWLC5HV+6APbd/9k6XUZVNBVBQRsADTQphoeaUGi+q9kHggrfJfad5aZdtZBFjqS2swNGJY5V8bJMbZQHfs+SgYN13sbqTiG1KBsEl3rCnOk5yIZnPWWUWm+XfauATxtOxrMezA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 14:01:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 14:01:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 23:01:41 +0900
Message-Id: <DE8H17HDS2CL.2PKRL4FNPAXDJ@nvidia.com>
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
Subject: Re: [PATCH v8 5/6] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-6-jhubbard@nvidia.com>
In-Reply-To: <20251114024109.465136-6-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0033.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV2PR12MB6014:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e355936-907e-4efe-99a3-08de238657f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGNZWmo1SkVhSExsNnR1WUVsODVxN3pIL1BpT2NRNVA2c0U1Y2F2NnJ3c3F1?=
 =?utf-8?B?UUJlWlBjV2ZueWRXTHQyTFlDaG1HMDk0S3lRNlUrbm5ON2pib1c4eWNKTDFP?=
 =?utf-8?B?c2kxazAvSTR3N0JuUHAvZGhoWUJ3dXZ0KzlpdE5kME9UVXk3N0NhU3ZySWU2?=
 =?utf-8?B?VjRIR2lEMVQwa2xEMHZNdGMyT28vTFFBR1Vvcm1jVm5JejBhSEJpa2hrejI1?=
 =?utf-8?B?cld6M3ZIWmNobjJrV3pFbVFHVXJFT1ZSMDRaQUZmdEsxTjVXY3hxalFKYVZw?=
 =?utf-8?B?WGlrajJUamhRRzJmYTMvRERYUVlHZElyRk9OWU5NYVFWdU9jM2pZRGVyWGE2?=
 =?utf-8?B?dkdQT05aTE83LzRpS0JWZkxrQ3dUOVBGVDFFVFgxUjFFQUtkOHV0NGV0bnpZ?=
 =?utf-8?B?TDVZem9BWnh4all1OUhTcElkMlpURWppSytocWpxenprQTNKcHk2VEROY3FF?=
 =?utf-8?B?NzNNVzM1eURmK0VPbC9Hc0hBL0hUZXcxaTlselFlOGMrblpBanYyQ0hMSmNa?=
 =?utf-8?B?aXN4VXVzVFdTMnRkaWVoWEs1ZFNLdkQrK3dmZmFZc1V3L1h1a0JiSllhVDcx?=
 =?utf-8?B?eVhFZTI1RldTV3BUT284b0lCVnp5UFJUUGdCOVVoRm5YSnVSaXBDd1lHY0Fi?=
 =?utf-8?B?T1A4Vk5YL1RTZWZkQllvOG9hVytCSXRVQVBIZlAzTy9RWHluR1RNUkFFOEVJ?=
 =?utf-8?B?WDEzL0hZNUR0N2h2MllQdXFOaEg3OVptb0E2R1Q4NHlhSUxMQ3BmaVdJNjhU?=
 =?utf-8?B?MWplcGVTZTIvRE9VYzU1SzBIUW5QK0J0WlBrMkpNMDdVUlF5TlFkRUF6aHEx?=
 =?utf-8?B?bTR6OTlwQ2x5TStZbFh1Y2pKc3NhdGZiaUlCTWN1NkQ2VStLSUFKV1lhMWRO?=
 =?utf-8?B?aXkrY1NqdmFzcnZoeVd4NWFEZWdLVExCNnZpTDVDTmF0UGJQTy9Nd1RuYTdl?=
 =?utf-8?B?QkRRTDN0d2U5K1p0TUxrdm93S0lvOU1MVVRnd3NaNm1HcnlQNWYrTEdWZmMr?=
 =?utf-8?B?dFNLYi9pb0grTllUb2hlbGxmZjgvblp1TkJkNDlyN0xQVE9IU01QWjQyRmdv?=
 =?utf-8?B?eDN4N3RSWTBhTjV6M3ZDaC95Y1haNFl3TW8wdUNxYTBFTUNiWkwvUnNhUWlq?=
 =?utf-8?B?L2JPVStzZ3pEcksvckxYdDhMTGRaYVl5RWRiMGY2bGU3a2FwaGdrOHkydlk2?=
 =?utf-8?B?dS9QTXBuVHlYdXgxQTNVNUhLaklXSVB2eWJGL2xOeldGdFJiS0tBWUM1d2hJ?=
 =?utf-8?B?aTdHWnlkWFRyTEtEcW5WU0pSU3JQTXphRDhCc1NBTlFJamVxaFZmVytpK1RR?=
 =?utf-8?B?OXEzNTlta1lzUjdoWldZeXBka2xWV2RmcUhyb1hMT3JxRWtRTkl6czhibVlF?=
 =?utf-8?B?clpuM1Q2NG9qR25pMFBoek5WWHA4d2N2bnJaa2pKby81MTJLR2lFMk9DNWNa?=
 =?utf-8?B?dWRpdzNJWVB1L1Fhd21QM3hKTGxIMDNQZUJiVDFFdjc1czUrUDRlamVWOHNz?=
 =?utf-8?B?MytBR0JYMXR0alRzQk5FbC84dkNaSTBkSEs2TmhSKzZSU2N2N0FQZTlOQVNm?=
 =?utf-8?B?Um83czgxbmw3N2R1OHhJM25kU2NvL2dSRUpJUDJwb2g1ejRTNm5xZDBvOVBq?=
 =?utf-8?B?UDNDaFM4N3pVckFUa29ENkh5azl0eFRLWDNkRzJ0MG9SUW9jQTR4ODRCRCtt?=
 =?utf-8?B?SXlhc1QrV05lVXRkZnZML1Njd3R3U0drU2c0SVl4TnkrNEdTVHdUMnJrakVh?=
 =?utf-8?B?WktCM0xNS0VVR09nYXNxRkdHTEE4a2dvSEt0MFllZlYxOEpVcXRFYmt0aXE3?=
 =?utf-8?B?VVJTM3hNR01nOXFFellNL3pzTW9LRHBmdW9BcjZ6cWcxK2VPMXRlaUxvazFi?=
 =?utf-8?B?bWtZWEJXZ1J6N1YvaFhaUWJaL250aC80em9WeUlCSWNXaDA1eXExTU8rMHFu?=
 =?utf-8?B?cVdQUjlYQjdjTFdDZXRHRlhqMzB2a0xRV1Iwa3k3aXJrcENkQTMrVVlPcjlX?=
 =?utf-8?B?RnRzS25NWmlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVJIVzRvWjVYc2RxWVlwd2RIb0VZNTVSanBLTlpOeXN1ZEZ2MS9uRUlwZVly?=
 =?utf-8?B?UlRrTHZrZTk4MWtuR0ljWVNuUjRvd3VHRjJlMm1SMXh4d3dXUXZQM015SmxS?=
 =?utf-8?B?ZlhQRTFTUFE3N2VSYUVpbGJGaGs2Y2V1Q2l3WlJ3U3dXRGw3WmhhRVEvNW9T?=
 =?utf-8?B?NWV3MDNUdzUzYWxrRk1KZkRnUHVjSERZWWxiS2RYTFNDQzM1YWZJb3ZYRWdz?=
 =?utf-8?B?Skl5UjQrR3hPOW1RN3A3Y2xWakpzUVRCeEtLYUxPelBIYjlGRzNoTlpWQ1J2?=
 =?utf-8?B?TE1NWHFURHJGc1hKT2ZtOUcvcThVREt1eWR6L0xGOHBwcDFka25GUEhVSzla?=
 =?utf-8?B?VGZxTjdxb2VIMDdETjdNY0wxQTljcWxvZHdGZ21CamdxaUFsNEpkTkFPVjQ4?=
 =?utf-8?B?cXJUbnRIR2xDbEd1S0pBT05XY1dDMG81Mk9PNGw0Mzh6SmZ0aVM1N3F5YXFw?=
 =?utf-8?B?NE13OXlTQm1HVTlFTFExTWNyd0FsenRPVVU0b3R4TWJ6Ymk5VFZOdVphbGw2?=
 =?utf-8?B?UHVXWkxIT3pCTnFMeUZ2ODc5Z1V5eExVeGx2dHZUT0w5SEtEUDhuRWg5SHd0?=
 =?utf-8?B?WGdBdmxjUHFIbDZnS1dNM3dTeFh2Q2RqVy84dWN3YzB0L1ZlUkswcWhZajhx?=
 =?utf-8?B?MFRDSzRpOWQ4aFJhRGdLMldHaFJUL1VoUDJzUUNTeXhZcis3UXpUdDJXK0pF?=
 =?utf-8?B?dStNaWlnU3Bsb3JTS21vYmdFM1Nkc0Y5aHltbjNYRHBDMXY1Y3FDVlhtZ2Jy?=
 =?utf-8?B?WEtqQnhaSXNGaHNpRmxxa2EwQUtvWWtKQkp6d0lsaytKZWN2dnF4VmQwcUNN?=
 =?utf-8?B?Qzg2ejNXQWZRZVVLRjU0ZTczQWRsMEtuWDZXY01ZWkFxZHFZVFNjU3M3TmZ5?=
 =?utf-8?B?Uk9UeGtsYnFyaHVRSHFVU0h4R2VVR2ZUYWpCTjYxVjkwdkZpcEl1bUNFeGtr?=
 =?utf-8?B?M0ZqQ0ovcjBremlUR3NFd2ErU0pIUlhhTS9xenVkYTFrMW5oRXF4enhDYzlx?=
 =?utf-8?B?UDNWaFFjN05vV3pmQ0dIemZWdTlQN3JWZHA3WWF6ZVIyTTZKc2h6aWNNYnlm?=
 =?utf-8?B?U2s3KzFVNHZjTVY4VDFoZ1dob0tMd0pYeXdrcWdpS0lYT05Za0doNk5mU0JQ?=
 =?utf-8?B?OVNaVVhYcVFoRkdwN2JsQ25oM1BPdnhraktmSmFmZmkra20rN2lIUDZkTjB0?=
 =?utf-8?B?eUY2b21VMDBuM1dwd1ZZR3JzeTgvT0F3UTVWVGY4WHMyVGd1Y2NjT3l2OFpV?=
 =?utf-8?B?VWZSMFNId1Yyb0pxU0J4MEh3TWxQTDhFazRUTy90QksvVmFjY2JXcmI1dzdM?=
 =?utf-8?B?Zmp5bGFiMmsyMkVSSEttRk1tRDR4TDRXUnVHeHZyNWpJeWU4MXJNZjY0dGhT?=
 =?utf-8?B?Wmx0TjFKdkxCUVRydERjRWh6RUp3OFBRT3FvQVJuaU1sYXdLTmlKdSt4eFpZ?=
 =?utf-8?B?U0JmY3c4RVkzSTIvS0N0K2VWVmdmS0JUdFJMeHllN2N1Q0ZZblRsUVVqMi9j?=
 =?utf-8?B?RzErRlNoUERFM1Z4ejY3UnhIUHYzamJ6OWdxa2N6L2JwWXNjL2dpY3BlQTA2?=
 =?utf-8?B?ZUxKQ0o4QlNwd1pyN29uSk42QlVRZ2pjMTRHcDNTT1c4ZTRUQitXY24vRDlJ?=
 =?utf-8?B?elBkSEtWN1p3dkZtcmgzNVk0MkxlQ2I1Ty9qVjhYOFJkUTlSajBxL1FxUXo5?=
 =?utf-8?B?R21RMWVnVm91ZWcvVGhIQWJMbW1zL0Y5OXJlRnJmL2RTK2ZRZ2Jhd01ueGdM?=
 =?utf-8?B?SW5NeFZYSlFQYkd5Y3ZRMER6L01jOS9rRm9yd281K1g1ckVZUkg2UnYwSG82?=
 =?utf-8?B?K0pRNzc1QzFud0RiT1hwQVdiUnBwRy80WWU5blZOUXBpU21ReFVTZkVRTFRQ?=
 =?utf-8?B?TXlsMjEvaU1kOWJHbTNjSjdJTE9oUDhyTjMzUFFwUkxON3hwaFZUakx3UVVT?=
 =?utf-8?B?WE9JYXZkeGxLRUI3N2hCeXNHRjRpY1piWTNCYXpLWVJVeW4zbzV6NkFuU3pn?=
 =?utf-8?B?M1p6ZnJZQldZTnlYYmkzUnd3VzRzaVZ3bmZOT3RJYitzNjAxdWNiV0ZNbjM1?=
 =?utf-8?B?c3hMMU1HRTJRY2Y2MmRYclNKQlB0VXA3UjhvdjJXU2Vqb3dsaGtkeFI4R2hL?=
 =?utf-8?B?aHdiOFpnQng1TktQNUtLS3lnWndnUVp4RkkvRzNMajVBQjFGeWwzejdtQVdx?=
 =?utf-8?Q?dOvGorA3UdMoF0VV9PFbY3x0qwweIYUtWlFHx8K+Os4Q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e355936-907e-4efe-99a3-08de238657f3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:01:44.3161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Axy+kaKh4UNoovvHmz3+LLsHzgTbgAtDV+zEQQIVbJ05/v6aaMb+ZfakaCBNWDAzKR8p+HkMLxDshUIbATRhWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB6014
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

On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
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
>      }
> +}
> +
> +register!(NV_PMC_BOOT_42 @ 0x00000a00, "Extended architecture informatio=
n" {
> +    15:12   minor_revision as u8, "Minor revision of the chip";
> +    19:16   major_revision as u8, "Major revision of the chip";
> +    23:20   implementation as u8, "Implementation version of the archite=
cture";
> +    29:24   architecture as u8 ?=3D> Architecture, "Architecture value";
> +});
> =20
> -    /// Combines `architecture` and `implementation` to obtain a code un=
ique to the chipset.

This comment for the `chipset` method got deleted. Is there a reason? If no=
t I'll restore it when applying.
