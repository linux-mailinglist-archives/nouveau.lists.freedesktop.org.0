Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC46B1B473
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 15:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D844B10E26A;
	Tue,  5 Aug 2025 13:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jKIs2eEE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0480010E26A
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 13:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKV7kgwLC5Bo3RSdO6yrMrxIY8CAzGqzefVHlqxgpRpHntYF95NZ00vr0IIybcjyUK0f2gv7vpJ+BjY2gkQvFRl087Y7XRjDDa+hz2kAMjL+liZw5+aqfCcAyUDOshf9CDSVuLb19gtyTaJoCDP2BthFb20eJ361+bZl6mAuOWI6nCC8vyGwGRvLdszZx6JNUX4UfLUTevBMrir06EYL1QQ9wWs1FiJ5Ew48lMNNLCHISyapJeX2cquads/1KNF5Rpc/Clbm2UiFG37x/uvU83XIYWoRvRqQPgRmcdzrcb9VLblBgZQijX9HZ4HgPek5dSZljbQISobeYEns1OJvLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dv5yUxh/1vdtecYxgvBskYGCb1S62urj4z1ZfXzSyUk=;
 b=euTJBYyU5zjZQ5l+/tx6VF1FnMYrKYWmcsVJcPBoRGfsttf5JSLVjt9tLiUrZxKxUqW/SZOlHvxbuBjgFb4XzLCCJSYYOhu1PsM9ebJGdi6TA418ltpovRpaXzOrBp1j7VNjV1RShvibz3LPDf7d+grD5T3jmVe554zxTBfmLfvse9mgBH3SkmT/g4xhiZmTft3oq0E9DhbWpRvR6hu5raZuPFDOPnW5xyr745JqUgS0qqkI9MYPcpVjGoJexcnOwbuH2gPGQzQtq4TXLUkN+LvapDObRh9uig0dK4kaf+MhzMooUHnbP8In9gMi4qV4s2S4Cp5PspCQ1BLqMEtDrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv5yUxh/1vdtecYxgvBskYGCb1S62urj4z1ZfXzSyUk=;
 b=jKIs2eEEAQ9hd4/mLWeBEv2uBheKJ93Pn+bnq0WU0XpI0bcdxmhUiiU2B+q+7KeTMrV7HAvJM1pEukVdttVTOdLUkYTgUs1yVI1XnGpztGqrIZtcRed+6ze8UHBCgQJyty3Fioak37H+qPKB0fEQc2E8o30r6+HHKR1tR1RXpGiX2gfYgaFqGJf+V/DYYxHAXAoRVu8kiuYmWzky9kJySgGwpzKqvYoI7rUkgDOdCq1HJhDcQ8elv+9SGOLA+NNSC1iQ0GtYKeJTvJlnrJW/CSlpIyXSojMi8qfFdmTjR2EuPqb9o8Ws7Wx9q5Fu520oVL0uI7W2Uw7bz+SrA12mNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW6PR12MB8913.namprd12.prod.outlook.com (2603:10b6:303:247::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 5 Aug
 2025 13:13:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:13:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 22:13:27 +0900
Message-Id: <DBUIR9ALSORF.2UVITQEFXD0RM@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
 <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
In-Reply-To: <CANiq72miQSuEEzKZsOhHKDah1kP+8PYcmODGqwtcaRwAggF-+g@mail.gmail.com>
X-ClientProxiedBy: TYCP286CA0332.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW6PR12MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: e8929341-9d01-43c2-7824-08ddd421df68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDBQVmpjZVNMb3RGaHBnNHhEREtEK2VXNmMxTjlPNFlGWHl6ZVhNTG9GcjdX?=
 =?utf-8?B?M1drcTRBdDJ2cEdTUFBVdmhDMWNmcElvZEsxSjJtenVYMCtTQ3RuYXpERjk2?=
 =?utf-8?B?ZFQvbk1PYXVRQ3krdFZ3d1JBeWc1dGoyZ0EwSWEyeWlMa2tyaTZpejZaZFNz?=
 =?utf-8?B?bzVxa0lGaExJUDlBa1o2TUJodEx5TkozWEhFNEUzU0c3QjFmandiVjcrS3hQ?=
 =?utf-8?B?MmFLZk9wb1VnaFBwRXg0eTB2aU1TOEtrSktTSWVjWGZySmdpcURId0hlNE5s?=
 =?utf-8?B?Mkk4Q1Z5RVAzOEc0cFlHd3ZCcEM5a2luYUZ0dE91Y09kdU1TQ3ZqVGp1My96?=
 =?utf-8?B?MURWUjlyaytPUGZkV1dBanJrUWhScy9aYjJFM29IUFRhd2Uxb3VkN3RYSHlR?=
 =?utf-8?B?QmlGRzhGQUlPTWRqQk5MMWJsbVk4RDlBY3ZaUjF5YlJraGE4K3p4QU9IOTU0?=
 =?utf-8?B?bUFlbE9JNWVEOVdYYTVrWlAzZ05uUS83eS9OeFp6eUE3YW94UUNLeGxQTlpu?=
 =?utf-8?B?cXh5cHk1dlVmSTluam5vOStzY2xFSEZGNDZ5cmF6VUExNGQwL0pKSEZTcWpM?=
 =?utf-8?B?TndhSnBsbk1RaG43NFNibGMvQThPNm9FKzl4NTBiY3R1SGhYWU0wdzc4NW9x?=
 =?utf-8?B?L3ZGQ0ZMYWtaSEVDalh5WGV6L1ZDYXNaOHNGRzJMRkhaKzY3WlVKR2NtTWNE?=
 =?utf-8?B?bGUycVhjcks3azZiSk9lV0x0YXppVFhhdk1kYlpHTVJDbldxMFE2UGVTL054?=
 =?utf-8?B?VzRDMEJuY29NMFFWTEg1bjF4RXU1Ty91UkVEQ2kycCtYWUJSSUNmcWlmUG94?=
 =?utf-8?B?Z25JNXpMaXorNmozNkNOQWJoN3loc1AzVmVPKzlDZ093M3pHR0haaHBUOFlH?=
 =?utf-8?B?aFdPcjVhcTlUcTlFa1FLQ2RDVHJGVm1TRXhmemt1WFRFV2J0b1d6eDhFenhM?=
 =?utf-8?B?aTdzYU5pczJjSncyN2YwUzdvR3pRVHBJTjF3RGJ6ZlJ2K1NYMEV6UzY4S1Q0?=
 =?utf-8?B?YUREanpVSlBzVmpzbmg1T3NzWXY0dFMvUWdFd1dVM21Hem1QbkI3aW9SSFI0?=
 =?utf-8?B?bnc5MkExcHJXME1oQ3FRV3VyUkpyQXFTMTAvemFuM1Vxb1NQNTc4ekIyOXdr?=
 =?utf-8?B?SEowRkowdXY3Y1dYOEpGTi9wQ1V0OUhkdUpjQ2ZDZ2U0a1pWSU1QZ1FueGpp?=
 =?utf-8?B?WWdOREdBWTZmcHp3ZVN5WDRnZ2xLVUY5NkZTbUd2dU9MM0tXbllES2RRTEl4?=
 =?utf-8?B?ZUM2WU9leEtra3pWT05xUUtFTkJJSk0yWHBWamxXaytDM1ljM2RlZVFScWFz?=
 =?utf-8?B?dndxSWdBU0E3bys0ckl4aEJYTCt5MHg0eTNlVXFZMHJ3bXZ6Z3NDOVdNQmdV?=
 =?utf-8?B?WWlLT2lsd1EyVDR1aVUrRjUvaHNMRDFIcXhjL3llanBPa3NBRFBDRnF6cFRo?=
 =?utf-8?B?ZWlzQlhiTFVibktuRXdpS2t5SXpXVGpDRHkrVTlQTkFwdDV3Qzc0OUdOT29M?=
 =?utf-8?B?R3NYZFl6MDdkQ0lmVGdwTWFwU0hFeUk4LzZkS3hCMHRBNjlTUXZReEdveWM5?=
 =?utf-8?B?OTRkMlY0UDF1TGZ1VFdmSlNXQnhTamZnL3ZFZGpEa1EwR3Y1ZFM0dzB1MWgz?=
 =?utf-8?B?aXEyRmMyTXk3dmIwQnFsRm8zWnk2NDdCc0xCeThwbmlLTXovSjByNXpvM20z?=
 =?utf-8?B?eHpoZHE1Q3p5ZU1sYlhoMnRSUzFGY1U5bTBtTjRpSTlkWjcyTTh5WUpWa2t6?=
 =?utf-8?B?NnBBa0lHd213NkVORGIvZXNNVTJiSW1zN1JkTWN5S2tPdTdyc0xwR2xsZE10?=
 =?utf-8?B?T1pscVp1c2hpbFF5VHpaQlhaaTVPVlVEdHp3RklrK2gxVm9CaGVRNUxGWUox?=
 =?utf-8?B?UVR0RERGR3dMUG43citqYXJVemNETkNmQWNCdDRub28yM0h5bEZHWnBPY21Z?=
 =?utf-8?Q?jiODKhOV1hg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFJFYmxramRoSzhacWh2eTNMYjhqRCtsdzV5S1ZQYkhaR1hjand4dFd4SDln?=
 =?utf-8?B?YkU1NHM0NHAzYW01M1BlbUJHMSthSXQyOFAwNlVYMlJ6WU41VEsyUkVIeFZM?=
 =?utf-8?B?all0U3QvWFBFYnluQ3M5aFJSdHJIcmY3aEMyUHl3UEcyeGtsOEtzZmtodjJr?=
 =?utf-8?B?L2hRZWphRXp5RmErcVFVWndFaWFZM3hZMUl0RXgzYWVhSXNJL3o2V3Z5cG9k?=
 =?utf-8?B?RDBsK2l0dU9xVTVKR1p5ZU9NV3RLM2lOYVhMN1NIcGt5eVlyUFhNNm1GSGJr?=
 =?utf-8?B?dkYzcEp1eFhUZFlYeWg2N0thME5VVGRIMFZDenNxbnZLMVBJdTBtbGZXKzFj?=
 =?utf-8?B?RVE2SFFZZXQvNXFXSzBPTUNCQUZ0aGdpOWF3eWZmUnZsdWMrQUJFcmNYSjlE?=
 =?utf-8?B?dEJaWGxRYmpBaDVWYTg5cnNJbmFPckJpOERPU05pUk1yOGNWTFQxRXFzRE1Y?=
 =?utf-8?B?S1JMT3lmTENKVTdXSDIyVEZMN21zbHZwTlVSWVpMZndMeUtReWZtWGNRYjdY?=
 =?utf-8?B?TXJ5SWNPd3Jpdk9aT04wa1Fwd0pkVXFIQW9lc1BLQ1FHUyt4eXRERTBmUWtv?=
 =?utf-8?B?aHR6eWkzQ1BrSEQxUU1VNTNBc2NZN2QxUW9tMG9Eak5jWStGdXBZYzU1a21p?=
 =?utf-8?B?dGpSVGN3MzFKMUJXSndJMFFJUVBZT2NHQWs3dm1DdEc5YkRIc2VNSXVuczIx?=
 =?utf-8?B?ZFJnN3lKamJFYjFld3pwaUlmM1BoMVIxTUw2dVR4MXcxTHVhYmtlbzJ3RXBx?=
 =?utf-8?B?U3Bvdi8wQzU3TlYxRk50RytXNHl4SHJIb3FQaUFLWXQ0UVZxOE9halNsNG0z?=
 =?utf-8?B?VmNqc3RBKzl1UVBpcDNGUDNHZ2thL2NhdE5ISmQrZTg4T0s4YXhmVVdZQzVy?=
 =?utf-8?B?NGZ4WnJ1eXNNTmU2Mm1PQTNsbDZUbjFLTUxGSUt3eHY5RTRXWndReU1LYmdM?=
 =?utf-8?B?NjBCbE5ZdTRGZVBNZnRjQ1ZkVWowUjNGOWp4VWE2MEV2V3poSzUxb0RWTWtp?=
 =?utf-8?B?ejZaUzBwa0xhQ29RS2tYcTZvSjFEVnlBRXNvanRZMlp2MFN3ZHlqOFd5K29E?=
 =?utf-8?B?VWJ4QnBxSEdEMDZhMGgwSG1ad2ZaMnZsaWFxRVVBSUczQ1hrSk9xdTVZclpu?=
 =?utf-8?B?MzlvQkN4OHlPQjBXdDBKSzJyd0pqTUFOTGNESDVVYzVZSGMzc2R6K0hNN0dq?=
 =?utf-8?B?Q095clN5YklqaEd1OHVEbzQ0dlB4dFlIeHBaL2M1ZUJjb0YwS2tUb0pTZGUz?=
 =?utf-8?B?OXlMeW1adzhYYTEzRFlWODhpTE1SOFBWdTJIbXFLTE1xSWNNREQxZjlBaXU4?=
 =?utf-8?B?VC9RbTlSYWQ4ZVIvMEFNZHBudVFMSzhkaHo5VmpoWXd1YStSVUM1QkZvQVNa?=
 =?utf-8?B?bmI2VG15NFlZaS9PUlBrT2dUdEZ6emZRSE9ydXRIbmNnck8vc1pEY282Uk1T?=
 =?utf-8?B?TUhxOUhaVG12QUFXMzFZYjZaVnFlL01uR0Z1QkVkcFgrNTZEa0tmOFk3cHJi?=
 =?utf-8?B?bXpGTzlNTFM3cVhxeEQrenc2VmpBd2ZZaTJFckoyRmFuVjBGQnZiVGdndFFj?=
 =?utf-8?B?RDZJMG1GU0lvMGtRWUV3d1Axckhsa3l2akV4YTZVQjdRZ0sxWE4rTUdrL090?=
 =?utf-8?B?YmFsYXpNMUY4SXFWcFdjSE1aMWhpMkRHRjNKN1RzdWZRTlRPVk9SNkwwbFhK?=
 =?utf-8?B?ekFnMnNCK3gzOWsxdGZVbDJUelBnMVp1N2dSN25wM25jMnpGeldZdnhQZnlG?=
 =?utf-8?B?YzQxQnhGQzM3WXpMVG5yenhBaDZLYlc2MnlqRGdPYXpucXJFWWxCU2ZicDRX?=
 =?utf-8?B?Wld0YjRSWFgyUkZzbXUwVlUwaU9ZaTBPUGttdkxRSGhMaTl0bHBhRFkxeHZi?=
 =?utf-8?B?MGVvSlJtc3JXbm1nMEpZSTFMMjZZWmFuQnpIU0lLZ1F3VTZrd2F3TU9mUUU3?=
 =?utf-8?B?amoxOG9rVnQ0NjdYQVpaMjBqaUp0UTZsb2xxckYvSm9PUUZkTVRIU1F1Sms0?=
 =?utf-8?B?dWJlY0N3TGFlckRDZms1dFVUa05lYjN6NDQ2N1k0aCswL2dGUkFpRmJwd1hu?=
 =?utf-8?B?QnY0QytVVzZqa0dVMkFNejB6NnJMb3RWNkhadWQ1Qmo5S0ZRL3pPUzlFNHo3?=
 =?utf-8?B?Sy9sZXd1MkcreGZlekxLYk5ScWhLQ2tHSHFaY2I3U2RDR3R2Tmg4cXJLUFV2?=
 =?utf-8?Q?DyDtdJh5XOwWk+K2FDdwe7L0BS7X5z74T8FMSX5gPJvH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8929341-9d01-43c2-7824-08ddd421df68
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:13:30.5794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dQZ827NbRTzYiCeTnSZNJTq7kglA9lHEiElOsb5BN0mGyFRrErzQmGSvtdP1B6stVoO5igjCJ7KNSVp+y8ZUig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8913
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

On Mon Aug 4, 2025 at 11:17 PM JST, Miguel Ojeda wrote:
> On Mon, Aug 4, 2025 at 1:45=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> +/// align down/up operations. The alignment operations are done using t=
he [`align_up!`] and
>> +/// [`align_down!`] macros.
>
> These intra-doc links don't work (they are not macros in this version at =
least).

Oops, these are remnants of some previous attempt at making this work,
which I could swear I removed. That and the sentence's grammar as a
whole is incorrect. Let me rework this.

>
>> +    /// Returns the alignment of `T`.
>> +    #[inline(always)]
>> +    pub const fn of<T>() -> Self {
>> +        // INVARIANT: `align_of` always returns a power of 2.
>> +        Self(unsafe { NonZero::new_unchecked(align_of::<T>()) })
>
> Missing safety comment (`CLIPPY=3D1` spots it).
>
> Also, cannot we use `new()` here? i.e. the value will be known at compile=
-time.

We can indeed! Brilliant.

>
>> +        if !self.0.is_power_of_two() {
>> +            // SAFETY: per the invariants, `self.0` is always a power o=
f two so this block will
>> +            // never be reached.
>> +            unsafe { core::hint::unreachable_unchecked() }
>> +        }
>
> I guess this one is here to help optimize users after they inline the
> cal? Is there a particular case you noticed? i.e. it may be worth
> mentioning it.

This was a suggestion from Benno [1], to give more hints to the
compiler. Let me add a comment to justify its presence.

[1] https://lore.kernel.org/rust-for-linux/DBL1ZGZCSJF3.29HNS9BSN89C6@kerne=
l.org/

>
>> +    pub const fn mask(self) -> usize {
>> +        // INVARIANT: `self.as_usize()` is guaranteed to be a power of =
two (i.e. non-zero), thus
>> +        // `1` can safely be substracted from it.
>> +        self.as_usize() - 1
>> +    }
>
> I am not sure why there is `// INVARIANT` here, since we are not
> creating a new `Self`.

>
> I guess by "safely" you are trying to say there is no overflow risk --
> I would be explicit and avoid "safe", since it is safe to overflow.

I just wanted to justify that we cannot substract from 0. Maybe an
`unchecked_sub` would be better here? The `unsafe` block would also
justify the safety comment.

... mmm actually that would be `checked_sub().unwrap_unchecked()`, since
`unchecked_sub` appeared in Rust 1.79.
