Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25ADAC42777
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 06:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF4D10E347;
	Sat,  8 Nov 2025 05:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="q6Skm6Hq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011044.outbound.protection.outlook.com
 [40.93.194.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20ABA10E345
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 05:09:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0lrWRwIVPKRXqpPTYtbDww2AHPaDaTFel3U6CBPeBXiNmV5QMv6Wfn0PnC7+6C0UAePeByOEpQE5FezNomfnBBrsgDlXQ71Wf4DaJ7XnKTzIsiJ/N2DxmC7XwgjuYUIMHJgOhxFYzfisXgQcUSDyyAtc/tRwS+h2fuvsOJCW1ehELvjXF1zg/0E9DRP7bPaLNXQu1tkViIaRtYzV6CvY6dUYLdr+xI183W4JYlg2H+iNjkpQ3vzIAjbV+chK0H9qguh8l6OBw53iVT/BzBGc5DAtWcLpjXJCcp/XVFeomzkyiLvc0+RUto9OOc6xoavbpqkMWOZVcp3KIHKRgMn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo+MxOrUPu74chRESEe9063TjnJJXycA6sABDyX7BqM=;
 b=evQy1M+TuB0IU0/UhC/xniCG1LkkIojGom2vwxZhpwd8U6f/IRWEgm6/xyQ969GGkrf5r8w5NlNvBWd3HjsAMW+0a8N+LeerNJRn4y3/H+eQf2s35tZuTuW6vDpDrQDjWbfo2vMN2Dj+eQTD1uqRjY7UufWuTfeukXop0yqVa2LJSHswpV/80QHE7E1m/c8qWCyGlXFMGA9RtDbC/IrWm2XXIQBBf0kbkJkArAHUVrxNfX0HivFgolYGUFOnfvmZbTKsKI5X1DwfUcb8+PeSo/I7W0oYtVIQOSlx0+IqHZIIArLerLzoW3jgxrxOuQEY0HzoKnq7Ic8e7rzTtimF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo+MxOrUPu74chRESEe9063TjnJJXycA6sABDyX7BqM=;
 b=q6Skm6HqxENyXXnHzrihJ3t/KIdMzzyfVKA/jzwNZwok8Ta+mWKlT6tjP7cDsJV/XQrLngMib0shYIOPiZI/j/7KyP9j7J/x4fblaZ4/irH8k3/KTYzyrq48cgst0FZYwQSmbxH+QWVoJav7lyJrfPp1sc6S9ZGs5AWigdGAPIFqtSsUj9UW7GQEJ6RgYsJhls6rWazvFo+ohbKceZ+bS/gLktsSBtQQ+nGJapUSd4EbXPX8zJmiFM4i6GQLjdS2sxVpho/XM2CRmArDNV+xY56rTj5aP6dfxamELr8Ei8VjNR0ADUPWhvi6VVtwRz7oxEAkyOckpTrS8+KO0PBCOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DS7PR12MB9044.namprd12.prod.outlook.com (2603:10b6:8:e3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Sat, 8 Nov
 2025 05:09:12 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 05:09:12 +0000
Message-ID: <05cdeb51-2731-43f0-b24e-53534b524a44@nvidia.com>
Date: Fri, 7 Nov 2025 21:08:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] gpu: nova-core: make Architecture behave as a u8
 type
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251108043945.571266-1-jhubbard@nvidia.com>
 <20251108043945.571266-4-jhubbard@nvidia.com>
 <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <5342a0f10a3e9ef7d3165bd8912bd042ae7f68f5.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DS7PR12MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b284846-3128-4dc3-a4b9-08de1e84f46a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXU5Z3IzaHFyTnhrN2YyTjV5MHBQV0tEbFh6VzBaYkRHMnZpYmV5ZlRGbk9T?=
 =?utf-8?B?MlllWGZUbTFXdlJvVERPeHdadE5tVHl2QmtvWEMwcjd5ODlON1dhYTAvYjJ5?=
 =?utf-8?B?L0kzQXNaRkw5UVNqTWx0d3FoK0d5RVVHU0cweXVEQTVPbW1SL3FUcWI5TTVW?=
 =?utf-8?B?ejJaV0ZMeEFscnY2YWh6TEJ5TjVVWVpzQUpmWElaZ1RHRlNydy9IR2p4SDVJ?=
 =?utf-8?B?ZVVQY3Q4QjA0TWNQVFRrM0F0K280UG12b0dzRkFwdFl2MTJQd0d4UGEwTjA4?=
 =?utf-8?B?R05EZXIwZEpzcG01Qk00cFc5QkpMRWJjM2tEb0t5UlZUMHQ5Qm9TaTRWbGJB?=
 =?utf-8?B?ME1kWEtod215c3pTd1h4TG9UcjBMZFU5a0lPdUNZNnJzMDZyVzcrRmUxUVFW?=
 =?utf-8?B?RU1JZmNSSDhqSVVnTTdvZlYwRXpuM05hSlYvZHhLNXpmV2tuNjZrdEZyQzhP?=
 =?utf-8?B?YzBxNk9vb0dmaXlJWGU2SUZaRDVpOTI5S0xDMHBJYk9KdzlQdExqaGovQ0xp?=
 =?utf-8?B?WWhDRXJPNVRxeE01ZFlyM1RFU3FpSHdxYnFkV1Q3NGZrOVQ2Nkx6RWQwWldH?=
 =?utf-8?B?RkNrQ0FRWkR1QXdVUHdIUFJsM2ZHM3hKaEZuZkFrWkJVMjU3cktGMU1ybEpO?=
 =?utf-8?B?QmJEdzdtNnBua1FQTHV6OWFXZGNYV3ZjS0FnRkIvcGlWaTFZZ1RyZzR1UW1h?=
 =?utf-8?B?YzdNSHp6MEhUaGxCdVVQeWFYZC9yM3dtdlFtL25BbXJlc1lqNFpNOFUrOWVJ?=
 =?utf-8?B?V0pUZDJnWW9aVEZhb2MyNjIvOWo5RXlyNXQrSUtuOVZxZGdmUXRBTTZXR2Yr?=
 =?utf-8?B?ank4RS9Xb2hTeE9lT2FOZ1hlMUpZWkRiN1JtZ21CdGZvVHA1bnQxSHZrMjNQ?=
 =?utf-8?B?M1pMWEVER1BaWVV6YVFVaWloWUxuaGc0eHcxUE5nZ1A0WUI0T2ZmdFREejdo?=
 =?utf-8?B?ajhVWFFTNHVza2ZXVXdKeTBzeloxTE9qRm1aY1pwdEdQcTZ6OEJZMFI0Y0Mr?=
 =?utf-8?B?ejlwYlJHelR2RmtVdGxreGg1azBleUJ4ZkZraW5KYjRaZ1phR2d0KzJSTm1y?=
 =?utf-8?B?aExKSUxESEtGeE00QSt4cXZwdEI0VDFDN0NkbXBKTDdHZUJkdzBBalpNODdI?=
 =?utf-8?B?UmlzcCtRQWVJc3pOS1U3TnMwY2dGQlhGaUJPNDdodTkvN3BXRmtHQmN2TXBJ?=
 =?utf-8?B?L0l5UmxVekN3TjExM1FTSGNTaFpkNGZ3amRaMndYb3E0V2taOU9DWFhWQXhZ?=
 =?utf-8?B?KzR1WDlMNytXY2dIRk1OYkV0dUxTUXM1SjRBS1A1WUdMOUkyZUhUcmtJclFG?=
 =?utf-8?B?TGowRm9rVU5qM3VCdC9oaVJuYW5EZHdIRVRORlhYNi84QVFwYUhaUjhPYUgz?=
 =?utf-8?B?SWdPTTRmVVN2Nlg5QXNsYlc5YXByRjU4Y1JrUjBqQzBXakVINGlOc0ZxOGRB?=
 =?utf-8?B?OUZ6aUVRSnVPb2ZxWXIvLzFVKy92eS9XVE8xQzUvZUpsS1BLVTEvTTRTZThY?=
 =?utf-8?B?NmxudmdrSjlXaFJFaVZiNDZnZzZlTk55S0h6aStvMHJkTjVyZFJOaFAxaTdn?=
 =?utf-8?B?THlOeVlod1ZYTXhIdlM1Z01iUEEwMzUzUUZtV082ZWt5clpsbk85NWcyOTNx?=
 =?utf-8?B?TzFHTG1xMEtCRXgyZ3hxTjNXcmFQYlBnOE5GUU5rZlhKSkR3ZXQyZTFXUk51?=
 =?utf-8?B?clJVbHVocHROd1cyLzZidGNodzNSNVFHNDFablFkeS9Pem1kKzFXM3NidUN0?=
 =?utf-8?B?SWhkSSt4M1c2RlpzcGxJYkQwUzJRSjNvTUlNOUdHdXI5aGNJZlpGeEg3OEZT?=
 =?utf-8?B?eGFlcFR1aVlVTWhFRXJORVlnRzJEZW9OODFSSk9zcGVBbkxoSy81aDVVc01z?=
 =?utf-8?B?NEovUjJMTCtMamFiNXFRdjJQdnBoaTBuQW1ia0FxMnA1eTBsY1dnYVhCekF4?=
 =?utf-8?Q?VFUkjBMbS3f9MEYdcRUpOWiQTnc60eGt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MTlQL2tiWHRaWVRjT1NqNEpJWk9oZTZxM0pRaURHcnhIcGIvcU9hK3VrWnB1?=
 =?utf-8?B?WDNhZmhNRWF6THJybmRnQXgxUGdtK2RrcjZFb3lIT3BFa3BjMFl2M1lTTkN4?=
 =?utf-8?B?MWFGSmlXYVRpQlVDZzlhelNVRGtFVVBXNm1yTmdUYzh3bTF0Wkd2RGpYUnFv?=
 =?utf-8?B?WFA2cmk2bkRwcW40SGtDV2gxb1J6UExXMHhkN2JLK3RaSjNKb0JZVDFUMUI2?=
 =?utf-8?B?SmtWU2JYb0JYeEg0N1hFZXdiQU9CV0xPeGlTQmdtRFVpdnIzeVdQSGJhT3BW?=
 =?utf-8?B?a1lWNUwvZXYxTHkvWUpTMFluM1ROdmZ2YVNFVDl4blRZMUxMQUZYZFJwaUF0?=
 =?utf-8?B?ekdKQzRBd0RJMXdSQThzQ20ySlFHK0hBdzI2ME4vb0Z2dkxDeTA4SlpXZ3JG?=
 =?utf-8?B?cmZJOXlEbUt1elpmNlBQWE5MR2RGYm9hZVFGNHR0N1ZQall0QTdyK2hrV0No?=
 =?utf-8?B?aVJGQVFXdk00T1oyV1IySEp6M0pUSlRPMHZ3c1VqUXNuSTRoT29ySGQ2YUIv?=
 =?utf-8?B?K3QxV3N0RnJSUlo0bXFicVpBRmY3c29YeXFvL0JtcjZ4WnB2ck9TUXZzZzQ1?=
 =?utf-8?B?Y0FhTE5hc25JT1Q3TEhRbWYzYlBvOTZ1b3UxZ0NJYVM3amxWNnByUk1GTDRB?=
 =?utf-8?B?b215cUxIdmk5NHFDeWtYWFFJVDh6cWFVRjVtNlpMQXF6S3lYdkZUMUpjeVZX?=
 =?utf-8?B?YUxTMk1sK3p1U1NnQzBydU4wbDY2cG5LcXBRb29jTzJzWmVUck9oQ1ZQazcx?=
 =?utf-8?B?amNDcktCVlAvOTBmMUR0dWpTYS9FMFJhSVZoa0FLRGl5WUhFeUZhY2JlY3Rp?=
 =?utf-8?B?QXJnWGdhejloclY3YXROb2pIUjRhU3BRT0I1MVZLRE9wN3FTN3REalJINkwr?=
 =?utf-8?B?NDI4VHlLKzNjRTFneUpVUkVSaWIzNW1xVTN2b0I4RG5neVg4YkJaYzdCaVpw?=
 =?utf-8?B?UEo2cnB3RzVrek1JZURGWlplRElEa0ZkTUZHbGlZajYzRlc1dTZsRU1OT3RS?=
 =?utf-8?B?eHpjOVFlUGxmWDFXbW5uZmwxbGtqTzFOS0dQNmZqQ002Snd5TDF1Tmsrd3hG?=
 =?utf-8?B?cUJKVlkzK3hzUXMySVRRWUJ2Z2gvL1RyS1lFSDFDc3F4RVhYWTI4aEFFWndN?=
 =?utf-8?B?ckZLcGM5QjE0SXEvdUlLS0lkc2REMU81Y2M5ZENTd2lxcXB6SHIvc3BJMGhD?=
 =?utf-8?B?VVV3TGEzbGJEL3M4Nnh2ZThiUThCMm9mU1I1Rys3UFhMa2ZmWmlPVnNWVmhD?=
 =?utf-8?B?cHh2L2w3Ti9CUm5UaVZDbzdCalRUR3J1ZUdYb0pkSXFOa09JMHpma2dET1Z2?=
 =?utf-8?B?bGd4dnlLQUF0cCtKdUFBeEVPWXpxSGhKN3dTV3Z4ckwxMHlrbThmbG1sajBC?=
 =?utf-8?B?SWZzNERvYTJKS0VOUTZwOVYzMis0S3FTMGcxaVZBZytvMzN1YlRLcVJSNGhK?=
 =?utf-8?B?V2dvSFVHbmFrbVhVT3RYVkNMM1lQWEczYVpIT2lacy9XcGNQUStEVWNTSFRr?=
 =?utf-8?B?YWpGS1ovcEVPdS9GcTBEMFZyQ1RmcDh4MnRENy9mYWkwSXpGR2tIWW4vZ3Nx?=
 =?utf-8?B?RmNiN1QxemczMjRkR2lHYlRpNWVHMFZZbzZVSGswTERFSzlOSktnQjR6VW5v?=
 =?utf-8?B?WXdmSlhNRW8xYk1Qald5MHpsc3BqL1pkVGZUSHNObzZSdTYvTWo4STlDZzgw?=
 =?utf-8?B?VE9PdHZ0SGRaNDdWdTVaQW1zT0I2MWpCR2JaMlduSXNmYXNjWjB3MjNudTZZ?=
 =?utf-8?B?SHhmaVVlS3UreFNSQmhvS3Y0bXlWc252ZGRIZkI3SHpEVDJ3S1k2RmRzN3hB?=
 =?utf-8?B?eUk3akxsbVZsRUJLYzViWlpzQ2dSdnhCa1owMXpHYy8wdERoN1VnY2FGQ3NI?=
 =?utf-8?B?UzFrWDE2bXU5WWZGMmtiUjRwcTJqN3NGVkhZRjVIZnp0cFhJTWNFK3F1UDJz?=
 =?utf-8?B?bzlvY3NVdXdiNFBQNHBxNGJnODJrVkNhY1VWMUV0ODlUNVZSdlkvSDBoS2Rq?=
 =?utf-8?B?cXhhdnExVFB2Rll3SURMRytCdmluWVlKd1hBbVRiM2lWTWdQclAvWUhIUkhy?=
 =?utf-8?B?MG1ueUI4QTJkb2VzVDNrekFyZjdKZU9kaVROMFE4RUdYWWM1T0U4eGFZRlc2?=
 =?utf-8?Q?5VUqqzEnLsCk1V/bTZElFzNxX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b284846-3128-4dc3-a4b9-08de1e84f46a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 05:09:12.0022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dnlwAzdzo6ejVMCCUsL05T3JaYnVBHyAgFHAYBJsHTYdgk7rxFqBdeCJvCjXUXVccXRLfms0FvStM0iwGUqGuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9044
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

On 11/7/25 9:03 PM, Timur Tabi wrote:
> On Fri, 2025-11-07 at 20:39 -0800, John Hubbard wrote:
>>  /// Enum representation of the GPU generation.
>> -#[derive(fmt::Debug)]
>> +#[derive(fmt::Debug, Default, Copy, Clone)]
>> +#[repr(u8)]
>>  pub(crate) enum Architecture {
>> +    #[default]
>>      Turing = 0x16,
>>      Ampere = 0x17,
>>      Ada = 0x19,
>> @@ -142,6 +144,13 @@ fn try_from(value: u8) -> Result<Self> {
>>      }
>>  }
> 
> Does it make sense to designate a default Architecture?  Turing is not a fallback for Ampere --

Definitely not! However, we do want to use Architecture in places
(register! and bitfield! macros) that expect u8 or u32, and that also
expect to use integer defaults.

So that's why we have to supply it. 


thanks,
-- 
John Hubbard

