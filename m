Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC60D06E39
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 03:53:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3813010E7E3;
	Fri,  9 Jan 2026 02:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lMGuf2r5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4576444C3C;
	Fri,  9 Jan 2026 02:45:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767926710;
 b=IcmTZyWr17ZrpEFkp6+Rr800/S34XS7e7IA/o0kLKkDtDz69/7m7S0d7M1DYZyvDNH2NS
 Sn//zp7qM9UJo8qOGuVNI6ZjepcPmb9dIlj+3pVWiFeGI5UYFbSh6gv+1WUVcDHa9J6+zrS
 0YjzCLhHpx49xPRp1WLmBknnapo0lDesSdQpKdV8YXhtzpF5ClRXWqoQpDi1YQb+KO7ddbD
 ORf9mkM2ZeWmcsxjrdAQhJTM9SstzAnCZy9otklXoOJa1n0sw56JbusCOB6lSm8UlbrE93G
 gHaQTfzBm01kJg15Rs140hgmltQgsOZQ7O3+Vdy6tBYag6xnmSH5PM5kU/Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767926710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JE2/+t5GtNhgAq7YMPchv+l703PUheqAb1hzBm6qVvQ=;
 b=lLP0gNmVD3P5kWi0l2n1AXnrGqFAzn1JEgGFmsq+9zdVqlP/uMg+qPTLIOSkpwfXdj3xZ
 DKkA/4fGkn1pbZgISVXUy+VVhAqpUMIyC5xxIzB9gO02moWb6tovjJJKIGBRskVeCPbfGQP
 est0QzDnEuSI4qJPmAvzOW7XmaGELmrdv8CYACBPfHxI3CDNxj+3X2kyTThKoQrM2bAMNnp
 oBDSkuE1QptChUrT9vOqhxN9M0T4qRjqq0sM+yhqHdy2kqTdyeoxeB9MDSd2k+sKUC703Oo
 nX8syG932vQLODXuJSKO37Fb/uIbTD7EkPQs53UqGYipwJWQfLqLaErkboHQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4132844C3C
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 02:45:08 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010063.outbound.protection.outlook.com [52.101.61.63])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C449610E37E
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 02:53:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=raKli9Znohx7L+pWBT4eiq3CGgCIGr+Hg9ykEWb5JBHH0mok40L1qwYChkKVX5YB9LfZVHApXjSbWXDPUmAozWLxIDXXoYuDNKrfQyOrFk7u/RkAnKQxcqehEzxAjElis7kgd43ZjYIQaCTrsze9Nrf9XMD8MlY3fpo6h5ZSsv6yCO4ihyMLLRSOldMzs+w4teeSPbvrpy8vig+BCKlizePoFIx87oovierDGRn7T18DUBLtOosWOwNNsy9hAzRSagHkxl6XpGC51gbLBddwQSJahkm8Qdny8wPK/pfsgIgF4Za7T7XJdfI64XZf9ra+plgfcS5uGEYxXqoAybtVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE2/+t5GtNhgAq7YMPchv+l703PUheqAb1hzBm6qVvQ=;
 b=MBk5WHFXtYd9xp5wvUUoAAeF3qUUXRnvzumeo68c0rg4sX7oiI00FgO+RHSt+Q/fmy6YLFB552tZVOrJ1+GoDF4LNxTqOSucfKqoUR1ywoVy+lbQHka58Slfag25pjrYGOT7c6uXKIwl9cxArS/pSKpzV3MeTrXm9Yn+dL2SckJqvdxPzPoZzjp91hyMmk0wSlpji4zGdxhBHridOlSSR6rOC0YUzXnvqJ4OIdDmok008iXyV0PzaUSyG+VUUNBVR1PZQja9uW6nZJswXaHyf/HJSFuWDPPTzkw/9AcXRuscIUy1m161VvVK7S2LN9JwU/tIj6INHIqsmy1Id6BfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE2/+t5GtNhgAq7YMPchv+l703PUheqAb1hzBm6qVvQ=;
 b=lMGuf2r5+Q5VOD9LB4LTifvdlrWevvcC+wzQQQlTXYcisyYbuJlnA0ED0M8Ea8RWhV34iuJ6+dCHj/lGUPDFPG6Np3N63QhBchS650Zcn9FIIrCdOgUaOwbbN4daQNRVZ0RDWxJEK0nH+jJrp2ii8/c8YzM+Mrh2uusWJRpxUqQYvbZFnRp8iT72b0R1NpOrKjgWlnJ5yrmo0ZfrNkTooI/q+hD1XLANlkhGihTCqDlfUpsxvrqvklXPIMtky8BnCChvUKOJVL9vg4fjsRILR2tMHxwTpiemiX0zHZScrpyzAchXIlahGSFKKFNUoyc4zoBT94FZ3grubi3RJkm8qA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CY8PR12MB8196.namprd12.prod.outlook.com (2603:10b6:930:78::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.3; Fri, 9 Jan 2026 02:53:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 02:53:19 +0000
Message-ID: <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
Date: Thu, 8 Jan 2026 18:53:17 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260103045934.64521-10-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CY8PR12MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f597f5-e85c-4930-d862-08de4f2a3ed2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dGdEZUFJdDFicHBEcTBpZ1JIbXJxcnh0YkZ4WjdnellvdmxQeGJXK2l2a1ZO?=
 =?utf-8?B?MWFsbjNOL3lQSFVlYytySmFzVnRuOU1yNEI1WVUrVThiUGlZR2RtUFY3YTk2?=
 =?utf-8?B?bEpHcjV6dlNuT1pMSHk3TU1vblFLNUs1NjVBYW5MMkFyMC8zNFdoRWFPNDg3?=
 =?utf-8?B?L0lBMW1tYjUvZXEvaTlHTGlvZzhlSWNCMndiTi9KL2pkVS9mWExyVmMyLy9w?=
 =?utf-8?B?Rjk4YUkrd0dhMXlvRWVuUURpUXVlalJsY1B3SGhXRXZTeDVsSXNNTXExai9s?=
 =?utf-8?B?Mnd6bUUxdHdXaURMa2VBTlRVMHVUd3BXNDhRR0VGbExuM1RIZ2o3WlBueGxj?=
 =?utf-8?B?Qk1LZ253L2FqWkpaVTFqa1VmRHVFSlkrRHdHQk40cFhSYzNpZnRwdGhhTDhG?=
 =?utf-8?B?SldTM2xOMW5aeXVWUmRxaWFFZVRjYngyd21Fa1hIbm5nd1c3YkcralM3RitW?=
 =?utf-8?B?OTlzT0V2WkNHeW9YVU5JM0gyZmFOZmtpem1rT3ArZ25KWWVZak56TksrWTVn?=
 =?utf-8?B?Nk9vdU9XekEzWXhTblMwb2FXVk8wa2QzNnY3bTlGMGIrWDk1N0RsanNzaXIz?=
 =?utf-8?B?NEtFU2ZvdktlL3V6WXhhWk1QcFpPTmRNTndVYUdneXZ2TGtCVis0ZTEwZ2dW?=
 =?utf-8?B?R053YjJjZWxTSE56bnhDV1RqdWlTaHFnOUZJODJ4SmtWNUk5YlJIZk9YcjE2?=
 =?utf-8?B?T3hPN1JsVjBKby9wcG9qa0pHcnRQdUJpdm9GMW1oQ3N6R2tEb2U1QTJBUE1V?=
 =?utf-8?B?V3NFd2p6VUxKbkZFNjU2WXp5ZXYwRW5pNTNzWDRQSndaN3Y3MEEyZUhKMDhl?=
 =?utf-8?B?amhLWUN0NzVUd3NKcnQ3RTl0aHovSi9EanYxejIzUlRpNS9nRDFOaFNDa3pO?=
 =?utf-8?B?TTkzdEFDYlJwTUU0WlNWWGxOY1ZDVHMxUFI4Z3dveGM5dXI1UmhqZkxEVTBN?=
 =?utf-8?B?RWNmVURoalE4dTJNMnpiV2R5Q1RrUkhNMHNNb29oUGNjdkIxaXhWWlVWUERt?=
 =?utf-8?B?OXpFaEdqWHVxeUFHcTgxUEJNQmFMMVkzcjJtS2NxeVRaZFlQWHlJRW96MzJi?=
 =?utf-8?B?TUZYVkY1RG9UQm0xSUhWb1RCdlNCT0VPL3IrQ01yOHZ3UTk2WU9MK2M2WEpn?=
 =?utf-8?B?YWVuZ0JXbGR1YzExMW4rVXkyM0ZPaktzeEZVVURnVG56T08vTFNhOVd6YWUw?=
 =?utf-8?B?cCtzQitLNHZSaTFqaDVGdSt3ZTVzaGxaby95S2N4UGhrcytQcjZBZnlXK05s?=
 =?utf-8?B?aFQxNDg5NUJPUjBNTnlyN09uc3FQQnRPK09qdjZXMGRScmdzem1mMVFBdHpN?=
 =?utf-8?B?elpQSEFud3NiWTBROHJQcFlFZlVoSmQ2RmR0Vy84cStaK1Y3WS9Cb2hKOEhW?=
 =?utf-8?B?blNWdzJrczFCeUF0VUdoMERhYzloZEx5blBWSlIyUHFLd0VOUmgxL2g1MnJ2?=
 =?utf-8?B?TDIvWmFNaHp6QXJDR1lOa2ZsaDBEZU8wZmp4clp0RGNBck1MZU1LSTc0di9h?=
 =?utf-8?B?bGx5REVWMDRYTC9Ea00rQS9LSHdwRnFIUXpiSjVCeEVhNzdiVWNPVVJKM3lv?=
 =?utf-8?B?ZEVDN1BmSHROcFdwcTZMN0thOVB6MmdFKzZWbjVRem5zZ0gzZ09WeitOY3Rw?=
 =?utf-8?B?WXNCTm1jQW1KbmZLYnE1Q3RiZmx5WXpYT0VCV2pydXpUTGh5cStMTytaUUM1?=
 =?utf-8?B?QVduS0FaTWc4UEdZSVA1dS93MEw2Vm9NRlIwZ1Ywc0NzalZyQXNGRlJLN25s?=
 =?utf-8?B?R2JnLzcvdmFLOGdpVXB4Tk1KNG9zUU54cTZCcGU1MWVMZC9ocXZTTUVQM3J5?=
 =?utf-8?B?cHNDaVdwaDQzME9RK05uUDc1dkg5SUZSditlYjVCSjRBd2M2Tys4VlNxRlBk?=
 =?utf-8?B?eHZvdzUrbWtXNEhWTWNwWDljMXEzQXlJeHpEcjZ0ZkdKVEtta1c3a0x0Yis2?=
 =?utf-8?Q?QbGNA+jvQGO3H1uhH+zZp9pmSbQ1U8gR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cXpLTS9weGlFU1JRK1lwa0hzVE1yWFd3S280RnF2S1VnVm40a2dyZ2hqaEdp?=
 =?utf-8?B?cGZwVkNteHpJZzl5QmhScU44ZXg0UmIxdFp4QTRwUEhQSE1LM3QvdUtGL2Mw?=
 =?utf-8?B?NnAzK2dhT3gvTHBLM3BYUk9SNXRWUFpUVjRabGtCUlB0OVVzVGg5ZHMvaDA1?=
 =?utf-8?B?RllhUURaVnJCTlAzM0wvUWFVWHREZUdWczBFREJWWm1BMTZCNnN5b3d4bDVI?=
 =?utf-8?B?RWRGbG4rUkhoaFdST3EzUXJTMVJ0OVpaaXBOU3MwVkZ1ODRtQllHOTZDZllH?=
 =?utf-8?B?bUM1aFZOVGJUazBNMjhEc2Y2UDNVelpLbGR1SElSVW90ZTRrcDRkWEpLWC9j?=
 =?utf-8?B?SVIzRmYxT3Z3RHVVcmpzOEg5aldsRUtzUUZyK1V6OVNKQlFtUDY5MTRXVmNQ?=
 =?utf-8?B?RHRNQUZpYXJqV29KaE9SeG13YkszQkJ5UUVkTXZRYVgxRUo5MVNMZ3R2YUVK?=
 =?utf-8?B?STJmWTlzOU9Ra0Eyai8yNnFXeXpackc5OFdGL2orR2RBekpQUTJHZWhXajFC?=
 =?utf-8?B?UG01eXJzZ1BOV1lnQVcrTUFsR083aUw2MlhqNE13SkNRT2lKR3VHNVlhTVFu?=
 =?utf-8?B?dHFtaS9tNHhCQmJOQ0tZWGszM2hGSGpPczkvNmNmQmwyWEludi9PUzVnbmov?=
 =?utf-8?B?SUNYelNldUFjMjRCMnFYZ3g0T2g0RTlXNHYrQURlZk54NzliS0dVTldPS0Q2?=
 =?utf-8?B?Um4xK2Rpd00wMHNVQWpDaGJUbTEzZ1lkOSsweWdrWjUyb2dScWphRFhqR0V5?=
 =?utf-8?B?S2kvamxSNVZIV2NaMUt2dytJZ284TzZJK3dMalU3SG12S0NJVWVUZU5XcFlY?=
 =?utf-8?B?RGdkRWJKUFV3TUUyeXM3SGY0NDRDMjhUZUZYN3NWU25rbWJlV3BndDZRdEhx?=
 =?utf-8?B?S3hpbEF5WkdJWEM2Rzh3cWsweUFjL2pUenFpekpCK3dQZWFVeERVNjFjWkdy?=
 =?utf-8?B?SUU3UnVMdC9wcG43MGRxcHVlUmkyY0Jsd3lwOFNjZFVSOHdlQWR4OUp4Vy85?=
 =?utf-8?B?dzV3UitST0IvaFQwQmM1QkNhUnpXRlUzRENTRWMvUzQrVE9aeis4L2E4RGhR?=
 =?utf-8?B?YzZDSHpFUFcrdlAwdDNjYTN0ZTdtQ3RyU05HVU9oMEdJRHN1ZzV3ZHJsZXBR?=
 =?utf-8?B?VnV0VDh2eHVHU3BVeDlVWFVSZ3IyaTU1TGllNUNia0lRdWtuNVFZQ2hNOHZa?=
 =?utf-8?B?VUR3NU0reW9LQ3VORGxmRDlkZXlab2pqd1JkQ1o5YU1iZFd1QXlveTVoazhS?=
 =?utf-8?B?YjlBV3FFcVB0ckRpMFhEaFJ1ZkVTSjlzUm02MkVJY1ZpaXpOcDMwSi9RT1Uv?=
 =?utf-8?B?WHg1MXJKRUNOWHl6QXVnZzIzREVKMVg3aDdIdFdsbmdaZjNGOGQ0RlR4NTU2?=
 =?utf-8?B?SlpIUXJmYUFIMm9DbFowSGdGbE9MbjZaU2VXME1zYitpaE9zRld4dFhBMjJJ?=
 =?utf-8?B?U0FBNElJaXVNeDdmVGVzcmNMVnZDZnpuMCtIcldac0wwYThGc2RCc2gzaW9C?=
 =?utf-8?B?eTZYYjV3OWpJL0pEUVMyL3ZidTJBZkgrSGVSK0pFai9BdnZQQTd2bDl1Wkdn?=
 =?utf-8?B?Y0JkVG1IYjJoL043R0hNcVRVbU9ZNlBqTnI5TkRDRXlnUFRxTTc4NU5sNVdw?=
 =?utf-8?B?b1QvTWRSM3doVUZQK0xUUTJWTG1zWCtYTkVRNy9iY3FQTXhpNkNRbzg3c0Q4?=
 =?utf-8?B?N1U5ZG12Zk1zTDA0L1lvR09DWmx1NGxZLzN0STdvak9ndWdCYnJnUDk4Rk81?=
 =?utf-8?B?ZDVvLzlTSFBybittSTVRekZzVGtoKzlRZFBBdzBzMVFXT3IwY1dtN0pJK1Rt?=
 =?utf-8?B?ZUZPTEV3RnR3TkxHYzQ1RWVBbU5TQVk5UVQxWVNQZnJpakxsL3prbEZyV0h5?=
 =?utf-8?B?VXVQVjFTcDJ6L2F5aDBOYzNPc1lwd0lZOUdQcWxhWlNwSWJaQWxZWWxhOHFF?=
 =?utf-8?B?SzFPM3ErYXRjbVcrOEtrQXU3cTVMcVkwaTU5ZlBQd2pMR2NzQmVRdFhpS2kw?=
 =?utf-8?B?enVQQ0lLSWErRnh5UmhSV3VsNkh2eXpoa3JSNytaV0dSNDQwUHpPZFFLaG5P?=
 =?utf-8?B?TW5KeldvYk01dll0dVJaaU9vMnl1UDRXYUNIQ0RDeUcwaGVhRmZCOGhtRUJP?=
 =?utf-8?B?NGI0dktyMXpkYVY4NkdzNWhRVW4ydDdQd1ZaK3dCNGR1cndIMWxNdWJLa3BO?=
 =?utf-8?B?RFFZSHFTajZDc0szY215dW4xTHZBWm93UTRjb3FaSjRpT2g5NENmR2JMaVNU?=
 =?utf-8?B?Z0s1eUU4YmxjZFFPVElLclZOYVpXOTJPRWNEeGk2ZkVEV1RvczlDYm9DNjA2?=
 =?utf-8?B?aEFvQTFoeEY4YXhLanRNRlhaZVI2eEF4QmhwdVEvSHZuVEtoa0twQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 50f597f5-e85c-4930-d862-08de4f2a3ed2
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 02:53:19.6482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 J3sGZk6hqT7Y1+YffsT0CzYCD1K2EHADqkI4YKLH+UUkVf/ZTQ5hTWoAJYUQ6glNB7uzTCe5M6Jx4lb0qCvGMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8196
Message-ID-Hash: HHR3NGUZY5SMXAS7U5OBADXQE5DHI77F
X-Message-ID-Hash: HHR3NGUZY5SMXAS7U5OBADXQE5DHI77F
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HHR3NGUZY5SMXAS7U5OBADXQE5DHI77F/>
Archived-At: 
 <https://lore.freedesktop.org/bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/2/26 8:59 PM, Timur Tabi wrote:
...
> +impl Deref for FalconUCodeDesc {
> +    type Target = dyn FalconUCodeDescriptor;
> +
> +    fn deref(&self) -> &Self::Target {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2,
> +            FalconUCodeDesc::V3(v3) => v3,
> +        }
> +    }
> +}

OK, I really don't want to do it this way, because this approach mixes
compile-time (explicit matching) and runtime (vtable) dispath, which is
odd and will surprise Rust readers.

I looked at Alex Courbot's feedback on the previous v4 patchset for this
patch, but he focused on things that I don't want to care about, which
is "what if we add more ucode versions". Because that won't happen--we
are done creating hardware/firmware for these older GPUs.

So what we want is a nice clear, directly readable implementation that
is *reasonably* Rust idiomatic. And I think that's available via:

1) Use direction enum methods, and

2) Use Option<> instead of zero sentinel values.

I've implemented these, and runtime tested the combined approach on my
TU117 board, and am including a diff below that can be applied on top of
your patchset.

It may have its own imperfections, but this is *approximately* what I'd
prefer (below). I believe that it strikes the right balance between
simplicity and Rust idiomatic code--and it's not any larger than what
you started with.

And it won't cost you any time to implement, since this already works:


diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 9f0ad02fbe22..c499491c25ab 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -4,7 +4,6 @@
 //! to be loaded into a given execution unit.

 use core::marker::PhantomData;
-use core::ops::Deref;

 use kernel::{
     device,
@@ -124,108 +123,92 @@ unsafe impl FromBytes for FalconUCodeDescV3 {}
 /// Enum wrapping the different versions of Falcon microcode descriptors.
 ///
 /// This allows handling both V2 and V3 descriptor formats through a
-/// unified type, providing version-agnostic access to firmware metadata
-/// via the [`FalconUCodeDescriptor`] trait.
+/// unified type, providing version-agnostic access to common firmware
+/// metadata. Fields not present in a particular version return zero.
 #[derive(Debug, Clone)]
 pub(crate) enum FalconUCodeDesc {
     V2(FalconUCodeDescV2),
     V3(FalconUCodeDescV3),
 }

-impl Deref for FalconUCodeDesc {
-    type Target = dyn FalconUCodeDescriptor;
-
-    fn deref(&self) -> &Self::Target {
+impl FalconUCodeDesc {
+    /// Returns the header word.
+    pub(crate) fn hdr(&self) -> u32 {
         match self {
-            FalconUCodeDesc::V2(v2) => v2,
-            FalconUCodeDesc::V3(v3) => v3,
+            Self::V2(v2) => v2.hdr,
+            Self::V3(v3) => v3.hdr,
         }
     }
-}
-
-/// Trait providing a common interface for accessing Falcon microcode descriptor fields.
-///
-/// This trait abstracts over the different descriptor versions ([`FalconUCodeDescV2`] and
-/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata without needing to
-/// know the specific descriptor version. Fields not present return zero.
-pub(crate) trait FalconUCodeDescriptor {
-    fn hdr(&self) -> u32;
-    fn imem_load_size(&self) -> u32;
-    fn interface_offset(&self) -> u32;
-    fn dmem_load_size(&self) -> u32;
-    fn pkc_data_offset(&self) -> u32;
-    fn engine_id_mask(&self) -> u16;
-    fn ucode_id(&self) -> u8;
-    fn signature_count(&self) -> u8;
-    fn signature_versions(&self) -> u16;
-
-    /// Returns the size in bytes of the header.
-    fn size(&self) -> usize {
-        let hdr = self.hdr();

-        const HDR_SIZE_SHIFT: u32 = 16;
-        const HDR_SIZE_MASK: u32 = 0xffff0000;
-        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    /// Returns the IMEM load size in bytes.
+    pub(crate) fn imem_load_size(&self) -> u32 {
+        match self {
+            Self::V2(v2) => v2.imem_load_size,
+            Self::V3(v3) => v3.imem_load_size,
+        }
     }
-}

-impl FalconUCodeDescriptor for FalconUCodeDescV2 {
-    fn hdr(&self) -> u32 {
-        self.hdr
-    }
-    fn imem_load_size(&self) -> u32 {
-        self.imem_load_size
-    }
-    fn interface_offset(&self) -> u32 {
-        self.interface_offset
-    }
-    fn dmem_load_size(&self) -> u32 {
-        self.dmem_load_size
-    }
-    fn pkc_data_offset(&self) -> u32 {
-        0
-    }
-    fn engine_id_mask(&self) -> u16 {
-        0
-    }
-    fn ucode_id(&self) -> u8 {
-        0
-    }
-    fn signature_count(&self) -> u8 {
-        0
-    }
-    fn signature_versions(&self) -> u16 {
-        0
+    /// Returns the interface offset.
+    pub(crate) fn interface_offset(&self) -> u32 {
+        match self {
+            Self::V2(v2) => v2.interface_offset,
+            Self::V3(v3) => v3.interface_offset,
+        }
     }
-}

-impl FalconUCodeDescriptor for FalconUCodeDescV3 {
-    fn hdr(&self) -> u32 {
-        self.hdr
-    }
-    fn imem_load_size(&self) -> u32 {
-        self.imem_load_size
-    }
-    fn interface_offset(&self) -> u32 {
-        self.interface_offset
+    /// Returns the DMEM load size in bytes.
+    pub(crate) fn dmem_load_size(&self) -> u32 {
+        match self {
+            Self::V2(v2) => v2.dmem_load_size,
+            Self::V3(v3) => v3.dmem_load_size,
+        }
     }
-    fn dmem_load_size(&self) -> u32 {
-        self.dmem_load_size
+
+    /// Returns the PKC data offset (V3 only).
+    pub(crate) fn pkc_data_offset(&self) -> Option<u32> {
+        match self {
+            Self::V2(_) => None,
+            Self::V3(v3) => Some(v3.pkc_data_offset),
+        }
     }
-    fn pkc_data_offset(&self) -> u32 {
-        self.pkc_data_offset
+
+    /// Returns the engine ID mask (V3 only).
+    pub(crate) fn engine_id_mask(&self) -> Option<u16> {
+        match self {
+            Self::V2(_) => None,
+            Self::V3(v3) => Some(v3.engine_id_mask),
+        }
     }
-    fn engine_id_mask(&self) -> u16 {
-        self.engine_id_mask
+
+    /// Returns the ucode ID (V3 only).
+    pub(crate) fn ucode_id(&self) -> Option<u8> {
+        match self {
+            Self::V2(_) => None,
+            Self::V3(v3) => Some(v3.ucode_id),
+        }
     }
-    fn ucode_id(&self) -> u8 {
-        self.ucode_id
+
+    /// Returns the signature count (V3 only).
+    pub(crate) fn signature_count(&self) -> Option<u8> {
+        match self {
+            Self::V2(_) => None,
+            Self::V3(v3) => Some(v3.signature_count),
+        }
     }
-    fn signature_count(&self) -> u8 {
-        self.signature_count
+
+    /// Returns the signature versions bitmask (V3 only).
+    pub(crate) fn signature_versions(&self) -> Option<u16> {
+        match self {
+            Self::V2(_) => None,
+            Self::V3(v3) => Some(v3.signature_versions),
+        }
     }
-    fn signature_versions(&self) -> u16 {
-        self.signature_versions
+
+    /// Returns the size in bytes of the descriptor header.
+    pub(crate) fn size(&self) -> usize {
+        const HDR_SIZE_SHIFT: u32 = 16;
+        const HDR_SIZE_MASK: u32 = 0xffff0000;
+        ((self.hdr() & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
     }
 }

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index f1f8f921aa43..28a52e251c3e 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -334,10 +334,12 @@ fn dmem_load_params(&self) -> FalconLoadTarget {
     }

     fn brom_params(&self) -> FalconBromParams {
+        // V2 descriptors don't have BROM parameters; use zero defaults.
+        // The Turing HAL's program_brom() is a no-op, so these values are unused.
         FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset(),
-            engine_id_mask: self.desc.engine_id_mask(),
-            ucode_id: self.desc.ucode_id(),
+            pkc_data_offset: self.desc.pkc_data_offset().unwrap_or(0),
+            engine_id_mask: self.desc.engine_id_mask().unwrap_or(0),
+            ucode_id: self.desc.ucode_id().unwrap_or(0),
         }
     }

@@ -463,52 +465,64 @@ pub(crate) fn new(
     ) -> Result<Self> {
         let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;

-        // Patch signature if needed.
+        // Patch signature if needed. V3 descriptors have signature metadata;
+        // V2 descriptors (Turing, GA100) don't require signature patching here.
         let desc = bios.fwsec_image().header()?;
-        let ucode_signed = if desc.signature_count() != 0 {
-            let sig_base_img =
-                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
-            let desc_sig_versions = u32::from(desc.signature_versions());
-            let reg_fuse_version =
-                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
-            dev_dbg!(
-                dev,
-                "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
-                desc_sig_versions,
-                reg_fuse_version
-            );
-            let signature_idx = {
-                let reg_fuse_version_bit = 1 << reg_fuse_version;
-
-                // Check if the fuse version is supported by the firmware.
-                if desc_sig_versions & reg_fuse_version_bit == 0 {
-                    dev_err!(
-                        dev,
-                        "no matching signature: {:#x} {:#x}\n",
-                        reg_fuse_version_bit,
-                        desc_sig_versions,
-                    );
-                    return Err(EINVAL);
-                }
-
-                // `desc_sig_versions` has one bit set per included signature. Thus, the index of
-                // the signature to patch is the number of bits in `desc_sig_versions` set to `1`
-                // before `reg_fuse_version_bit`.
-
-                // Mask of the bits of `desc_sig_versions` to preserve.
-                let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
-
-                usize::from_safe_cast((desc_sig_versions & reg_fuse_version_mask).count_ones())
-            };
+        let ucode_signed = if let Some(sig_count) = desc.signature_count() {
+            if sig_count == 0 {
+                ucode_dma.no_patch_signature()
+            } else {
+                // These fields are guaranteed to be Some for V3 descriptors.
+                let pkc_data_offset = desc.pkc_data_offset().ok_or(EINVAL)?;
+                let engine_id_mask = desc.engine_id_mask().ok_or(EINVAL)?;
+                let ucode_id = desc.ucode_id().ok_or(EINVAL)?;
+                let sig_versions = desc.signature_versions().ok_or(EINVAL)?;
+
+                let sig_base_img =
+                    usize::from_safe_cast(desc.imem_load_size() + pkc_data_offset);
+                let desc_sig_versions = u32::from(sig_versions);
+                let reg_fuse_version =
+                    falcon.signature_reg_fuse_version(bar, engine_id_mask, ucode_id)?;
+                dev_dbg!(
+                    dev,
+                    "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
+                    desc_sig_versions,
+                    reg_fuse_version
+                );
+                let signature_idx = {
+                    let reg_fuse_version_bit = 1 << reg_fuse_version;
+
+                    // Check if the fuse version is supported by the firmware.
+                    if desc_sig_versions & reg_fuse_version_bit == 0 {
+                        dev_err!(
+                            dev,
+                            "no matching signature: {:#x} {:#x}\n",
+                            reg_fuse_version_bit,
+                            desc_sig_versions,
+                        );
+                        return Err(EINVAL);
+                    }
+
+                    // `desc_sig_versions` has one bit set per included signature. Thus, the index
+                    // of the signature to patch is the number of bits in `desc_sig_versions` set
+                    // to `1` before `reg_fuse_version_bit`.
+
+                    // Mask of the bits of `desc_sig_versions` to preserve.
+                    let reg_fuse_version_mask = reg_fuse_version_bit.wrapping_sub(1);
+
+                    usize::from_safe_cast((desc_sig_versions & reg_fuse_version_mask).count_ones())
+                };

-            dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
-            let signature = bios
-                .fwsec_image()
-                .sigs(&desc)
-                .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
+                dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
+                let signature = bios
+                    .fwsec_image()
+                    .sigs(&desc)
+                    .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;

-            ucode_dma.patch_signature(signature, sig_base_img)?
+                ucode_dma.patch_signature(signature, sig_base_img)?
+            }
         } else {
+            // V2 descriptor - no signature patching needed
             ucode_dma.no_patch_signature()
         };

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 12256e5c8dc5..349b994fef92 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -1074,7 +1074,9 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
             })
     }

-    /// Get the signatures as a byte slice
+    /// Get the signatures as a byte slice.
+    ///
+    /// For V2 descriptors (which have no signature metadata), this returns an empty slice.
     pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
         let hdr_size = match desc {
             FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
@@ -1082,7 +1084,8 @@ pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignatu
         };
         // The signatures data follows the descriptor.
         let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
-        let sigs_count = usize::from(desc.signature_count());
+        // V2 descriptors don't have signatures; unwrap_or(0) yields an empty slice.
+        let sigs_count = usize::from(desc.signature_count().unwrap_or(0));
         let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();

         // Make sure the data is within bounds.

thanks,
-- 
John Hubbard

> +
> +/// Trait providing a common interface for accessing Falcon microcode descriptor fields.
> +///
> +/// This trait abstracts over the different descriptor versions ([`FalconUCodeDescV2`] and
> +/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata without needing to
> +/// know the specific descriptor version. Fields not present return zero.
> +pub(crate) trait FalconUCodeDescriptor {
> +    fn hdr(&self) -> u32;
> +    fn imem_load_size(&self) -> u32;
> +    fn interface_offset(&self) -> u32;
> +    fn dmem_load_size(&self) -> u32;
> +    fn pkc_data_offset(&self) -> u32;
> +    fn engine_id_mask(&self) -> u16;
> +    fn ucode_id(&self) -> u8;
> +    fn signature_count(&self) -> u8;
> +    fn signature_versions(&self) -> u16;
> +
>      /// Returns the size in bytes of the header.
> -    pub(crate) fn size(&self) -> usize {
> +    fn size(&self) -> usize {
> +        let hdr = self.hdr();
> +
>          const HDR_SIZE_SHIFT: u32 = 16;
>          const HDR_SIZE_MASK: u32 = 0xffff0000;
> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    }
> +}
> +
> +impl FalconUCodeDescriptor for FalconUCodeDescV2 {
> +    fn hdr(&self) -> u32 {
> +        self.hdr
> +    }
> +    fn imem_load_size(&self) -> u32 {
> +        self.imem_load_size
> +    }
> +    fn interface_offset(&self) -> u32 {
> +        self.interface_offset
> +    }
> +    fn dmem_load_size(&self) -> u32 {
> +        self.dmem_load_size
> +    }
> +    fn pkc_data_offset(&self) -> u32 {
> +        0
> +    }
> +    fn engine_id_mask(&self) -> u16 {
> +        0
> +    }
> +    fn ucode_id(&self) -> u8 {
> +        0
> +    }
> +    fn signature_count(&self) -> u8 {
> +        0
> +    }
> +    fn signature_versions(&self) -> u16 {
> +        0
> +    }
> +}
>  
> -        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +impl FalconUCodeDescriptor for FalconUCodeDescV3 {
> +    fn hdr(&self) -> u32 {
> +        self.hdr
> +    }
> +    fn imem_load_size(&self) -> u32 {
> +        self.imem_load_size
> +    }
> +    fn interface_offset(&self) -> u32 {
> +        self.interface_offset
> +    }
> +    fn dmem_load_size(&self) -> u32 {
> +        self.dmem_load_size
> +    }
> +    fn pkc_data_offset(&self) -> u32 {
> +        self.pkc_data_offset
> +    }
> +    fn engine_id_mask(&self) -> u16 {
> +        self.engine_id_mask
> +    }
> +    fn ucode_id(&self) -> u8 {
> +        self.ucode_id
> +    }
> +    fn signature_count(&self) -> u8 {
> +        self.signature_count
> +    }
> +    fn signature_versions(&self) -> u16 {
> +        self.signature_versions
>      }
>  }
>  
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index e4009faba6c5..1c1dcdacf5f5 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -40,7 +40,7 @@
>          FalconLoadTarget, //
>      },
>      firmware::{
> -        FalconUCodeDescV3,
> +        FalconUCodeDesc,
>          FirmwareDmaObject,
>          FirmwareSignature,
>          Signed,
> @@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
>  /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
>  pub(crate) struct FwsecFirmware {
>      /// Descriptor of the firmware.
> -    desc: FalconUCodeDescV3,
> +    desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
>  }
>  
>  impl FalconLoadParams for FwsecFirmware {
>      fn imem_sec_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: 0,
> -            dst_start: self.desc.imem_phys_base,
> -            len: self.desc.imem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_sec_base,
> +                len: v2.imem_sec_size,
> +            },
> +            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v3.imem_phys_base,
> +                len: v3.imem_load_size,
> +            },
>          }
>      }
>  
>      fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> -        // Only used on Turing and GA100, so return None for now
> -        None
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_phys_base,
> +                len: v2.imem_load_size - v2.imem_sec_size,
> +            }),
> +            // Not used on V3 platforms
> +            FalconUCodeDesc::V3(_v3) => None,
> +        }
>      }
>  
>      fn dmem_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: self.desc.imem_load_size,
> -            dst_start: self.desc.dmem_phys_base,
> -            len: self.desc.dmem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
> +                src_start: v2.dmem_offset,
> +                dst_start: v2.dmem_phys_base,
> +                len: v2.dmem_load_size,
> +            },
> +            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
> +                src_start: v3.imem_load_size,
> +                dst_start: v3.dmem_phys_base,
> +                len: v3.dmem_load_size,
> +            },
>          }
>      }
>  
>      fn brom_params(&self) -> FalconBromParams {
>          FalconBromParams {
> -            pkc_data_offset: self.desc.pkc_data_offset,
> -            engine_id_mask: self.desc.engine_id_mask,
> -            ucode_id: self.desc.ucode_id,
> +            pkc_data_offset: self.desc.pkc_data_offset(),
> +            engine_id_mask: self.desc.engine_id_mask(),
> +            ucode_id: self.desc.ucode_id(),
>          }
>      }
>  
> @@ -273,10 +294,10 @@ impl FalconFirmware for FwsecFirmware {
>  impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
>      fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
>          let desc = bios.fwsec_image().header()?;
> -        let ucode = bios.fwsec_image().ucode(desc)?;
> +        let ucode = bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object = DmaObject::from_data(dev, ucode)?;
>  
> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
> +        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>          // SAFETY: we have exclusive access to `dma_object`.
>          let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
>  
> @@ -303,7 +324,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>              let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
>                  transmute_mut(
>                      &mut dma_object,
> -                    (desc.imem_load_size + dmem_base).into_safe_cast(),
> +                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
>                  )
>              }?;
>  
> @@ -317,7 +338,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>              let frts_cmd: &mut FrtsCmd = unsafe {
>                  transmute_mut(
>                      &mut dma_object,
> -                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
> +                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
>                  )
>              }?;
>  
> @@ -364,11 +385,12 @@ pub(crate) fn new(
>  
>          // Patch signature if needed.
>          let desc = bios.fwsec_image().header()?;
> -        let ucode_signed = if desc.signature_count != 0 {
> -            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
> -            let desc_sig_versions = u32::from(desc.signature_versions);
> +        let ucode_signed = if desc.signature_count() != 0 {
> +            let sig_base_img =
> +                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
> +            let desc_sig_versions = u32::from(desc.signature_versions());
>              let reg_fuse_version =
> -                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
> +                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
>              dev_dbg!(
>                  dev,
>                  "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
> @@ -402,7 +424,7 @@ pub(crate) fn new(
>              dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
>              let signature = bios
>                  .fwsec_image()
> -                .sigs(desc)
> +                .sigs(&desc)
>                  .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
>  
>              ucode_dma.patch_signature(signature, sig_base_img)?
> @@ -411,7 +433,7 @@ pub(crate) fn new(
>          };
>  
>          Ok(FwsecFirmware {
> -            desc: desc.clone(),
> +            desc: desc,
>              ucode: ucode_signed,
>          })
>      }
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 7c26e4a2d61c..12256e5c8dc5 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -19,6 +19,8 @@
>      driver::Bar0,
>      firmware::{
>          fwsec::Bcrt30Rsa3kSignature,
> +        FalconUCodeDesc,
> +        FalconUCodeDescV2,
>          FalconUCodeDescV3, //
>      },
>      num::FromSafeCast,
> @@ -1004,19 +1006,10 @@ fn build(self) -> Result<FwSecBiosImage> {
>  
>  impl FwSecBiosImage {
>      /// Get the FwSec header ([`FalconUCodeDescV3`]).
> -    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
> +    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
>          // Get the falcon ucode offset that was found in setup_falcon_data.
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
> -        // Make sure the offset is within the data bounds.
> -        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
> -            dev_err!(
> -                self.base.dev,
> -                "fwsec-frts header not contained within BIOS bounds\n"
> -            );
> -            return Err(ERANGE);
> -        }
> -
>          // Read the first 4 bytes to get the version.
>          let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
>              .try_into()
> @@ -1024,33 +1017,49 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
>          let hdr = u32::from_le_bytes(hdr_bytes);
>          let ver = (hdr & 0xff00) >> 8;
>  
> -        if ver != 3 {
> -            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
> -            return Err(EINVAL);
> +        let hdr_size = match ver {
> +            2 => core::mem::size_of::<FalconUCodeDescV2>(),
> +            3 => core::mem::size_of::<FalconUCodeDescV3>(),
> +            _ => {
> +                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
> +                return Err(EINVAL);
> +            }
> +        };
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + hdr_size > self.base.data.len() {
> +            dev_err!(
> +                self.base.dev,
> +                "fwsec-frts header not contained within BIOS bounds\n"
> +            );
> +            return Err(ERANGE);
>          }
>  
> -        // Return a reference to the FalconUCodeDescV3 structure.
> -        //
> -        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
> -        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
> -        // in `BiosImageBase` is immutable after construction.
> -        Ok(unsafe {
> -            &*(self
> -                .base
> -                .data
> -                .as_ptr()
> -                .add(falcon_ucode_offset)
> -                .cast::<FalconUCodeDescV3>())
> -        })
> +        let data = self
> +            .base
> +            .data
> +            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
> +            .ok_or(EINVAL)?;
> +
> +        match ver {
> +            2 => {
> +                let v2 = FalconUCodeDescV2::from_bytes(data).ok_or(EINVAL)?;
> +                Ok(FalconUCodeDesc::V2(v2.clone()))
> +            }
> +            3 => {
> +                let v3 = FalconUCodeDescV3::from_bytes(data).ok_or(EINVAL)?;
> +                Ok(FalconUCodeDesc::V3(v3.clone()))
> +            }
> +            _ => Err(EINVAL),
> +        }
>      }
>  
>      /// Get the ucode data as a byte slice
> -    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
>          // The ucode data follows the descriptor.
>          let ucode_data_offset = falcon_ucode_offset + desc.size();
> -        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
> +        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
>  
>          // Get the data slice, checking bounds in a single operation.
>          self.base
> @@ -1066,10 +1075,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
>      }
>  
>      /// Get the signatures as a byte slice
> -    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
> +    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
> +        let hdr_size = match desc {
> +            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
> +            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
> +        };
>          // The signatures data follows the descriptor.
> -        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
> -        let sigs_count = usize::from(desc.signature_count);
> +        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
> +        let sigs_count = usize::from(desc.signature_count());
>          let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
>  
>          // Make sure the data is within bounds.


