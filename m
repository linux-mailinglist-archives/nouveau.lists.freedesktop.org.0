Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55678CEFA79
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 04:37:49 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9AA310E2F0;
	Sat,  3 Jan 2026 03:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HF47XWOq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4681C44C81;
	Sat,  3 Jan 2026 03:29:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767410982;
 b=E1cPIV2/rIo1cXfUHBHkp1W513KIzAvEjN3Ybm2mlRvmz4r9UGofRvNfBpsuuyorKNG7V
 c9NaimpUICxSJwZlpeJNXxzcmqgVafWSlPkl6IFvlv8jnbM+C3OSzFNcoBoM88zeDdBgEV+
 bzAj3r0PeNo5xwjmpvtmJ1/psf0fc23sYNZOoD87DUGoc4ah5NzLLns/uwhdA+RL3UBVTia
 NaZmLq3jnoMcf2kuILtwehJ+G92xLc442+tut16c89EKezRgpkylQEUXfDzk/f5btxkj/37
 GKwv6pvVGYNhP1oUymabQOeKeIutY3tgsUGlHoE+g4/IsADnprGyV2A/Zusg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767410982; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JXe4bIpt97TCepgZGBd2w7K2OdB+/YLyv6xGA4oV+Jc=;
 b=kAJFmnpymHttZ/VgDYrvi+Gd/Vca16nAP0pYTYx+BAkbUvv1JK/zTY9EvmyjMHzbV5nGc
 ULbnt9mkZzXPdX4wbMUd9MZiDf5VzunpZ4lNkI+IPV8aQydbqs+cMzv2gi24SYLBwpsvEGe
 ELvZLl6yaEIjdWo+sAvZWHOcpg5GhpfVxuSChcCFrRR8KcYTI5nVvwlW82IxAlbz9Dz9pfo
 SMjqKJ/9JtGNJB0VLxfxhc8kkbT4FQ43JRMJk1BjR4SYbT2I9YRpqnrCNPnods0Rsoofx/C
 WtQzd6wTgcSY9ztOrBeYAaTKN6EApq4Pp+2OwWGuHyX9PBw6oWyRZpVb5AvA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EC86344C41
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 03:29:38 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19FA310E10A;
	Sat,  3 Jan 2026 03:37:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeD3EDVqsKJn+aWIRlM+Dbz5h7+Gfo6GUQVZVpoa4kC5IKwjhp1bOJoqdkfAVcrvK5+Gr4bjW+VPWT+vJUofpQxqjiJHTxSqvqAUcfe9LbFf0f6buwnFY0iaXzEukAXB9TLEH5uKcMY3cwRnItX3J+wd6HxmffAD/Ws/C6JVwIQsCNuBdOirDOa0clgUqbSzfbvGoNEYoi+7Ngdep+vGhG5zHKoxpzqTgp2Fs0cVu7jYjWYzrR3QF6ekxN8UMyTsklseXgpknA52ycbSE4D/3O+u1MdStom+/5ZvCv4X1umXP30434cBugu734cuog76ZD/CYePkmu3c3XWTuzgbag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXe4bIpt97TCepgZGBd2w7K2OdB+/YLyv6xGA4oV+Jc=;
 b=gAFudC+pzJ0WZgpBQqsza3QKOH/2rEiNgv/uelibIMjxCeqGdr5P4sidEPrxCxCXBPoijZbmAOb4jPi68DcBra+1QIc6WxrEpPycYQhgyLyhvEDZ4utiZv9oLrWbnmjrl/cv0HnQ1rzZoqen4GijVBD+dGbqX8Wa4OoEMbSGJzhkAdL4XJ7enxuvdGCil9hed3+lrNBbxlsVVgN3aGaMrHpssgzee91fwM21EkpYwu0QeZ3t38sjQpQpKzraGki7LjLDdmlV/zAphoN4xcLQ3FuC+DbtdI0zvuZjD0XwcbNn1cY+cj8eEOyX5kgqtKG2FxL8YyRUsq8dR3HEG7eMGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXe4bIpt97TCepgZGBd2w7K2OdB+/YLyv6xGA4oV+Jc=;
 b=HF47XWOqW+o0w45W1R0mMS6ER60OAQV9/M8Jk2pvS2xmfFR+hjAJTFNK6HAImL0xLDvlKPRvsX8XEFulxymwFi1F8VwGmUbUc3n3AcuBwJZ0wk9SCzlzNaxj63hztLcF888avkx/2AJOfup4p3XZamysWbwAC4New1bajpL0Zz/yNKzBpqX1oPEtsbnHWQqSk6OdxplsY4batw843HLiIYzVTEte5RUKlAmHaEPB6h+CYn6oy2g6SHSinIho8hMf21aiEvTVIWjZj67MR/y6LJvs/41Zh4KupCSeB0r7FtgofrHvtulI7ZZ6sfjnQI4+LwXiL44ZerHUI6g4mMkEmQ==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Sat, 3 Jan 2026 03:37:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 03:37:40 +0000
Message-ID: <9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com>
Date: Fri, 2 Jan 2026 19:37:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/10] gpu: nova-core: simplify
 str_from_null_terminated
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0078.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::23) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 19069103-79a7-43ad-f84f-08de4a797214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Lzg1UmpEaGRGN0dXekpsZldGOVN0eDZBM0V4RTVJalo1NkY0UExocU82aytk?=
 =?utf-8?B?KzR3Z0p6V1hZeVJOU2o4NGJPSVVzaThMNUdnaHJIWFAxajRuRTNCYyt6ZXpj?=
 =?utf-8?B?M2JydEhZQ0t2Y0ZxcW85STkyZHhaTmFpZWlBckRjTDA2YkUzR21IRDczbGdZ?=
 =?utf-8?B?NEs0bkc4NHAzeWFUSk9GQXJJTTBVK2IxK2RMREtvcFZnU3hZVDF0Q1hTNGt4?=
 =?utf-8?B?eGpWTFVITXVMRlg2WTA4eVNJQ1lQZkd2TU9CMDZ2dGx6UVVuTlVVUnAzby9O?=
 =?utf-8?B?bWFCb3E4NE1NODdJeklhL0pSRmxWcXlTays0cE53UXcwbCsveFI0aHQ1eUxa?=
 =?utf-8?B?ZVlqOEx0VHY1cW80MkJQYW1RMnFMekxlY01lUEdWUXUxK3lHRTNTR3J3czdm?=
 =?utf-8?B?eDU5MFVxcFpTSmxPNHhTeU1KSElJZmJsMXJKa0oza3JWVktWQ2pPODd5anNz?=
 =?utf-8?B?S2phbDhYaFhWUVNzdVcyQmdVbTNZSkxtOWd4eHNQaEpLUkZ5MDBwQjdtS0xh?=
 =?utf-8?B?UjdDSUFpdk1tc3F6eWZiOUlXaDE3aEpnbG43b3owTWpOM1lPbXpHOXZDVWlM?=
 =?utf-8?B?UjE5d2dLeXhRTXE5SldnZWRRSjJwMUdxa3B4bTVhN0RGUFdkUGlGODY5c0NV?=
 =?utf-8?B?SW00NUFJRml4a3lnelRPVlVpemxXQ25rMlFZS1FLbk9BTEIvcDlncVg4TXdX?=
 =?utf-8?B?cXlNNzVOY2FhMnZHTVM2VHlqNU5OL3c5aC9QbHlBd2pMdkkwQ3NHR3liM1ZJ?=
 =?utf-8?B?SWZCOFhOVUZZdEZocnhCQU5rbWpBTnNSVmpHdXJOejBEQ1ZpSWRpZG56MDFJ?=
 =?utf-8?B?bXIrR0lTUGtQbEpjMVVHUVkwVDlpYU9nSUJ6amxJWVNRWG5PVkZQSG05TEtF?=
 =?utf-8?B?cFdkQ2FPZXJtSXh3TFdKSDlESnYvcEZyWmhQYVpicWJwMVo2M0RxQ2JjYU8z?=
 =?utf-8?B?bTZscFptQ0xMVGxUbG1tRjRLUEhjZ2IwUmkwQUY2b0pHdWk3YTUzSVhyUVlo?=
 =?utf-8?B?QjRQekNSUjJKd1RkM2xFQU9jZGJGQ290ZWpZemw0WEI1Q2cxNWVBRWZaUmU3?=
 =?utf-8?B?bERPZ3lBRm5HWThDR0NCWDUrT3Rub3RaTWU3OElaWGx0bDZQSGlJUk1SczFR?=
 =?utf-8?B?Ym9EYVBKZGdvd2JGdWIwRUxOUnZPWWthM0JTOWx1Zi9oRUdhSkhhQm1rc3ZN?=
 =?utf-8?B?V1FFN1p2dit4RmxlS1FhRGd3dDFzTkhiY2VKMDhVcTVJZkcrOGU0bXc0VWhR?=
 =?utf-8?B?eHZuR1hkZk5pR3VhcDFXaGZiQlpxclFYWGh2a1grS2JZMXNtbldLTXppTkRn?=
 =?utf-8?B?QWJDMW5rZWV0R1BreXRoOWljVlBEWG1QbE1yZWtkRlNrSEM3Mm9BUStlV3hy?=
 =?utf-8?B?end3TU1Ic21XeVI3bmJ3OTBUZFhHT3pyengzWXpNRFBVdEludE5leThOWWFo?=
 =?utf-8?B?RmY1TlBvTExSNnpmK3kyZDNIckx6azNMOWxMNHYwM2ZSaXMzRnVRWStFNGlC?=
 =?utf-8?B?aWZaMlJLWXUwRGZ6Nk4xN3hVNnNCa3M1bGVGMTZEejRJdzZKUlkwOG1ueFdp?=
 =?utf-8?B?MHo1YUxGcjRVbytmVk9pQk4vRi9xTlVZOHZLRS8rZWZxQ0w0bGpmd3cvYUln?=
 =?utf-8?B?RDNYSFkxN2dWRE5CMGlveVNHaGEzeVlUR3VORnFhS3dGNUFqam9UUGVwd0Er?=
 =?utf-8?B?citZN2pxZnpoOGZmV2FESGMxS2VDUTFTWU9Hc2J1Z0xwNzdNZENORTVucHpB?=
 =?utf-8?B?cmJXeXJTTFRKOGFIYjJyZDU3aUx0dWNmWkJpMzk5Z1R3SUloaklpYlNjQjF5?=
 =?utf-8?B?ZGlmVUpxR1NTTkRqUGIzclhLQ0ZrK3RGbitldDZFQXZxZzIvUGI2OTQ5WTZU?=
 =?utf-8?B?eWpvZGo5V3hiYnRySXcyaCtGMUxiSHFBSmt5dS9ka1dNTXFaWVFTNkZiTUYz?=
 =?utf-8?B?NXlRVXFjdG0wOFZ4R1I5aVVHR0grSndIZU00MkRKbktneTlVRzZQL3U5K2VR?=
 =?utf-8?B?cCs1WkNvYzh3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WDNMZ0MyRU9CNHBYN21IclJUWUp1ZjdOZnhIVVBVQUZvTlBRSFFPS25rSEhC?=
 =?utf-8?B?RUgxbUM0SzFFNHk4QmxWWFVyVDVodUlaS1pZOEFyQkVMUDR2TEZJYXFGK2Ru?=
 =?utf-8?B?RkJYTUEwOGJxTWFNM2tqT2JkeEVuNG94L0UxNitTY3dCZEdTazdkaFlGbmdJ?=
 =?utf-8?B?N3Ziak8veEtlMUxGS3BJVkdHeDdCR2c3bk84U1Via2h5a01FNklXSTlWc1pJ?=
 =?utf-8?B?TTNPOWczZURITHJKbndEV01wOXRYRHcrUVcrS05nWVZYWXdqWkljRkFHZ2tY?=
 =?utf-8?B?QWk2K256UlJLZjFmT1hOOEtVL0pKR0g1TzlDMGVwL0djd2lhRzA0cCt6bWtE?=
 =?utf-8?B?WHp3aS9BaVVobytwT1grQUQzOW9pWUdTSDFZdnJzdEFkWHFBMlJuZVhFdzVl?=
 =?utf-8?B?OURxc3B6RWl0OE9ZQWlqSGFURWhlWUQ0MVpjcFVTR0o0WElsdjZqYzlMRnRi?=
 =?utf-8?B?cUxITUt0QVJ0VlBkaHR0NGoxOGd6b1labW1XeXBidDdRVDdIS0c5SElFWnFW?=
 =?utf-8?B?WmdaVVJDQjlIaWJ4QUI2TmlhcEhoNnk2b2tGZ0p1Yk9ybDM3MG13ZjU2QlNF?=
 =?utf-8?B?K0w1andpZVBEczY3L1QreUEyTnk4N0VvTUR1dVB1R2FQMUw1cGJaanlJZ1Zk?=
 =?utf-8?B?TWNRaDBpelM4ZDhLTHRXNHFLUTlJd1R0ZzhGVjRBRGdDdyt3bVZXMjRMZ24y?=
 =?utf-8?B?RnU5VjJjL1VCdU16aGRzVWZONHU1Z0ZFYkdNb2t6dHpQWm5XbEd5ZU1KMFBK?=
 =?utf-8?B?Y3pubjVtMjVzbm9zYmhTT29ubHRENlExVFpNTmhOdE9UQURIeVhqNFhZVHRt?=
 =?utf-8?B?NEtRWGNLcTRORUhPTXJRdVdFTDlIT2NXcTJ0TGNJSSt1YXpEbU9LSGZsNGY0?=
 =?utf-8?B?Y1BjaXNHdlRZRzIxcWZ0MG9LSElQUmg5WjdDVkRXdFhxMTRRUVppb2grVm5a?=
 =?utf-8?B?ekNHTmNpV1BLZXJYWWpoc04wZGJKMFlZRDRuUWVyY2t6RVVWWDhNbFlzU0Mw?=
 =?utf-8?B?eDg5MzZxY0daRDBrMUUxdm9BRGx0bER1WVNKTW1TK2hoU1ZjanJEbVF1NXFm?=
 =?utf-8?B?VHdyMXFFQ1I0U2FKRE5TM0ErbE9MSHIwc2ZoKy8zUmVtcXFFVkZDWEphcTY3?=
 =?utf-8?B?RUVyRERPRlhrKzRFN09peEYyNzh4bjE1dU03MEpiUXZiYVhGL2o5ZDdWVVFB?=
 =?utf-8?B?bm83bUhkakhYQmhyemhlakNKcmlGaE5IZDF5ekFxWFpNY3ZUQWNrWXFxdzVl?=
 =?utf-8?B?Mkg3ZFBNbGQ0UU9BWUxCZlZXVTd3M3RMT1VnTk5RYzhmbTI3RU5tWlpzVEN3?=
 =?utf-8?B?RkQwRFRqTHB6SGFpS01nRk1YUmhsOWdKZUxCSC9CY050ZjRnQ2d2Sys4UDZE?=
 =?utf-8?B?V1lPZXlDM3VsNXpZbGlXZnFmU2J5bENjUXJyY2krWnFQSXNFZTNyaVhCVFB4?=
 =?utf-8?B?dUt4YXpydUdmeTh3YXIrbUE1ZXJSMjRpTzNaMm5ubW8vTHpOdDlFYkVrNURB?=
 =?utf-8?B?RmlFVlZ5ZENPTG1YYVdKZ1N2cGowWG5MY3lqMHFkRlUyNHJ6NE9kcnZ1cDhl?=
 =?utf-8?B?RDNDbFNOTm95MEQwNnlPU2RjWjFzeFFlNHQxUlM5aGlpMGw4aVZWQ0VqL3Bk?=
 =?utf-8?B?aXBNUnBYbUFoZ3ZqZEdjUXdsa1I2ZXZsM1hPQXRlUWIxKzhLMUpoc2NueXFv?=
 =?utf-8?B?MkgzUUxUclRwOGYyNktyNHJHaXhSa2hnWUg5L05abUNZM2lMdGlsdHM5UWVw?=
 =?utf-8?B?aU1McXpDN2wxd1VVbG9zMnhsbG03emN1eDlIdUxwb1hZRjF0dmhNcGtxdFN0?=
 =?utf-8?B?ZXdzTkYvcit5YU5HNmsrOG4ySDZDMVJ0eExzRE85Um9IamJIN2xOeFo1blhD?=
 =?utf-8?B?bnJTNEFkNnd0UDQ3bFhCYVEzWXpjZWRQVFIyUmhGRnB1YjI2K1NkZGw4djJv?=
 =?utf-8?B?V1NabkZ1Y0hZV2YyMzNCcGpmMGExTi9OSDlQWWdOVVdaN3ZXZ3h6MEc3aVpt?=
 =?utf-8?B?Vzd6SzAzQUxPSGRUd3BUOVFjSWF5SWQ5ZUdqZ2Nxbm1wM21qRlVDbTRGZXZm?=
 =?utf-8?B?TUlwZXJXSi9OY3RDdStaVDVlQ2FoYU9KSlM4ajhmK2owRElVOFZsQ2xVTUVK?=
 =?utf-8?B?S3FvZGxYTDdUQ0o0K1luSnJXQ2xreG1UblhyWUJxVm9rU1gxN0IxcmF4ZUhk?=
 =?utf-8?B?dlpsUEhESWs2dmtEaVRjRE5PVzdHYU1EVTNjem81NXh3S2hQZFFPc3d4SWl4?=
 =?utf-8?B?elloajhKbGNjSUh2UC9KVkZWb0x5bzlxK3ByQUtoNE11S05xK2pQWStuaUlP?=
 =?utf-8?B?L2E5dG54VUFMZ1BvMmhrL0JYR0pmcXhEZDJmcWc5NEM2WnJJd0JyZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19069103-79a7-43ad-f84f-08de4a797214
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 03:37:40.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kGLZ6DIJqIbUhJ1547dXOJbH8hw5QKJ1vb4csvJxyzSG7TbCM5d4QMIoGotoXHmqZhJnzuOw9jmhd0717kEvmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
Message-ID-Hash: QUJ6IOCUMBJHNDC4JJF36LN5HLPKSAD7
X-Message-ID-Hash: QUJ6IOCUMBJHNDC4JJF36LN5HLPKSAD7
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alistair Popple <apopple@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QUJ6IOCUMBJHNDC4JJF36LN5HLPKSAD7/>
Archived-At: 
 <https://lore.freedesktop.org/9c153278-c334-4649-8f73-ec5676ad25b0@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/15/25 8:27 PM, Alexandre Courbot wrote:
> The core library's `CStr` has a `from_bytes_until_nul` method that we
> can leverage to simplify this function.
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/util.rs | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
> index 8b2a4b99c55b..2cccbce78c14 100644
> --- a/drivers/gpu/nova-core/util.rs
> +++ b/drivers/gpu/nova-core/util.rs
> @@ -2,15 +2,10 @@
>  
>  /// Converts a null-terminated byte slice to a string, or `None` if the array does not
>  /// contains any null byte or contains invalid characters.
> -///
> -/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
> -/// slice, and not only in the last position.
>  pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
>      use core::ffi::CStr;
>  
> -    bytes
> -        .iter()
> -        .position(|&b| b == 0)
> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
> +    CStr::from_bytes_until_nul(bytes)
> +        .ok()

I guess I should have reviewed this patch, before creating my version of this.
I went so far as to delete this file entirely, see if you prefer that, it's
otherwise the same core idea, but with more cleanup. [1]

[1] https://lore.kernel.org/20260103013438.247759-1-jhubbard@nvidia.com

>          .and_then(|cstr| cstr.to_str().ok())
>  }
> 

thanks,
-- 
John Hubbard

