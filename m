Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3EBC6B797
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 20:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD36010E1AA;
	Tue, 18 Nov 2025 19:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oWd4MEHT";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010033.outbound.protection.outlook.com
 [40.93.198.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4564110E1AA
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 19:42:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPJ7n8pUGSBmlJOviAOzVueCjzRapvBXrPPdffzeo1adxGl17XFAJtB9b3kBqGSzVVmqGo2NqK6d8DpuOcQAYk7e67fVAEha0gLt6YSTuCT/UXe+AJTFn9nfnH9AqsAZGjjcfo+LPLGofdn5eUhj28ySdOid2vhQW8zYtm6pFgu8Tx7bRjcxnM+KSf5kNAaLAI9IWCGVZDHhTdgzLCK21zjf9QzX5AGuV5s+f7+K8XlHFlQn3MZhNrQyW54bq5LI/fnlVrlFsncL7cNhdTRXAQ0DIWc1yrmnxEtcWT02VA8ODxoRIPsySvcyVeXcTJKZ4UrZMXEjWKxwohuilxh6tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V1QJu0fx2AzvnVF7kvkP8+Xo9eSZo+O6P45S3HdYlu8=;
 b=K2aWXI/0wPu2hVK9adaecngCt3lbAj0LBdtWR8rr2azD1ftiZtdDL48VComWLWEuX+E/6o+OPY5T572ANuneBzhvLDtMyuBpRIskNwC1FM01aOKymJ9TmPj7zxMqU7YXjRGhEGmXdux+C0z7MIZIiHvBTS4dNUPRWdcvPTs6x8zvl4ngNaq1nq+ikvBSXmTHrATzOICId9XV8phmVv9JbMRmbBG4xrxl9sUCRb8Yb7EihImNV1hB0Y1qxQLVfX9Y9fq+GvSmv2vWwWYdzIYP7pJSqAxWL6uXTCDjnlmpFqCV/0NS+jctChnvXo0Q7uJTFwYhy2ogLI1WYfkA6LK6cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V1QJu0fx2AzvnVF7kvkP8+Xo9eSZo+O6P45S3HdYlu8=;
 b=oWd4MEHTdwqNRzEZt/262Hv72TCzI8YtjMeM4FYCj6l85h2L0wKTSQ9eKCD7bfpd+vfCI2kPnJNbjMo0ML6tO73Xd2wGVxRFmj5t3IjsxajPNL/TD8mdc/wfHB33nHCGMk44XBsAmaTi9MFMJX/CEaYokrpKihny8QWK66smz2cBKphjmrxlpffTqTX3+iZ1lJs0zZgBH3/XT9mGhkUPfu3YPng1xK8eWMqvBSatSK0hDlRJ8ZQn9u5B9K79d4ZkIPldUlKpK9yhluM8hmGgP14oda1BhTSihY0YqAkenQUC/bjavuobIe7zllm0wNkcqKiRLg0gnPJWngJ8+n3yiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5864.namprd12.prod.outlook.com (2603:10b6:8:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 19:42:15 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 19:42:15 +0000
Message-ID: <1d1b163d-1964-472e-8eec-aadf6d0f0e69@nvidia.com>
Date: Tue, 18 Nov 2025 14:42:13 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
 <20251118010424.GA1131446@joelbox2>
 <5ff4c334-6f36-4aaf-8f6b-45650b8f7a32@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <5ff4c334-6f36-4aaf-8f6b-45650b8f7a32@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5864:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c05db8-3a31-4c65-fc9d-08de26da9353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2Y3eWFLUjJDNUVLZ01nb1k3M0ZQYkFGemdlR3JHcStPR28zcFRVTE5BcDhx?=
 =?utf-8?B?bmMvRm1SMG9wNVMwcDY1aEhRaTRKQ3ZnQW5XcHVHcFJJUitiT3NuYm52Ulhp?=
 =?utf-8?B?YVhxY0FqVUg5bmp2T044dlJ0WjR6eUlLcVBXbk9mcTB0SnN1VU5mT1pvMHFs?=
 =?utf-8?B?UkFtTDRuQ09jeGN3NjFKbVZadXFNNEo3eUMrMDRaaS9VbnhsTEFxRTZmazE3?=
 =?utf-8?B?aWpydG9tWU1WdWp6ZHd0empTRERQMU1nbDVyQi9ENHN6clpLT0VYNkZwdnkx?=
 =?utf-8?B?RWRnYUtSdVo4Ukc3Wm83V05MSThETlpJSVQ5UU96ZFJMc0U3bnpsbnNmN2Yw?=
 =?utf-8?B?Mjd3OEhqbEFPVElycERwTXQ5S3dDY0hyZ1MyRjFFVm9mK0dIWXZSYXZwTUNs?=
 =?utf-8?B?NFJGV3BTK2MxRTJxOThySmRjVVBMeUdzMU5teUt3Nk5vd2NYUk9YQTRQcGdQ?=
 =?utf-8?B?czNUUUhWRFpJNDk1UE5PMEkvUlA0VEIycUtuV2xxbzRXWnAvVW1LWStHWEUx?=
 =?utf-8?B?Y3Brb2FjNUN2RmJENnZoUlRpOHlWUHdWU2Q1NzlQQnlDZ2xCazRCU1NqSy9T?=
 =?utf-8?B?NlFjbTN5QjFBYkNNam1hTGtvTUp0cTVaOVYrdFltWHNkV0pmaHdxL0htanl6?=
 =?utf-8?B?MjhDTmF3STlSbmdDWlRpVjdpT2p4NjJPSWdWZnJsNWhCYTl0R1RDVU1HZUQ5?=
 =?utf-8?B?NDBHZUlMbFE5cExxMTRrZm5pTmU0d202Z3A0T2R0b05BNUZtSkcxLzErQWdR?=
 =?utf-8?B?NG1KYjd2bmp0TzNiSjJRMm9HNEtuOFloRk5OcW56VHFzK09WL24wT0xrRjRD?=
 =?utf-8?B?bk9EdDAvUDh2TWtTSTN0Rko4R2RRL1dpTE9HMVlrSFlla3ZRMUlKL3RLbWlQ?=
 =?utf-8?B?dFNwbGNhRHFIWnQrSGhuNDh3eXhCMjZNN0VEay9BRWhKZVRsNHB5RUMvcTVM?=
 =?utf-8?B?NVBpZVYvTk4vV3dxMm1tdjZIYjlZTXdoNXFhMHRsbHRTNVNsUWJHbk95RHI2?=
 =?utf-8?B?S0N6bDFwelRyYVU0L3VOcjBvWmJSVmpxYm9zbloxWWN4aFhJak9LaEdVcVVy?=
 =?utf-8?B?NjhNNFlxUWU4WVlQNTNHY2czZlg5azd5ZFBTSDlaWWlrc3hNMHplYXEwYjNE?=
 =?utf-8?B?NEhsVEJram4zRGdGREl3ZFcrUFhzYng5Z1NNbVIydXBOUUNEc0pLN3hwbUho?=
 =?utf-8?B?Tml6VHBsYjh0YldZcXZQcVZ4TytDdTRWWjhwbGdzOUpWSVAxaWxsUkxGREZF?=
 =?utf-8?B?UWNmajZnOGdjOFpnNDRBd2pXOVVYQ2lFMEVQdnhnMXozKzBrWW54S2NzTGpW?=
 =?utf-8?B?UEl0aXJIZ0hZc1lLc1lsbm9uMVN0U0puVEVmT0d5ZkFGcG9sc1dScyt0UzVy?=
 =?utf-8?B?K1k5Z1MxcFlhREtpcFVuRUt6bjZ2ZldVTkZRWjZNZ0dSU3ppc1pwYytqcWw0?=
 =?utf-8?B?M3NuYXZub3hlZklyQzNSMTRmVFQ3c1ZQUVpNcmMrZEJKb2poRUxpeXF3WnY3?=
 =?utf-8?B?TGphc3RJd3dvV2QwbFhmcnQxT0d2aklPc0tYaGRBWWlaL3kwS09tWHdiRnl3?=
 =?utf-8?B?K3pxS1NzYWpYMFdETThKbXdkTGU4dnFRL1AwdHlTU3JlS0tQeUlGaVM3b0RY?=
 =?utf-8?B?ZWdxejNxR1YxYk45Y2ZZSEdzbW9ERUdmeE5ZNnNsWDhhZ056cFN6OGk1U0lB?=
 =?utf-8?B?ZklBdWxmcUN4VUNTcU1SL2VjcnNBTUh2SmpXUXoyNUFzZkRGNzhpMkkyYVd4?=
 =?utf-8?B?U2ZUdHpabW4vS3VFUCtxdDIxemhjQUhvZ0E2Zi9VWW1UQjhmb0RqRWRjRXFz?=
 =?utf-8?B?cmxMMXlFV25ucFdNREhITGR3aVBTTlp1WU53bWF1MTZhSlExYTc4dHpGSHIv?=
 =?utf-8?B?c0gvNkJ4cTAwcnJDU2dTWXZSZ2dMN0FtQTZmYzBWNlRRcjVjR2l3YWdOWmJC?=
 =?utf-8?Q?Tw4KtoT+rveD014G+Tz86Pjtw3/bBTXE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2pwWEFmN3BKWjF0R2FPK0FXWEVDRFl4bEZRMXM1WmRkL0p3K0ZmQjhCQ0tx?=
 =?utf-8?B?eHRJMGRuMGFKT2loRWFNbDZVRFlad1ZLaVc4MyswbklHWXFuZUxjUHhJQVZL?=
 =?utf-8?B?ZTNIWWlITzNtMjF0eWNxNFpjRFdpam9vTE5saDZmRlNIa2grekc2cjZtaW42?=
 =?utf-8?B?TlpWTkx1UUZHam5vVGNxSndDMnVpNWl0My9mbzJnQk1ZU3hlWkJGNVZTV2Jm?=
 =?utf-8?B?MXY5TkV5TFgwUDZ1N0tVUGQzbFNoRGJReUh6clVKakcvNzBjT2RiTWQxaUJ3?=
 =?utf-8?B?WkI3SXR4NTk0SVNyemNZeUFEUE93cEhzRkNXQUFoUG5CRC9wWkNkUlpFVXNr?=
 =?utf-8?B?U0pUMXJwa1U1WEJFajJ1eU5mZWlxN2pMZEtPaGQxS01INWFoN2crYlZnQmNF?=
 =?utf-8?B?ZE1PZStkOUlEZFdadW1ONkJpaXFzcEdVOERLa0pybmE2SXJKTGNZaEF2MTc2?=
 =?utf-8?B?YTRXNHU0Zit2VnZZdVY5cUdaSVRVbVJXUytkTWRwUDA1ZHVkeUlZTzJ1bDRh?=
 =?utf-8?B?QnQxRkpxNlFnckM4UFVLSnlBY2xpQkNldUs3WnlNQm9xSkhWcVdCYk5xUDdq?=
 =?utf-8?B?SEJzbSsrZElVUVhJOS9Ddm92UlNEZlc2bFlnM2lTTTdjby9rZlZTWlNWR3Vu?=
 =?utf-8?B?Tkw2U09Wc0p6cUJFT3lubXJXd01FR1RnbERETW9mVkZMZTlQRE8vNkJXZkhP?=
 =?utf-8?B?eENOaDMwcmw2TUY4SFVQQWNwQ3FpNGFOanE5ZHlEN1ZuMXZ5YU1NbWQrbmRF?=
 =?utf-8?B?bmlpQUY0THllc3p2SzlUanlmbDV3eElSdzA3bjE2WFFaYk9DTHJtRG55d21D?=
 =?utf-8?B?YmlXOHdsWTB1Tno4aDQ4TnlDTnJkSlZPR2ZGc0U5akJuVXdSZnNnQStCeCsz?=
 =?utf-8?B?OHo2MEc1SVRybTZ4NWNrYUFsTEF4RlZyNWRkWGNlR0RCL2RvRGNoQ0JmUnMv?=
 =?utf-8?B?c2s0TnkxWFNHSEtYUzVqL3pZWmdJZnp4YTZtTzJvQnNxNXFKOTdSK2N4NklG?=
 =?utf-8?B?dkNZeHhsZUJyRllqSVNMLzlJUFdhYzBNUkk2N2VmR0F6S0NQY0hDK2krcGFB?=
 =?utf-8?B?ZTcwRXdpVFFDKzEwTlNldW1Bbi92U0tLU1NXYkw1Nm45VGpvOWZSWnYzZjVy?=
 =?utf-8?B?Tjd1Tnd4R2JrN0NIQjFaVkNsYkovY01VN1NuS0xrelF6SjVtR1l0N2NiM2ts?=
 =?utf-8?B?UURKZHBxNFNFcUo1VzFXN2NMOEpMYkM1bVB6QWZWVk9UaWIzWkgrVG5sYTFK?=
 =?utf-8?B?dURrWlBQZ29WdTZ6ZjUwZDhJcmd5bXJvejBFZSs5UVlFN1p3RU5pSlpPWlFo?=
 =?utf-8?B?TlBZS2NsaThBb3hQK3BmNHZxcFUzZGFKMU9XMGkzWllVam1yY0ZrbUxkcUl2?=
 =?utf-8?B?bnhxOE9rV21XZ3hVVk9vbmEraWpiWnJOS1R0cHJtQ2VsWmhEMUlrQ2hpVnpM?=
 =?utf-8?B?WDRxell3eFFaNDRsYkFGcE5rckE2QkhTOXRKS3BxUkQ4SVVUZGtvT200alRT?=
 =?utf-8?B?cWNWbWZDcTlNdEN0MDV1L09XejJycVZiT1kyZ0RmaVVIMk1hdXVRa2VzV2E3?=
 =?utf-8?B?Y3FPOWw5Vld4NE1mVGwzMFVma0VVTndZa3MvQ2FDQ2Fmb0RxVmk3aHFtQTRE?=
 =?utf-8?B?RlRKMzJYTE1Nd2c5ck1jSWE2OCtuN05nTm0rVHdsaUdwZ0h4RkdPbW53Vm9w?=
 =?utf-8?B?UGc3QWlOUXBoVnF6VXQzTzhkSkNGQUdCQldtUXYzdzBadXhEWE5XZGdHSlho?=
 =?utf-8?B?NGZ5WTkweW93STNucUtaTWY0c1NoWGFGcG90c0xXT1FvSWhralhEMi9WV1A0?=
 =?utf-8?B?OUxlT0JTbG9BbFc5WXh0SU80M2RNZ1FqdDVmeHNjZmR5T1VoQnpwUUtrdXFi?=
 =?utf-8?B?ZUpPWVZNNTQwRFBBOWJLMzRFS3Ixd3RuZmM0azRwcTBIREtVcU8xL0hZUEll?=
 =?utf-8?B?bGQ5dnBPM3NqSGlFMDFNc2k1YjYzbm13R0lLbTdhTUVJVXFESzYyaEpzeEph?=
 =?utf-8?B?b2F6eThmOTR1UTdlemtkNkhpcW4wMDhqdzVjcnNWNjQzQzZrNndpN2l5NEs0?=
 =?utf-8?B?bk5zM3F6RFNmd0ZIVm4rSklxODE0eW5Qc2o0NGhWZ0VVcit3K1BLY3B3Qmkz?=
 =?utf-8?Q?zvZHQUuLFqOBvlX+ziqoTJECJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c05db8-3a31-4c65-fc9d-08de26da9353
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 19:42:15.0907 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90URRIHk+ZBNVkm7g0IvVYSqDYkFzWJOJGM/Z1GYE6mbcuUhpil2AyRT16l4ze8L1p6iP78zbR+JoE3ueHeCag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5864
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



On 11/17/2025 8:12 PM, John Hubbard wrote:
> On 11/17/25 5:04 PM, Joel Fernandes wrote:
>> On Tue, Nov 18, 2025 at 12:52:47AM +0000, Timur Tabi wrote:
>> [...] 
>>>>> +
>>>>>          Ok(Self {
>>>>> -            imem_sec_load_target: FalconLoadTarget {
>>>>> -                src_start: app0.offset,
>>>>> -                dst_start: 0,
>>>>> -                len: app0.len,
>>>>> +            imem_sec_load_target: if chipset > Chipset::GA100 {
>>>>> +                FalconLoadTarget {
>>>>> +                    src_start: app0.offset,
>>>>> +                    dst_start: 0,
>>>>> +                    len: app0.len,
>>>>> +                }
>>>>> +            } else {
>>>>> +                FalconLoadTarget {
>>>>> +                    src_start: load_hdr.os_code_size,
>>>>> +                    dst_start: app0.offset,
>>>>> +                    len: app0.len,
>>>>> +                }
>>>>
>>>> Can write more succinctly:
>>>>
>>>>   imem_sec_load_target: FalconLoadTarget {
>>>>       src_start: match chipset > Chipset::GA100  {
>>>>           true => app0.offset,
>>>>           false => load_hdr.os_code_size,
>>>>       },
>>>>       dst_start: match chipset > Chipset::GA100 {
>>>>           true => 0,
>>>>           false => app0.offset,
>>>>       
>>>>       len: app0.len,                                                                            
>>>>   },
>>>
>>> Do we really want to use "match" instead of "if", just because we don't need "else"?
>>
>> I don't care about the if/else as much as I care about the opportunity to
>> just specify FalconLoadTarget once instead twice. I think the match here is cleaner for this
>> snippet, but I am Ok with the if/else as well.
>>
>> Something like:
>>    imem_sec_load_target: FalconLoadTarget {
>>        src_start: if chipset > Chipset::GA100  {
>>           app0.offset
>>       } else {
>>            load_hdr.os_code_size
>>       },
>>
>> That would be one more line of code, but pretty much the same.
>>
> 
> You know, this latest snippet looks a little better. The pattern of 
> 
>     match a > b {
> 	true => foo,
>         false => bar,
>     }
> 
> is actually not as nice as an if-else, because, well, anytime you
> explicitly compare against true and false, you are likely doing 
> something that the language (any language) has a construct for.
> 
> And in this case, it appears to be "if/else". :)

Yeah, true. As I mentioned I was more referring to the `FalconLoadTarget`
definition. :) I prefer if it is constructed once and then fields conditionally
constructed, if possible.

thanks,

 - Joel

