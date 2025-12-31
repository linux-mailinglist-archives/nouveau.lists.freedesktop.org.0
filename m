Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4680CECA7E
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 23:55:05 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D91710E6FB;
	Wed, 31 Dec 2025 22:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eJjxvUdZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3996544C84;
	Wed, 31 Dec 2025 22:47:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767221222;
 b=Vis6b9WzNMklhwT1+V6N694dWTZYlxkYtwsjKTD3O9yeSfvtRrEjS+0iwWTqIN5asMYfq
 oN84uBu/NySrYCr5RGWyXzsex/sJpXMWWmhEf4VlqJcDykfwa2VVsaPfZU1NPslkOpTRFAd
 j0KZsPtC4ciDd6ASZwNd7rf9ZD4Vn/TbRFSzGUS3ZziRRIXjtpGSsZaRHjGETu2tlqOq75V
 mQE0JAYO8VZ1Pz0WYBt5NiC0wMCpeD5GRwoTU14iojRcDnv6hjs7KEeiwLAhhYokOtE6uem
 B6KgwBeSfn6iTn09lwrLLMXzg4IFB/jT1JgEqLshsDE72MdmauX8ztKhMzMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767221222; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XpJSLJtfo+S9oquLrs31D4Q+9A1+H0nPqTamtqO6x58=;
 b=wgv30blGPHtJL4Kw39jLQMLbjNDT2293I9TmzQOMYxncXwWZn9Pd5cCPwfR0nOOoHJEKJ
 21G8n2hvy+M4TZnOSzXWxsAhFDrwNzvja3xxISYFUZz4n5svK+dnYpxG31Ah/ch1roFOluf
 nMgU++7GNbrhLqlBlKX8jn+QKeuq1sMtmxI7ecEjlCdCR3wnD0wYMevc4ye0KQNQurJbU0o
 u+yJQ9oWJZZsbBRZh6/Mc2XV7SOWzgfxpWqmg+65NOeDZ6q05UkV7oSW8HwvbsnseYLRhb6
 HYXCwIoI2ijpw0zJROovDdUfveVqISui62rs/jDQLXWXa5Du8DmpiJi+0dpg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4C5B244C66
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:47:00 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 942DA10E159
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 22:55:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O4yLih3UaAtlD/1l4B7zXUTvfQ8l9amo67BpK5laK5Fqxf6SjIqgOsfqhmPHB4JFeHAZSUialnRR9NoqFEjyiydE+WeB23fh7kZM8I1mcjvqJ3NVf98jf4yntNDJWWuij1P7n6hx1HYj3V75ICTPQHaFWkAfkOD/W49O81QkIktCLbn/5YsrC5/78/IFE43H4Cu6r1Ci2RhtWlxI2GXmSvg7pSAJBw24Y0jcxOgYPpd+ljbin8rRjhv6mO4aoAgNQyz/Vx4yz58l1LEwIS+Wr7BfcRe5L8A2Wz+cwb4DmWQS/P3novSwoyCz/jPM0jnailmhsPv9YOZlxnuq+9oA9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XpJSLJtfo+S9oquLrs31D4Q+9A1+H0nPqTamtqO6x58=;
 b=BQUWUQrlqDMk55I1OB/vr53/17YC0wayjZZniNygNTNNcQOWB/smYcJGrjtrQryRCdU0t2VvSA+ySGzrta6qo+7KXDmO6W7ly0s3uEzPE1N40dQo5GKbF7S7uy9Sw2XBxZC4lIyZDvYI2+co3S8XONbQocj4uzv6/Y+FvRBabOA8iY/9zEP+Me8tvebLDmCZ1cFnId6ZmhiEdxvGJmkqlzIfF0rM8d9LNKunPhYVZs5/NhDhh/iL2U7pNGM67aVZz9Qotmp3rh8eMiYREYi7IwJPcL8SvI2L2QQD8bONZ/MfYE0ZTeS1CFfAVWjroHMrlw2FI4qiZED/M3IP0m/Qfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XpJSLJtfo+S9oquLrs31D4Q+9A1+H0nPqTamtqO6x58=;
 b=eJjxvUdZ8z9BJ4Xh4c6z692iHlrxqQTMLlybAjuBgynFc0giOZVb1pwZTLPIS6OYWu7OR16R3rzDHzzJFRLJRe11UXbYl1lU2wyEOzIOusx4O7l+opfBShIC8qnZZbnw2oUGH5D1XAxTi+Wo2zXhpSZaKDJNEJn8PLcwALohOqfHahgNVOTkcbUQJkqdoj+BznqH7wl32CcX6XqMzI3Biu5tHThyEyPZ1q7e6Ux/yd19cIcuilXGbZTq5QyHuBBzB9kXmwGwTmy4v+lSguQyc3cGJFV0O2nPrnJT+6ETlHeZPO9rVaTLLx2nro8WbVj1j7HiAmWmYNPzHQx6mHSAnw==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Wed, 31 Dec
 2025 22:54:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 22:54:57 +0000
Message-ID: <31402838-162e-4e41-84df-49e6109a2e41@nvidia.com>
Date: Wed, 31 Dec 2025 14:54:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/11] gpu: nova-core: Add basic Turing HAL
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-8-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-8-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0062.namprd07.prod.outlook.com
 (2603:10b6:a03:60::39) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BL1PR12MB5753:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fe21dcd-41ef-4fac-ac7a-08de48bf9e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODdnanBaQ1lpZFhPZDVMelUyTWJwam45OTQ2Z2Z2UFdSc043N3BpNHhjVWsx?=
 =?utf-8?B?Q1ZxWVZNVml4aWxiQzRvSU1xWmFhS3FkWDZOcXRLK3pvT1BDTmdPK3U4aFJk?=
 =?utf-8?B?N2l4SjBEVWNyTU5PUGtlOGMyWjJCMlFrNDFhK0RkVWd2bDF4TzhYTnNKOGlS?=
 =?utf-8?B?SHlMMHcyVHV4dnNxaHUwSVhCbW9FZS9EZlZtRW9JeFdxK2xMc2h6REo4eDZ1?=
 =?utf-8?B?VjNWVFFvRFo3YU9RemtKbGhvVU9MSkJnbmJEUmNtWVVEeFpSVU9VSmNWcklM?=
 =?utf-8?B?U1ppZ2hINDR2RXczMjNDQk4wcmJJTXlTVlZVdUNMamNnRlAvdm8xL2JTOWNS?=
 =?utf-8?B?QnZMWnpac3RaSU93Ym15ZDNYZk5Vc0FMRkphcHowcW54ZXdKOE9VR3MvVXcv?=
 =?utf-8?B?KzE5M3ZuVWZTTi9jNm1sSy94aG5BNHlML1pWckx6SFp0QXlCQTIyc3l2eUF4?=
 =?utf-8?B?ekFqOUhsbEZ5N1E3MHNLMkVKcDFiWUtKb3ZkSklSM3lzdmI5djQrczJpWUhN?=
 =?utf-8?B?cStwQ3pqNnZ5SGRjaTBjOUljK0sxU2pSYU5DWXVJeitZcHlGZVFmdjFPYzJW?=
 =?utf-8?B?RitCeDk4b1I1aUFLNytReU9IZkFQQ1dtdmNFd3g3bzFrRE9QWE82WnF3V0NR?=
 =?utf-8?B?RlhYZGlkMlRVaWlVVGtkYWxob1AzUjAvcklaK0huS3lLNWRFOWhOeUZrbkhy?=
 =?utf-8?B?RzBVVXNWbFJoWnFvekpPd1pjaVdkUm9OVlp4ZUY2R0JZU0pNRVYxeEJldG1z?=
 =?utf-8?B?eEdmQkRQOG1PbU96Y3ExSjJEbVN1dU1vRXcxcDJySk5MRVMyMC9hUzJUcEda?=
 =?utf-8?B?TW0xbjA3VjRCbDZ6d3lDclNtMEN3MGdtVWlOemJUcW16RFd5WmVvOVczalBV?=
 =?utf-8?B?dWRjTVNpVEpXZW9SOEpkL3EyV0JFS0ozU3l0aE1aVUl1MmVSQ2Myc1lmOStP?=
 =?utf-8?B?eEpzS2Nha1ZMb25BTDY2bG5wNUFMeTBwWjhvZVlCalNGZWUzbXN4NWxLTW53?=
 =?utf-8?B?SStoNVUxcHFld0w2N0IwTFBJVFFXYldZWUFaanNDN2hOT0FuVDZrUnUzRExv?=
 =?utf-8?B?ckpsVWFmNDQ3Nm5NNkw0YUwwY283cEdXT0JGUjJ4cWRmNEJKVEtQellKVDdl?=
 =?utf-8?B?Nzk5TGdQVU9WOEdhcWJxQXI0aXZYbWErUHJhdU1pdzVyS0FGSm53OG9HekVL?=
 =?utf-8?B?Y1ExdmUrMDhnZ1JhT2RIdDdKeWR0d1VWK1JIS1duQ2JMeDM2WkhTSUJ1L0h4?=
 =?utf-8?B?WTluVXBuZElxNWFsMzJIU1IxbFg0ZEpJV0w4NXVPVUlZUlhBMFlKa25yNmtx?=
 =?utf-8?B?SjE3TTEvMWdITGgvVVJ6WlArNFh3RDZ2WTk5SUZaTGdXT04xTjdtOUh3bTAr?=
 =?utf-8?B?WldSQ2I0WTRXRVNETVdQQTZxSW9lUFVaWGxDeU96eDZ1RjU4L3EyejR5cUhQ?=
 =?utf-8?B?T3RtbDlyVFU5TXVMbCtYM2dndUc5bmN4V0JibEppNUxFeDFKYjQzTlZtWHVh?=
 =?utf-8?B?c3NoR2ZTbmdTVnd4ZlEraURRM09UcjhlZDNpbk9mZ1pvOXNxQ2dycVJhVFN2?=
 =?utf-8?B?dVB4a0VlRHZudE5iMEdodTRpL1RrdW5JODZ5V2lidGpXR3BlbmFISlBVSzJT?=
 =?utf-8?B?QVQ0VU8wRGN2Q1Y1Mit0cHJ0eVhCS1FvWmtuQ3A3NFBLZlVNN3MzSHJTKytn?=
 =?utf-8?B?VVpWb2JCWVVIcXlWYWJhSFhqczlhd0dXbllnZjlubjZHaS9ORC93VzZEMVQ5?=
 =?utf-8?B?d2xHVTNYbXdnWDFETGR4UW9JZU9xMytveEt3Y0M1RFVuYSsxTk1rN0VwOHpZ?=
 =?utf-8?B?c1JsRVZBUWVod1JDeWJBaG1NeTg0ZzA5czlhWDRVbWNSbm93WFRzVkNZTE9O?=
 =?utf-8?B?TXZxZnRIeUhJMkd4aUIxNmFvUy9PdkZDMi9pRTBxZVZJZ2JkWnZJb29VWEJF?=
 =?utf-8?Q?t5AwG3zlpoHqufOS7fWhnseMMdvBgl8p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEZOeWJwbnlUdTM5ZzlESHZRY2hBUUl2UlluSjF1dHluVzg5Z045bFVRU3Jo?=
 =?utf-8?B?RWROL3V1Z1ovaTNyWDZEUUxtTVNrVWhlQjBESWl5MUtSWW9VcXdJTzFrYUZ3?=
 =?utf-8?B?QlhJczhsN0h2enI3Mk93ZG5ySVljNFh2OUE0WlNjWDRQUmg5b2RBMDhMOUxC?=
 =?utf-8?B?K3NzM3lvSDVEV3B1YTFXZ3hvRHBRSUUxR1pjbTVFcXBWVUVYVW8rbzl2SHow?=
 =?utf-8?B?YjB5MzRvMVpvamVrM254SkxaOStqdEkxdFk3eWJqRkFsRVNBT1l2c1FXT2lO?=
 =?utf-8?B?Zmk5WE1NbW5nMGc0TEV3cCt2MXkzMEVTTHZXQ280UWtSWktWNmZpMHgrYWcz?=
 =?utf-8?B?Vmh3VnMraTIrN01vU0lWZGJzZVZBMnJ6L2s5NkgzdUdibWVZa0pYUStyOHI4?=
 =?utf-8?B?anp5SDFxM2ZFTllncmd6YUhLM1ZxK29GN3pqSE5EYkVpZ3pKd2Zpb0g2djdx?=
 =?utf-8?B?UngwVWs4VUdrZWh1QXBKT1lZUHRqdXJIUVJqV3Jyc205aG5xaUsrZVpYZXpv?=
 =?utf-8?B?aHc4RXNaV0RiU2o1ekxWZ1JFeHZ2YmxWQnFURkJpUi83MkpKOHplRDlTeFJo?=
 =?utf-8?B?dUp1QmF5czdUWmNHQU5WdVFjMnl6SHA3Um1RdjVGeFd5YTJyRGF0UXV6RGdD?=
 =?utf-8?B?ZmwwZEFIN0hVTlpLVEpSSHhvaksyUHRDM0hyQnpzQ2p0QVJnZjF6aDI2SE5T?=
 =?utf-8?B?ZjQ5RmhkL1BObmhnRFB1VWVhb0VuS21rUjgyOXFnblRRVHRlMkhpU09HelFq?=
 =?utf-8?B?TktPemdBcHRxanRpSXBzSGZXRDdtV2VEZUdpTnZ4TVdTYTdtOFQ2ZG01UzNy?=
 =?utf-8?B?WTlzK21VblR1Q2g4TWRsaWxLWEdlU1Z2ZVRqdGQ0TDczWGtRQ0krNmt1M3Zr?=
 =?utf-8?B?QkxVK3hDMUlmQzUvQTh0U2xRRnc0MDJyTE1ONWlSRGtMaTE1QzBpT25LM2to?=
 =?utf-8?B?aFRCQVFQNVR6VnBTamJ0R3NlRDdOZjNMRUFCU2xjemFaNG41ejNZNC96cmhv?=
 =?utf-8?B?UDNDRHdUOXNTdERLNElhb2hOVmJ0cVNiRXZNMStPd0VwRStpZVZ0c3M1SzhK?=
 =?utf-8?B?a3EwM3pmejkzbzNVOWlxSDZmUElQc3RpTGJjOXNXcVRwM1M0cXg0L29KTzB2?=
 =?utf-8?B?MDl1bjNhaHR5Rmw2SEFOZGVVTzBoQ2pTUUJmWCtWdjRNVUUxcmRXQitQbnJR?=
 =?utf-8?B?eDcwNWdoa3lWWGxZN2dQMFdYS3FKQ1lFc2hLSVM5NExBZ0c5TkpQdGJBS2Nv?=
 =?utf-8?B?emlQVHNLc0tDODd6OVFFTWJiTmhMb1RKaDArdXRYRXpoUUJpdGZFSlp1Q3Vz?=
 =?utf-8?B?elhXRlREU3B6d1V0dllKbFowWFNqNWUzZ0lncGoxcVcvSGtrd1UySEc2V3Nr?=
 =?utf-8?B?eU92TDRQUjNTcmowaE55R1A3R1dPcnNpbnFFSThBKzI4eFVTd0pMakpxMTVL?=
 =?utf-8?B?L1k1ek0wajVpbW1paWlHTi9wbG5qSzhNc0lmUTRaSlozci9ldVl2QWlYZG1y?=
 =?utf-8?B?b1UwZlh0MjM1RTc2S0wwVGZGMkxJN2p5c3FjTlY2djdsZWhvTC9zaXU0TkIx?=
 =?utf-8?B?M2FSSXpnQ0Nzckdmck52OEJsYklQbWEwYXhaU0hQODdOaWRBSk8rR1IrSG5o?=
 =?utf-8?B?eHJYUFR1ZnRvRVM1Wlo2RTdTSFAwc3dxejhnRi9lcDE0dm9sVXZFWUxJek9Z?=
 =?utf-8?B?Q3RZMS9DTW80RnFoRXVSTnlBaDM5RlU5M0s5TVJJZFNqS3NvR3k5S1NqMmJl?=
 =?utf-8?B?WDJYOXNHYzBFK1lqWnM4bnpCYzIxSVROSkhMcG1SbmJQRWcvYWR2S1F0WWEr?=
 =?utf-8?B?RUxXMk1zS2lkWC9MdkgyV1AwQ2huRzlZZlovR203OWRHR3ErRVNrVUdvN043?=
 =?utf-8?B?MWJGWm9oamVQWXdjREhmdldpY1F1UmYycSs3SldNeGozemI5WUJ4SFFvUGVB?=
 =?utf-8?B?SU1UbTNLdVBES0lXekI5a24vUzFUS2NKaFI3clZQdGZBT3dJb2NqaWplV29t?=
 =?utf-8?B?YzhDMW93MEtXWHluVVFYdjJKQnZtWG1INXJFRmFWSWxpTDlja1lRdXFIVUFO?=
 =?utf-8?B?eFZHR1R5Mnc5a1VJNEx1ODNqemp5RXFDQnVZQTRJYTI0SlhxZkVmRGlnOVNv?=
 =?utf-8?B?ZFhoajlSS2hhWlhTL0xNbXdtazI5YlFSdUMxWjFqclRua0hzajkzQk1mVUox?=
 =?utf-8?B?b0xwdkE2RW8vK2dObHVyMkkvbUpES3R1VGlXbWZnWitHM1FWa3VqVWpIeXo2?=
 =?utf-8?B?YWJWcUxheEJ3QlhlanJNbmdoL0xIQ25mZjJsd2VOdU9jQXJkTGdBRHBieG5O?=
 =?utf-8?B?RXdzSnRZZUlRQlBZWitWTU5jMDRlRnAyTnFrM2xObFBwR1I1dkZ3UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4fe21dcd-41ef-4fac-ac7a-08de48bf9e8e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 22:54:57.1735
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Cj5GsPl17EWkzERVKxeivpUrNFTiHo0huJBij88Tr6N8XEbh/Pr1/KZ5AoIrgN5cqiYEaobBeRmctgP5LeMZMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5753
Message-ID-Hash: VZHXQ3ODKDMVKHHHEPCYXXUYCVD46TPY
X-Message-ID-Hash: VZHXQ3ODKDMVKHHHEPCYXXUYCVD46TPY
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VZHXQ3ODKDMVKHHHEPCYXXUYCVD46TPY/>
Archived-At: 
 <https://lore.freedesktop.org/31402838-162e-4e41-84df-49e6109a2e41@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> Add the basic HAL for recognizing Turing GPUs.  This isn't enough
> to support booting GSP-RM on Turing, but it's a start.
> 
> Note that GA100, which boots using the same method as Turing, is not
> supported yet.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs       |  4 ++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 73 +++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs             | 14 +++++
>  3 files changed, 91 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
> 
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
> index c77a1568ea96..c886ba03d1f6 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -13,6 +13,7 @@
>  };
>  
>  mod ga102;
> +mod tu102;
>  
>  /// Hardware Abstraction Layer for Falcon cores.
>  ///
> @@ -60,6 +61,9 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>      use Chipset::*;
>  
>      let hal = match chipset {
> +        TU102 | TU104 | TU106 | TU116 | TU117 => {
> +            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
> +        }
>          GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
>          }
> diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> new file mode 100644
> index 000000000000..ac8f58ef6789
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::marker::PhantomData;
> +
> +use kernel::{
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    time::delay::fsleep,
> +    time::Delta, //
> +};
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
> +use crate::regs;

This needs to be formatted like this:

use crate::{
    driver::Bar0,
    falcon::{
        Falcon,
        FalconBromParams,
        FalconEngine, //
    },
    regs, //
};


With that applied, please feel free to add:


Reviewed-by: John Hubbard <jhubbard@nvidia.com>


thanks,
-- 
John Hubbard


> +
> +use super::FalconHal;
> +
> +pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
> +
> +impl<E: FalconEngine> Tu102<E> {
> +    pub(super) fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
> +    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
> +        Ok(())
> +    }
> +
> +    fn signature_reg_fuse_version(
> +        &self,
> +        _falcon: &Falcon<E>,
> +        _bar: &Bar0,
> +        _engine_id_mask: u16,
> +        _ucode_id: u8,
> +    ) -> Result<u32> {
> +        Ok(0)
> +    }
> +
> +    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
> +        Ok(())
> +    }
> +
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool {
> +        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
> +        cpuctl.active_stat()
> +    }
> +
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> +        // TIMEOUT: memory scrubbing should complete in less than 10ms.
> +        read_poll_timeout(
> +            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
> +            |r| r.mem_scrubbing_done(),
> +            Delta::ZERO,
> +            Delta::from_millis(10),
> +        )
> +        .map(|_| ())
> +    }
> +
> +    fn reset_eng(&self, bar: &Bar0) -> Result {
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
> +
> +        // TIMEOUT: falcon engine should not take more than 10us to reset.
> +        fsleep(Delta::from_micros(10));
> +
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
> +
> +        self.reset_wait_mem_scrubbing(bar)?;
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index c049f5aaf2f2..8188a566e1ae 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -307,6 +307,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      7:7     secure_stat as bool;
>  });
>  
> +impl NV_PFALCON_FALCON_DMACTL {
> +    /// Returns `true` if memory scrubbing is completed.
> +    pub(crate) fn mem_scrubbing_done(self) -> bool {
> +        !self.dmem_scrubbing() && !self.imem_scrubbing()
> +    }
> +}
> +
>  register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
>      31:0    base as u32;
>  });
> @@ -389,6 +396,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
>  
>  // PRISCV
>  
> +// RISC-V status register for debug (Turing and GA100 only).
> +// Reflects current RISC-V core status.
> +register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
> +    0:0     active_stat as bool, "RISC-V core active/inactive status";
> +});
> +
> +// GA102 and later
>  register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
>      0:0     halted as bool;
>      7:7     active_stat as bool;


