Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE8BCC36F
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 10:49:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D4310E107;
	Fri, 10 Oct 2025 08:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uA0WxC5v";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012022.outbound.protection.outlook.com [52.101.48.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E14610E107;
 Fri, 10 Oct 2025 08:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjospqP0+qZCJEkQrrTwItu5kUs1IkiqY2F/p0VBHYUK+7KDl+Dterr7MoI7cn50VsdYoPiMrcasq1hmqYW9ATjp0lryDF/vEv9H12K9HNqt4/Np1XG1BWyVguz5JpmwR+PgmMo/5DyZ7q7kVU1Ie52//P3DdNGY5S68VmqKJcTWkTpSNmybD16n46UKPmOiKmKK5HBw6ijY9/i2qNSPY4rOz/fVLQBlDXnyYxCp9aTaZg2Ge8jv5bA2UN//aF6U6VlJk9Y4naQU0YgMc6/1AzzZvL61VFIQzdhiA57+bBEF+9MSeLLT7+ECanNdd6XA5TOJkp5udWCKex/Nzc1EYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+Ue8i1qymd4ZsBPyaIIrjZTyHApgJWcv5IZ7D3dEsI=;
 b=rzC532NLiNyfEGV/V3KxvaD2DvuO62WW5oI85DN7qcshEZ84tF0+vvcaWZxsDdN5CqsYDFynriz565Ya/OaHPPkNp4yKDfDgFkSKGzRb0Q9JKbYklPRDRBgStN5vMiNahu61I94KREO2w+lhGPa6jZbdqhhTKntfMRD/b5zLRSqatrTpyU5XYHl32HhKFYz7cRBCraMG+yiC0aISF94D6UWr6kMZWuPp+7bMxxnqBehDJaXUKEy8in2MM0moLeoIEU4ySsNLwa4+hQN0dSXarhh1fDnF7FRYTryMIAH6h5wj7VmSoZAPBh180akw3mq/kmcBRNT1wnqLNGN2XUPCmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+Ue8i1qymd4ZsBPyaIIrjZTyHApgJWcv5IZ7D3dEsI=;
 b=uA0WxC5vbHFEgQytkHgUgcf+kglLZkKHSPwRwLwaLmMHV6RuEKJtYeDsn2iJXhoZEUSvT/rNFuy3LFMulEvcCNVqqgOf+CyasW/Vk8MoPUU7Of7MQ1UGDyYmG4awEcsP7aUiXiIb8Bq3wXIz4wNiMAD0wLpD/tzZFVmTKoODT9rop6er1vb0u7NlL0R+xYl9s1LbaunyYaIZsZDBrixHrZQ8tdyQGa69cd5LFTpfJYJ61MdgohcjDQCosrvyKBd/oN/R4/wTWZW3ZokxFLjaEAe8bISPHSWsi+QM0k7Asn/E21LOL+1ySCSjk0DF1VNNP00TWXqcxL3FgXGcP2t91g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:49:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 08:49:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:49:23 +0900
Message-Id: <DDEIH181JDA9.2DG2C3DBOB2V@nvidia.com>
Subject: Re: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Yury Norov"
 <yury.norov@gmail.com>, "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
 <20251009213353.GA2326866@joelbox2>
In-Reply-To: <20251009213353.GA2326866@joelbox2>
X-ClientProxiedBy: SI2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:4:195::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d9bc0c8-aee5-45ae-2bd9-08de07d9ecbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTVhMzZWVmd4emtVR0pmbzZMUmkwZkNxd1NmUjZ3Z01LMm5WMGpsd0dNQWJ6?=
 =?utf-8?B?TnEwMGtOa0tjNVhpN2VITjlBY2pRN1NIR0g3K1pYOGVtclB2TWtzUUJVd2Y3?=
 =?utf-8?B?Q0NoajVNTkZyc1N5OG1FRi8xWFp3cVppekNSa0hNQWdBcmtNd2M3NFA2WXFG?=
 =?utf-8?B?emsvSTRJdDBsTjQ1Z2tyaS9hdVdnbHJiOVplclQ4YVU1TUxSN1FzQ2R6YUFN?=
 =?utf-8?B?T3VkVGU2T0dQZzJZYndFNFp5NTN2MUZDaU1LYVl3VWtaQjNpczMvSHBzemhl?=
 =?utf-8?B?MGs0cmlWUVBVQ0hLSlVFRU1PNUFjeWhyTkc1ZmZvM3pxM2dKYlE5SE84Qktq?=
 =?utf-8?B?TmFkRHBhNnNZMExPQ1J5N25MdlMvSWtjb1l6bzdYZ2hiVFp4eW11T1dQNE9G?=
 =?utf-8?B?aWMrdHNFYmU3NlIxOUlBMWxyT1BOWVhYbWFJMkd2VWd4U3Z0VXZBS2NmRGdG?=
 =?utf-8?B?U1BaTFF4MEFGZDdpRVBEaDBwcVZTcnJqUmRzWkh2VEdnQThSd25IWnNueWFn?=
 =?utf-8?B?V0NWM2EvUFMvODFKcmZXS2o4Y2k1VHZJMlFWYjhkWjdPeW4yRng2UWtiMFBL?=
 =?utf-8?B?YklscTBIZVlrVTN1TUhyTmFaSUdldEJubWlQUTQrUjlVTWVncXNBZzU0YUd2?=
 =?utf-8?B?N0tVdy9rT1FLS2E3VndITUZHZkU2eXlHQkdtc2wzZGdhU3dIOG1ab2NvU1JW?=
 =?utf-8?B?ejhJa2g3d0hqY1R2OTZzWmlxSUtjUGxRUmxwL0dSblJsa2hQSHNVU2dQYlN2?=
 =?utf-8?B?UHYxdDlocmE4ZDdlVHFTK01hcnFWVUl4ZjJhYmJDV1dwNSsrY0xwRzR1bHpG?=
 =?utf-8?B?YzFPZ3FWdlZVWWZPRFhURlh4S2RWMWtXbTFETW8rVTNZWjNEUENtR3dyM0p6?=
 =?utf-8?B?YVpWWDkxVzdoR1lBWmZWcjVGZk52R2hydldyMS9hQzlZSG0rd1BTczlQVU4y?=
 =?utf-8?B?UnlMVU5LSGR0K1JXTFk5eXRKMDZVV3k4eHhGVmVyeVpOYUtGdEY0UGRhRnM4?=
 =?utf-8?B?WmdDdm9aYnBuNzY5dU5oNElHU21jd21tTlZ2TUs2cXphK1pMOWlMMzVQRmlM?=
 =?utf-8?B?dWd4L1g5ejkxQU44YmNrcXRmY1dEeTA2dkFiYjRaM1N5V2ZYVVNzdG5XZWRx?=
 =?utf-8?B?dFkvV0RudTJhb0ZtQkFaTy9DSXFjYjI1K1d5MExrVU1ZWnR5MUZzUkxucTIz?=
 =?utf-8?B?ZUdrdk9OTTJYZU91b1JzSTJoS3pTdmR1Vno3anBwV3haR0VwbHF3RFBQVnlG?=
 =?utf-8?B?Q09vS3dacGRzUHZvTlFzY0FVOVBQMEdnOUhmODFOYytNa0VLYlIzQUcxMUZZ?=
 =?utf-8?B?TTVmakljVmdzNWpJcmVtMkVTTUtHdUZ1T01GZEpMZVAwTHltWExka3BqUFRn?=
 =?utf-8?B?aFFaWXV5dTlMZElkUW5pQm1aZFRhMWQ2eHoveml0VG81K0tJc0VsVjQ2MUlj?=
 =?utf-8?B?NXFybUtUY21FdXd6MHRvQmdtNEpxZVpQM3hQQUxWQUhZcXFqdVZGLzREb3Z2?=
 =?utf-8?B?dnhQeVVTaEc1alhndzlZVU5BVzRmVXFNN1lua1VYOGJsamdBRkZLV2VlWmFU?=
 =?utf-8?B?d1lsVmZ1d2lZNFUzTFhTT2s5dC9td2hFTnZRNy81amJaaUx3cEN4R1RRUUM5?=
 =?utf-8?B?VVp4NkdhKzErK1NBZXZ3VDJlUWt2bUpiYVZqRXIraDFnTFNQL29MK3VzVmdl?=
 =?utf-8?B?ZGxJU0FWZmFETkJXeXNjV2Y3dTQwUkNGeERxT0dDM1lNUWRhRk13TDUvaUwr?=
 =?utf-8?B?MnYzeEk0czRCVXJsdUlOYWlCNnhzWlNDTEVqTmxWL2NlQm9YTkFJVktVdUQx?=
 =?utf-8?B?cnZpeExLbVNCeUE0djAzTXVzeE94Z0FleXdYVGM5V1Y5SkZqQlJYQVVxSTRu?=
 =?utf-8?B?d1gzR3JmMEI5NmkxdTNxa3lldDMwVHN1ZDV5c2lXTkRGS0RaU3hVZmNlMU11?=
 =?utf-8?B?eklTdGJyTkpuWWRoa3NvdHU0cEhjemYxOWR3QmZQMmNnQmJiYkNCSlp1VVdI?=
 =?utf-8?B?MXFiVnFTUWpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y05Sd2tlK2NKQUVvenkrcHUycWtGMHNEdjdJNTBoL0tkcWxZUzgrN2R3UVBa?=
 =?utf-8?B?aFd0RC9vWU9MSE43cjBuYmZQcjBvbVpFOVlvMHdxZjczL3dGVy9xaDl1MWJD?=
 =?utf-8?B?akxzWDd5dG40UGZ2b2xMVHNNUHRBTkU4Q2x1eXUwaS9ub0NoL3UyVWRCSFpS?=
 =?utf-8?B?ZWZLYWc5NGJVdHRNWUFCem00UW0wVDJkRXlvVHJHbTZMYVhZZ0xDSi9BcXBY?=
 =?utf-8?B?aGdycGpuczJZYy94aEFDUmJLbERmeGNHZ05SdWtPSnl1cXV5LzFZTGdRN05s?=
 =?utf-8?B?RTA1V3kva25abG43MmRvVC9xOXhid3QranVNcXdpQUltdVZvNUwycE9hUVlt?=
 =?utf-8?B?eGRsVVdvL1ZHeVgySlU4M3V2Ni9iSy9PVTlNMDZqWUErTmxzZHFZdTU1anBP?=
 =?utf-8?B?Uzlma3k5V2xVUmdmUG9HUVljS0w0QVAxU3dGZ2ttSGZLZXRIbDhyNkxkeFND?=
 =?utf-8?B?QTVvaFo2eXgyKzFNUHNrUVpVZGFKVXFyY2hXenFUUkNPTndBMm50OWVrNTZN?=
 =?utf-8?B?UTh4N3U3YzEwVWFVQWNUUmIyL2hJRldWelpob0lRelVYVjFmR2FuYzc4cUtl?=
 =?utf-8?B?RSsxNktMSm5XS0tLRFhpQ1ExSkxhNWs0OEVNemUvZ1dEZmF2SFpBSW5OWHRO?=
 =?utf-8?B?MXByeHVMYnNkWkJLT3hrMnRNemozODRvaU00c1piZVhtY2NEazhocnhQdVVj?=
 =?utf-8?B?aXpBRlBOYzBzRVhub2lmQjRJU2R0Q05lREhoZnBXejkwR04zL1RBd1FDbk5U?=
 =?utf-8?B?OEdPTmd5b0xPVzF5NEtVajNsWWNMeS9YZi9RRndYR0g4RVhzb25EamRHcFN1?=
 =?utf-8?B?bi91V1gxN3VwaysyRFY4Sm1kWlM2YWRkRU9HREg5b1IwUS8rVHZmY1lJbnoy?=
 =?utf-8?B?dkNDZFJ2MWJxY1JrMTIyajltSkI3SGZDNFd6N2JhYWl1eTlMR2hTUWVZOWFB?=
 =?utf-8?B?d2o3alZFS29hUmNHNGdDOGdKMzN3M0JpQXZSclZPWG0wZ3o4LzF5eGhqOXhG?=
 =?utf-8?B?T204eENVaXlPUDU3N2p0TDd4N0ZxVVRqamROVkRZVVM0S2xIcmhMNlhYRHhW?=
 =?utf-8?B?bnhwRm9CVmtUTEw2cGxUSlphYTk0bDJrK3c0QSt1ZXF2OXA5VCtGTWdVaC9K?=
 =?utf-8?B?djc1NGNMTkdsZW5MYjN5TTUvQ2p1a09zZGh3Q3RVL2p0b1ZablRRdk41cHEr?=
 =?utf-8?B?czFaTGQ3SU40SzhkclZZb0Z0YStQTjk2Y2l0aFMyeFBFeDk4M0FWdUVIeW9F?=
 =?utf-8?B?aWJPQTdyZkRkRmxMYnZKTG1rVzhSY3AyM3ltbVZVT3VBd1drK2FYQTVMR1Vy?=
 =?utf-8?B?aEo5YStSVkREcDZONTdKTFBZak50eFJCTk1Zck1QeDZrWlozNkZZUHBtTWtw?=
 =?utf-8?B?OTRXaGpkYXVWYU4rbXpQUUZERW5yOXFGdTJFYTFHbWFxMUtmOHlRN2RUY0Nm?=
 =?utf-8?B?UDhOWTdvK0E0UU9QTkpmRnBycGRrd1dkNC9oWEMxcWdScGRIc2QwY3VsUFVq?=
 =?utf-8?B?Wk9QUXVmbE5qY25ianY5bWtIdDBkTTFybEl5bDFZYTRvUXJXc3VmdWVwNjZw?=
 =?utf-8?B?TUk2R1pJU1phTzlad2VKdWJQWGlDR3hqVjZwY1VjKzhCYU90M1ZsRGtRVVY3?=
 =?utf-8?B?TzY2am9nSUZ1QmtpWjc5SW90RE5CMEVhQXhhTmg1emgyWTQxVVBFZFhTN2x0?=
 =?utf-8?B?TFkvVUh5RlA2U2I2RllLQ3dpbGFNdXUzbEoxUUprSDBFdkxpYVZ2MXRYbkth?=
 =?utf-8?B?T1JtOUZrSkE4WndZKyt3VElhYyswVWRVeUxIK2xBUWlpSEN4YTRmVDlHT0ps?=
 =?utf-8?B?RGFDRkdsaWdFMzR4Vng0SzZvOVJNZ2hrUk90WGl4N25kRVhpQWpiWHRqYnJD?=
 =?utf-8?B?YmRGTHVMK1RTL0FYRXY0WGoxYnFjV0tGKzJaRVU2SE4zb1YxU1VoUWNzLzRu?=
 =?utf-8?B?SWRCL3k2ZENrMEZFaVJ4dVZrdStqaTRsZVVqdlBjSFVYRGg1V3lBLzFmc3hm?=
 =?utf-8?B?QXJrTy8wWnBGVWRZZFJKNERFbjFkd3gzWWRuYkpLZDljd1g3Tk1JZ3pOMlpQ?=
 =?utf-8?B?bEc3U3hKbkR4ajlhMEZCaHlEa0xFTkNVQmlEbTVEc3NPcThwdGgvTHN0bmRQ?=
 =?utf-8?Q?lK39vuthuHgWU9fHaqQLqA0xu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d9bc0c8-aee5-45ae-2bd9-08de07d9ecbf
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:49:29.7881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cYqfcQry9RkvKTMwWguQDWOpL/la5RCQbqyv93g+r4nOQbRbxQXVKbTBH+BbaiuYfI2ffsIi0uCxNdbYD95bmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
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

On Fri Oct 10, 2025 at 6:33 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> Great effort, thanks. I replied with few comments below. Since the patch =
is
> large, it would be great if could be possibly split. Maybe the From
> primitives deserve a separate patch.

I'm all for smaller patches when it makes reviewing easier, but in this
case all it would achieve is making the second patch append code right
after the next. :) Is there a benefit in doing so?

>
> On Thu, Oct 09, 2025 at 09:37:09PM +0900, Alexandre Courbot wrote:
>> Add the BoundedInt type, which restricts the number of bits allowed to
>> be used in a given integer value. This is useful to carry guarantees
>> when setting bitfields.
>>=20
>> Alongside this type, many `From` and `TryFrom` implementations are
>> provided to reduce friction when using with regular integer types. Proxy
>> implementations of common integer traits are also provided.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |   1 +
>>  rust/kernel/num.rs | 499 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  2 files changed, 500 insertions(+)
>>=20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index fcffc3988a90..21c1f452ee6a 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -101,6 +101,7 @@
>>  pub mod mm;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>> +pub mod num;
>>  pub mod of;
>>  #[cfg(CONFIG_PM_OPP)]
>>  pub mod opp;
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 000000000000..b2aad95ce51c
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,499 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical types for the kernel.
>> +
>> +use kernel::prelude::*;
>> +
>> +/// Integer type for which only the bits `0..NUM_BITS` are valid.
>> +///
>> +/// # Invariants
>> +///
>> +/// Stored values are represented with at most `NUM_BITS` bits.
>> +#[repr(transparent)]
>> +#[derive(Clone, Copy, Debug, Default, Hash)]
>> +pub struct BoundedInt<T, const NUM_BITS: u32>(T);
>> +
>> +/// Returns `true` if `$value` can be represented with at most `$NUM_BI=
TS` on `$type`.
>> +macro_rules! is_in_bounds {
>> +    ($value:expr, $type:ty, $num_bits:expr) =3D> {{
>> +        let v =3D $value;
>> +        v & <$type as Boundable<NUM_BITS>>::MASK =3D=3D v
>> +    }};
>> +}
>> +
>> +/// Trait for primitive integer types that can be used with `BoundedInt=
`.
>> +pub trait Boundable<const NUM_BITS: u32>
>> +where
>> +    Self: Sized + Copy + core::ops::BitAnd<Output =3D Self> + core::cmp=
::PartialEq,
>> +    Self: TryInto<u8> + TryInto<u16> + TryInto<u32> + TryInto<u64>,
>> +{
>> +    /// Mask of the valid bits for this type.
>> +    const MASK: Self;
>> +
>> +    /// Returns `true` if `value` can be represented with at most `NUM_=
BITS`.
>> +    ///
>> +    /// TODO: post-RFC: replace this with a left-shift followed by righ=
t-shift operation. This will
>> +    /// allow us to handle signed values as well.
>> +    fn is_in_bounds(value: Self) -> bool {
>> +        is_in_bounds!(value, Self, NUM_BITS)
>> +    }
>> +}
>> +
>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u8 {
>> +    const MASK: u8 =3D crate::bits::genmask_u8(0..=3D(NUM_BITS - 1));
>> +}
>> +
>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u16 {
>> +    const MASK: u16 =3D crate::bits::genmask_u16(0..=3D(NUM_BITS - 1));
>> +}
>> +
>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u32 {
>> +    const MASK: u32 =3D crate::bits::genmask_u32(0..=3D(NUM_BITS - 1));
>> +}
>> +
>> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u64 {
>> +    const MASK: u64 =3D crate::bits::genmask_u64(0..=3D(NUM_BITS - 1));
>> +}
>> +
>> +impl<T, const NUM_BITS: u32> BoundedInt<T, NUM_BITS>
>> +where
>> +    T: Boundable<NUM_BITS>,
>> +{
>> +    /// Checks that `value` is valid for this type at compile-time and =
build a new value.
>> +    ///
>> +    /// This relies on [`build_assert!`] to perform validation at compi=
le-time. If `value` cannot
>> +    /// be inferred to be in bounds at compile-time, use the fallible [=
`Self::try_new`] instead.
>> +    ///
>> +    /// When possible, use one of the `new_const` methods instead of th=
is method as it statically
>> +    /// validates `value` instead of relying on the compiler's optimiza=
tions.
>
> This sounds like, users might use the less-optimal API first with the sam=
e
> build_assert issues we had with the IO accessors, since new() sounds very=
 obvious.
> How about the following naming?
>
> new::<VALUE>()        // Primary constructor for constants using const ge=
nerics.
> try_new(value)        // Keep as-is for fallible runtime
> new_from_expr(value)  // For compile-time validated runtime values
>
> If new::<VALUE>() does not work for the user, the compiler will fail.
>
> Or, new_from_expr() could be from_value(), Ok with either naming or a bet=
ter name.

Agreed, the preferred method should appear first. IIRC Alice also made a
similar suggestion about v1 during the DRM sync, sorry for not picking
it up.

>
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::BoundedInt;
>> +    ///
>> +    /// # fn some_number() -> u32 { 0xffffffff }
>> +    ///
>> +    /// assert_eq!(BoundedInt::<u8, 1>::new(1).get(), 1);
>> +    /// assert_eq!(BoundedInt::<u16, 8>::new(0xff).get(), 0xff);
>> +    ///
>> +    /// // Triggers a build error as `0x1ff` doesn't fit into 8 bits.
>> +    /// // assert_eq!(BoundedInt::<u32, 8>::new(0x1ff).get(), 0x1ff);
>> +    ///
>> +    /// let v: u32 =3D some_number();
>> +    /// // Triggers a build error as `v` cannot be asserted to fit with=
in 4 bits...
>> +    /// // let _ =3D BoundedInt::<u32, 4>::new(v);
>> +    /// // ... but this works as the compiler can assert the range from=
 the mask.
>> +    /// let _ =3D BoundedInt::<u32, 4>::new(v & 0xf);
>> +    /// ```
>> +    pub fn new(value: T) -> Self {
>> +        crate::build_assert!(
>> +            T::is_in_bounds(value),
>> +            "Provided parameter is larger than maximal supported value"
>> +        );
>> +
>> +        Self(value)
>> +    }
>> +
>> +    /// Attempts to convert `value` into a value bounded by `NUM_BITS`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::BoundedInt;
>> +    ///
>> +    /// assert_eq!(BoundedInt::<u8, 1>::try_new(1).map(|v| v.get()), Ok=
(1));
>> +    /// assert_eq!(BoundedInt::<u16, 8>::try_new(0xff).map(|v| v.get())=
, Ok(0xff));
>> +    ///
>> +    /// // `0x1ff` doesn't fit into 8 bits.
>> +    /// assert_eq!(BoundedInt::<u32, 8>::try_new(0x1ff), Err(EOVERFLOW)=
);
>> +    /// ```
>> +    pub fn try_new(value: T) -> Result<Self> {
>> +        if !T::is_in_bounds(value) {
>> +            Err(EOVERFLOW)
>> +        } else {
>> +            Ok(Self(value))
>> +        }
>> +    }
>> +
>> +    /// Returns the contained value as a primitive type.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::BoundedInt;
>> +    ///
>> +    /// let v =3D BoundedInt::<u32, 4>::new_const::<7>();
>> +    /// assert_eq!(v.get(), 7u32);
>> +    /// ```
>> +    pub fn get(self) -> T {
>> +        if !T::is_in_bounds(self.0) {
>> +            // SAFETY: Per the invariants, `self.0` cannot have bits se=
t outside of `MASK`, so
>> +            // this block will
>> +            // never be reached.
>> +            unsafe { core::hint::unreachable_unchecked() }
>> +        }
>
> Does this if block help the compiler generate better code? I wonder if co=
de
> gen could be checked to confirm the rationale.

Benno suggested that it would on a different patch:

https://lore.kernel.org/rust-for-linux/DBL1ZGZCSJF3.29HNS9BSN89C6@kernel.or=
g/

OTOH as shown in patch 3/3, this doesn't exempt us from handling
impossible values when using this in a match expression...

>
>> +        self.0
>> +    }
>> +
>> +    /// Increase the number of bits usable for `self`.
>> +    ///
>> +    /// This operation cannot fail.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::BoundedInt;
>> +    ///
>> +    /// let v =3D BoundedInt::<u32, 4>::new_const::<7>();
>> +    /// let larger_v =3D v.enlarge::<12>();
>> +    /// // The contained values are equal even though `larger_v` has a =
bigger capacity.
>> +    /// assert_eq!(larger_v, v);
>> +    /// ```
>> +    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T=
, NEW_NUM_BITS>
>> +    where
>> +        T: Boundable<NEW_NUM_BITS>,
>> +        T: Copy,
>
> Boundable already implies copy so T: Copy is redundant.

Thanks. I need to do a thorough review of all the contraints as I've
changed them quite a bit as the implementation matured.

>
>> +    {
>> +        build_assert!(NEW_NUM_BITS >=3D NUM_BITS);
>> +
>> +        // INVARIANT: the value did fit within `NUM_BITS`, so it will a=
ll the more fit within
>> +        // `NEW_NUM_BITS` which is larger.
>> +        BoundedInt(self.0)
>> +    }
>> +
>> +    /// Shrink the number of bits usable for `self`.
>> +    ///
>> +    /// Returns `EOVERFLOW` if the value of `self` cannot be represente=
d within `NEW_NUM_BITS`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::BoundedInt;
>> +    ///
>> +    /// let v =3D BoundedInt::<u32, 12>::new_const::<7>();
>> +    /// let smaller_v =3D v.shrink::<4>()?;
>> +    /// // The contained values are equal even though `smaller_v` has a=
 smaller capacity.
>> +    /// assert_eq!(smaller_v, v);
>> +    ///
>> +    /// # Ok::<(), Error>(())
>> +    /// ```
>> +    pub fn shrink<const NEW_NUM_BITS: u32>(self) -> Result<BoundedInt<T=
, NEW_NUM_BITS>>
>> +    where
>> +        T: Boundable<NEW_NUM_BITS>,
>> +        T: Copy,
>
> Here too.
>
> [...]
>> +impl_const_new!(u8 u16 u32 u64);
>> +
>> +/// Declares a new `$trait` and implements it for all bounded types rep=
resented using `$num_bits`.
>> +///
>> +/// This is used to declare properties as traits that we can use for la=
ter implementations.
>> +macro_rules! impl_size_rule {
>> +    ($trait:ident, $($num_bits:literal)*) =3D> {
>> +        trait $trait {}
>> +
>> +        $(
>> +        impl<T> $trait for BoundedInt<T, $num_bits> where T: Boundable<=
$num_bits> {}
>> +        )*
>> +    };
>> +}
>> +
>> +// Bounds that are larger than a `u64`.
>> +impl_size_rule!(LargerThanU64, 64);
>> +
>> +// Bounds that are larger than a `u32`.
>> +impl_size_rule!(LargerThanU32,
>> +    32 33 34 35 36 37 38 39
>
> If num_bits =3D=3D 32 (number of bits), how could BoundedInt<T, 32> a
> LargerThanU32? It should be AtleastU32 or something.
>
> Or the above list should start from 33. Only a >=3D 33-bit wide integer c=
an be
> LargerThanU32.

The name is a bit ambiguous indeed. An accurate one would be
`LargerOrEqualThanU32`, but `AtLeastU32` should also work.
