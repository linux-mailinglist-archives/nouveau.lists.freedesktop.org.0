Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568DD15D90
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 00:44:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D478F10E43F;
	Mon, 12 Jan 2026 23:44:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kBLyg2D1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3999644C7F;
	Mon, 12 Jan 2026 23:36:12 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768260972;
 b=ksfM4k+XiO7DwX8aWA7xcUhz+2KvX3mxrg42+Gh8IPsU5/T1I8Waz21V/dPW+L8fMomYJ
 20qeqZJJxW/9dRoij7HmAA0WhFS07X6m0o3oNPYbyGwo7O79UYAyRbowdZvQMotXiwnkCKP
 eNOSZM1AYXk00xgxHUrx5z5nxJPNl/2cfTyZXWhIemtXZv6gqqOKjnY+dG9xoh98HE/jGCO
 OOmccdkv6kHdlATbT8N9IOP8G7W755JfLEeg56y3e2W+9mPJnVV/dEUC57fO3VrL7QwE4/C
 7udAxNb/6gnDWyRd1ofOx11QfvYPN3tBVjgIuGB5xqoyKTHh0GKG3m7YqCPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768260972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7X8vpo3vZ/nH288uGNq0WqYnFQShaZtHcvn+nw/1eBQ=;
 b=pkrvXZ4wmxhtzQw0AYsx1q1OewGsOMm907QBmK27WYAjiW41uD86EYgUVacMflSRj7a3h
 S6t2NkKduf33B0jK0nwgRW1UCeB2PtqhjkPmaWhKYhCqLLKoanXf7TETxDu0prxocQ4ecwQ
 pRVipFTzuA8JvzFuyFcH0q4AoUA2V1hLgv2+QwkBniIiD/4LLGOACHEk8TaGOEWEC1RIsd6
 PwKIaK8C1Pf+KK8V+azuzg240DhCJsL/Nnx8hpcyPPSLwvT7xkpAGsbq2Cn+6A87LDw1KOt
 ST+CYfxM81s5pvriM9X+C13A2xhLM3nc2vkfiI9Eo+bmzhEEXOLFyoG+1KmA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4F3C844C7F
	for <nouveau@lists.freedesktop.org>; Mon, 12 Jan 2026 23:36:09 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8976510E2DA;
	Mon, 12 Jan 2026 23:44:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVaCgAXMXdAEBT90Mv5svElVGNROcTinS1kJ8H19AQv+Uah/Za4TcUYhgkayPnkxFj7GQbTBqEj2uxjnTHbW2HoU0o30Ouy62K7VlaJHKNuOB03XfgCF0kl+VRvafrqPpmU0NOzHl103+uoLxGbU+D5UcxHx2DAAr53wPjblJch7IotLl+Ur8fxLQo3RVHBd0RWlje1D3Jnh9SXLdsGKtHWo4vPo0Pe1SDwJL/NYBS0xnY4SJNY2vwHy/hzXuKGqFKERNhDfcjxHvBQfl1bIYWWB3w5FPEslwFiVT7B1pTHpWUXEyZejEdDzMndGkqjPJGo61FceERCBSYnqJqXFfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7X8vpo3vZ/nH288uGNq0WqYnFQShaZtHcvn+nw/1eBQ=;
 b=SDw4vU18FdSJobIyIqXF3CH93gsSwibg7EsV7TMpPD0bUKvQrAR2EVi8QkhOVqJ3cmuu5ehGnzbSqMXO1VtFTcRrIOblcImn/rTOG9gvwauk5AqkPIVifU10wjxsAVWz/XZHPKlFoCXP2LU5zlgZF2Y9Kwj1Zf9Fr4ZqD+MMMDicHQLLg1SVUB5dcGk4mwqyJRlvaqvSsQaXNGvciwDS79JBdoaI9Cujf1/bZXrCk54XAwahv9lq9VFtT+0wkw3kdx58cFEOaLSdPa08EWPDpw8tH7KtcNHkJgol8MShmS2wpSYeNgssSlcguU5qdbXyY3HHDospAaN85LlJMu3EZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X8vpo3vZ/nH288uGNq0WqYnFQShaZtHcvn+nw/1eBQ=;
 b=kBLyg2D1P8mpbgcmTeA4OtlYA/3pFwljqstTZHAWBu7SnWSnYFx20Y4436JtR+68WyUjOUJWbAL2qBN1X1KQyNinWBvT96BItQC/pjC7kAZWb9Dtu1Q4kPlPn0z2X4+wX26HC/SU3V9cAb45ntnTqRLvWJoa2m2q8EYoEFCdksXiMVj+9ek0XzjYRcd8O68VCOLTovjLot2eO8h0gIHPZZpCrVJQMDyUpriUHTyIF76vV2AioFCo8zrvKtSYeV9HKjHj5nL1Nj77aGzy930n56sukPunc6hwnVOtohUMHV6zskH3Z0uGa4Z7sZzDzMzBdzaUUOOgVJRrBIfwkftquA==
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH0PR12MB7488.namprd12.prod.outlook.com (2603:10b6:510:1e9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 23:44:32 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 23:44:32 +0000
Date: Tue, 13 Jan 2026 10:44:27 +1100
From: Alistair Popple <apopple@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4 1/7] mm/zone_device: Add order argument to folio_free
 callback
Message-ID: <fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh>
References: <20260111205820.830410-1-francois.dugast@intel.com>
 <20260111205820.830410-2-francois.dugast@intel.com>
 <aWQlsyIVVGpCvB3y@casper.infradead.org>
 <874d29da-2008-47e6-9c27-6c00abbf404a@nvidia.com>
 <0D532F80-6C4D-4800-9473-485B828B55EC@nvidia.com>
 <20260112134510.GC745888@ziepe.ca>
 <aWVsUu1RBKgn0VFH@lstrano-desk.jf.intel.com>
 <45A4E73B-F6C2-44B7-8C81-13E24ED12127@nvidia.com>
 <aWWCK0C23CUl9zEq@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWWCK0C23CUl9zEq@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: SYBPR01CA0193.ausprd01.prod.outlook.com
 (2603:10c6:10:16::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH0PR12MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5552fd-c8e1-4042-998c-08de52348905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|19052099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WGJpbW5IZUxrelBTRk43cFAyL21uMkZTT2FZZTVWbVI5WERkbUVtTFRDbEdW?=
 =?utf-8?B?L1NYOTdCajlDRzBqZHFKTy9MbUV1RTkrSHdFeDVjTXFuaWN0SDI1ZkhEWkFS?=
 =?utf-8?B?VmpjVUd2ZGdLbkNCVUM1ajQ2SEZvUXk0TEJhcjJHQ20rTDdQM3BYb1c5N2lY?=
 =?utf-8?B?UGJRZTNBRk51MU9wT0VqY2NSY2pGKzZLTEQ4UU9XMzRUdDNiU3hmSm1oYi90?=
 =?utf-8?B?akNVdStlbXBQbnBpa1J6RXZkNm4rRzRLdUxrdldWVW5nUXRBb2p6ZXZYeHBK?=
 =?utf-8?B?bnlpSGJIdE15bkZscDR0L3E3WkxtZTNZZXlPWktyOXNrWTRMamdza1FKdHFU?=
 =?utf-8?B?WGw0RDY2WnJJcE9rcmpVcUpRZ2FFeGFpLzh0c041Ym4wbGNocnhTUC9Ba0Va?=
 =?utf-8?B?SDVGQTRYNkhGWXFHTmNSSXAzcE9DMjJGeUtpUXNNRkUxekQrUUFiOU5DeUxk?=
 =?utf-8?B?QTFWd1QxUFVVZm1Dc0NKM1Zkbzh1a2Vpd051dCtndmxwQ1I1M3BBY0dzeWp4?=
 =?utf-8?B?NzBxY3dwR2pJWXBKNEhzS0F5SXFnOHV4SXlia2wxUUlDNlVmaTFTbkJOOVpx?=
 =?utf-8?B?Sjk0KzFoem5ka0FLazJqSzVxbjlXSCtCWDFyUmlWaXNHUTJXK2RNSXVnTDhv?=
 =?utf-8?B?LzQrRDc2QnZoWWo2eXVXT1JQM1ZQc2ZvaFJYSVM5R3RROE0rZzl0S0Zib2pZ?=
 =?utf-8?B?VGtiS3grUUFTRDhlMngwT2dDVWxBQndkbFF0VEZFemlOdDRrSTBnazQ5blNQ?=
 =?utf-8?B?MTBQdTRxQ21CMWxBWHk4SzlhOFY3Nm1uMjFtV2hnSmd5a0E3NUZOOVlRMkRK?=
 =?utf-8?B?c09oRjMxeWh2TklDVkdMNUJyQXd0bGNDbVREZjhrZ2Q1dW1vRWlTY2o1SHVw?=
 =?utf-8?B?aUlCWHNETkxuV2NURlZnWEcvY045R2lCSUw4MzN6NXhpb25ZMGtGSFZkMEFv?=
 =?utf-8?B?L01YZFpTb05NcWJOUnk5SVFXMmlrN0ZaK0J3ZFRVRkxHWmVVckVuZkRXb0hz?=
 =?utf-8?B?Z21XMkRVbkhVSUoyZWFsRlFUQ0JNSk00aUV6NXY2UXZBWDIrUUV6eGRZT3Rx?=
 =?utf-8?B?R3RSM2RaRkJBTllGSS9xRFpuNzY0QW93ZzNZUnpMYUpJUHEzSmFrcUZTTk01?=
 =?utf-8?B?Yi9wbVN3NWxMcGU0TnpaaUxqb3VRVnNIVU5xV3RxNk1CdTJlQUs0UkVWVWJw?=
 =?utf-8?B?ZTNtRzdMOHZ3a3FKS25RSkhIR0RQbUpZRXZZbllKVUNqNVhhMWttem5uRmk4?=
 =?utf-8?B?MWJTazZWM1djUExteU9wTkZoSHRSTWNXaXdtT09PemN4RXhMRFpmUGY2bE9E?=
 =?utf-8?B?dWZpTHR2cUZ5YTZPdXZKSVFhQk9EZ2tUR3I4REVQcmVZNTNkL1BBSHc5aG1j?=
 =?utf-8?B?ZHFpOSs4TWQ5clRZaENiN0xKNHZHTHQrNFYyeVN6M241U2dzR29VZDZvSDl2?=
 =?utf-8?B?QnpJYmxGaUl6cGk3Y05LMlhjcFV5N0ZzOENFTWlwWGRKOXRCTjkza1d1cTly?=
 =?utf-8?B?YlVSRE8zeDRwaVFQRVpxR0xzQTVlditLTndiVVIrUnd2ZjVGM0dRNExvaG1P?=
 =?utf-8?B?Q0RSTmJjeTYwN1hGZVRTL0U3U1pwc1grWDI2elVQRWpsTlhYbUZnSHN2bkho?=
 =?utf-8?B?UTFUeEJkVERnQVJLQlR2TmtReC91SHh4V01JZmJpYUVac1M0cEpRU21ncmEx?=
 =?utf-8?B?VUZZS1JydXlGYldNeGtEd3pubWsrQ2V1aENUQ1FpUUI5N0NTYlRwZ3VlamJC?=
 =?utf-8?B?WHA4eG9pZ0krRGNXUlNhZzBzYmgyMUtvRVFMNHhOS2JMOVBkV0NkUlBLOER3?=
 =?utf-8?B?ZEpodjJHeHRlUmFzWStWT0xCSUlNUjVnMmtmQ1phRWdnMWJEaXZjcDZDZndh?=
 =?utf-8?B?UVM4UkVteVh4UFpmdGxQODdwMSszQi9GVUpIaFBMZXYvelFjOC9pRkdoTmNi?=
 =?utf-8?Q?hbXacn3q5nt3s68L8WeGSBL7I5RsEQq/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7726.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19052099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a3JtQlp4QitIYWpNWWo5ZzNNMDAvc3JBeW9jRTdBYjdpS25IZHg4VEFMU0NU?=
 =?utf-8?B?dEVrWXJKYjFld01zL3FPQllDRTBqNWJ2OFViVXRCOVRYUkZWTWxjUUsvU28y?=
 =?utf-8?B?bTc2aGp4dnVCOUYvanRXOGZINUo2N3N1aUlnWHRyS01QbU51bDlDdS9qcndh?=
 =?utf-8?B?MVpRVk1HRTcvdTdWNzd6TE5kWXJyNWFybUVKK01QbUFNKzR1NjVzVWViVjJk?=
 =?utf-8?B?a0VjRktqWEsrMDR3a25hUlJsbExOQUpscFJ0TWxGQkZidEZXYWFKRUFUS0tz?=
 =?utf-8?B?N2ZiTVJ0WGlPOUF2ZDAvTnRraTZZTkd2R1ZXcVlzUjFzL3BKZGg3OFBnQ012?=
 =?utf-8?B?R1ZFZlREQkdpL2JjUFdrL3ZyRjBjV0c5RkJRK0V2L1MrY042MXZROWtKQ1Jp?=
 =?utf-8?B?Q0dDbldTYlpUTi9RcllVMHl5MnQ4SHhJckNHNWtLbmc5SHhLMFM3MkZpZXR4?=
 =?utf-8?B?NWJUdnh3K0NSODFvRjJpWFJxUTdXRFlQblJUNzFlNWZaQVd0WmFGTHVHWTBr?=
 =?utf-8?B?UFFibjVqRmlUZzVONS80MkNweW9kdkwwWGk2ZElCemFuNmtGaHMyUzZQYm1J?=
 =?utf-8?B?TGtLZmgyb3JoVW5KVnB6UkZ0cVliNGlyelRIb3YyV0NYNGc5RTFVcm9BdEtY?=
 =?utf-8?B?cWZ5VzJ5VVk0TzBnUkRJdUdYWXpqcGhsMFY3eVpDcVRYM2JTZXNwRVVGTW1K?=
 =?utf-8?B?TjYyRVd4aEI4bENhSW45Lzd4anhveitTT0g1UlpneEJ4dStrSTVjbHdWTUd1?=
 =?utf-8?B?Mm95LzUrSHl1ZHhxWW0yMGo4aW9ZUEhrMUtuakkwTGsrNG1HYkZpbDdHNlZq?=
 =?utf-8?B?bmtaWnlJQktxTDJxZjFvNWt5NFNDZlVZbVpONWk3NEkyZkUwTFBkUS85REF2?=
 =?utf-8?B?RS90Sk02bzVndy91ZHNIME9sY2w4OTExbGdxVGVOOFRnalpqcHdoTjNvNzZ2?=
 =?utf-8?B?NGpuK21WdWowWjZkUTNISVJEU3Y5Rnh4dHMxOTJOMlJUVmcycDl2cHdxSWFv?=
 =?utf-8?B?M0tsOXJwNlJWMVZOdmxLd0dNMGZ3ZktKZkdXZXBGTTlrakFUbWZPc3lNdHg0?=
 =?utf-8?B?eHRLZGdLd0hqZm5Yb1hGamFKYytzam1GNW5WUmM4OFBydGpOWEYxWk5HKzdB?=
 =?utf-8?B?TFA4eWM1WmxtSlBHVlJ6a1VrR01BY1JrMDBUMldqbUdKUXNtdDVvWUVtUTR5?=
 =?utf-8?B?QVJLd0dFbnlsbUNsdkpycUJKcFBDSmVtN2hpR25vZjF3Z0lXcWhyNEI2cE1J?=
 =?utf-8?B?Qm9lS25raElacDMrMnZUa0RpcnRUVHVVOTRuUHN4V0pCN082WEhkV3ZObGJs?=
 =?utf-8?B?WXRydit4MGNOTW9oZzZZTkxBcHpMOFJidUtPaHhDdHcwUUI5cGNIWFpudmN5?=
 =?utf-8?B?ZVZDTkNIWWdmbkt2Njd4djd5emlzSFFJTGQ1UHoxUXhWbDZKYWpmM2VSbDhr?=
 =?utf-8?B?OThXUDFtTCtJeHdoRVc5czI5WlhEVEdqamNVUW1uaVZJV21LMGwrdGozZDlG?=
 =?utf-8?B?ZkQ5SUVqdWl2M0grTVU1b0hubVd5WFVjWnlBR1htSXgrd2RqYkxXYnQvSlVq?=
 =?utf-8?B?d2craXYwOW9laWQreWc4eXJ4Y2VVWlFGbnV4OXprNFBTYU5idlVsZDZkdXZ5?=
 =?utf-8?B?bVRLM2lwUmZtc2tsOVVBTURRMVF2RTVGbnFsWFlEK0pJbWZHOWgvMkhBTmFF?=
 =?utf-8?B?MWpzeVV0MlE5QUtSa1dnZGtuV3M5d1dmdEtsQVlsVm5vL1dOY0s0MTZLTG95?=
 =?utf-8?B?TWpENlRoa052ZXdqYjA3UW1WYUtzcERYcmd3M3hoeG9FbWVIZ2JCUW5tOWVn?=
 =?utf-8?B?YXBFNTM2b2lGb1FXT2VQelNCL1VMdFFEZmRLV25ib1hHVzd5QXo2ai9sbUFt?=
 =?utf-8?B?cWRtTDFMUk5ZRFpFeis2NTFWVHBLclZ5MDlJY0hBUldDK1R0QnJiQ0ZGM0U2?=
 =?utf-8?B?OTlobGkrMjlSM3RRbm1qVFI3UlZ6clQwMlorUm5vdzZIQjcvNUxqTDhlVUMy?=
 =?utf-8?B?bVFLOXZvTlZWZVIwREY0SnduN2lhZzdxYXdkNEsvNi9VanpPS0ZscHQrRWN0?=
 =?utf-8?B?aHJvbVRCMitjKzYyamRXV0tvb3lObTFtSjE3OTFPZ2FpNE5nK3hXVkYxMHU5?=
 =?utf-8?B?OTRSS3NjMFgzeThRQUZZWTB6ZUZmSDg5RTlIWlIrVkVweGpLT3pTTUtCVTlU?=
 =?utf-8?B?OEhGWWtTTEpYTHFwVnlzZHBZYmtnRUhFNVBHaUdtTXpEc3V2dUhZbXoxbUd2?=
 =?utf-8?B?RmsvMkNYQVBoVTN3SE41VDg1K3BEZU5nNG5GYkFyUWtpdlBtTmdFSTFxTlpo?=
 =?utf-8?B?b2JnQjV2ZTFWMld4V1ZLbElNY0piczA3MU9VZHJsRWQ3aTl6clhTZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b5552fd-c8e1-4042-998c-08de52348905
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 23:44:32.5483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wlygDO67kDF8mYlYrSrdnv49lZ9EQn3Qcip6oxIxtV1bHWV+3aTY8HjhcOaGleI9H3kp9/OkUeARSU9K8ukwuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7488
Message-ID-Hash: ZR7AMYEPGVPBPRYFNNCGQMZVMSGRJ6XK
X-Message-ID-Hash: ZR7AMYEPGVPBPRYFNNCGQMZVMSGRJ6XK
X-MailFrom: apopple@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Zi Yan <ziy@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Matthew Wilcox <willy@infradead.org>,
 Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>, Leon Romanovsky <leon@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 linux-cxl@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZR7AMYEPGVPBPRYFNNCGQMZVMSGRJ6XK/>
Archived-At: 
 <https://lore.freedesktop.org/fzpd6caij2l73jkdvvmlk4jxlrdbt5ozu4yladpsbdc4c4jvag@d72h42nfolgh/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2026-01-13 at 10:22 +1100, Matthew Brost <matthew.brost@intel.com> wrote...
> On Mon, Jan 12, 2026 at 06:15:26PM -0500, Zi Yan wrote:
> > On 12 Jan 2026, at 16:49, Matthew Brost wrote:
> > 
> > > On Mon, Jan 12, 2026 at 09:45:10AM -0400, Jason Gunthorpe wrote:
> > >
> > > Hi, catching up here.
> > >
> > >> On Sun, Jan 11, 2026 at 07:51:01PM -0500, Zi Yan wrote:
> > >>> On 11 Jan 2026, at 19:19, Balbir Singh wrote:
> > >>>
> > >>>> On 1/12/26 08:35, Matthew Wilcox wrote:
> > >>>>> On Sun, Jan 11, 2026 at 09:55:40PM +0100, Francois Dugast wrote:
> > >>>>>> The core MM splits the folio before calling folio_free, restoring the
> > >>>>>> zone pages associated with the folio to an initialized state (e.g.,
> > >>>>>> non-compound, pgmap valid, etc...). The order argument represents the
> > >>>>>> folio’s order prior to the split which can be used driver side to know
> > >>>>>> how many pages are being freed.
> > >>>>>
> > >>>>> This really feels like the wrong way to fix this problem.
> > >>>>>
> > >>>
> > >>> Hi Matthew,
> > >>>
> > >>> I think the wording is confusing, since the actual issue is that:
> > >>>
> > >>> 1. zone_device_page_init() calls prep_compound_page() to form a large folio,
> > >>> 2. but free_zone_device_folio() never reverse the course,
> > >>> 3. the undo of prep_compound_page() in free_zone_device_folio() needs to
> > >>>    be done before driver callback ->folio_free(), since once ->folio_free()
> > >>>    is called, the folio can be reallocated immediately,
> > >>> 4. after the undo of prep_compound_page(), folio_order() can no longer provide
> > >>>    the original order information, thus, folio_free() needs that for proper
> > >>>    device side ref manipulation.
> > >>
> > >> There is something wrong with the driver if the "folio can be
> > >> reallocated immediately".
> > >>
> > >> The flow generally expects there to be a driver allocator linked to
> > >> folio_free()
> > >>
> > >> 1) Allocator finds free memory
> > >> 2) zone_device_page_init() allocates the memory and makes refcount=1
> > >> 3) __folio_put() knows the recount 0.
> > >> 4) free_zone_device_folio() calls folio_free(), but it doesn't
> > >>    actually need to undo prep_compound_page() because *NOTHING* can
> > >>    use the page pointer at this point.
> > >
> > > Correct—nothing can use the folio prior to calling folio_free(). Once
> > > folio_free() returns, the driver side is free to immediately reallocate
> > > the folio (or a subset of its pages).
> > >
> > >> 5) Driver puts the memory back into the allocator and now #1 can
> > >>    happen. It knows how much memory to put back because folio->order
> > >>    is valid from #2
> > >> 6) #1 happens again, then #2 happens again and the folio is in the
> > >>    right state for use. The successor #2 fully undoes the work of the
> > >>    predecessor #2.
> > >>
> > >> If you have races where #1 can happen immediately after #3 then the
> > >> driver design is fundamentally broken and passing around order isn't
> > >> going to help anything.
> > >>
> > >
> > > The above race does not exist; if it did, I agree we’d be solving
> > > nothing here.
> > >
> > >> If the allocator is using the struct page memory then step #5 should
> > >> also clean up the struct page with the allocator data before returning
> > >> it to the allocator.
> > >>
> > >
> > > We could move the call to free_zone_device_folio_prepare() [1] into the
> > > driver-side implementation of ->folio_free() and drop the order argument
> > > here. Zi didn’t particularly like that; he preferred calling
> > > free_zone_device_folio_prepare() [2] before invoking ->folio_free(),
> > > which is why this patch exists.
> > 
> > On a second thought, if calling free_zone_device_folio_prepare() in
> > ->folio_free() works, feel free to do so.

I think making drivers do this is the correct approach and is consistent with
what P2PDMA and DAX does. All the interfaces for mapping a ZONE_DEVICE folio
currently rely on the driver correctly initialising the folio, so this special
case for ZONE_DEVICE_PRIVATE/COHERENT seemed weird to me - they shouldn't rely
on the core-mm to do some of the re-initialisation in the free paths.

Also drivers may have different strategies than just resetting everything back
to small pages. For example the may choose to only ever allocate large folios
making the whole clearing/resetting of folio fields superfluous.

 - Alistair

> +1, testing this change right now and it does indeed work.
> 
> Matt
> 
> > >
> > > FWIW, I do not have a strong opinion here—either way works. Xe doesn’t
> > > actually need the order regardless of where
> > > free_zone_device_folio_prepare() is called, but Nouveau does need the
> > > order if free_zone_device_folio_prepare() is called before
> > > ->folio_free().
> > >
> > > [1] https://patchwork.freedesktop.org/patch/697877/?series=159120&rev=4
> > > [2] https://patchwork.freedesktop.org/patch/697709/?series=159120&rev=3#comment_1282405
> > >
> > >> I vaugely remember talking about this before in the context of the Xe
> > >> driver.. You can't just take an existing VRAM allocator and layer it
> > >> on top of the folios and have it broadly ignore the folio_free
> > >> callback.
> > >>
> > >
> > > We are definitely not ignoring the ->folio_free callback—that is the
> > > point at which we tell our VRAM allocator (DRM buddy) it is okay to
> > > release the allocation and make it available for reuse.
> > >
> > > Matt
> > >
> > >> Jsaon
> > 
> > 
> > Best Regards,
> > Yan, Zi
