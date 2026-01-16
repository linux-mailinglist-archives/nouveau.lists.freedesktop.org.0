Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE0DD38780
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:27:21 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B659F10E92D;
	Fri, 16 Jan 2026 20:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NENiFhnK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8AA0144C96;
	Fri, 16 Jan 2026 20:18:44 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768594724;
 b=rL81s71s6Fmh389j5Yg0dGaKNkh2Gdwn3MZLg7i+EXp4huZmaBZyekEdnw3DNELjdr1nf
 R293wc1mx7/hih9/x5jtvTlnp19g6yqq0uuxR9XoxWNveK2LPjFFLbevQBqQ47jClZMhBAS
 6eqA7O+uR7vE0zixm0VZMDZvBvaow6vgt4Iy4vcpB4g2JMZV67XdppdTkypy7mAIhK+BIAN
 YCX39y4+eVIp8i1oyGvwwvr0tfMMeZWq3RzWW2a0TP45YIviSNHy7Fbj9EwR+Zc8ITbP5JP
 /SEY4U2GGTGCz1wY6L8BEj24YglpHXCFBT0iT7Kbnug/ZwYb2TdVDcMDFs+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768594724; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ox9nCDqoWupLzGWizIrct6NxSMZkH26wP6VuWWjq/08=;
 b=Wbnm0Oxw4ZfO2+Zuhlpopwpuv3zC+4W5b1sW9mVlYu8ASOxRV/sSiYDMe8pEicT4j5H5+
 d4jXna4KC5Y4H489bl8WVwaR2f2xp7PGeIp37rEhe6EG3I6YjayHSUMFMYdSrVma3Ef1LxI
 5VBWwXNJnDrQO8YbJYHgjhmQxodWD/9URytlkDvCS48Sh/cDCAEdGgUCODrKvOjKk+x7okH
 QTv908rYdMtbSZwIQMVVMZNcEvQv6KZM5I1g4gZBpHt2utgHtG4kEQIWzzet5TgEIhCT97+
 imxRLJ2h+mg7IDN9H4RqLVKtapZdX24gtYOeI5/8lX3Ohe7+lOV6R1XBawdw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9F66344B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:18:41 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8748810E929
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FpNrG6AvS5b3/zS7GGL1//hxqGZp7/5qDwPyJ+g1iMXBwAFuBJpuXDRK5M4pWDRk7CYCFrj3FWQ3gGiyLi7ACazPLXQ4NrQT3XF26pgE31xw38Qq2Pn4hTHS5S1QuLZTrAPHxgk3M1Mkeeyf17P4GjoXS+XkMfVc/GLgE+XqDiVCkzS9RI7wX8NKaSrD4e2cMKusTER77qkQnX1Ud72Q/AZyKySQCsMAHL1fJvYJLSf/xNCc4HksfDLD3oCxdoR+rWUXsxAmnH95CvzfKmDQLl8sUX8qQBwv1L9jAsjQs0ABrCjxXKIfZbIwJBNZvGpsj5FVuDBIjgH/YJYZ0kjqeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ox9nCDqoWupLzGWizIrct6NxSMZkH26wP6VuWWjq/08=;
 b=MvCRZu4W4NO6nvPgerH5SfWUuvSXw6oUW5QjG4aht0m+iI5n1PpToPWUW/e2KsY6KV0cd3Vi3YUybs7RhkvuzaCS1nR/ACgvo+TFWeV35vMsGZo2A6eOgYLJ5CMiEtpOlwpioAbzw3/15n2mud5OfYJbh7T3MlUeaGVWdpckSFh6vSHtwjIuPYWykwlBwxNRqP/SVqtW7VjH7f/kyepNMpLN6nLINopIIJyj8XNOXDsBNVZ4upS2DRw5T9T0boP+brf9mAhF2paH7ajKjdOG3ag8eKOZUT32IRKyFM2V6CTC5K8IhXmbJj02w7/VXwrKKe3ifNah4gdggJm8SygPuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ox9nCDqoWupLzGWizIrct6NxSMZkH26wP6VuWWjq/08=;
 b=NENiFhnKeYV20QXv3w/TLs+E6O5Pa81dJic+hcqHRQwnizgf50ZAituxUy0qOtxc5s7XatG6gKC6TToTnWefjYqzw6TxssugfVRctUbRLk1KSyPK6ftCBPFffWRvZQhEO4txFbqbO3LvqAJk6QI6nP5GGIDMTU0f5PWqrPEaJRHzDwyOQdfSeXLyzL9BSp+vc4mLBoifp6F3cFnALoTUwGTn0367ZZNfTvXukZc3jjbfu/SU7PjhxBR1iJYeRz674E+FeGlJm6KFj6p6/Dnw9y7f/rmu9U6ofLAPKe/znDJAeLwmTiOvcQzd7BcYPazmtSOHA8cNt64cq+ImotwGNg==
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by DS4PR12MB9707.namprd12.prod.outlook.com (2603:10b6:8:278::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 20:27:14 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 20:27:14 +0000
Message-ID: <62a28e20-0a83-48e3-8e25-0dc53a614467@nvidia.com>
Date: Fri, 16 Jan 2026 12:27:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the HAL
To: Danilo Krummrich <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
 <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
 <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>
 <DFQAKCP72Y4W.3SD00GX4Y29N3@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFQAKCP72Y4W.3SD00GX4Y29N3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|DS4PR12MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c8ba22-bf82-483a-6312-08de553da2b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGRwWDhiT3FRR2xscm1UR2hyYXM4dmxWb293SDFxcDdmUE15NGdwUXBxa1hI?=
 =?utf-8?B?TTVHSHZ6b3hCazZ5WnZtQ2d1ZVJOTkIzWWE0SFZrRVlmT1k1dlF2MDFQWjNs?=
 =?utf-8?B?WC9EN0ZncWtmNTB2NUREWGZWbFphRUZscEVvd1g4RFpKTHRsdWM5MHU4ekc5?=
 =?utf-8?B?NnBCZnJCclpHelp0Ky95SXlWSVVDL3VMeW1jYUI4UHMvVWwzamNka2QvRUdD?=
 =?utf-8?B?VDlIQVVURUZrNHFLeHAybVpKdFRHN2hQSkd4ZldMd2dXc2NTUDErOVdyem43?=
 =?utf-8?B?NFlwYlVPWnN5VFRCQmlNQ05DckZPU2FJN2NIRXJKZ1JINGFSQ2JiVnRFVmVl?=
 =?utf-8?B?dFJPMk5BemlnOXBSTURqVGpwOHFuQkgzUkxINWtVZ3ZJbWF6MC9QUUJ3M2xx?=
 =?utf-8?B?ellRazdiV2h3aGkrd2ZIUlNEYmN4SDZPOEQzNEtpR2JDVHRiWE9KUStxZEJs?=
 =?utf-8?B?eGRYMzV5WGxtQkRzQTNaQ3pqUUozSFRFVnRibUUxb0QyZjZudWNTcmRjYW9m?=
 =?utf-8?B?cldBeE9tVmlDM3g5V0RUWWVZV3NYS3lGekhYek5zUDBlTWxIQnM5Y0ZYLzBQ?=
 =?utf-8?B?a2FjNmMvc3NTSkNDNWtyV2NCZ24xUVZ2VXlIU2gvYnBrbWdKYi9aWkZLOHFZ?=
 =?utf-8?B?aW9FcnZCdDhLMmwwM2dkMWp0TkZlcXNHRFl2UW92SURET1pNdU15dnhvSU1v?=
 =?utf-8?B?K1lUV3A5czczZjNJdXloOFg1bWlBWGx4WmFLdHp2eTBndWZkNWR0VkJOV0NG?=
 =?utf-8?B?Y3ZuWXhHT2ErcEQwTVpmTW5wQ3VqY2NjQVd3T09DQnltSFJvTS94d1piVk5h?=
 =?utf-8?B?YXpZWW5oL20wNzJQUGp5ZnpzYUtDNjJWS1JyZEZVM2ljeXFrampTV3RHa2Za?=
 =?utf-8?B?TGpMZHRxMUE1MzdUcUttbFd2bHhzVGd5WS9US3pYVTVHamxoS0d1Z2psWDlW?=
 =?utf-8?B?Y2QyZVBSR0htMzA2TUdtVTQyYVhMQVczSnFyOCs5bHRoOG80S3R4Q3F2Y1c4?=
 =?utf-8?B?YS9uRWN6RURSK05mYTU0bmF4UGFUV2hYUkZyYWkzOFVVSllmRGZHTnZIWHBr?=
 =?utf-8?B?TGJYbmRJeVI5R0habUV3cEEzNGszQjVFVVJIU2ZaUlhXd05UN1dVekVBN0Nw?=
 =?utf-8?B?bzhOV1BZTlVsQlQzY0ljdkFpTzV4YmVncWwxbjZTOXY5Y2duY25Cajc4R1Fp?=
 =?utf-8?B?Y0J5ZndMeEhUcEQ1Ky9QaFVLVThsblVJTkw4ekFBeCt3YXpEOVFTSHRMVDVj?=
 =?utf-8?B?akw4dldMR0o5MGppUFNVblN0dC9DV1huRGorci9teFkvUFVWd1N1a0JMMjN4?=
 =?utf-8?B?UlJoQnZpMUIyb3hUOW1FMzFobXN6djZELzBuMFZPc3VvTk4rVWlmb3ZuWlpw?=
 =?utf-8?B?bDI3Y0ZvWlR0K2VraXFmNUdkUmJwcHRRUUl3cTVGRGt4VVlOeVU5SWdzMXRv?=
 =?utf-8?B?YUFkTEZxMENCaEdBY29vSmhCZjl4cDdrRFNsR05tUjZZZ2E0R2FSU2FHYlN4?=
 =?utf-8?B?UXIwZW5tUURtZ1FuY2swYWpvMWFNQ29QemoycTY3ckN6Y0NwOHdHVXZzS0Fi?=
 =?utf-8?B?K0c5dUlXdExtd1NEM1NIbmFtRFlyZGxoOWVYUWpiNlJYUTVUa0Y0YkZZYkFB?=
 =?utf-8?B?aStJcUZ3NHQyUFdpS1FMc1ljdVpKOEkyNHNhT2U2VXo1OWFKc1ZVOEp1emhw?=
 =?utf-8?B?RmxpZnhDUmFuMVVwNHlTclQ5c3ZiRlpmRUJiSDZuVWMvU1VFRjh1YWRWU21x?=
 =?utf-8?B?NjVNc0Q3Z09uTUNjaEFSeVdqazVzS0kwZ3B0cVd3RFpzT0VIUTdmUjlLckZC?=
 =?utf-8?B?RCtWMVByb1c2YnJhWEdNL25LZXlyL3hZR01XR0l3cmVuaWczLzhkOE8xMEVS?=
 =?utf-8?B?d1UvaW5reVJja3d5WWxJRWdqcHdSRDl1UGp3QWhtT2VZV1p2dmNyd0FMek9u?=
 =?utf-8?B?ZjJaVys5OVFXbmxUM1hMcVY0dDBmSnVvTEVqVGsycWlWVU5SM0NsVzBzaFEr?=
 =?utf-8?B?allma0lBWkpNRE9Jb2MxK1FDOExOWHBrYWxzYXRBWTA1Um5tMk9tOFRoazc3?=
 =?utf-8?B?QkdlV3h3ZlBYeUN0VXZGR3dWTk9ianZWb1RKbkhXUHBHaUVEaTZ1ZURsSkZ0?=
 =?utf-8?Q?g1Mo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NXFlSGxvZk9JVVk0SkkxU1REbDNkQk9RMFlOR2gzeEZGdjJwY21DNXlnMW1O?=
 =?utf-8?B?N2h2K1Uxc01TMUgyTGVOQjlwNjlQcTJCYjc1aEZxUThNNHR1Rmd0a01OODZt?=
 =?utf-8?B?Y2ZLZlJBRGZWQTdhaDdUSTlDQWFtd2p0SzdOZUVSSHBtTUdCOWp4bWxCTGt4?=
 =?utf-8?B?UStYcFZmNmNjcGxHQnJRNjF3c1J6UjlwallSY1VjVzNyRjVOWFNIYVVWR1Jw?=
 =?utf-8?B?eE9zaSs0SElKcmI4QWN4S05yaTF5bGZFcGI5RkRXaEVESmJQQTY4SGpHcmRD?=
 =?utf-8?B?emlLWlBmVTN6TmhLZlZGOXNXTkR0UmoyUWhmd2ZOeUlnb2ZPTmdVNzhBSUlz?=
 =?utf-8?B?cXNuVWxHWjdnQWxqSlN2RDJBdTczK3MzYmxoYWw2Zis3NUFGQTl6Q1RIaFU3?=
 =?utf-8?B?dlMrcVNtZ0orbm9ScXJPRDQycjk1a212bW1NYnlKQm5FM2F1amNtNFZCdnpW?=
 =?utf-8?B?Q1hSelJpTjBHeHFINUZ4bDVpZTBDTlJabHpUVVRZQnkwemI5TUJJZDZTUVJm?=
 =?utf-8?B?b1BVU1RlUVQ4K3JtcDZwbWs2SEN0RkhBT3VJTXIrOExTaU1WRFMweTM1Yldw?=
 =?utf-8?B?eWlJQldUcktIN1lHb3Urc3puam5CRzhWNkU5Y09KSThGZTljWi81TjdtUWQr?=
 =?utf-8?B?M2I3K1VoVjhTa2dOendNMmR6KzlKdnphNjdxZlQ4b1J3Y2xDVVlkbTZVOUVT?=
 =?utf-8?B?UzA1bGNNYW41WDNWYlNtTzRLY2F0dWlXUGFlTzF6UzFqci91RHFScDhTQWZS?=
 =?utf-8?B?c3Rrcjk5a2FtR3haSy9wbnh2R09VSjJoNlZLc1lPVGZEM05aNFhuUEovRWMw?=
 =?utf-8?B?cjRCSlF0Z0l4UDZLeG1aSmQ1ZkxwaWJlcytUR2YvU1VIWTNWQXBaSHlqRHUv?=
 =?utf-8?B?WitQNERPTHJGYzBYQzdENDk2cFdkRit2RTNLM25DeFpRcXUxQ01hbE0vLzF2?=
 =?utf-8?B?NWJVd1Evc0R0TVd5WjFTYVpDNVlKUiswaVFQMFRwcDY3ekFqNDF1ZEZUdS9F?=
 =?utf-8?B?Qkg1RlNWS0syZEwxcHQrcmFwVlJMdHpZYVA1a1VYU1ZFWE0wbFRBK2I4T2JH?=
 =?utf-8?B?RytIY0FINExoVUluVXBhZTAvdUZxYURMMzU5Tnpsdk13L3JOSEpzTWY2dUpR?=
 =?utf-8?B?ZCtUSnhCOE9qai90QmRKV0F1MG1BRHhydWoyWU93d1Nwd3RXQkwrQXNNaThG?=
 =?utf-8?B?UDc0RjlhcnFPelFSTW1lVmZDVVRmVU1zcnlURFlOVjgzQmtQU05taHpGSUk2?=
 =?utf-8?B?RjdOMnZZR3hZZHVVNXdMeTc1dnBFY1psWWNuN0o1aWdabW5PUFJEbnN6TFdy?=
 =?utf-8?B?blFFVHMwK2ZoWFExU0RvYmZFSVkwWUwzdHQyc3hOemd6SnNBWmVsZk90RGp1?=
 =?utf-8?B?bmtuQXdiWUNja2kveUJabEF6RTNybzFFZ25USStLd0E3NEd4aGduRDRwWHJz?=
 =?utf-8?B?QkFZc0VmSGlZWXlxZVgrTnp5NFhzdEloc0NGRTRQRnVTUm1CNGI2M1pxUkh2?=
 =?utf-8?B?MTNvNVBCZ2EzM0pac3lxaVd5WEU1dFRDd290ZmxYNVZpSWNnSnZ0cEVvZXd0?=
 =?utf-8?B?WW9mRUx6MnpsT3hmU2RISm01TzNlbHQ5bFFqK0d1QzNXRDByUURmR29Ybm5N?=
 =?utf-8?B?bkYvY0llSjRNRThsKzNvOVp2bWxBaEJMN3JNQTE1ZXpxTFhycWxKbUxIa0Y4?=
 =?utf-8?B?NTVIMEVUQmc5NEhjd3JQU0dLUUd6aXI0UTdNU0xjMXdHS0VPRlZUNG52eEhj?=
 =?utf-8?B?UG84WU15OUxaakMvcHZpU2VFMUZ6M3pRK0dtM3YzZXdCRVg1Y29uSUVTMlEz?=
 =?utf-8?B?L3FBVG50a1pQNDU5MmtPbTZLbUYvZVVlcCtDVWR5S3JRM0VLQ1FKN0VDTWxk?=
 =?utf-8?B?V25RRGx5T0tGUmtHWnFpdlFaZEdrcnVzK1MwMWRkNWdOMTYwNndReVlZUUhv?=
 =?utf-8?B?Q3ZsTVlYcE9HK2h5T0ZOY0dhU1ZXaGFTVzRvMmZHK05kYVRoeXRJclpEbThi?=
 =?utf-8?B?bllhMU1ad3NoTDFodkYvcVdVWEQ0T2R5MnprTVJXVHVZbWlhZGxzZmFrQnQr?=
 =?utf-8?B?a25ENXV2ZUU4L0JtMXp5QnBpUXk1ZUlFZHYxeEVNK3BMd0c3ZkFVbGF5UDkr?=
 =?utf-8?B?dS9NaWxPUjA3SU1haW1ic3U2WXlVRDhJQ0FrWTVpY0hSdVNrNW9LSTdGSHJQ?=
 =?utf-8?B?NHd1NU4vOHk0MGg5RTBONVZMR0drYWQ2bUROSmJkUng0QitzWGRaZ3pLaHlr?=
 =?utf-8?B?cW9VcXdHM2g1OWNGN3Y4clVvQ2g2T3ZQV3JHcTE4bXNSUDRNQTlpVTlacXRC?=
 =?utf-8?B?cjIyWFlROGxIWUdjdXJVMFQvUzJlR0VYK0RpS2ZkTTk1aEFjWEJkQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 34c8ba22-bf82-483a-6312-08de553da2b2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:27:14.6157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GcfbuAheQvO3q4GeOWDVHHiAgwr8U5spHU2e23FciS8++pBYE1xxGD5XKWSLPaP1DRv5QRlqfKxE4LKuKE1jNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9707
Message-ID-Hash: H3VCR6FDE53WSPVHD77ZZI76WDKWUSRX
X-Message-ID-Hash: H3VCR6FDE53WSPVHD77ZZI76WDKWUSRX
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H3VCR6FDE53WSPVHD77ZZI76WDKWUSRX/>
Archived-At: 
 <https://lore.freedesktop.org/62a28e20-0a83-48e3-8e25-0dc53a614467@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/16/26 12:21 PM, Danilo Krummrich wrote:
> On Fri Jan 16, 2026 at 9:15 PM CET, John Hubbard wrote:
>> I missed something here. Could you elaborate just a bit more on
>> your proposal please?
> 
> Both HALs Ampere and Turing implement the same code to reset the falcon engine:
> 
> 	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
> 
> 	// TIMEOUT: falcon engine should not take more than 10us to reset.
> 	fsleep(Delta::from_micros(10));
> 
> 	regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
> 
> Instead of repeating this code we can just add a new function
> regs::NV_PFALCON_FALCON_ENGINE::reset() that toggles the bit with a
> corresponding delay.
> 
> So far the delay is always the same, should a different delay be required for
> another architecture, we can also pass it to
> regs::NV_PFALCON_FALCON_ENGINE::reset() as argument, but that doesn't seem to be
> necessary.

That sounds like exactly the right factoring, yes. Thanks for spelling
it out in detail.


thanks,
-- 
John Hubbard

