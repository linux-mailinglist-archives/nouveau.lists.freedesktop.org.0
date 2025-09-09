Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB608B4A2E8
	for <lists+nouveau@lfdr.de>; Tue,  9 Sep 2025 09:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB710E636;
	Tue,  9 Sep 2025 07:05:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PYFnwyVK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAAA10E635
 for <nouveau@lists.freedesktop.org>; Tue,  9 Sep 2025 07:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4igGWx+ObP3dS1jxDdDrAN3wSjg2W/59tvAsY65vTI+rScYpXEamZn/JSgicMf1agGfsgsI0G5jXtOaGJxieC35o636LvgdtgAaVm7SAbEwcpvZw7SQcVD+cA9gem9gFcUyLyingAFBO97Jb760rNkHvCgYe0dku0bnvW+K6Su6mOyK7HQ6/mNR2+CBYk9zdaWZVl/ICGPpx8EwDCb7xCxwFjLm00NyCEu0OWCxq7WnPo64UpQMkrsZgnZiiJwEWzwjGlqH+kKUDLAJ4eQFD2cxrNchErlyH6m5cF0/H9Hrn+bySLJnUdn7KFI2RJ4SeWKp2gl8edQkQIwMMVNfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E22eECusKyHfLDAU9K/It4tVLzqE1n6Y3qdPEgtp4Lg=;
 b=YC7dP6ErZ9Knwl573c951kBcVaGxtvE5o8XiXLVpPWsgunTkQeKPOeY6KWncrcRoH9CehcfnkXQa5/UgHcZkJVYqYdcyOj+fqoA7lbOUC3LyIxcY/qbRyPnICXqvNSxrbxcegw0pCGTRr4wlFtTK2+2f6j387qHWRZExoDTOD347cYiNjqe/l/M+HP+R2E6pGtME4tYiaM3OC/a/dXqe2fhFK5uUg0Uko/979G/XpCYa4kHVOpQ1ePwqXrsLLVUiNhXkkJX5uSZh5o91WONerRx78qRXKK6G/U84/bw8zT6aofazqecHDIiT35bPeid/CkJQIxO0ed6kYTbUx+ntfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E22eECusKyHfLDAU9K/It4tVLzqE1n6Y3qdPEgtp4Lg=;
 b=PYFnwyVKVZwkqbuYZisyrvk8TOFw2VzCBXNHK59BwHJZFZRDJPlN05OWX0JGIeCxztxpur9jiwdYwe/9Y8bXdVWUmZgNwgg/dATO924Dgt7MwrYQm115Z5ZUw0ZJgL7ZkdhcnY59rZUchAQ0J7nr0wwVJPTbXIfPxafMbPhf+nGVhFB+7G+M61RpJIFms+ZsMjxYG34Qpw7mRpEHowtU9QN6SEkD8boiLuELCPAJ4c1iz0gYLm7yPZklC2r2ihAJKa1Z5IudlXZi2cPK83ltRdH777GQZa1S47bkrXzMggHAgtt95SDLClNLrc5js9ifLANySotEOisxZyUIgDo7mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS2PR12MB9821.namprd12.prod.outlook.com (2603:10b6:8:270::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 07:05:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 07:05:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Sep 2025 16:05:22 +0900
Message-Id: <DCO2UHSV1FJH.146QJD3UR8FVR@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 1/2] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
 <20250908-num-v5-1-c0f2f681ea96@nvidia.com>
 <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
In-Reply-To: <CANiq72kUsG10+E-W6zhFXhexZV+O_a-K1Px0kGkWPKvMMhAztQ@mail.gmail.com>
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS2PR12MB9821:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9c5029-9ab7-4c43-289d-08ddef6f4017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bkx5Z2t5dFIrUTVOd2NzZlVKakZEdmZ1K2FKRGYvd0RqeFJpYUJEODlzelRR?=
 =?utf-8?B?MHBoQlVocllidjdFNkdOVURYSnBMeVkrb0F6UnZKOFcwWFJUUWd1OHRzZXNx?=
 =?utf-8?B?TzVya2R5NlVTdGRrYXl3Zmh5RkVPdTBEV3Z3RjRZNzBqZ1oyWDZnb3BpZjJT?=
 =?utf-8?B?TkpEVCtESjZtUkxvcUJjZjJYTmh4ZGs0eWwvUEUzdUZqUGE3UmtJbDZCU3RG?=
 =?utf-8?B?eFQwRTZrSStMR1g3TVMwMEh2VlNCYnZRM2R4a2ZITjBEdGV3akNRaUFMa2FM?=
 =?utf-8?B?N1hrc0daMkNNbytwVFgrWHB0Zk1XMDZ0ME1sSVRQT2hYcXlwVG5zVzlWK2JC?=
 =?utf-8?B?M1I0cEFGblRic0REWlVzdnUyN1I2Z2p6RktMQTA2RlgwUW1raEFSVGZxMk1q?=
 =?utf-8?B?UklUQ0dEOUZvcEw1TmFRR2ZzUzVkRXU5dTVPSVdHVi9qK0I4WVNmbWFXbEZk?=
 =?utf-8?B?SGJWV3VENkcwS0dSRmlBbFMvcm0yMzdKcnpDZ1NXcS9sdmFDYk9IUmJPMjFm?=
 =?utf-8?B?bmR0MUtpcmFwbDd1S3pueVNkNTlUd0dzUWxqQUJ6aFdIVU1UWUF6Q0w2M1JB?=
 =?utf-8?B?VCtqYWZvVGI3ZWpPVmRBUGF5UHlpK2lwT2hqcXBmR1RWVHNoOE12aEFoUkEr?=
 =?utf-8?B?OEJybGsrekErcGlVUDFXYjFKellqdUpMTWlXemYrdlRkOTdYRzBWSi9NY3o2?=
 =?utf-8?B?VjJldEhkWStiMHNSelZ1UXpTV29HOHlxdlBYYnN0cExMT0V5ZXc3WSt5dnZH?=
 =?utf-8?B?SVIya0xBYVRyK2pQeC92eE5Oc2FleEZlbUhITDV3bzFPTTFqbXZYYmI3ZEtB?=
 =?utf-8?B?UlFOakhLakhYdGhVeUw2MWNBUzJpNE0zUkhBMGZTL016MHp5b0FNbGRTV090?=
 =?utf-8?B?Ky83a2FZUXJrMHpMZkVPdjltZDNEMGJUb0c0QnNtTTU0YTdJZlA4WlNEUFlZ?=
 =?utf-8?B?UEZlMVoxRkJnY0JBVTVlbE9hRmF4eWN3VTJIdTZseFZmN0lXcUpaSTVUWGNI?=
 =?utf-8?B?N0V0d0ladkFnT2JCT0NyTlNNQ0FJTGxqeUFNS1UrbnhuMG5XNFdkaVNMOVps?=
 =?utf-8?B?Zk5kS3JLSEwvcGE0eDNHWXBTRnkwSkY0MWRUeHZlUUNyOEJuQm1Xa3RPMjZM?=
 =?utf-8?B?QjNJcnhsSkJhTUJmK1ZpczlxdDhpVFNETUpGL3kxRURUaDhDeWxaWktGOU04?=
 =?utf-8?B?VDFRTFlSZnVteGZaamh1YzVFRERGUzBZcnEyWGw0Q0g4N1JNb2lzQmJ0dFJO?=
 =?utf-8?B?d3RUMmJkM0xNcHNUZHdzdzJPNkpsT0tsT3UrRnJhMk5aTXA0Z3J0dEEvK3pV?=
 =?utf-8?B?OXFCNEZWM2RmZkFyZmVRNDhQU1ZBQW1RUjI0eFRoMGNtTTFJdG1qb1pxV0pD?=
 =?utf-8?B?THMyVCtzSXZXM29FWnRtcG9RRTA3WUZYZU05Z0NYaUlHdmd6ZkVqYWpaZXVL?=
 =?utf-8?B?Y05jRE43MmJSejVKWjh1T3V0Nzdua1FiMzhUYk41M3pOZmJ5ckJ6VExhdDJX?=
 =?utf-8?B?S3BoVXE0Qk5USVZybzhvTFkzMEN1cXdURHh3cFZzYnFaWUdaOElYWjZYTWh0?=
 =?utf-8?B?clJ2ZDRMSDA4ZkhjQlZZU2ExNzdrZkVRNXF2THpmSmMyLzcrN3FVdjliOFM0?=
 =?utf-8?B?K25QY29RU2NydHNOdW1rM3NnQnZDUTlWL3prRldvWXF3NkMrbkF4UUVqenNN?=
 =?utf-8?B?bGtLbDVFdnBXdURrakszaUtoK0MzTFlDZFdZKzV6SFV2dERjM3NYVzhzQ05a?=
 =?utf-8?B?a1krNWVKaG1hWVBJdkJTK29KcnBqZnQzRnladEw1UHNiQXZacTJnMkhwQ1JO?=
 =?utf-8?B?REVxOWM1eUpkVUV3NWp3THVzUHFrcGtmalg3MlUwTEprN0creWVJcHBQRExJ?=
 =?utf-8?B?ZGpVL3o5NHI2VXl5Yk50TVhWOUJkYWlKZ1UzVFdIclBaZUt6ekNuTmxGYXNS?=
 =?utf-8?Q?S6Ss7dzgoNs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGErRUVTKzFjWWg5MWtvUGF2eWNyQXI0SXpJTjJlbGIrRmhtdGgyK1BKRmpi?=
 =?utf-8?B?anFFSC94NlRuQzJtN2R0eWRYakNvcFBDNjZVR0NJOExaUlN5S21hSFpqQTM2?=
 =?utf-8?B?VFYvVk0zL2c1TG40MDMvUVVzcTdZeTZUMHRad01raU9RWGpiblJHbTZaK3VN?=
 =?utf-8?B?VlJZQzQxRjFpZGtSOWlxclZSZFdyYjh2TE9SbTlFSGFhWCs0MDE5Mmc5U0xU?=
 =?utf-8?B?T1NaN1dmZHZobVdRRVJJMFBQY2Q0cHN0dVU1UlBMVWNmYXgyNEJvbEdVT2hz?=
 =?utf-8?B?VEE1a2FoTFl2SmdaUHlkZ1hVNlZWb3loS0lSU29QVGpsQnFEMndwQ1Y0WUVQ?=
 =?utf-8?B?OFhTQTNwWTRqTHJxeHZPdWZsbzErSTFJMVQvL3N5QlNqVG9nWEh2OTF1TEFE?=
 =?utf-8?B?dy94cU12b3FvRWJ2anNVMm9QRG5vUm1BTTNxVGMrcmk2V0N5T1BlM1luWm4z?=
 =?utf-8?B?Wk1ldGx1aXhsMmM4UzdicjBtUUlrQktLRkpuQmlXclptMXBTWWFBd29wc1ZG?=
 =?utf-8?B?bXZPRWhSU2d6V0lJZ0ZwdnVnZUdYYlo3VFQvYnVXODN3U2hXaFVtT3RzalZX?=
 =?utf-8?B?SFJ2aTRHWVY4NnQxVG9XWWNRYlJ2WVRJUnQrNklwZ2JNUE9hSmVjY0xvakZF?=
 =?utf-8?B?MkJpOXpOMWlDK0Y5MVptanJQRTJld1lIMS9WVHlDb2dNdE5IMmJ6L0UxSVdm?=
 =?utf-8?B?aFplZk9CUWFSZEwza1FRUTR2VEZIamhwOVEyL0E3N0crUFZmdlBPRGRwcFBR?=
 =?utf-8?B?cG96emZGMTBES083S0NzY1VCSFVhYm5aMkN5TXEzeVBsVUhobmIrNzhxUTU5?=
 =?utf-8?B?SHZhVEQyQ01HN2l5bWNGajEvRnFtWERaUHc3YnZsTUlQTkUxNDZqQm9IRldH?=
 =?utf-8?B?Z1BXUHJDSVFXeVNhMGJKYkdXVHQrZ3gwWDBaN0g2dkpGYmRyekFyM3pybjFC?=
 =?utf-8?B?N21rRUZZQ09YNVhpczNWUTk4SzB3MzhXY3F5TUR5YjRER0w0cUJ1RTBWenF3?=
 =?utf-8?B?ZmhnQXNkSmNZYklIL1lhb1YySmp6UTdLZUNmNXVSMnBKWUhxalpFRWxJRkI0?=
 =?utf-8?B?cXVlQ0ZadUdzZGxwOEtlejVRMURoNEJjRUd3ZUplZks0ckxTRGJtd1Q5Q0xF?=
 =?utf-8?B?ekZhK3RhMkJFNlZqVEtwUmRJRnFybXRySGNhZHRRcThmL1JONGRoZjFKcU1w?=
 =?utf-8?B?UzNibFhhK2hoTS9ibmRGK2hDK2ZNTDhmRllPcVpnTmVET2oyNTBjR25QM1p1?=
 =?utf-8?B?ZjQ4OU04aDB3OUZGNmlSTm5sdkxRWXd1T2tPQ0J2bHlRWjY2S2lRZkN3ZWho?=
 =?utf-8?B?T01WYTFMUS9TT3oxa3JhSjltdmUxWTREK2s4TWRRVG53cW8wRzdHakJScGxU?=
 =?utf-8?B?dGVnbmwxbUU0VWJiOGllb3NNK3VoRGtiRDE5eXhiVkhxWUgycUZtQWdXaWdF?=
 =?utf-8?B?bTBBbkdtdThhNXRWbVl4QTcwQmh6OWdaMWw3SnVWMW5GQ3dMWFJ3ZVZZdDdh?=
 =?utf-8?B?YTJ0WE1qbS81cHEzK2RoWm9nMW16bTMzUzdXSk1YajIyU1RYbG9uNUV5Mmt5?=
 =?utf-8?B?bG5rWXN3Z1lQMUdlQ3pnYzBDdE01L0UwajJpMXR1U0hib1dUYXE2blY4cXRo?=
 =?utf-8?B?R0o4elVMNGZ6b0RuWUg1UVBLSnZCbkVJcS91b0NoNmdJS1JiWVVNZmZSajVp?=
 =?utf-8?B?NDFzYWw5U2lsUG5CYmNPcFJ1Qkt2SXlYYnFJMy9zSG1XUnUwdWdkcGY2NmpC?=
 =?utf-8?B?cWsyc1BmT1gzTTloTnFaNWpNbUdBUVNtb3FKTkVLSXgyaUl5VmlqZG5oN2Rr?=
 =?utf-8?B?K2RoUTF2eEtlV1FZT2dGUGZaUG1aUWduNkVGRmFJWTU0SGtYeHVhc1N1aXdy?=
 =?utf-8?B?bnZMbm1KWlF2RmtCMmtaU3VLUUdmK1F0OFFNU2tmVTlORkUxQm45NHVwc0Z5?=
 =?utf-8?B?OFQ0Z21sV1pnMm9FZWU1Y0N6cGRObFFNSWVRZHdjNi9ocm9kOFpleldYVG5F?=
 =?utf-8?B?Z0Z5WkljTTdiRW1HUDNxbnB4OUtMS2tBQmhUZm5rUUp2NkNTREVPM3NqbzNl?=
 =?utf-8?B?NFZWdWhHMXo4ZkFhbG96TWx4dE1zdjZJTlQyR3YvTE5jcVpjMmVXUUtnVThu?=
 =?utf-8?B?UjFjaHZNMTdMQ1l4Rk41M3MzNUNVRVd1ZUhnOFlnTFVuQVZnODBUbnozTXEv?=
 =?utf-8?Q?Y3uEj+JkS4J+hCEma9I7RglPdO4ZCiWDO8BprS86fy1b?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9c5029-9ab7-4c43-289d-08ddef6f4017
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 07:05:25.6368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0McBXbMjuVPbKyxyKS75nWXraJT3yGjPLvp/tcNTQscWEUvTNrLPPIH443gZ3OHNPtNNv+6HNxhLgBQfUokc9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9821
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

Hi Miguel,

On Mon Sep 8, 2025 at 11:21 PM JST, Miguel Ojeda wrote:
> On Mon, Sep 8, 2025 at 3:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> +        if ALIGN.is_power_of_two() {
>> +            // INVARIANT: `align` is a power of two.
>> +            // SAFETY: `align` is a power of two, and thus non-zero.
>> +            Self(unsafe { NonZero::new_unchecked(ALIGN) })
>> +        } else {
>> +            build_error!("Provided alignment is not a power of two.");
>> +        }
>
> Would `build_assert!` at the top work instead?

Oops, it certainly would.

>
>> +    /// Returns this alignment as a `usize`.
>
> Intra-doc link.
>
>> +            // SAFETY: per the invariants, `self.0` is always a power o=
f two so this block will
>
> "Per".
>
> I can pick this, with or without the user -- or do you need this in
> Nova this cycle?

With -rc6 approaching, I don't think we will merge any Nova code taking
advantage of this for this cycle, so please feel free to take this
patch. We can then merge patch 2 through drm-rust after -rc1 is
released.

Should I send a new revision with your fixes, or will you apply them?
