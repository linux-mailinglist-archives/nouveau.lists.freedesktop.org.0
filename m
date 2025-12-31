Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D9CEB232
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 03:59:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46C5010E7BD;
	Wed, 31 Dec 2025 02:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B/J0udFs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5CA7844BA5;
	Wed, 31 Dec 2025 02:51:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767149465;
 b=gOIE1l8EsvfzFvlX+PhpDoUbldNa2XLNZSXNbsBSIgS2Moa2WgRoJCBnhzNjRPXawqjcf
 bw1tIX3LoO1ZO/ID1a1rrCOxvuRJkXknrfafbGq7y/4G/NGiIzr1Aqdp4qErjihOMvmdFpH
 jrmCacj48ZDDr+SZoYMGXCbQ8pQbgilxeB7MrhDmD3pigzo//YbC9orWC+jGjqqv3N45jqu
 1oIO97cy3zxfWejD6OgehHPPv+X+nmSeoqiEZSwxdlrz/MHq1fDMAG3Q3yhlaljHW55dyk8
 ayfSg+1eZ2ZK8iyu/kNVamYKrZZY0Mpbez9t6LNyVhEzPFXjWUsVkiHWah2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767149465; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oAWI5ErDc3oBtzSrebzNfx54mJ1t9hUznTNSojwxYoI=;
 b=nEnLb0DUpt4Q8H8jH6j/Yd7t8w/jy2WPMnpIXmemX1zdcFD4ksOMXoKKds7SSSVd9fCm+
 ULR25PLP/QCVORcXB0g8XNSWhUchtAOv1tEKvfX1KqF6/E4aEFuqOGM1x5eOYOFgPzdLGzE
 CbPZAE2FG4nQOV4TxyVyj1GVlPMOBkFsLuDOMEsrlnTMSvsVWf2f754hv9AUBEkRcGYaT9F
 +4tDL0AUsHN1N46LPJ+/y2XAOM/NW9IG9B4ZMTLBo3Edp1CGeo6E9+GP9zVdB1dQOgUIYkG
 zAOtaCzNFcVsPWlkItGrBjFq8IiI63/R6J2BqNR6zvx2TJFS2Xy9muQJUNwA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 50AE844BA5
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 02:51:02 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012000.outbound.protection.outlook.com [52.101.43.0])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CCE5010E0DB
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 02:59:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7BIjhdV1KzWDzfwTP3aKY0JeP985QiZ9rdAOJC0ykt3bA9gbRnxQT0kTQDomqPHdyL5zWQHysF29X+OczMEf2oC4s5liBx6M1Lvo2ZGsVKj4U6S9P/DN8oESqMauU8kHBBzqZ52q36m7b3IFMxZc6T3D6AO5MCiV5lmdKNK3A1gysat3CjT/EcqKmG7iRRNChZha6uV3hOT7INu6NoTTq+eIp6fCPs1ye81zlnHVuO8iz5tUKr83/3GczsKCoZBzFQHtvaVZpx3xqCWWFnaxgHuMxkFdwNWZkaH1unkOkZWLlP9rxezxvDhNS2hCmUeseFUjcgtqO2CxIuDRBWxrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAWI5ErDc3oBtzSrebzNfx54mJ1t9hUznTNSojwxYoI=;
 b=dMiV8Lq6N15sG7iqmzTK0bUNFg+Y6Ag7fWGMfFURNV5lZrPDm5i4DbAKeJZHQh3qqYvFp9MbBA9MjPCVF0ZhyRZHXcvxe98g/+9XAd6PRy2xM6oHZ7sqd/zTp7J+yOcVJn6aN3zWyW3ixh8uLlEbURNnzTbtoUkxmLLJbSXsdts5nOK5Do65xFnCYE5ghixeHx8RLvj42aWHizTIsM5GDNHqVsdNV95MGEfjM2b73oBNGiVVrbkCxzwG/DW6mz97WiklKGAcrzoYzEbVrFG4wGrAGp5DqbbLxEfUcA5iBgBqYgWnDN7JvKavZrussVZalhOvrRqBvLi8ch81/9kQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAWI5ErDc3oBtzSrebzNfx54mJ1t9hUznTNSojwxYoI=;
 b=B/J0udFs5hYhiaJY9OgmHUwZHsauOLqZ2n+cJCrgYTRe95FpLGAUWiIYI+inyNhK1o207WSFa5fUqXmr434Nd9cFDxxnk6Vuhac7RLM1qj8m/UTRxZyQElphPJklm2FkPrFv1e5t99o1gj7oEawH9qXPyTm5SSMLzlXeG2JO60jWkUk/7gQrwS74Q39Y0r6d8DPpdo8vCDC67r8imPk6DTCd+25iPEVW77X5S2U4wIFdFmsSRJjWMhiWu+QcMxF57WtF6ZGLDjS92v4Jq6PAFSodb1bJ7+x2irrtU0s12ljArRjmULjS1z4rWPig5LUAWt9oxb4LKLWDvtRfqJ+Rug==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB7016.namprd12.prod.outlook.com (2603:10b6:303:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 02:58:57 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 02:58:57 +0000
Message-ID: <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
Date: Tue, 30 Dec 2025 18:58:46 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0225.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::20) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB7016:EE_
X-MS-Office365-Filtering-Correlation-Id: 5510d6e5-a91d-435a-0129-08de48188a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1lOUEQxajRVWW90MzlVMmtCaG8rOHJuc1BWVEsxT1FtYUJFdmRuYVlsbDZo?=
 =?utf-8?B?RGNvYlp0cVNzWDJnai91VVJGUjlKTkZWQ1JDejQ2c25EeUtHVzFNUmgyOHEy?=
 =?utf-8?B?U25ERFJQNCtvd2dqY29zVlAxZTQ4NzFuWkpvMXpRTWRqODE2RTNJbCtFREtQ?=
 =?utf-8?B?WlozZXd6TzZMRFZhODladXdsVjJ1M2pqSEJzVjd0czBicmtvUzJmZ0FYekhG?=
 =?utf-8?B?bkRIa2NUSFNQbGtXK0hCclFPcVZ5MmtkdEtjVis1Y1B1ckpQbkpmUmpQUnpL?=
 =?utf-8?B?SHkxbmtYckJJckM4a3R1ZEYzOEd5ajhqV2k4QzdBSXFjcGlyTVNkNmJWcWtB?=
 =?utf-8?B?T3hNclo1WDRra0FZUHpIOThBMmpxWG9UUlB5UnlKTldQbkVQS2YzRVRvSUth?=
 =?utf-8?B?bnB4bkJjZk9BOHpCbjd4VXROZFRTMWpnU2VLeHJweG9EeDcyd3hrTTNMWkNX?=
 =?utf-8?B?SmoycElnNkRzamxZU1lrVWQzOEVzSUQyelJEVGN0bTFiQ1hIS09Lc2xlUmVm?=
 =?utf-8?B?STVZNURvelZsTUdFL1ZJejBBTytwUWZqV1ZjbE1lSE1QM3JEUWFLbjdSRXh6?=
 =?utf-8?B?Wnc5ZFF5ZTJCWG01bG4yRzR3Q3QyRXBlU3dtSjM5SGFydE15MTQ3ZElVaHhk?=
 =?utf-8?B?ZG85cGpHWm16QVI5TThnOHVaUDA2NWRJSTBhcmoydFArcW1KNW1pYm8rYVRl?=
 =?utf-8?B?WTVVM21SK2Y5SEFkb2Z5eHlJbFJ4b2R4MXpoVG5sOHZKY3k4ZGJxVU1sRWlK?=
 =?utf-8?B?RUJkUHRpdnY5c0RlcnU4VkZBSnFDT2E2R2xqZ01Jb3o4N1BUa1lPbXZ4L00v?=
 =?utf-8?B?VklKR2FuempZUlVhZVdha1ZBWTUrZEVtaTE2SFA5K0kzcFBlcEFxR0hibkxV?=
 =?utf-8?B?UDY5SmhjSS9OWDYvTVBBNVFFaTZBbjJlc0wwRGNLUk1hZFhqMFcyMUY0UkJS?=
 =?utf-8?B?a1kyTDVTTkNNL20wQTJCeXJLVGZQSlMyemVyeURBMTlEa01XdDNnbHZZS1da?=
 =?utf-8?B?OHh6aERJOUxwUDN4WDF1TmJHSEEydWpmcGhaVHc1SEh6b3pDaWx0WXFycGJm?=
 =?utf-8?B?MHNCL3JCbnVFQWxwbnBlOVpldkI3UHc5OGlVcGg0VXhWMUE5K045Y1pZa0NR?=
 =?utf-8?B?SlRHZW5yNFVWNFI1dy9RbVJ4TThJK3M4NWpaRkhVc2VqTTV2ak43NFVucnNO?=
 =?utf-8?B?dU9hc2NBaDQ1YUFKYzQzOFlNaUZ4Qk5PSnh1OVZSZVI2d1RDUGhPcGI1cm9B?=
 =?utf-8?B?Vko3eGp1cnIwRHN1QWpWcHVYUWVJYXU1OFQrZVFQaXlBYmVRbmh3RlR3NXlE?=
 =?utf-8?B?Z3FQUGtNZWtmVENtVVAwV24vWlVaUENUdDI5S2tQQnpPdmE0RXczOTFnRDRX?=
 =?utf-8?B?NkRQN3pFaFNvb2llZnpiL2lsaWkvSzlOazF0K2h4V0h0WmdwL2tSWThWc3FS?=
 =?utf-8?B?QzB3Q1pLQ0JNQ2RXbjNMUHBQa0t0eE1nWDBEMkdHN3hYcktsREF0aHVEUFlV?=
 =?utf-8?B?L3NNUVJCeXdwSXJyVHByNWFvTDN1bkxXZlgzK2I4dHBDYXJla3JxQ3RrNFNx?=
 =?utf-8?B?dEg0eWRhNmR0V2F2Y3UyK3c1T0Q1VHpDc2doaE9HdlFwODZiOCsrSllkWjZZ?=
 =?utf-8?B?eTY4cWFwcGU2TCtMdUxJZDF5TndJVXlZYkdOMERka2lvSzJQVVNHckM2Z0lx?=
 =?utf-8?B?azZFZ2ZiY1JpZVhFOUdtMDB5OFJGNDdhUFBsOE5nSGN4dE92NWo4bS9obkt1?=
 =?utf-8?B?Mm1DSmUrUjQwcDhYSUYyOTdMTkR3aUVRWWdmb1Y4NkxpSTNqZithaDQ2WGkw?=
 =?utf-8?B?MXlCY09IQkk0WjlaOVJqM2x0a2hWcUJ4OExSNFprdjI0cS9XUGV1bXZtV2Rv?=
 =?utf-8?B?QkI2ZUlKRWwzUnlYRWphWnBqeFRZNTJ1UkYzVGlKU05uU0lRRUE4VFRzMmFs?=
 =?utf-8?Q?UKFojTiNtDreFETCGuxl8VRKfCD8r8eg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?LzIvNEtjWkhPUjErT3FpRGdkOUVlSkY0N1UzVStKT1VjME9FVzNlaEp0d3Fz?=
 =?utf-8?B?RzNjUHkrUkdGOGpoQS92ZzJlUjZ5ajVORjNhM0ZoaDVIOTJQaWhDSkQ5aHpI?=
 =?utf-8?B?dmFxdmQyVGN5aGk3YmhqWFUrRHlvdzVVc243eGplSDhQT2JTbDNMM2JNdlM5?=
 =?utf-8?B?WmpRTXpWUzNLQXZRcnZENjkwSkx3L0VWQWIvRkVZSWxqMHdsdmhvclJITVBX?=
 =?utf-8?B?K0FsT1d6THBJT2FXUWRTZTZjb25IZmNyWDFESDJIaGE2ZUdSMjhRWmZaQXY0?=
 =?utf-8?B?TnF5YUVoWER3ckk4OGRHZ3JJOGJqcXJaSEo1RzNuQXZ4cXpIdUJjZndTVjhY?=
 =?utf-8?B?TDNYL1FYMnMxY21WZWhJemtzWlRxNmhvWHBPWkl4Tlg4ZTV2STRBWVpiV0pu?=
 =?utf-8?B?eWF5R3BGUkw2cE5wckZGQkV5K1pNV1JrblhicDBZako5eHdWNCtvTHFIQVdN?=
 =?utf-8?B?OXlaMXM0R2lHSWJ4dlhVSk1qMUMzYW9tU2FLUWQ5V2g1UmE3SER4QlM0UzM5?=
 =?utf-8?B?WWtScEd0OHJEWXVRYW1mRDVLME1SaGtmSzJvMmFJVUg0NVhUWE9Cck55cHow?=
 =?utf-8?B?T3R4UGRBOHF0TEJ6NlR5bmRqQSttNGRQbGJaNSt0YnBhMnVqY1U2THA4bkEv?=
 =?utf-8?B?Y2JHd0FZUFZ4MGJGdHRTQVpaOTdpT21zb1ZjVmdNV3VuMGtHY3hlZGdpUHNW?=
 =?utf-8?B?RWJyNWlmcmFIcnRYSE5rRDAyRURyU2pkNWYrQ042NHpLL2NTbjUxM3BjekpK?=
 =?utf-8?B?dWFTUXduV1lCNWcwSnNFa0laeXJjc05QWjRUNjNzWkd4OVVHTmErRHlhMGJs?=
 =?utf-8?B?TTN0ZWkraDhDNHFhWEJjajZhNGIwL1VMSlJsWTFtcWUyNm5BeXpCMWpWWlJ1?=
 =?utf-8?B?ZTJQVkVWZlZOUlFiK2Y5aWI3aiswWE1ydHVlR1RxTEorak5tT1lGdWhVU2hn?=
 =?utf-8?B?VnNFUittaWZpaFFoYzIvZittWitBQlFFZ0JIYWkzQ0lHaXNOcWlWbVVJTE9z?=
 =?utf-8?B?ZFB0c2F4NnU0UHRHM0h5OWYxZjBQSktoazBiZEs1Sk85bmxtSWl5c0NBdTRw?=
 =?utf-8?B?bEFsWVl5WDE1VWg1eUhEMXdHSXQySlR1dGRicy9IZ0g2azc3RHJyZjlzOGVB?=
 =?utf-8?B?VGNWdWNoRE5WVUV5YWQ0MzRsaXdlOGVZYlhDTUtIZDc3L0FKNGNtZHNmeDBm?=
 =?utf-8?B?c3NBeUtNQXRaNktNWi9vV0dVaU1FbEw4TThKR1c4ciszZmhzSVBkMjBsN0M4?=
 =?utf-8?B?U3pMVkxic3dqdzFOcG5GbENTVWt4RCt3NnE4amxuY1RNNGNZTGhwNktrdmF2?=
 =?utf-8?B?UVBxM2Ria3BWNDN5T1d0WXRtZDVjK3hqMmVjZDZpL2RaVjNKU3h3Y0RYcG5U?=
 =?utf-8?B?d3pCeHVpdXRxelZpdVcwVWZRMzVrem1qTW9LNlFTaEkwVGU4aTJaQVJsVXRE?=
 =?utf-8?B?T1dTV29FZE9FNWI1QjhUSjkrZjdyVEFObDYxdi9QVVBXRXFrR2tGR042NzZx?=
 =?utf-8?B?K0RzclBXUTBFeUNmbEtuKytidXZSYmVwd0sySUxzN2cwZ2I5eGcxTzI3Qy9S?=
 =?utf-8?B?SGUzSGxlN1p3ZXhmQWJxei9rditUSkZuYkh2VUh6NkdSYTNXaUtTSFdsL0li?=
 =?utf-8?B?U09SamI0TmR6WUlrTUhrWFV3MEszc0JOVVFUSVJnd0xpNGs1Qk1TbFRZMFRo?=
 =?utf-8?B?UTliV3pmc0ZMdzBsMU16UCtNY2pJL3V6SFRHWkZXR3VVRHZtanBkdTlvM2ph?=
 =?utf-8?B?VzU1ZWtjcUdLOHdud1EyT0Y1REhsZ2dWbHphZjkvUTQvR3lQYy96azdldzA1?=
 =?utf-8?B?WVlDYWpNUFhDczNERTBIVTJXbyt2c3BycTUrcE9VdzN2eW5NZzFmYWg5M3ZM?=
 =?utf-8?B?bU1SRFJjZGxZWEpsVHdqVmJSUjNVcFA0dmZMSzMxMXB6cXdqMVFwT2N4TnlJ?=
 =?utf-8?B?QVVPdVpjWmZ4cHNEa3NXMnhSK1VUbmFGNHFVVmNpaDl1QittWXdMbE1iMUN2?=
 =?utf-8?B?OVp3STNCeU91dVNNTlY3eWIwRDVUWUg5M2pkczJzNzFjL0N4TE52MTlxNUJk?=
 =?utf-8?B?QnVtTU42THYzUWVhT3Q5eFJBdncrS3I0MFN0Vmp1dDZNSWYrUlpCZWtnSlFV?=
 =?utf-8?B?czRBb2VFczBPMDFyS1lXZkRlNTExQ2l1bFV0d1U1SitPSWkxd3BwUHJQcHhj?=
 =?utf-8?B?eDlnMDdWT1hROEJQVytEVVk4M3pRclRjUlBzR3NlOWkxQlptUjBvU0ZIMlpk?=
 =?utf-8?B?Q3JrN2VaNE55dTRKNllMWkQzYko2OXJ4MERZcFh6NXFEd09oMExjQVRBd1Y1?=
 =?utf-8?B?bVNYT3YxaFBNY2R2enVLK29zdE91Y3BHMnhmZlRST2hidWMvRHk2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5510d6e5-a91d-435a-0129-08de48188a7c
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:58:57.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 p/SBSoalZuA5gZzE7i9UnCVhghpP/7Zkn1msrAM2O8ufcChNqUF8Wz8XtKITvGaxF7P+AEf/ZbGo5Ir2zXuFqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7016
Message-ID-Hash: 2C2KWVVDSM5VAV6BECKZF6JXATG5SLRQ
X-Message-ID-Hash: 2C2KWVVDSM5VAV6BECKZF6JXATG5SLRQ
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2C2KWVVDSM5VAV6BECKZF6JXATG5SLRQ/>
Archived-At: 
 <https://lore.freedesktop.org/858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> This patch set adds basic support for pre-booting GSP-RM
> on Turing.

Hi Timur,

I gave this a quick test on TU117, but it is looking for a firmware
file that is not on disk.

Should I be updating linux-firmware? Or something else is wrong?

NovaCore 0000:01:00.0: Direct firmware load for nvidia/tu117/gsp/gen_bootloader-570.144.bin failed with error -2
NovaCore 0000:01:00.0: WPR2 region not created after running FWSEC-FRTS
NovaCore 0000:01:00.0: probe with driver NovaCore failed with error -5


thanks,
-- 
John Hubbard

> 
> There is also partial support for GA100, but it's currently not
> fully implemented.  GA100 is considered experimental in Nouveau,
> and so it hasn't been tested with NovaCore either.
> 
> That latest linux-firmware.git is required because it contains the
> Generic Bootloader image that has not yet been propogated to
> distros.
> 
> Summary of changes:
> 
> 1. Introduce non-secure IMEM support.  For GA102 and later, only secure IMEM
> is used.
> 2. Because of non-secure IMEM, Turing booter firmware images need some of
> the headers parsed differently for stuff like the load target address.
> 3. Add support the tu10x firmware signature section in the ELF image.
> 4. Add several new registers used only on Turing.
> 5. Some functions that were considered generic Falcon operations are
> actually different on Turing vs GA102+, so they are moved to the HAL.
> 6. The FRTS FWSEC firmware in VBIOS uses a different version of the
> descriptor header.
> 7. On Turing/GA100 LIBOS args struct needs to have its 'size' field
> aligned to 4KB.  So pad the struct to make it 4K.
> 8. Turing Falcons do not support DMA, so PIO is used to copy images
> into IMEM/DMEM.
> 
> Changes from v3:
> 1. Fixed Rust formatting issues
> 2. Misc style changes as suggested by Alex
> 3. Merged regs.rs changes into commits that use them
> 4. Used Zeroable::zeroed()
> 
> Timur Tabi (11):
>   gpu: nova-core: rename Imem to ImemSecure
>   gpu: nova-core: add ImemNonSecure section infrastructure
>   gpu: nova-core: support header parsing on Turing/GA100
>   gpu: nova-core: add support for Turing/GA100 fwsignature
>   gpu: nova-core: add NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
>   gpu: nova-core: move some functions into the HAL
>   gpu: nova-core: Add basic Turing HAL
>   gpu: nova-core: add Falcon HAL method supports_dma()
>   gpu: nova-core: add FalconUCodeDescV2 support
>   gpu: nova-core: align LibosMemoryRegionInitArgument size to page size
>   gpu: nova-core: add PIO support for loading firmware images
> 
>  drivers/gpu/nova-core/falcon.rs           | 246 +++++++++++++++++-----
>  drivers/gpu/nova-core/falcon/hal.rs       |  17 ++
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  47 +++++
>  drivers/gpu/nova-core/falcon/hal/tu102.rs |  77 +++++++
>  drivers/gpu/nova-core/firmware.rs         | 181 +++++++++++++++-
>  drivers/gpu/nova-core/firmware/booter.rs  |  43 +++-
>  drivers/gpu/nova-core/firmware/fwsec.rs   | 215 ++++++++++++++++---
>  drivers/gpu/nova-core/firmware/gsp.rs     |   4 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |  10 +-
>  drivers/gpu/nova-core/gsp/fw.rs           |  24 ++-
>  drivers/gpu/nova-core/regs.rs             |  53 +++++
>  drivers/gpu/nova-core/vbios.rs            |  75 ++++---
>  12 files changed, 864 insertions(+), 128 deletions(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
> 
> 
> base-commit: 60c7398bded2e11f0db40a409a241b8be5910ee2
> prerequisite-patch-id: a3e23917ec535263604af95194422382f14c2f21


