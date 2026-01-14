Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C407D1C1F7
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 03:25:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D673B10E5C6;
	Wed, 14 Jan 2026 02:25:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B4beluZR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D4CBC44CAB;
	Wed, 14 Jan 2026 02:16:35 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768356995;
 b=u1aK+ftwkI1uPsGFbSRb8AxwieXKrHmgfQIXYQTYih6phlIzLaJK6BfLDVFw3uxuAu5lI
 R1S/fKyHsYYBSMy2DsysSI8x6P1ljvrpBN2nnrdnzmJnQPvyUblwcPg8ksyh47n3z66rUix
 7kup8n52JYUuOEu4Su+cQ/VYo0Ixsvr0xgqfRJzuv3miI/Dxzb5X+wB9tPihMe4h6AlElrA
 qg/I0MSl9ewzrIsp7u92tl7wdixOr5ZdtcvTamx0GuJEThbA262wgOXkbHEKpTddk6vYv2s
 3/ItYCuNIFsGEPSxS1nAuYexlmittSoZOQ+aYINx37M0loBNkZdnWDGgsl/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768356995; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1sflGhnZcCx2GJ9iiudk4t/DXp0ovzUy+GyUJ5sWhNI=;
 b=HrYxZUdZ4okGlAc+dFcO+7moea27iRDntFUYTnc5ciJ+FZQnaP3KdtleWTQG2OlpJ2ip8
 xrr4I5U6MdfkTpTBzJ4hpcJG5Q4KW/V19Cqled78kW+MMTqXvkTeahZvgWBzn5Ju00ToDHI
 FMMyi6JINz4dj0OIPUyjlOsO11cB5bgO5G/g8OiUA3gc4sEV61037C3PrCthXE9fwDcUqdb
 ZiZ+SNqZMIWcHfA+PbdjK/p6UDXLjUfQ28eQnumEEIS2TfAFj9xmqb6E+PwTY6vtSJafdE+
 7RF6zmjELwOzKKzPB/Rfk+8vrOs0oVurxswwJVSyRc5xH8k2REjLfbqk3T8w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BA7E444BB2
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 02:16:32 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8549010E214
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 02:25:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6u7INovOmtAANJwlBs7bfJ/6qNR6p6P8cOy5Uo1gGckWP6ajoIdo1sXZ8L6LQb3Kt70VDEWucC3fsk7ycz5WtB3J8lQqnMLjyvEyeqcCFoEo91h+vX6/saTpTQ/EL8g6OyvO94KItKmEXwI+RE1c96DVd+HLjYi57nRKi715IIxQH5krDUNwmv3idZSqEDaEGRYkhbOiOhqKDIEBLZ0D+nqF0FqobNoSGMN1AmHkZN5yv0HUFlyIjoNgG9mYKGDCWAoTC2qnvmGP7p4tG+Go2VnXAFYb5mVwBNGL4fN+9H591b7sDMGtw38tO/VLOlvhRCTcqdZTNo8flczrd+X1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sflGhnZcCx2GJ9iiudk4t/DXp0ovzUy+GyUJ5sWhNI=;
 b=y7ZtKXR3ftVQ0PjLySBBFYn5boSJb7UbKZ9xxA4VPEjUTFYC4NFY6nQ0q9XPGDc0JslwQqgT0evr+cCN7NnK8vZbgfobTie+bswqYm05KTw80Z7hjwzklW4KqEU0bRazDGs5Jcs1bVxsUU1VUiJCDdBNFd432tHDsFhR1WxGsld0SfZIpTMJKmC+YKECvnXrzmK2cXMs0edIvg9H3MHgKDoYL0MDaPdhwuqWwDE6O4ByH8S+M+XVTL81EOXDed6CawHo9ciVL8v9Ne+XeaRq809ai5lMqyvYxslyzdOeCAzLub/yJQnocZ8uND3vFz5bg1kkk761w8TOLnEu7vi/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sflGhnZcCx2GJ9iiudk4t/DXp0ovzUy+GyUJ5sWhNI=;
 b=B4beluZRW3l0EySdo2HS0Wl7/Iv7HxyjDsZikVK+/iTpot4FPc5RNBZ1qh3fj60qA4YGgUUgzlP8vOsjHBX7LS7ecFKc8vnGXXIPK4eVmwYJ5EBD2XV3BN6XKxq+FhgkxLOwD5IWu2UeS9lP7zkGV4ofXAXZxGlihyyQyE3p0LuvNZyaX7RQCZ3Zdcko6D7dZamBywxVVzdML6ZmqRgloa1+ArHX6E6M8xVBBKqRV0dxUOtCLm6NFbu0N5AVq5qJeW/K9ToWPQM7htWZF2pPFVtL7lgGDbQfdoTCRZfPQfMdohM5PZoMV0YAjSuAnMsrdg2K28fXqacGPIWKZmf91w==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Wed, 14 Jan 2026 02:24:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 02:24:57 +0000
Message-ID: <8891f76d-4c91-4452-bad9-dfb725a58d5e@nvidia.com>
Date: Tue, 13 Jan 2026 18:24:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/31] nova-core: factor .fwsignature* selection into a
 new get_gsp_sigs_section()
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-5-jhubbard@nvidia.com>
 <DFNI0EDLI3MD.2YNWZBAWOFTBQ@garyguo.net>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFNI0EDLI3MD.2YNWZBAWOFTBQ@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0039.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::14) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aee3b49-a02b-4600-f282-08de53141c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RE1HVlovdlQ3RXFrV0xOMWh4YlEzRWhCa09YTTk0VDY1aFg5Y1kxL2ZSTXQ1?=
 =?utf-8?B?ZjA2SjMxc2JxWEJjWHBVbUFIcG9SQWQ2K0o0VkFJZ3Mrb0VxNkZqN1J1KzRr?=
 =?utf-8?B?bjZKWi93RjYvNVJrRUxpWEpKTEl2Z3JYWVFwSDExNVkxbUxtakQzNnpLT0po?=
 =?utf-8?B?dHFueERxUlUzSDJzQkhCTUc2Q1RTc0R3bkd3QndFSndYME00U3dVU0Uwc2o1?=
 =?utf-8?B?blN1eDhROVVZMXFROGQ0SjU4MkhJNG9NSXQ0T1JHS0VmS0pFRkN6OHV3ODNL?=
 =?utf-8?B?cGsvUXhpSDFCLzBDZVFyOWN1a1RUd3EyOW93Mm5ESDJOYjlwTW1DOHVhU0RO?=
 =?utf-8?B?b0M4RkkzSXBKWWhOVzRCOUFoSmpKOGZ4YkNMN0F3VURaYmdKTjJuZ1ZtTHRS?=
 =?utf-8?B?NzYxLzQ5cy91VklCaDgyUGRrNkxBclF0elNlSlNEbmNVOG5nRU5tOHAwNDZH?=
 =?utf-8?B?ZzRHS1JjaHpNaUNqWnp5MU5KSWJ3bDlhWmVjc1grdG42WE5vN2d4Ti8rV3hR?=
 =?utf-8?B?VkZ6RHJJMFYxTmVGSVI2Zk5zVmdCL3BYK3hqOFphQ0kweEJRTXRvOWVldFFr?=
 =?utf-8?B?NWZFRVEzSEtpSzNqUUJIOUZ1NE4reUJQYmxZTXYzOEJtYjNZSGZkM1FKSi9U?=
 =?utf-8?B?Y245cGxTSzVMRit5SjRvSDlSQjRxZW5pS2RJVXUyZTZWaHdyUDdmdHdwREtM?=
 =?utf-8?B?SFVSV2Q4NUtad3g4N1dKbU5velZ5OEMycUcxNU9qZ3lLL2EzWU9Fb3ZpN3lG?=
 =?utf-8?B?c0gyMGg4c3Y4NC9WbVFodHMxOThubkw0cXBUdWFncEpwTGZyV0RiWWhIMStK?=
 =?utf-8?B?eFF2RVM0QWJ6bzUyZm5zS0c0SDU2RlRXb1pMSWV0S2MwRkp0NFdOaDQ2aDRO?=
 =?utf-8?B?blZNSmU2aEtkMDVFaS9nS1JwY2M4SCtCelN5VkJ5UWFQTVFPSTRkdVVXVHd4?=
 =?utf-8?B?Z09Ub1BVT1hMQU1ONDkzVDVvdHN6a1pScWl6RkpSOWd2UzBwODBnVXlFSU9N?=
 =?utf-8?B?M3BuSUQ2bHZtcFJ1NFlkVDNrQXJSUDdGU2VPb2duUktNUzBFY1kya0hycXpO?=
 =?utf-8?B?b21ZbE5ldXB2aW4xOWtSbWdsSkNma2pOYU14TXNTRHo4L2pCOWhUZ1dua0Vy?=
 =?utf-8?B?V1NrSDVJZDdUeEJITEh5ZkFyR2ZIYjZCRUozUytZYnc0RjdGTW1sVDdudm9J?=
 =?utf-8?B?Vks2WFR1N0tWVDRSVklKL2IxWlJjaTR4N05rYnlrYjVjWTZlYXYyNytvRWlJ?=
 =?utf-8?B?KzNHWEJEOVNlZjZ5Y0VwVGRTRW4raFRqYUdTTmFQWW9IemZ3NGRBa3k3QU5w?=
 =?utf-8?B?Sndrb29kQWxneGxBYnp5ZGJJb3AxY0J2UlBTQVdsZVRZSFY5dUdMS0ZjNGlw?=
 =?utf-8?B?bmROMVRiMXFNeTBvUml0WFBlUW5DZjROUlhidmM5dU55Y2p0V3FVQ1RZY0Jq?=
 =?utf-8?B?N1ErMm4wbE9OVXphWGpmTVh1eDJWUWd5dGdVcFl2KzFWd1RQT1phSDlnL2VU?=
 =?utf-8?B?U2EzN2VtMmxXZDJiYnNYbUFaZllkNVBMSkpKQ3M3SlIzRWlHRWdyNkVJZytv?=
 =?utf-8?B?bzNjMUtEWkdYaDl0dDhGTlFiWUw2dnZ5NGQ5eFhWOU9JdG5HamlBVnVtNE1r?=
 =?utf-8?B?Q3Z2T0xCNEZXdHhHMGhaRno3MDVLSWNPcEtnRzdHM0J0a2ZpQi9ocjgrY29W?=
 =?utf-8?B?cGs5UmU5eGU3TE04Qm4vUzdlNy9lcHB2citLRWFkTE8rQnhEbmEyVHl6YlNZ?=
 =?utf-8?B?T2F4WEd0cG9Ba3VhQTBYLzlnMG5oTG5xNGJDTkhNQStBNFBuWCtoYXVpL0Ru?=
 =?utf-8?B?dXZVT2gxUk1WeUdJbVYxR0tDY2NocmY5VlpEZVVEYW5ZdFNKM0RrZ3Fzai9O?=
 =?utf-8?B?M29kdUxGQzNtWC9JTmxwbFovOXpVZVYwM09Qc3JkSFk2ZVVWWmxnaFQwQjFE?=
 =?utf-8?Q?kfQjlw9fPOzLkfhQBHZvg5N0RweBxoRL?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjJZN0d0ZTRUeFZUN3F6NlV6QzhOcUdSQ2tvT1dLTFdCVkNvcFVPcWlnNXhP?=
 =?utf-8?B?K1R1VjlpKzQwOEhXSWtya1VBL2p5WFRIclplRUV2dS8yT0FlRFJ0Z2luTmZ1?=
 =?utf-8?B?SzRLUFlGaGZSYzQ4VjBGOGlLcWRUeklXQm1BLzdVSUdVcG5HTVJhM0RQc3Zj?=
 =?utf-8?B?MVd5RnJZcmxkTGJweUo4RVV3TjVpTllzdDJrQkFVeWZrYmVCTzdQMks4T3ha?=
 =?utf-8?B?QkU3RVZ0MnVyWjhrRVF4RGNUMXNxS0U3VGFqbUZoWjlST2RiQ2h1ZEVDWlVZ?=
 =?utf-8?B?VmthcytxUExCNnFic0dFc014MDBqeXJVUE1yY3pWL00xMHBLRDg2VXN5aDhD?=
 =?utf-8?B?MXZpbjdqUi9mRGdPanhDYWlaV1BOa0gyd1daQkVUa21NdUpJaHlDTE9RN0hI?=
 =?utf-8?B?M2FHd3ZzQ0N0ZzlyUm10eGREd214VndXa0ZrQXBJVnVLZHhpQU5rYzErVmJP?=
 =?utf-8?B?YnBnRmZkcEczYlFFWGhYeG03aGxkM011b1YvZFpyMjZCSG9kUjlwT1NCRkpk?=
 =?utf-8?B?VnFCTXk2QXhxTFZ1U1pLNlVpRVpGc2pjdzM5bTBZNEsxRzkraVpVbGgrOWpD?=
 =?utf-8?B?Rk9tYWZ5USsrM1g5cnliQ1hYTEQ3bDV3S1N5VUlNZzNkZGFoaWlCV3M5Z3Bp?=
 =?utf-8?B?Qko3V0pTdTJOK0daL3RWdHlYNTFuWG4zeVpLTllEZll6aUdQMjB4OUMyZ21N?=
 =?utf-8?B?N2xBNHdKUDhzY3YyVzFpQXZyMGoyc29HMGxIZ2hicHVuaGJaSWc4UGsyQ3lR?=
 =?utf-8?B?UFE3MHQ1cHowSVVRSVRCSjZGNFFNUkRBZjBUbHZPS2xMcVRieFRPK2w1aEpj?=
 =?utf-8?B?N2FTZzJkOEIxZUtVcU8rdDNhbXFQSldkYU5UNnJiK0g0N1RpU2Z6ZURuNjZK?=
 =?utf-8?B?cW5DVXhXZlB1NGFFREVpTEh4VWpvN3Z1NmVoRjhFSE83aGtVNVJ3REM5SVRN?=
 =?utf-8?B?NERvbkI5bDRseFlpLzVoMzZFV2NGcGNTWmh1RTRUbTdkYi8yZC9rTkxzanEv?=
 =?utf-8?B?bGFyMUR2SVhSVVBLRGVHYXFQTDZIRFZ4YUZwRmh2K2hTNzFIUHg3NUVoZHBn?=
 =?utf-8?B?c1VJcVFYcC93SUR4WDd2a2VENS81d3YvTVRXaUU2VDcrb0hIcnFuOXdiZFYy?=
 =?utf-8?B?STZ6OVN3dXB0Y2lHRkRLNHU4Vk5IY09QdkNhejhGY1RUMitJQVZVVkhYczBZ?=
 =?utf-8?B?NDNWL1d0NmFPaVNibFk5K0RMUkRnNUZyRWIzYjBVOEdqSWVqZnprREJ1RXFZ?=
 =?utf-8?B?aWk4NjlZdVB4K1VmSEtQcFFPNm5ncmNmVlFpcHRRa3dZY0drVU1scFFSTXlx?=
 =?utf-8?B?a25yNC9uZVNlZ0d4UGRuMmVVNDd4bkJseE16SGoxLy81cU81N09ldUtUOFhm?=
 =?utf-8?B?QStkaHFDcjZFMHA5M3ZsMk1RdWZxejVzYmFyUGQ1R05kSU5abkJUbVZ4Zzhj?=
 =?utf-8?B?RUpWd0pqbUV5cVdKVGJvNnFTMFdxYW1XM1VTclBjc0JGaDJRS3NLTnNZTnZ4?=
 =?utf-8?B?VEVXRWZyT0lmSXlJV2dicFRrcUVySitSa0grVVZoMEorVjFvSzJjTkY0OWhB?=
 =?utf-8?B?SXlmUlZuTHBMUm1FRUdBM1o2SENXcWVFeEUwTksvRkZsMEFpeDBjanhXc3Ns?=
 =?utf-8?B?VnRSQ0JXMktiMzY0dnhuaWh4Vk5MWHZvU0cyNk1jY0NxZUtNQU1pb3l2bXkw?=
 =?utf-8?B?Z09TUDBWNEhYNEFib3NleVBNUXpaZGdTbG53bDM5VUtKL3Y1dXVyd0JTcjJE?=
 =?utf-8?B?QzRnYVphMGY5OE9ta3QyaVl1YXFlWXFETnBTTjZ2UzJYUzJyVmppN0o4SmVU?=
 =?utf-8?B?VXNvUWU0SFZoRTRMb3Y1aHFjaFdNa1lRbW4wZVNqaFRNaTBPY09hZThKUFAz?=
 =?utf-8?B?ZkhObzdaUmtSblNibUJ4ME9PenZUcnc2cXRSUHpTamhzdXBaVllMQmRCZTlZ?=
 =?utf-8?B?dndOaWpWVkd4bjU2cmtsekFWWnZjOENPcVM0Kyt3bUJlZEhRTzR2NnB0YW1K?=
 =?utf-8?B?RGE4VlFWcGd6MVpqRTJWZVVzMjR1UXQ4d1Z3cnRhMEZtcDdEMUk2bUs4Zklh?=
 =?utf-8?B?WkIvY3VRWjF5MTVyQ1p6eUd0T09kVEpodjNpS05kUjBUWG04bzRTeEFHbDF0?=
 =?utf-8?B?QlNJcExxTjJXR2p3cnhPRk9ROUFTc0VQTXZmWTBjdjdiY2swRkpWTHgwSjBp?=
 =?utf-8?B?Ym4yNWxsZldaTE5ZbGtRS2FacWxEeDI1K3FlZUh1VnBrRkRxMFpRS2Z5Y2ls?=
 =?utf-8?B?ZGt3VW1RR1JjWTRZZ2xOVUY2KzVUeUpWSDNIeUtNSnorenlxQ0huVDJuMlI0?=
 =?utf-8?B?ekVHSWc0WDdHbFFQYUFCVksvTU5LRDlFSlRNdTQ0aTdITjRPZlVFUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0aee3b49-a02b-4600-f282-08de53141c8e
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 02:24:57.8167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ddUnIXCofzN7V0LQezK49S+qCtEYcJdxq9guU6ZqJGmLNxGPXsI524geoVt/IgAQzkiBUhmXjDpvbRYE1tJqEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
Message-ID-Hash: QTZKGRA6KI6JLRH3LK2L3ZZF6GV547IY
X-Message-ID-Hash: QTZKGRA6KI6JLRH3LK2L3ZZF6GV547IY
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QTZKGRA6KI6JLRH3LK2L3ZZF6GV547IY/>
Archived-At: 
 <https://lore.freedesktop.org/8891f76d-4c91-4452-bad9-dfb725a58d5e@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/13/26 5:33 AM, Gary Guo wrote:
> On Wed Dec 3, 2025 at 5:58 AM GMT, John Hubbard wrote:
...
>> -        let sigs_section = match chipset.arch() {
>> -            Architecture::Ampere => ".fwsignature_ga10x",
>> -            Architecture::Hopper => ".fwsignature_gh10x",
>> -            Architecture::Ada => ".fwsignature_ad10x",
>> +    fn get_gsp_sigs_section(chipset: Chipset) -> Result<&'static str> {
> 
> I would just return `Option` here, and have
> 
>     let sigs_section = Self::get_gsp_sigs_section(chipset).ok_or(ENOTSUPP)?;
> 
> similar to the ELF line aboe it.

Nice, I'll do that.

> 
> The code looks correct to me regardless if you make the change.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>

Thanks for the review (here and elsewhere)!


thanks,
-- 
John Hubbard
