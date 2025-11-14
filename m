Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F47C5B02B
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 689E210E060;
	Fri, 14 Nov 2025 02:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hbfk0oO8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2E810E060;
 Fri, 14 Nov 2025 02:34:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l9CUQ1F+4YIFpFrikSI9VgoXcGvwexyplIi9SV3mNXcZsIioV/l9Xdlx41C1ImyP1FPMIIiwL8zUxOniREA2TGNEXyZb7Is4QldkTTboXUANk8RrRE62ZktCuBluW3NckOSYf3dQLniWx8wax8obZevCBdG79SY9bQ+H41ZUz1RcZLCTm8x94xvdl6oRS379VY2F/NzgbNfwraOuZt0QgTN/dvWON5RP3ZNUvrNTToxJKx4jOg9crzQ6IKo7bqUj1HBT4jz8sD9BIr3XI42g3wCb8oCorFZJsLxOXDxlZcu4LiWtb06zq1XFimTjvbzFiUdoe210SplDb6urEYHopw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iKvJKPVYdL61sBcRFwlBEr4bA1HV+34nmmTWKB8xys=;
 b=P/mXUVx95KHDvWMTbkTq7SLxUTFfNRG1vIjSmgmhr+8Uo+9fTVnX574mIrtHPOpsh21yj9gwjZ9EoizPxRbqnuAHcY2m06XhfpdSU0nQPEmsy7FYyfrb8k5QYY3FIIRsLL+q2GrmHNoRgNt7urOgBj4nA4oZ6w4b3G/G0qVEGpJRMYmTHV3IlP7t3fhnyPX1ZQSzJlMyCzE3ynXm0mXeXU4aoR26kzzLx10+oRFkXfrafWDmHUxHYqR6q5U5Mfu9q5oO2FJm2N/wWfixh46MQV2fZCR9gKS8yPuvizGT/VJkrnQ6eaxocarQC8RD/SpOQdlI1V++WG2v+RrbC8t+4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iKvJKPVYdL61sBcRFwlBEr4bA1HV+34nmmTWKB8xys=;
 b=hbfk0oO8g6z04fL+r7YHEr5ZlE5WoKC0E+nEsMdGqIFQr4oOrodGyEw8K9APXDu+R1odU+iQZe6a3tfxOA2m3dXPwte9fyk1Q/Py4pH9UaWpZYXzQ5Zxax6Q6j7MTb3BstS2TKW+V1icBlSBA9k3xmRtKabDQH9CJXguA+hi78igI08PLoa4orsK0ZmRudJ3yM8J68MT150tDEHyv2/LTiCeAeqetcDzAG9v8OyUYfw7jnxUi/NBgjK0sBOYf+TGBPeSCbAQLDuuWaO+zxP2NWXBeNz77Qb4T5EDwTRg4mEkL6ncXrSN1dJVnVnRMz4GAWvjmYsWUVgprbO1syxrkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4170.namprd12.prod.outlook.com (2603:10b6:5:219::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 02:34:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:34:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Nov 2025 11:34:48 +0900
Message-Id: <DE82FAQUE3JI.2LC356YAW2541@nvidia.com>
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
Subject: Re: [PATCH v7 4/4] gpu: nova-core: add boot42 support for next-gen
 GPUs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-5-jhubbard@nvidia.com>
 <DE7ESLFYKP2I.MD5ABO05Q2O7@nvidia.com>
 <b7d1f702-e53c-4d20-900b-a49f634afb1b@nvidia.com>
In-Reply-To: <b7d1f702-e53c-4d20-900b-a49f634afb1b@nvidia.com>
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4170:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3797c7-fcf9-407e-ec45-08de23266373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vllhek1kQzhLQjdqWlhtN0FUUzA3UnE1eEdhV0lSQW4rUnpkcXk4cEFGaWM1?=
 =?utf-8?B?VDhwS0pYT0ViUFcwRWJobFlTbG1vYk9EdDVHQm0wK2FFbmhXcGRPdVNGOVZR?=
 =?utf-8?B?RldxdUYwcnBWY25KOUp4eGJZQWNuVFBrZVBCeTZUWjRETndWeCtRTnA0ZWdx?=
 =?utf-8?B?N0Z0VkVOTEJwYTN3MEZKaDJ4ak9pNmI0cDJjK2RsMmhIcmJtZFVmYmlpaHFC?=
 =?utf-8?B?VHFiM1AyVXA5VzhQWWNpcVE3eUtmVXg3RVN6dGR1VE5vWENKRHJtMWtiaGJM?=
 =?utf-8?B?SUV0TEJEVkVDdmRtVHhOZ1M0Z0lzLzd5WG43Qi9qT3VzKzZVdVlxRlFHd0dF?=
 =?utf-8?B?QXBmcmNIeGkxT0dUZ1ppVnFDZXBFaVVueWtxc2VNeXRqUGFxNkFZaGxlY0JZ?=
 =?utf-8?B?a2VJeWxNbk9SNlhkY0VZRVErL1dGeEVhZktiSnZlbjl5OGNuQVhpM3piRXVv?=
 =?utf-8?B?K2hxQThPZWJKc3pGditBaWpGcWlzeU1DMmx4eHVFb0oxS0NtK29Idkl0T2J4?=
 =?utf-8?B?cFNtWDhvWjFQdnZLVmdMSVdnSnlnZ002MmJWcDhUbEpkdGtuQTZOSXNGOVZm?=
 =?utf-8?B?L1ZMV2hZNEp6ZmZJRi9LYmR2eG1rTms3ZTNMeHgybFY1MHBsaFNCMEhNUnZV?=
 =?utf-8?B?SzVDbG9UaXZ6Wk1PditsdXBkTjUzNGVwbDFhcTd0cXB4ajFwR3NTNE10Wjcz?=
 =?utf-8?B?ZkdpMjJxdm44RVg2NUhyZ0FoaW4vTkduV21kcGtGbjFvQkMyRFh6eXR2c0JE?=
 =?utf-8?B?VWFoa1ZqTktBT1JNclhrZUpTZkhXVlNnc25WRTRnZ3JWVWJEaE1YR2wvak5o?=
 =?utf-8?B?c1dlWlZ2T21oeEd0NlhqdFJPTmtIc3ZhYThhODBEckEvSzhIU09RNjN5SmlD?=
 =?utf-8?B?bXNxTml5eGJEV2ZCWTdJR2JnYWVOSmJqdm9BTDlwOGwxT2FycTUvZVlVOWhR?=
 =?utf-8?B?TnZkelE5THFCcG9lbnVmQ2Y5Q3liTHVJREZ6Rk14TnUwUi9aZUEvd2tkV2th?=
 =?utf-8?B?Ymg4VGZSQWZUOW1JaVR3TVpnSUNPN3pQL2VpYWZjQTI0YzFlVjh1OXNLTXUr?=
 =?utf-8?B?dUpoMXhvOXprN0Y3V1lnTS9DazZjV2JQVlJkVER0VGMzY1hNRnRXUVBibmxv?=
 =?utf-8?B?d013WGY1QUhKbVJYZDRLOGJhbGl4YkVMMFdwL2lDd3U0MkFvZS91aTdCNU5l?=
 =?utf-8?B?ckh5dElXbFFkczd4YWhlRGVQeDlHRXpPT216QUpDRVhLd3FaRGhQS3V1WWlX?=
 =?utf-8?B?VnFqNUR4N2c2S1l6Uk1wQTgwVzNndmduNEFPTzk3WnJTQ083ditQQ2lsQUdl?=
 =?utf-8?B?Y0NGb01WaXpMRGtpcjU0RmI0SHNsMVgxV0ZabGgyS3d3SHhSTitHMisvRVN0?=
 =?utf-8?B?MnhIZlZEYVB4KzY0Y0J4UDZmN3F4bEVEWjBscGFYU29NNzIrMTBCT1VCUVJJ?=
 =?utf-8?B?NThCeUpxTXo5bjNoSlVMbFZ2WkxGQmhuWHNUZlM5TXlJUWVlamFaWmlscVRL?=
 =?utf-8?B?dXRUTkJBK3htckJhTWRORVlnMFhIcTZTUTBlc0FXNlI3QzRpZ0RkYkVwcW9L?=
 =?utf-8?B?U3VqbXd2WTJNSFFKYjcyYkpVdEhTSHp4Zk1QNi9NeHVJR3dJY2w4eHhzdFhl?=
 =?utf-8?B?MzFTM05iR25WTnBPdWVBeUJBL21tUEFuOXp1OGFtejFXN1docG1LREQ0YkZD?=
 =?utf-8?B?WHJiSEFtWWV1ZU9OR2NYaWxCL2YwVGpUT21pa2tQZUo2a0JuMU5vaURiMzR0?=
 =?utf-8?B?dSt5THVjMmZjV1lRQlJJRitROHl2ZkVJYjRaY2U4aVR0d0pVWkFtR3g0eVQ5?=
 =?utf-8?B?akdKQ3FCeURsMlpKNEZlR3B2Q0ZVblA4R3NhdE84a3VqbWp1bzFzNkxCdFRW?=
 =?utf-8?B?aEhHTVR1ekJEYWpEYTVhWHVtNDlmeXN2blNPRm8xaXVZcVNzbVJvbDBVQWtL?=
 =?utf-8?B?NjE3U0ZsRmFvQnRLVU1oQ1dyTWNlc3JOalJjMjhGSDZRMUoyU3dZN0RDN0tV?=
 =?utf-8?B?Kyt1alNmbzRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0lEMEREcHg2VVQrUXdVS0JWT2VGaTgyd3QyVTZUSFpYQnpOb1h0c3dCdkZ0?=
 =?utf-8?B?ODhwN0t0SWhWcXFUb3lWTWU3TGNiczFRbDZlUHBpdHEyYldwMUllYTZ4WVhs?=
 =?utf-8?B?aDFKaDhmUThBTlNYZFpJS0tFS3hPVVhtZEFORlk2OGI2UTEvOEN1U1QrRFFr?=
 =?utf-8?B?MEdYdThjOGJ2MmxXZExXRkUwb0RmUTUxSE9pQWdDZjBDY01lUmFtaWtlSG82?=
 =?utf-8?B?dlA1Z1VwZVVPTFZ6OU5RWFFMblNaZ2xsSWhjWmZpa2FseUtjN0c0aTIrV1dz?=
 =?utf-8?B?VjlEWHBPNTUwRlhFWlM3V3doYnBnTTdva1czajFobWZhTVc2eDZEYmNYaFhC?=
 =?utf-8?B?SmR2ZXJoNm5FOWZjQjRqY3lTRjRiVDhPUUU4OU04NTdEWDdHbFh3b2RHS0w1?=
 =?utf-8?B?ekRZN3JKdFAxdlhyOTFrU09GaGZnclRKeE9EUVpaQnAzK3AySkxvOTNXWUJa?=
 =?utf-8?B?eUdoM1ZueFJUbXVJN1Y5TWxTa3FtZm8xd2FLSEoyeXpXRUFTVU5lOVNORGk2?=
 =?utf-8?B?QlB2ckN6M3ZyNjNYSGNHZTZtdmNHUTMvQUNra1lpYXFadFd2ODN5d3hCVFg5?=
 =?utf-8?B?S1pwMXFXT0JqRWhYSlROMlRqSkwrVWNySlJ2Y0dWaENOM1d2aE8rdzcvTlFM?=
 =?utf-8?B?M0pZaTZtN0VLSkNWQWdjS3IwVEdaTkljQm1xekJ4MXJYSzh3Ny9WWkdhVmx4?=
 =?utf-8?B?bTBRMG5MR3VaQzhHZEdDSGZmb0JwcnUreDR5OEhwNUpXeDB4UC9UM0xzaVVt?=
 =?utf-8?B?dDZYaWJxSndEVjZvQnRQTjFoVWNhSng3d3RoZGtnSEF1UmgrWXhQTnFIZzh0?=
 =?utf-8?B?L1owMkNSVHphZGUvY052MWdJeWZmNVZWSldKQzZjM0orLzliZkFtd0F6aTNt?=
 =?utf-8?B?SVQ4M0JlYzdjajAzUkZ6ZWZGeUdrSGZBMHRFWkd3Y2ZGc3VGMFJNaEFaMGVr?=
 =?utf-8?B?a3dtbGVyaUNOQlR6b2NCRTBwSTdLbUkxaksxWmNFVmtXTmE0RkoxZjJrMlBR?=
 =?utf-8?B?QlhEaVBVTVBIZVl1LzFvYkRsUE1CTVM4bFRRL29LTkdXRlBsL09WK0p0enY2?=
 =?utf-8?B?aUdnSW5GSDRPYktVNGlSblgxc0dNdUdQUGZQTHRpSnA2WDUzYjVSSTIzSkF1?=
 =?utf-8?B?TmprZ25mZHlsaElQZENwSk5YTGszS2ExK3ZYcFAvaExoQitscmJZN1E2dlVW?=
 =?utf-8?B?NUZSZi8zamZUWDBtUStKVThMalBtMnBVSGk2Ym9rTENwNGI0b01oQ0dVbG9I?=
 =?utf-8?B?dTZ0MzhPY2ZxeUVnM1hZNDZrR0s3RWw2ekVhRUY4aGo4VjZycVJjZ2JQNGZZ?=
 =?utf-8?B?RmJMQ3FRbk0rSFR6WXk0Y0ZiRDEvL3FJWkgrdnBjUFBaeHdFQ2VrSnhmQWts?=
 =?utf-8?B?akRDbmo3NmtsbXFVeWFnb2FCTElEYzUreDhNYWdMU3I1RCt4enVaUzVNV25m?=
 =?utf-8?B?MjZxT096bzF3YUswWlFpZG9CSFVhazlhWTVYZFZsRGlTbGMyVmF5RWdLQnRi?=
 =?utf-8?B?T1NWSklLY1cwNzY0bDBGVDRRNk1yUHoxbUlQdVQ2WXRlYng5bHhJQWlTMVZI?=
 =?utf-8?B?YjZjWFc2VS9DMTEwbSsxTEMwdVhhZkVVeTE0NElQL1pKVjcrc25ZQVFSRVJM?=
 =?utf-8?B?Y0gzWm9BQURIbGEvR2RhNnpIY0lXRmo1dTE4UWRCb0ZpSWgyRlZYVHVsNlpX?=
 =?utf-8?B?NDdNN0ZGS255d083aThEeSsrRFEvdVl1alZoSEU1d0lrSW52amw0NnFSaENQ?=
 =?utf-8?B?Z3FiMFpUMUpkUWYrRmxTNmxaQVpzOTRNVlV4bzkvZnpobWgrNmVrRVA5OWlw?=
 =?utf-8?B?VTRFaGxWTUNkZ09EcGo5ME9oNHRMdDhqOWFjMm5jQjZ6VytRZzVLWHpFSDhh?=
 =?utf-8?B?UHhPOWsvc2RYajRodHRDdmpuWUphVHJkNmttbkIvV1FjZFgrbm52RU5rcUhx?=
 =?utf-8?B?MmJ2RnV0ODYwNENuNC9uTzZjNjRZWENFOVhUanNORjFvVnNSNGg2UldQTDFM?=
 =?utf-8?B?M3lBZ2pFcGRZeVIxY0JsWEZrWGVnQ1lUeG9HOXJTWXN6elZwbmF0QjRiMHgx?=
 =?utf-8?B?TUc5UGExODdwVXQveDNpS1RzeWM5SW1qYURIL09mZ3FKdHczL3dkTlFGYjR0?=
 =?utf-8?B?T3poY2VyblZ2QllFTzNLMWFwRDF6czRwcnBGMWZIeFRsdk9sZlZEV0dzdUta?=
 =?utf-8?Q?IJIYHeTs5H7LMXI1+q+ooZFUuRp+bMstLQq3/zuSs+Dc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3797c7-fcf9-407e-ec45-08de23266373
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:34:51.9315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vGznzAsGv2HF+QmBoppJkVKbyFOy3+VVKTfPqVtZYRBk871mbyHfWhk+Wzj/RrEjMrG69tC5eC+z3rhatQeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4170
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

On Fri Nov 14, 2025 at 10:54 AM JST, John Hubbard wrote:
> On 11/13/25 12:03 AM, Alexandre Courbot wrote:
>> On Wed Nov 12, 2025 at 1:30 PM JST, John Hubbard wrote:
> ...
>>>  impl NV_PMC_BOOT_0 {
>>> -    /// Combines `architecture_0` and `architecture_1` to obtain the a=
rchitecture of the chip.
>>> -    pub(crate) fn architecture(self) -> Result<Architecture> {
>>> -        Architecture::try_from(
>>> -            self.architecture_0() | (self.architecture_1() << Self::AR=
CHITECTURE_0_RANGE.len()),
>>> -        )
>>> +    pub(crate) fn is_older_than_fermi(self) -> bool {
>>> +        // From https://github.com/NVIDIA/open-gpu-doc/tree/master/man=
uals :
>>> +        const NV_PMC_BOOT_0_ARCHITECTURE_GF100: u8 =3D 0xc;
>>> +
>>> +        // Older chips left arch1 zeroed out. That, combined with an a=
rch0 value that is less than
>>> +        // GF100, means "older than Fermi".
>>> +        self.architecture_1() =3D=3D 0 && self.architecture_0() < NV_P=
MC_BOOT_0_ARCHITECTURE_GF100
>>=20
>> We could also keep `architecture` (making it private) and just test for
>> `self.architecture < NV_PMC_BOOT_0_ARCHITECTURE_GF100`. John, I can do
>> that when applying the series if you think that makes sense.
>>=20
>> Considering that the series has been extensively reviewed during the
>> previous iterations, I think we can safely apply it for 6.19, so will
>> proceed once I have an answer.
>
> Hi Alex,
>
> It turns out that this doesn't work well, because architecture()
> returns an Architecture, not a u8, and then we have to map it back
> and the whole things looks a lot worse: complexity on the screen
> that serves no purpose.
>
> After looking at several approaches, I've come full circle back to
> what this patch has.

Ah right, we would need to add `Fermi` to `Architecture`, which would
now include some architecture we don't support...

In the light of this I agree your original approach makes the most
sense - thanks for checking it out!
