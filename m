Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFEED386DB
	for <lists+nouveau@lfdr.de>; Fri, 16 Jan 2026 21:15:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7C1210E1D4;
	Fri, 16 Jan 2026 20:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nuE4zUim";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A015A44CAA;
	Fri, 16 Jan 2026 20:07:17 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768594037;
 b=HsoMhSfByrvx4dYNtGKJU5lUTa9fJQ8Dr9payVr1ttGjd/u6jzKevsitUf2b0vXAFHZGM
 EpabcSHpSC5vTjI4nqRPADf2Dui66D+PDbABy3zOlZvad8EaaGiHC/tvNYZ/Hy37zws4UvM
 XJryI/6z9oTFimef+JIdDYLWSx2KrodnXqsht1U6WIkbOqTiNg5zIokaF87/KO2EOMxKy50
 RGEHR7QGHWJ+gUpQ8rwCb+HlCoPDv8K/JKtkxs9qAcwMOdxVa1Swssfsj1UgOi9grVn5h9R
 tae7/COOPHFyXLt1H9GRulryu7BjC+HGwuNC/mDxjw5fsJHaWkDITLpENejg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768594037; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ozMkyLYVj92xUjznkf6vPAQA1pqSxgzSpYBuLVa/h+Y=;
 b=prnryu0lA9o/t689G58xHKl5/Zja1tB/N9KAliIdusInzXdpxX4oHQmdg3UeTlTFgyHPc
 NBGW2mR/Klch2mzvUzDob/aYG4Zg7YzpHSX2XCFnzeNL+ZsWdNVgUGhL7B144Pa1XWd35QW
 BqQTKYLNoHHTkff9jxbEJBupncamrK0uBJ1tBhjLaMqBgFqKNZV5Gz2uX0uvoSrdyZ+4xMO
 bWBdup3Oay6snXJjclWzECv8w5WYfZbP5hxMjTNmz3gZGbxarlFf0WRR15PpHa4NeOvM2gX
 JETyBAu5l8O63o7SSWeTmXcpXc+QY9LLqYl5i+3cI7HYAAVQxItcCkNWwhWA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0BA9044B97
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:07:15 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011065.outbound.protection.outlook.com [52.101.62.65])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DCD0910E03A
	for <nouveau@lists.freedesktop.org>; Fri, 16 Jan 2026 20:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFTKwOE0qHsw67nTOBAwFe/MPA28Fbj6qLP1KQeVuGkIPC37aXfG6M7hQqokE56dt1HSUQAg8odZI4ZOQnzEZeLM1J/6SwbD/PC5xNE4FMOIF9dCWSTpPjTuKs705PQyhHVJf6JGLwZRJAMZKxlta/IY7lPTg/Zd8waxsuhVinyC0WVEMWdIYqZyq/pfIqEUCnOoSmSJ0W0t1Z/s2U8OM05UbAb6cqRW3xmZHrHa5LWvFdlY+yQd41mW3B00ZD4zwgFMVBVZtuX055ZfkHlOUgsALeA8x9mB31HL2ShMH8n613hnPsqI4JE1/xt6XqoVxCJHj0wxOaQu7OvunJMj4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozMkyLYVj92xUjznkf6vPAQA1pqSxgzSpYBuLVa/h+Y=;
 b=juW9YUvSqTEoJ5oRvf/QsVw/EagdOjztf4Wxm8LNp5BOBZlwN1S3Q7qmQfYf7IsODU8KLjtDSig591fwcqvhthBtVMaXuXjWqEl7BxXoFh6m5u0Jd4DWFVkmu3xaIzAcefPcl8Ve63XGeIGUL1vIMvru6nnVssLhjfxKG85ShdQ4P8eUADIr/kb5i8v9pInhvAJ7sIMeUwPHAeWmPa8XH37OtQnt6hz2r8jtftqjv8/ORHP4Xa6P3eZs8WHGH7stcMhrXXombTpkUL8uf7ZEGwxpM8f2ab+Swb4GKYydG3ibY3IfXyj6JgTkxrubyOPWskw8x7d+5rn4VFJ+xQ4KTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozMkyLYVj92xUjznkf6vPAQA1pqSxgzSpYBuLVa/h+Y=;
 b=nuE4zUimjcfwZpnZ1f8qvs7RX+pnCNhzed66Hwpq4mZEzphcUClPKMYGzOJb7OcE9S31sj6+vMOQQFjqZP95KG0eZHIMWcxMJInQREWC7QO54oyhiamAfxp1wboq+MZDQ2YUfdzCwOEPF6VlDKsu2eZbMUo5huAcjRaVQST/gL6OQKCQyDDd4VLOy8ESlbOcSdCmfGzvhrIuf87qJZGIWLgIw5hV9XX2xpX+5OrErni1lP2JwNIUTox/BgoZso0w07QsgjgQi17wAnLA8gHkc9ykkFuoCEsGlghEk1sL5lcUpaPRGZoeimHFG0/98Ip0eIDZ8CMF0Ezi8i7Ym+9ToA==
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by IA1PR12MB6210.namprd12.prod.outlook.com (2603:10b6:208:3e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Fri, 16 Jan
 2026 20:15:47 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 20:15:47 +0000
Message-ID: <9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com>
Date: Fri, 16 Jan 2026 12:15:25 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] gpu: nova-core: move some functions into the HAL
To: Danilo Krummrich <dakr@kernel.org>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
 <20260114192950.1143002-7-ttabi@nvidia.com>
 <DFQA0S0IXLNS.NBNHXPS9OHOV@kernel.org>
 <b476ead7-f9af-4194-a848-dcb3f415cd34@nvidia.com>
 <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DFQACNZ42CNK.27BOZPAO1T33R@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0158.namprd03.prod.outlook.com
 (2603:10b6:a03:338::13) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|IA1PR12MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 709b3cf4-d0ca-4818-d5f6-08de553c08d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aEtCWVFsWWNwUTV3T2N1OG5DaWlFM0kzeFNOQTRvTXMzZnkvTFZvbVNLcjdT?=
 =?utf-8?B?VXpUNFBwbS9iWnRNcXY5eEI1RjE1dkpqLzFndThybS9lUVQyUndnT055K1BL?=
 =?utf-8?B?N0lUNXozMzhSWkFaMTgybnFDZmtIMVl6MERvakZyK1RUYzBIRHNoRVNmeXgx?=
 =?utf-8?B?S2NjMHJmYjllZmV6WEowdk1QYk1VSHJqcFFIN0JJd1hzS2hDVDd0NFduY3Fj?=
 =?utf-8?B?YTVxc21MdUp2cWlyQlZyMkZPd3BWbFF3bHpHeWI0R0p2SENoMWY1TjczSmxq?=
 =?utf-8?B?Zzh6WWtHWlN1TGNHOHBzMkJJV29PalZSejNGUVhRb3VLQnVsRVpxUmlMK3VX?=
 =?utf-8?B?Nk1tU0FjRDAwTUxabE1jckM1ZVlCU0lpc29aMHVhUWRSajRnYm9FY1Q5ODhP?=
 =?utf-8?B?Uk1rMjh6MDBERzRXeS9NWExSYXJqZlZmaWI0bm92OE53NjZodzV1YW5CUFlt?=
 =?utf-8?B?UmJDcWx5ME9ja0J1U1pIa1h0OHl4Ny94cnJISVNUbWhTeUF5QzBjelpUMGJH?=
 =?utf-8?B?UE5aRjR5aHZIeG04ZkgyNnpTbHF4dHV0TWFFcnpHVzl2NGxSOWlaK0EvSlNV?=
 =?utf-8?B?TWY3MDd1TmY0M3BGM0JNSFJLQTU4cERYV3Nrd2pxS2lmQW9kRTYycUpyRDZs?=
 =?utf-8?B?Ly9tUXJ0dGlIY2tJMitnRHFoNTZwZWNLa201ZEtwemIydzcrT3R4WS9zTWcy?=
 =?utf-8?B?eDJ1Qzk4TlRjbllBVGRtWG5LSFNUdXAxTlppZFlJNkhKK3E5eE1LazNNUEFp?=
 =?utf-8?B?Q1NObWhURG9UT3ZHRlFKUzlNeGdudEpSMHgvWFlDbXVOYTBrYUJpUXA2ZU9V?=
 =?utf-8?B?QTdVRVg0UFMvZWVHTlJORTdtd09OUTE4dThaTndZazU3TTVJVnJ1K2FXVXZ3?=
 =?utf-8?B?WjAyYWFnWU50cE51VTFwUTVaSXcwZU1NdHhZbmRlaGZyMGo4K1drMkYwWmFT?=
 =?utf-8?B?bGVmT25xOW5TejhzZmJlM2FjaXBtZlh1K0FDc28vUnA1SzB1U3ZyRTJOMWtT?=
 =?utf-8?B?bDVrb2NsV1oxZEk5SVNpYlA2Z29RQmNpNkRsSkxkMmFWeXFtdEJIY0dhWm5n?=
 =?utf-8?B?UGVOWnNiVjNZSEVwVkU5Uk85K1dOWUJGd0FIMFhoR1BENDU0eGNDaUJ0bjlo?=
 =?utf-8?B?T0RnZldyaHE1em1BRitlSlg4QzUzeEY2R1oyckNER3ZsamF4WmJDTExtWTY2?=
 =?utf-8?B?ZGp0dHZ4Mmwzd0ZMV3FDaVFLb2ZLNEFGRU9NRDlZdjZiUFdtallyK1VxQmpR?=
 =?utf-8?B?a3ZGVTdEYUZrYzdaTXpMc0dQMzBJS1BhVjBiOTJOckplYzJLckwyMnFYRXl6?=
 =?utf-8?B?VXBlMWphcWFFMk9NWmRqY2RJRkN3cG9HU1J3Z1ZhajdSaXFKeHlvcGtPeU9V?=
 =?utf-8?B?UG95UWQ2RVAxdUlLbWxyYmx6NExkMHdGTjg5c0wxcmE5cStGcS9DY0FCZmJ4?=
 =?utf-8?B?bnRrRWgvSmJNZEc5U2pkR2JXWHRpU1BWOXFkS2lnbW5qOEdacndtS0ptMVow?=
 =?utf-8?B?NG90MXZ6WUZYQzBxZDREUXdSZnh4U2pvMExzbGRxY2dXNnNxK2hpVzVlbTBY?=
 =?utf-8?B?UThqWGZWaUk4WmZ4ZHhlY0loVnhYKzNvUG5JT2k3dHhLcWJKOFFmSVVvK1ZC?=
 =?utf-8?B?MUtRejYwLzRYVE5ZOXVhbUtyZytzRC91NmI0Y2tZQk9EZGt0YnpDcG5YNC9C?=
 =?utf-8?B?Sy9NdGFRd1RCQzdNYVFRc3c3eXNiMUhFRnBKaW9YRTM3NkZzNk9NdUNtVFpi?=
 =?utf-8?B?YVovT1dQWitaK3FkMDR3L2xIc3V6MklzdlhIaUZWZUl4aEJFYkl6V2hVVGtP?=
 =?utf-8?B?Q3luOTBWdE1hV3RzRDJXekEzWi9SSkFkZk4vOW5OUDJMTEZlTjdXU2VLRjVL?=
 =?utf-8?B?NSszTmxnSzQ1MCtqUThHcU5xWTNFbFcxbUp0aHBkTE10T2N5c1hOcUlDSG5u?=
 =?utf-8?B?TDB2eWRaWG5WYW9BWmRtTGFPM3FmMjhveE52VDNDQWU1UmZuejYxSUpmNWor?=
 =?utf-8?B?cjFnc05LVG1WZFVpNUNQMzErd1NhbWlXOTNLK3RjdzM2NlAwT1BUd3FYZnQ4?=
 =?utf-8?B?T21kM1F3YTF3UFJJWFQ3RDVIQjhSRnV6TW8xZmFwSG5HVXlyVXM2Q1NaaWRz?=
 =?utf-8?Q?PXS4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?endGSWdBU1hMQU9EZXl4QXVGQlY1OGlvaTZOQlRaWW51YjBrNnZEVFNCUjlk?=
 =?utf-8?B?ekpPY2pYT2ZxOStHODBiWktMOExNZ0J4eGJLRExFNW8yRWQzMmxsU2dIeTNL?=
 =?utf-8?B?MWtWUllWYS9zZVVtVHRGU0Fqc2hDMU5XNVE4a0tpdjY5TWpKNDRGQXdMTDg5?=
 =?utf-8?B?UE5YdWhZeU1veUF6NmF6ZVBuWFZQR0ZTR2EzNXJtMm81T2NUWGZaQ2g3ZHhv?=
 =?utf-8?B?VjNzVWJJL0FrTHdwQ2t4b3FzWGJSc2I2RmtENzEyOVJCRGw2M1o3NDhhZTBZ?=
 =?utf-8?B?YitrcWxWUEtWL0dzc09ZbDcyelZaTWJCSTN2amE5TGx4b1ZTTm1yU2JJazRF?=
 =?utf-8?B?NEhtUWE1OEdFVDIwSjZ5WThmM3RIRzJBeERZckRLMHRJNDlWY2l6dHpINVox?=
 =?utf-8?B?R3hRTHBvSlF3RzFNdGFPYnJYL3hhZThpSlYyZ2JYZlBaRnNkTjh2WGsxRGs1?=
 =?utf-8?B?Qy9oMU1JY1VUU1pYbzVMYWtkS2poZk1nckZTOVlrRmxvSWpvT09nY3huMG5X?=
 =?utf-8?B?K0gyeElkRXN5alRyS2pCL3JBUGkzLzZIYWgrMkJxbU4xWHBJUk00WUFobGx0?=
 =?utf-8?B?OGJBL0JTUzVQR0U3d25DbkhPS21rcDU4emFWODdEN0pwUzVLME9zeWJNbWV4?=
 =?utf-8?B?dDlvZDdrTUZUV05NdE9DUUw0TldwYldIU2w5OE0rbFVDejhNYUdkRXg5Q3pW?=
 =?utf-8?B?M204cUZiemVFblhoZUd0ODRHMlpJdjBKYVhtd2NMRXlKOWI5UWRBZ3lNOUI0?=
 =?utf-8?B?RjRsRWZXV1VJQWVwQkZJUkVtNEVtTngxd2ZsQWJ5Q2hjWXZ2TkxML2gwSmt4?=
 =?utf-8?B?ZGR0eVhkQ21ZaE1CSUtza0ovc3BIYTFsdmlPOCtkNENxM0tyQ3JyWC9PWWw4?=
 =?utf-8?B?YnNPTlV1WTI4T2h6cnBaUUpiTG5nWnFYT0taLzNlcUl0WDJVTzFpc3Z4d2Mw?=
 =?utf-8?B?a2wyenlIUDVwOVVzdWpGV0ZTU0pUMXc4R1VxTENXM2xIcEFlRFZ1d296ckhY?=
 =?utf-8?B?bFN3bXlMZTBHVFZ2NjFySTdtSWNWNzJYZlBwUkpBa0RNLzFRcm5TRllMb2hG?=
 =?utf-8?B?N3l5eXJSSjkwNVVuaDVZaWN6SVdvd0NuOElBTjdYR0YxeWE1eFlLS1k4V2sx?=
 =?utf-8?B?emxYazJyaFRBY0liZVJNZXBXQzNHSzN3S05mZGlvYnZ5YjMyZ0ZMbUlzblVB?=
 =?utf-8?B?QXI5KzgyeVFDWnRZZERPOU14a3VheHVvc2o4MjJGMUNHNXBsZ2RscW1OaUdx?=
 =?utf-8?B?a2MyakZZcVdTRVlVdkdQQ2I4WlZEYlFEdU0rMTJaZ1VOODdDa0VTNUxlNElS?=
 =?utf-8?B?VzJ4RUZ2ejd2cnl4dkw2N3NyWllmVDdMRXg5SUNlZnBuSmwvQVR2dnJQZXlB?=
 =?utf-8?B?M1JmT1JVSmdMOUVwaFF4ckhBUC8wcGdSTDZQdldSZXBzQVQ1TEpUUXhTTXVu?=
 =?utf-8?B?U0pqT3l3YTljR2JKUm9saGJNU3FVUW5VSy9nOTRoU1V5RzI4dThQYmplRUFK?=
 =?utf-8?B?RThuSU4xaGlqTUJoZnZPYVhlMStFb0NiMnE5Z2RnRWVZbklDdTg3eXUxQkRX?=
 =?utf-8?B?cWdCU3dCSEN1UUx4dTBXYVVQOVdXR08zeTNIUjNKMjdmWWVDcHdXQlB1MXhG?=
 =?utf-8?B?WnVSTStYWlJjdm1NNEQrVUhFV0JqbjdoZmtvL1duQkFpVzVvclJ1a05Ba3dl?=
 =?utf-8?B?R042bkJ0bC81bDIyYVdObXZFd1hSd1ROdDlLVUszUzdFazZJL1RXZzlRcHd4?=
 =?utf-8?B?eWxuTTZabzBOQ0tBYzloR2ZVck5hU3ZCN3paZEc2TlRja21kdjY0eTVyN1Rn?=
 =?utf-8?B?TDI5VytodDNnUkRNS2hJbG50RHRlbEE5cEVUODArQzFxb2UreHlMYSswV2Ux?=
 =?utf-8?B?NVdDV3FkcDJJcStOZjNSVkdEMFp1S3pJa2FEalZNcjFzQmRiZjdPUGNDUDBu?=
 =?utf-8?B?ZjZ1Z2VxMUlSKzNQVnlzWk9vMEMzbkY2TmRDa2FYQytvaVYzRCt3bXUwcUJR?=
 =?utf-8?B?NmlNZEJFdU92MzA2UUJwZURvSmJCN3pSa1FaS3JuK0JwZlphVER6SkpmRDIv?=
 =?utf-8?B?MGhRa0YzZkZnVUpvUTdLeXAyeGppTytLM0gvQlk0bk1FMUYzd2xieng2V3I0?=
 =?utf-8?B?bFhRRjBrcmUvbE84UEIxQ0ZZTUlHRnk5aTNKMEFpQ05ZK3g1d3JkSExsaFI3?=
 =?utf-8?B?QXlHTVlzVE1PWkNxSnErL00weUE4eEN0VklyR0ZobkRkS214ckhtRlJwM2g0?=
 =?utf-8?B?TlhjUjdHU0dYQnc0b092c3BDUi84SVJTV2FFcVU0SWVEckt2dy9aenJLSXZV?=
 =?utf-8?B?TDZxS0pBNzBzK2Uzay9OT1NaTUFWREZ5QlJodjFLRjdreVZ4M2Vhdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 709b3cf4-d0ca-4818-d5f6-08de553c08d5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 20:15:47.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m3HTBD8SazfHGfUm01ibe7A6+/wVZ/fEWB7bWbDCqto4edYb+RE4+/xpv8tIR7UHoYVzViZAZBScDxNHj7p3Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6210
Message-ID-Hash: U7NS42U6K7XUYUTC5RUUSSR2PJSHABO7
X-Message-ID-Hash: U7NS42U6K7XUYUTC5RUUSSR2PJSHABO7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U7NS42U6K7XUYUTC5RUUSSR2PJSHABO7/>
Archived-At: 
 <https://lore.freedesktop.org/9489bcba-6c0c-43b5-baf4-5f1dc9a888aa@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/16/26 12:11 PM, Danilo Krummrich wrote:
> On Fri Jan 16, 2026 at 9:08 PM CET, John Hubbard wrote:
>> On newer GPU architectures, we don't even *do* a falcon reset, fwiw. For
>> example, on Blackwell, the GPU's FSP reboots the GSP by itself. And we
>> don't do an FSP reset. So we are all out of the falcon reset business
>> there. :)
> 
> Great, then let's add the reset() function. :)

I missed something here. Could you elaborate just a bit more on
your proposal please?

thanks,
-- 
John Hubbard

