Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E66A60718
	for <lists+nouveau@lfdr.de>; Fri, 14 Mar 2025 02:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B05910E00E;
	Fri, 14 Mar 2025 01:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qKkfFwob";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F68E10E00E;
 Fri, 14 Mar 2025 01:39:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBH7sKUqTp71IwGgWjm9+IHgL4ipKd1jN1PJA6eg1QBrIIHu7T0SqVKGvDIxVvOI14McBCN41nMHf76Ent/eW6Z7NB/xHwKQum1WeoEeePf5CuYEwZST5c5nsctDnM0Mi2onLo7oX4hmfSJyHgVhgU+AY620bqZ6PHkdN3cionmsWptq5ed1NBg9rjtn1OF0PTrkZK7NzDv+J8ODydDLdOS3cRtNWl9Be3zrZhZjblxNbBZy+8K5ES7ZaVs5RnGjln+lM+0CuncRG128nYOlJ0lkyp8/L9uI8jGrlQZPCL4zqYuC5uO00KwVi07mFxSdS3ExFkUPIQ+2qUvC/TVMXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tHUtAXJUr/M2gs710fFCMt003gvIkLYzAZbm4lqOORU=;
 b=USkF9caihF21xlsRCZ4odlOGj8FiAlP8KmgSGekbZqWLbBMpsqIRwUH6t4ZK0bdV7dspyHN1rGAV8dPDqnaS3FiRQ2wQvZoYMOM115O9dPfUhcd8ZXcCBaDtz2H0WV7z0ELslc9wVnjOd9B8eZFl+hgnp6akbOjt9PlpbHhMKRNjg8QQJHHqNrZ7xKSbANxJ5Solrdv0bQRGrlyLdjMx/f5XmXvCxdbVwbNWk5VQJUIkNOa/LuUMuboQW8hBGxd1AMvOSS1EwOqnNsoZ5Wx0EDzy6osELPJSmfn7T+fzwr+E9lKgObJdQVoBYmN+JKq/1KohczAMDOLCyb+GGiYttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tHUtAXJUr/M2gs710fFCMt003gvIkLYzAZbm4lqOORU=;
 b=qKkfFwobVDN2KNelJz0kacXWZj9Srl4yu7i2eRR7he0yCFESZPElssQXMaZNSRbPlOkzF1n8f2sKB6HkHyyWRhH104kTP8ShN9gQKfeGuQy7btZZSvJJYYZHvgBzaizpcfNey0OfwYo/1ZEbET00Kc7zocXRoM6Smt3lcdjUtQhe0PfEDmsq3p0Vyf3t7ws6kY2N8oFqFOMkHHFwtYiry7gTcA0dg9YKs0UThRsHK2Niy5wrstP3eGh5j4uXvlIGSiUyOXPYlUEmOwyowg+MQKcwihsngdD82svcHc6tKYxJjXItPO2+5WGRIJk2zrJwq2MHA8CPB+/6vcvxIE1O2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 01:39:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 01:39:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Mar 2025 10:39:31 +0900
Message-Id: <D8FLTHSZL80Z.1R0UNLQVBP75O@nvidia.com>
Cc: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <lyude@redhat.com>, <bskeggs@nvidia.com>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiwang@kernel.org>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] drm/nouveau/nvkm: factor out current GSP RPC
 command policies
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>, <nouveau@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250227013554.8269-1-zhiw@nvidia.com>
 <20250227013554.8269-2-zhiw@nvidia.com>
In-Reply-To: <20250227013554.8269-2-zhiw@nvidia.com>
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 02952004-cd54-405b-7cb6-08dd629912ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UHdHenFCREkyZXloeHczNENRMDRHajI3dG9CZWFTdDliMWo5c1lRQ09DdHEr?=
 =?utf-8?B?MTBRaG94Y1NEMmlvZXRVSjhqQi9xUDBtaU5xQUY4MVMxTzlUd2JIckp4MEpt?=
 =?utf-8?B?eWdTcndXZW5Ed0haZHpEd2RJSlNhTllERzJCY1hxbUx5bzZlUWhlMHFDdC9x?=
 =?utf-8?B?T2Q0dE10cXJCSUt5bERGalYzbVFEVU9CSXQyKzBqa2NLV1VyaWFsWEJ4cllO?=
 =?utf-8?B?T0R6a3lEWmNxMGdBT0g0eFFaUzhJVUxxemh6bVBFSjl6K2ZQblNyLzkvczcz?=
 =?utf-8?B?ZE5aakdXVi9kT2pWalJxSjNDN2djRHF4aG9YeTErdTFjTlBFR1g2VnRPRUs1?=
 =?utf-8?B?MFpZSzlmZ0lZcnk3TFJ5cHZvY3QxNGN1Wm9VU0xwU1FPQ1JxU25ueDdsK3ZK?=
 =?utf-8?B?azg3RTc0RExsUTg5dk01ZUwwUVFVZyttYXNMSXNMWVloOUdiMnNXd29BTkps?=
 =?utf-8?B?K3RQSFE1RHhkbXRUV0NwZWIvR3VJcyt5SHlGSnpQeU5tT1FJamp3b1BtSXRI?=
 =?utf-8?B?WGhSQ2xhRFZDdkU0VUJvZitHREduR2xJcEliRUNwd2tMaFU2V2FhR1Z5TG9h?=
 =?utf-8?B?b2dSa3RkR25ueWN0Vk85RzdGZUEvT2VVSDZNRjZ6ZTZBMTJpRC85SjE2Z3JF?=
 =?utf-8?B?RVczSDR4d1NUQVZaeHNRSHUyRzBUa1JyWEJOd255ektHbFdGK1JjMXc5VERM?=
 =?utf-8?B?MVgxWW1IUm1TQ2tBTDJPOWFxbm9qOHJmaHpBdU02RnNLUWh4SEdmb253Q3FP?=
 =?utf-8?B?MjhpdkVHZjhsYzYvVXBCaWZLSi9QaVZ0YVNuMHFmU0syenFUUjNKSWV0ZFV2?=
 =?utf-8?B?Rno4OC9HN2NmS1VZQmhiVWFLRk93enE2YlZRODNtQlB6eXJDZDZUNTRzRFFX?=
 =?utf-8?B?bnMvYlQzMEY2ZlNESWMvSjc1RkQzUjVRRGJUbHg4NGZ5Y25XVlJ2YUNEQ2pT?=
 =?utf-8?B?cm9pNHBoL1pFbzIxaXpRZVEyT09jdmdJU08zNDJReE4zcGNRQ2pJSFpGcU9i?=
 =?utf-8?B?V1pZT3JzQm9pVm90djV4aTBlOEE0ZjhJeUZoNEhiNitNbXZQWVhmK0JPWkRh?=
 =?utf-8?B?TmdlV3hjdld5czVlK2gvZlZlYStGNDI1N1IraFFqKzRDRkU5c3l2Ylp1VFBM?=
 =?utf-8?B?TDRoaGhtRU5iKzZEUDZ6bWVVZjhRSnl4T3V0ZVJVY3R6MWMwMWhnVEF5S252?=
 =?utf-8?B?RjdRYXYwRVJ3MzZaUklFa0hnMHFlR0s3VGRaSFFpNFFkdXJwRWl6VHRRQlIx?=
 =?utf-8?B?UFczVFJzZTQxWURiV3lGalJqS0d3ZU16bmxna21YN2U3eTRiT0VJaDMvY01Y?=
 =?utf-8?B?eGwxWEFxQ0hDZzVhMTZTRkJpWE16S0pGcTMxYTF4WFJXb2NYcDE5ZWhGaDI5?=
 =?utf-8?B?NUFKaVE2M2p0OC91ZUJqVzZsR3N4QXRJeU1PVEJaTnpUa2Q1eCtVUzdkQVc5?=
 =?utf-8?B?OWgrTDJMTHhsekpCanBsOXl6OWtTSTVCcHB6WW1Ma2pINVJTUlE4a1pJNER4?=
 =?utf-8?B?eHhPMm9jMU1XL216ZkZIeUhkZk9rdjIzMGl2L21ZZFBNV0srckRKNnV6Sjc2?=
 =?utf-8?B?TEhzbmVITTh0bGF3WWhpemdvR1B1cHpkZTUwZ0hnOTlKOE8vWkZhSUJtTzky?=
 =?utf-8?B?UHRDSnBQbXN5N0hHdVZwOVY2cXZhV2l1QW1HaTU0Y1dBK0V3SlZEZTRJQVpi?=
 =?utf-8?B?Mzl2NzNHQmhrVUQ2eVM2Q2JQRW1oejZISGNQM0RDMHZxTFR1b0pvOCt5azIr?=
 =?utf-8?B?WmYwazZ1aGR0ZUw0SnJiK2RlbXh3TjgwMHIrUnpSaGEyR0FPSUxQV3h6REdi?=
 =?utf-8?B?NHlRYldJM3RmU3ZNTzZFU2VRL0pJR3NEMVRrUVRwRmNWd0JIMW50SkZQWDJQ?=
 =?utf-8?Q?+lw8O75UOpvVO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEVOUWdhRXp1Q0NlcTZIME9GZ2JmVWE3Nm9kSnNkbUF1MDFKVDBwNGxXYU1o?=
 =?utf-8?B?S082clUyNVRsN3RkaURGclkxT3hEVHArOTlEaTVld3U4QStDYXI2bjQ5N1J0?=
 =?utf-8?B?UnJSZzhhb2RVMTBIRU85QjhnWmdRTnV5UVB1QXg4Tzl4WERJNUxPZ2dTak9v?=
 =?utf-8?B?M05wZi9OVkl0L0QxSmVSRmVzcjFwb1ZFc3JoYTd2QnlGSm5IN3NvcGkvYTVE?=
 =?utf-8?B?QmxudGM2eXpGcjEwb05QdjZXVzkwcHp5bmF4ZkFUUTY4S1BZT2JRSmZJSUN4?=
 =?utf-8?B?WmViRCs5WGs4c0QxWlBEM2ZQWHVaQUZZeTZuMFVBeWZXQVVHcFdXb2MzNVhG?=
 =?utf-8?B?ZUNEMUZBT3VLQVVYWlNkU2tlUGswVXBLUkpVd3FWL2owVzduYXBOVlRiY2g4?=
 =?utf-8?B?SUx2NGpEalNlcmpBL25FNUZvN0ROUlVFWlBCRTN5a1lIaFdVSU9IbzlSQWhQ?=
 =?utf-8?B?bkNXNzN2WDhxUDNYaHJhSzZndkN1UDZTYSt4TXpFU203MEEzZUJyQXkvZ0t4?=
 =?utf-8?B?NUxvL0VIUGMyRUNMeWw3MW1JQlgvTkZzcjZoY1lZV0R0R280MitBVmhvQkFY?=
 =?utf-8?B?aS9VbUpLSks2MnJaMGNnRUZzWVE0THNUdWFEWDloNllYS24rUmpLT2kzdkhL?=
 =?utf-8?B?TU9ZSFNMNzhtVjhPc0IvODk1cCsxN3JFY3BMQlVJK0s1YU91TDFjUWVBZG1T?=
 =?utf-8?B?YVYxMnJoOCtPNHBQaXdIUldCczBtVWZDdk8rbWRmQmlmaEZsZHBTdjNoYzRl?=
 =?utf-8?B?L3RQMzF1dk1MSGtWWlk1OHZnV2RLQ1ZYQ1ZXeVc4QWpOWHJhSnJUQWIzZEls?=
 =?utf-8?B?YnlYdm1BYUprUEtyanlXSlMxKzhHL3FNUGJQeXBqY3lYZTdyaGtwYWxKdVgw?=
 =?utf-8?B?cy9DRHRreGJHTUFqazBGNEZrdFYzU29CREhjcVlDeDJHZERpZlpuemtHMW9D?=
 =?utf-8?B?czB6YUdCdEpmcHFqN2RrWkgxcDlWcnNmclpBSUtWSm9qL3lMVHFVd0xPYytF?=
 =?utf-8?B?VUJrMWZxS1puWnp1QnlxbnNNN3V2WmRFdHVVcm82SEJtaE92b3Zud0lncWp2?=
 =?utf-8?B?M2xPQUdwMXBqdWhUNGJhem1GUms5N21UYThNdEQrTTFPMERVeGtlYkJpOW5t?=
 =?utf-8?B?K1J2WUE2aGwrczZra3hOMDRyQlFkRUM1L2RraG55SXJKSFl4SHVVT1FNaW5V?=
 =?utf-8?B?eGtHc0tRK0dycy9lSEpEVGt6djFOa0RJVnFwRmVxdmcxMk1HM3JHLzcrWkt3?=
 =?utf-8?B?OG1aMTB5T3JWOXA4THVjeUlqNGUveGtTU1BFTVJUSEc1cHRHbS9SUGFyVWFq?=
 =?utf-8?B?Qkx6NnM0cjhRcGdUSFBNTEJBMTE1REtwdFpuMUN5MW4rdGsxZERzeTN4YjQv?=
 =?utf-8?B?RGYrNTZjU0tDaXJDdGFTYnRiMUVUd0RiME9vUEMzR2s2dTZ6OGFVUUtTL3ZH?=
 =?utf-8?B?ei9VRXJXOXR3RmZLSXRHQTFJR2I2NWF3ZGs4Q2FmZUdzYmlnTzF5NDU4ZytS?=
 =?utf-8?B?VWx5Y2xIdkcrem81cWZGakpieVZPQU5aSlhnbDJBb0JsUHlFUm9adXVnUmxs?=
 =?utf-8?B?Nkx2VDdqeGpZL3lCaDNtUXFnVktXNDNxd3JHN25HdDRmSHl4bUIwV3AwQ2RX?=
 =?utf-8?B?NFF5Z041OTk1TDhSakJFMDJoSTFOSXpwTjRhS3NCd1NJQXpUUU5HY3pjcWNj?=
 =?utf-8?B?Nzd3SlZBb2g4OWdhdENZSGpQWXhJd0FwRUJXN2sxb2VzMnNQeHN2ZW9OemtD?=
 =?utf-8?B?OHA4T2VUVHdDYjJPQVJ0R1I5dEFKRU9CL1QzM1Y1NFpJMERUMkw3LzlwdkJH?=
 =?utf-8?B?bGE3RHNYTHJOcHhpWmxROUl3RitUeWM4c2dtTFFPSlZ6Q0R4ZWdHNzlERUFw?=
 =?utf-8?B?Z3dlaVJuVGpoQWN0TytIMkJkcTJURVg0Mk52T0tLMGRiMXNTQkV6WDd0Um1V?=
 =?utf-8?B?ZXh5cU1hNjVxVERDT1JrM0Y5bXYwamVVcTN4alZEbG9KOTJSQXovc0VFTEly?=
 =?utf-8?B?dXNPZmxSSU9hQ2s1RGZMSGN0TEovazBQejg3ZVZqcEJwRStGcStwQVE3Vnhw?=
 =?utf-8?B?U05OS2lnMTFYdGFpMURlV05HN0VrV013cGNqWlE2aHBlTy9QS0ZROUZZNlVW?=
 =?utf-8?Q?rwk9U3Ey6jsKOx87GojmLSobJ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02952004-cd54-405b-7cb6-08dd629912ea
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 01:39:35.0282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ec4VbZswyGm38vsO6slvEguOYm8ngBkBuWZ7A2lha8gy/rgj7ccT2qWHBHUS2oZBWtuyn0Qm/9BoZX516u/Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680
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

Hi Zhi,

Thanks, this patch has become super easy to review.

On Thu Feb 27, 2025 at 10:35 AM JST, Zhi Wang wrote:
> There can be multiple cases of handling the GSP RPC messages, which are
> the reply of GSP RPC commands according to the requirement of the
> callers and the nature of the GSP RPC commands.
>
> The current supported reply policies are "callers don't care" and "receiv=
e
> the entire message" according to the requirement of the callers. To
> introduce a new policy, factor out the current RPC command reply polices.
> Also, centralize the handling of the reply in a single function.
>
> Factor out NVKM_GSP_RPC_REPLY_NOWAIT as "callers don't care" and
> NVKM_GSP_RPC_REPLY_RECV as "receive the entire message". Introduce a
> kernel doc to document the policies. Factor out
> r535_gsp_rpc_handle_reply().
>
> No functional change is intended for small GSP RPC commands. For large GS=
P
> commands, the caller decides the policy of how to handle the returned GSP
> RPC message.
>
> Cc: Ben Skeggs <bskeggs@nvidia.com>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  Documentation/gpu/nouveau.rst                 |  3 +
>  .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h | 34 +++++++--
>  .../gpu/drm/nouveau/nvkm/subdev/bar/r535.c    |  2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 75 ++++++++++---------
>  .../drm/nouveau/nvkm/subdev/instmem/r535.c    |  2 +-
>  5 files changed, 72 insertions(+), 44 deletions(-)
>
> diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rs=
t
> index 0f34131ccc27..b8c801e0068c 100644
> --- a/Documentation/gpu/nouveau.rst
> +++ b/Documentation/gpu/nouveau.rst
> @@ -27,3 +27,6 @@ GSP Support
> =20
>  .. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>     :doc: GSP message queue element
> +
> +.. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +   :doc: GSP message handling policy
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/=
gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> index 746e126c3ecf..e5fe44589bbd 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
> @@ -31,6 +31,25 @@ typedef int (*nvkm_gsp_msg_ntfy_func)(void *priv, u32 =
fn, void *repv, u32 repc);
>  struct nvkm_gsp_event;
>  typedef void (*nvkm_gsp_event_func)(struct nvkm_gsp_event *, void *repv,=
 u32 repc);
> =20
> +/**
> + * DOC: GSP message handling policy
> + *
> + * When sending a GSP RPC command, there can be multiple cases of handli=
ng
> + * the GSP RPC messages, which are the reply of GSP RPC commands, accord=
ing
> + * to the requirement of the callers and the nature of the GSP RPC comma=
nds.
> + *
> + * NVKM_GSP_RPC_REPLY_NOWAIT - If specified, immediately return to the
> + * caller after the GSP RPC command is issued.
> + *
> + * NVKM_GSP_RPC_REPLY_RECV - If specified, wait and receive the entire G=
SP
> + * RPC message after the GSP RPC command is issued.
> + *
> + */
> +enum nvkm_gsp_rpc_reply_policy {
> +	NVKM_GSP_RPC_REPLY_NOWAIT =3D 0,
> +	NVKM_GSP_RPC_REPLY_RECV,
> +};
> +
>  struct nvkm_gsp {
>  	const struct nvkm_gsp_func *func;
>  	struct nvkm_subdev subdev;
> @@ -188,7 +207,8 @@ struct nvkm_gsp {
> =20
>  	const struct nvkm_gsp_rm {
>  		void *(*rpc_get)(struct nvkm_gsp *, u32 fn, u32 argc);
> -		void *(*rpc_push)(struct nvkm_gsp *, void *argv, bool wait, u32 repc);
> +		void *(*rpc_push)(struct nvkm_gsp *gsp, void *argv,
> +				  enum nvkm_gsp_rpc_reply_policy policy, u32 repc);
>  		void (*rpc_done)(struct nvkm_gsp *gsp, void *repv);
> =20
>  		void *(*rm_ctrl_get)(struct nvkm_gsp_object *, u32 cmd, u32 argc);
> @@ -255,9 +275,10 @@ nvkm_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 a=
rgc)
>  }
> =20
>  static inline void *
> -nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait, u32 repc)
> +nvkm_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv,
> +		  enum nvkm_gsp_rpc_reply_policy policy, u32 repc)
>  {
> -	return gsp->rm->rpc_push(gsp, argv, wait, repc);
> +	return gsp->rm->rpc_push(gsp, argv, policy, repc);
>  }
> =20
>  static inline void *
> @@ -268,13 +289,14 @@ nvkm_gsp_rpc_rd(struct nvkm_gsp *gsp, u32 fn, u32 a=
rgc)
>  	if (IS_ERR_OR_NULL(argv))
>  		return argv;
> =20
> -	return nvkm_gsp_rpc_push(gsp, argv, true, argc);
> +	return nvkm_gsp_rpc_push(gsp, argv, NVKM_GSP_RPC_REPLY_RECV, argc);
>  }
> =20
>  static inline int
> -nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv, bool wait)
> +nvkm_gsp_rpc_wr(struct nvkm_gsp *gsp, void *argv,
> +		enum nvkm_gsp_rpc_reply_policy policy)
>  {
> -	void *repv =3D nvkm_gsp_rpc_push(gsp, argv, wait, 0);
> +	void *repv =3D nvkm_gsp_rpc_push(gsp, argv, policy, 0);
> =20
>  	if (IS_ERR(repv))
>  		return PTR_ERR(repv);
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/bar/r535.c
> index 3a30bea30e36..90186f98065c 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
> @@ -56,7 +56,7 @@ r535_bar_bar2_update_pde(struct nvkm_gsp *gsp, u64 addr=
)
>  	rpc->info.entryValue =3D addr ? ((addr >> 4) | 2) : 0; /* PD3 entry for=
mat! */
>  	rpc->info.entryLevelShift =3D 47; //XXX: probably fetch this from mmu!
> =20
> -	return nvkm_gsp_rpc_wr(gsp, rpc, true);
> +	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
>  }
> =20
>  static void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/gsp/r535.c
> index db2602e88006..f73dcc3e1c0d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
> @@ -585,13 +585,34 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
>  }
> =20
>  static void *
> -r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
> -		  u32 gsp_rpc_len)
> +r535_gsp_rpc_handle_reply(struct nvkm_gsp *gsp, u32 fn,
> +			  enum nvkm_gsp_rpc_reply_policy policy,
> +			  u32 gsp_rpc_len)
> +{
> +	struct nvfw_gsp_rpc *reply;
> +	void *repv =3D NULL;
> +
> +	switch (policy) {
> +	case NVKM_GSP_RPC_REPLY_NOWAIT:
> +		break;
> +	case NVKM_GSP_RPC_REPLY_RECV:
> +		reply =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
> +		if (!IS_ERR_OR_NULL(reply))
> +			repv =3D reply->data;
> +		else
> +			repv =3D reply;
> +		break;
> +	}
> +
> +	return repv;
> +}
> +
> +static void *
> +r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload,
> +		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
>  {
>  	struct nvfw_gsp_rpc *rpc =3D to_gsp_hdr(payload, rpc);
> -	struct nvfw_gsp_rpc *msg;
>  	u32 fn =3D rpc->function;
> -	void *repv =3D NULL;
>  	int ret;
> =20
>  	if (gsp->subdev.debug >=3D NV_DBG_TRACE) {
> @@ -605,15 +626,7 @@ r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payloa=
d, bool wait,
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> -	if (wait) {
> -		msg =3D r535_gsp_msg_recv(gsp, fn, gsp_rpc_len);
> -		if (!IS_ERR_OR_NULL(msg))
> -			repv =3D msg->data;
> -		else
> -			repv =3D msg;
> -	}
> -
> -	return repv;
> +	return r535_gsp_rpc_handle_reply(gsp, fn, policy, gsp_rpc_len);
>  }
> =20
>  static void
> @@ -797,7 +810,7 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
>  	rpc->params.hRoot =3D client->object.handle;
>  	rpc->params.hObjectParent =3D 0;
>  	rpc->params.hObjectOld =3D object->handle;
> -	return nvkm_gsp_rpc_wr(gsp, rpc, true);
> +	return nvkm_gsp_rpc_wr(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV);
>  }
> =20
>  static void
> @@ -815,7 +828,7 @@ r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *ob=
ject, void *params)
>  	struct nvkm_gsp *gsp =3D object->client->gsp;
>  	void *ret =3D NULL;
> =20
> -	rpc =3D nvkm_gsp_rpc_push(gsp, rpc, true, sizeof(*rpc));
> +	rpc =3D nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, sizeof(*rp=
c));
>  	if (IS_ERR_OR_NULL(rpc))
>  		return rpc;
> =20
> @@ -876,7 +889,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *obj=
ect, void **params, u32 rep
>  	struct nvkm_gsp *gsp =3D object->client->gsp;
>  	int ret =3D 0;
> =20
> -	rpc =3D nvkm_gsp_rpc_push(gsp, rpc, true, repc);
> +	rpc =3D nvkm_gsp_rpc_push(gsp, rpc, NVKM_GSP_RPC_REPLY_RECV, repc);
>  	if (IS_ERR_OR_NULL(rpc)) {
>  		*params =3D NULL;
>  		return PTR_ERR(rpc);
> @@ -948,8 +961,8 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 pa=
yload_size)
>  }
> =20
>  static void *
> -r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
> -		  u32 gsp_rpc_len)
> +r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload,
> +		  enum nvkm_gsp_rpc_reply_policy policy, u32 gsp_rpc_len)
>  {
>  	struct nvfw_gsp_rpc *rpc =3D to_gsp_hdr(payload, rpc);
>  	struct r535_gsp_msg *msg =3D to_gsp_hdr(rpc, msg);
> @@ -967,7 +980,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload=
, bool wait,
>  		rpc->length =3D sizeof(*rpc) + max_payload_size;
>  		msg->checksum =3D rpc->length;
> =20
> -		repv =3D r535_gsp_rpc_send(gsp, payload, false, 0);
> +		repv =3D r535_gsp_rpc_send(gsp, payload, NVKM_GSP_RPC_REPLY_NOWAIT, 0)=
;
>  		if (IS_ERR(repv))
>  			goto done;
> =20
> @@ -988,7 +1001,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payloa=
d, bool wait,
> =20
>  			memcpy(next, payload, size);
> =20
> -			repv =3D r535_gsp_rpc_send(gsp, next, false, 0);
> +			repv =3D r535_gsp_rpc_send(gsp, next, NVKM_GSP_RPC_REPLY_NOWAIT, 0);
>  			if (IS_ERR(repv))
>  				goto done;
> =20
> @@ -997,20 +1010,10 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payl=
oad, bool wait,
>  		}
> =20
>  		/* Wait for reply. */
> -		rpc =3D r535_gsp_msg_recv(gsp, fn, payload_size +
> -					sizeof(*rpc));
> -		if (!IS_ERR_OR_NULL(rpc)) {
> -			if (wait) {
> -				repv =3D rpc->data;
> -			} else {
> -				nvkm_gsp_rpc_done(gsp, rpc);
> -				repv =3D NULL;
> -			}
> -		} else {
> -			repv =3D wait ? rpc : NULL;
> -		}

This bit of code seems to have a slightly different flow from what
r535_gsp_rpc_handle_reply() does - it receives the response before
checking for the wait flag, while rpc_handle_reply() does things in the
opposite order. The new code also drops the call to nvkm_gsp_rpc_done().
Can you double-check and confirm this is ok?

