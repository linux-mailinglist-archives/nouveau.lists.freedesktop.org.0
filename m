Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145CCD06858
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 00:13:27 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3484F10E7D8;
	Thu,  8 Jan 2026 23:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rx4fbMJD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8E9DB44C7B;
	Thu,  8 Jan 2026 23:05:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767913506;
 b=NYMCmkD0iZT1qiZn3cxxvTchYoEHASFnWWv65/adz3Fdt87ySiTjxQZ9dpzfoCDP6wkuy
 PJUlSuTGG+xR9sS8r8v3/suwWWt+0s6Qs+RIm9bx1qKw3Bz9uSNZyE7Yv7Ko1UJmCNv4siL
 DVkMr3hF9wdyKDiXluW4OPQlAUETrjo4oRpFYs8MtZ1FEVSmviy2grJKB9H8Yiu3D7TWK0J
 Q58Ff1yupi5+okTMVpBe7r2a7DG/XAwC4fu02F+6OCVXHz+0ey17onmxkRD7nKr6quPiK9E
 cPVUS2Ctkg1rJ3ErMjuYViorOi5mJaNX14z5NJN8IDuT9J8DecdyjmnUcN9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767913506; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5tTQjzc8Q+rrcOVSrNaSlT0Gwm7qxu2+ey0+v8RS9cw=;
 b=nmmd0VbMQ/gvdpNfgzNk4R/P3Yp8g+p6QBjRyd8xSSH/fLkO5dKbuFuOeqg2Mq57JZow9
 +8L+331KtZ6VZcwEOCVDrsiTazHcE+Jqd5vYOyJct2feB4tepSD4o9OyXuDJlO6E9tsTtPy
 LO1sZwDTkD+gZ5z0KlxfvvIb3WQroTrywWWcN0MwZmQmlQbZaL0ZcYXAEserysasYUdSwl6
 QPGNyMujSqvbQytvUtTqoG3v+lhhRA+Y4qFQrs43J4OCO01+NShuvxq/JOyeM32bq/RDzsC
 QHQ1ETDKvrSnY41RR8c1SNKyelfLnqImaF8DOUDPNN/RG+BuCVP+BtRXCwmQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 505B344C69
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 23:05:04 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9372F10E7D3
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 23:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eUje7dcfh98otJ/PfucoLzbz76UmRQ5TKAeujQ22EV0VfmMG+kBqx8VYHBGmWCjgSXzSHwA0Svpg24g1GaqPoybEpdNpEAiCD3owjxpBt0cgZPsbfp/fk9iQOFCUBgtKTYX2QWlHhRYKYCkLc6bpq6Xv2t7pMaWEG08EeuwpH4Du9CV3+FczSQWETG1HRHC5zQEgrWcLF+d8QnMQoO/uFrqjSoThOzz3sNYDlLu0qCoqI7VjL1lkc9MVSjAFlI9zPsi7zAmL6BndqiOs9sIjco9Uqi4LiEv3jpjbs3wY0P3qcTNfL3u0fNWST9z9JcJn7ZCZnYE9aaH1rZ17xfM46A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5tTQjzc8Q+rrcOVSrNaSlT0Gwm7qxu2+ey0+v8RS9cw=;
 b=QTePnpTmmG38jiEkOAc5b4NShQPpyD6JSKLmK0NW/sxenaz/V6yrTdtuFQ5t42F+aP13Boo7XcwXoV60vd4Q0hajGCFceBsl/A3KjLO/aLLpTPtERff5NXJmE8rH7drwVx/ISg0KtVrufgmjFzdmqCLgbGJTNF3He1F2eJhTtImAnLcrWJqVIv7z2aqaawpUnPtOQuCH9ZVwdVaa2zVVSem/cWzzPTOlfxVcLbA0FnMNW6bGLrF/Zgnk7Tvi4Hy/6+b3PezFjCKViTR5Vo85NSDEVmV8nicsdnNCHq4STNrLWQQ24eNbKGeqRfhH3dnjuVQGicacIj4IEUczVeYt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tTQjzc8Q+rrcOVSrNaSlT0Gwm7qxu2+ey0+v8RS9cw=;
 b=Rx4fbMJDFUFC7vwFY8lnoalAivlg2lXSPVTRY3OD8yF4WxB5erBsQmDwqxlZABWWYg2C1eU2dnEDL35EuQ1hezL0frOInYR1eVAjZ8FjYC+sklOUOob225JJsrP8RVqdFL4DuLWvcARQZTr5xxnyhB6JclQNERH2GwfOKhajlUBKZ/c4HUzn73I7e5VbzBKciy/A3hMcjaFeopl+L0lCV4fn5ix2mI4WyKcpJh/9ffiA1sjUxINIuXJ8tZylAV9WTUxhMV3exdj6xSvdzwSYal9taxjRTjvNapTaaJfuB6G3ZtROwYNc6FQz7p/Iz3WmP2RNB7OtSig41e0kkDf5VA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB9008.namprd12.prod.outlook.com (2603:10b6:a03:543::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 23:13:18 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 23:13:18 +0000
Message-ID: <7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com>
Date: Thu, 8 Jan 2026 15:12:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
 <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
Content-Language: en-US
In-Reply-To: <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0114.namprd03.prod.outlook.com
 (2603:10b6:a03:333::29) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB9008:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a8914a9-a83b-42a1-b093-08de4f0b8264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWZzMGVENzRhQlRGZEprL3V4cVQ3K3dUYTFBS1p2VFhHVWVnS0RhZlFwQWtl?=
 =?utf-8?B?REJ4amdGblE1K2sySlJGbjYyYkdNWVpjUDNpVDJoQ0ZhTmNaV1VSTy85cmFG?=
 =?utf-8?B?b0NLNTQxMkNseGNSYzF0a2MwUkxYd2FDaTdXTUoxUkFzbklXTkFxc2szZE43?=
 =?utf-8?B?clpxZXp1MGRpcXQzcHQxWEpJY3hza1UvcUR2alFZM1pqQk5Sc3hQMElOREYy?=
 =?utf-8?B?SnJGdmh5NDRLdmE4WEhNd29WY2hsYmJLK0FLeVdnTWpKc2tOMkwwbVBrTEY3?=
 =?utf-8?B?RnJId3FDaVBtdHgvYWhZRG8vSHZQZEl4NG9xRUgwSkoyWllBUmtCRVhtSXFF?=
 =?utf-8?B?OExYWHVUUVc4NUwyd3pGWmxYUngrY0dQNGR6STZTT21tNVVKY1lUMFoxSEor?=
 =?utf-8?B?OHFKdHNzVzA5NGRGZElyMHRHZ2o3UGhoVUo1MytZWUVBUlVOZ0s0M1FUNnFw?=
 =?utf-8?B?cGRBVnNtNFdRbnZ6ZUNQd3V1Wkh5Q1NPY1ltcjBld2NpeDZWbDJ2cVV0Y2Zt?=
 =?utf-8?B?aHJFYlpyMXNNWFpmaHpqaU8xZzQ2ZExCSlozcEM4R2VXZXR0VHZFZjlMczJh?=
 =?utf-8?B?eW03NUQ1ZERBY0lKTjlMdlVzUnFGeTh1TlZCaVJ6ZVBid2s3czFhczdpUWxE?=
 =?utf-8?B?cy9GM05qZFc5Wkh6Y3ZuVE9SNFdPaC9qQnlESDhLMzRWTWE1UHVvOGtYUmc1?=
 =?utf-8?B?b1J6bjExVS9DVWJQY3hqOEpIblpnT3pvYk11WlhxdEJNZHplQWV3eTUxOXp6?=
 =?utf-8?B?VlR0MkdlWWtjWkJZdVVKME9oU044S0FIcm96eE9jaEtGd1dmV2llRmhwcG9t?=
 =?utf-8?B?Q2JpdlFhblhGWlFYWTJOak56V0NNMkNEeHYvQW9DVlg5WGxSWFBpNHR3a0Qw?=
 =?utf-8?B?SjZkRDVRb0hvc1lrV21iamJ5Z1psRElTKytxZXpBamI3T0JvM2F0UE1SL3Vr?=
 =?utf-8?B?WlhaUDl6UGZBQTF4ZVpxR1NaZHJEWWpHMjRnTm1UZEl2TThqTXl6RnVXL3Q5?=
 =?utf-8?B?Z3J6ZkxxZnN6elEzM0cwMksyeE85TUhNWDBmMHE2Z1UxTUxrcVdUVzh1TmxR?=
 =?utf-8?B?VlZ5bC81MXlFeC9qQU5XYlpkRVJSSC9SNEwxY0o1TUVzZUNjTWNOMU96OWxX?=
 =?utf-8?B?Q2tXdGF1Z2pQcG92dWZ2MHNmUS8yVCs2N0xuV3ZJTTQ5eXNZRkRWemZ0Q1A4?=
 =?utf-8?B?VE9IbDNPUjNrN1VHelJ5ajZMR3V6S0VFZUlwMUlpNWFCcWhHRkxSamdVZHU0?=
 =?utf-8?B?cExSczB1UWoraVo0WVl2TTZzMVZsbmRxWmdsN2dJMmNFM2VMSGl3MGgwSkNS?=
 =?utf-8?B?SDRWVGlFeWhxVW9JcXJUSGtUK1FTREM3cEpxNnJzSnN6UE12TXBtTzR3SVJE?=
 =?utf-8?B?SGE5V1VGZHJhdWEweGp6Mlo4aXdqK04xS00rcVFQeGZVNndMNDZLSzMzYWpY?=
 =?utf-8?B?MnhLUnJ6RXlleTlpRTVULzUwTHdmY2FpSkorRjRRZUdXQ3lTQjluUDVjOFRk?=
 =?utf-8?B?d3NJa2ZycnBjZEV0bFZMQWhiYkhXOGxINHJkUmF5NVJDakpRNnhLYm9IYkph?=
 =?utf-8?B?WWg1b3JvYWx4eFlPeVlUbFllazFOZmhnejd1Z2JvQU1TU29FUVExNjBmdHky?=
 =?utf-8?B?bmFocDhzbnlER1RCYk1zRG9xSk44bmNPYk5wak5wa0Y1Z3dLb2h2anZnKzdF?=
 =?utf-8?B?bXBHOGtBakx1cWpWYjRSL0M5QzlVeVAxaklPZVVTR0VlY05YVmhsb3VaK3ha?=
 =?utf-8?B?Z0JnVjRhb2Y3bEZacGY4aVpZMkFvRVJGRXN6V3ovR0NoWi8xTkIwWnJrSlo5?=
 =?utf-8?B?UzJZbWduVXJadlBGbm5qeXZTaFpCczcrRU45eDBSRmcrdlZiVVpDSFpzMjli?=
 =?utf-8?B?VXA3WVFlQ0NWZjNYWEllclVlaWY0akVhZ3RndWpuUnlLU29OSFZLZGUwMWFK?=
 =?utf-8?Q?24BvpHyTGvfvZuzgs7ejgnBkfxBQ88hY?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHdDM3M0Sy9kcjlSbCtQS0NNYVVqSG41cTZzSThYUEFsUm9idms0d0V6bXpm?=
 =?utf-8?B?eW42aGVXTjJWZXpHdkZTWjE1bi9XZmxPT0cyNFBpTnRGRGRGeW1NUDNYYWFx?=
 =?utf-8?B?Tit6NDhjUkxBTXpHcjhoTUcvNnBndDFoUEVwQ0UxY201Q2FySWhlWGc2WDc4?=
 =?utf-8?B?dVB1dHJHN3NxRWJYQStnUFNScWJQM0VoR0Uzc2UwZ1FFajRrb2xxUStIV0ZZ?=
 =?utf-8?B?QWYzR2kxWVNoUzZ0VTQ0SGNrREtDRmdlaHphVDU2UUdDQzdGWVBWL015ai9I?=
 =?utf-8?B?NVkxTXJOYUFORHVlbVFWekZSYmlMS2pMU21RWktXb0xORk5ZWkUzNk1QS2Ju?=
 =?utf-8?B?b2o1MkwvTjVsM2VZamxzTWZuUGFWQWJ0ZTlxNmd2YlZyWDY2ZEJTeWFtcXV5?=
 =?utf-8?B?ZXoxTEVycTczeTRoSHp0cXUrM05td3padkdBZDhZUUZFaStNQ1kwY0tZVkdG?=
 =?utf-8?B?VUErN3FQUTNGbEszREpROE5sM0gyaHU3djkyTVpoQkgzNGZkRkwvMkdPR0x2?=
 =?utf-8?B?QzZJQUV6RmxkUzZjOE8wOHIrUlZjVi9hSWtQUGZFL0JRYlhtK1hvODJJdnYv?=
 =?utf-8?B?ZE5KMzNWVGxQOVQ1cGZTNEZQcE9vRmduR2lXWFBaMHNmZmZiUWsyNWh3aHpo?=
 =?utf-8?B?WG9KSWxIcDhJUUdMaU9VcUp6OHFMS1hlbUU1UktiemFXR213MFk0NTBJdFEx?=
 =?utf-8?B?QkNDVk9uRlNKZGVDcG0zZjlEUG5sNUdLbTl3Q3p2QnU3cUtHZmpyTndIa09z?=
 =?utf-8?B?ekZHQ0J5YzhKLzg0Yy9XUGdFcS9IVXdVMmNmbWY3THBremRuSkRYWjJJMzAr?=
 =?utf-8?B?eTJ6VTVPTHdwRXB3MlRuQ0pueVpDM0RuMGRKS2Joa3ljWDQ3ZUNSelpqMFhF?=
 =?utf-8?B?bnlTVG1lRmpSZG5aSmNBeWJtZHM2ODQvWFR6azhJakVIdEtKczBFYkt5d3Fo?=
 =?utf-8?B?M0ZraWIvZEVwZndmRlVlN1RlMEVlNm1zb3E3MUdVallIL2hoYnhuRFRCQWRo?=
 =?utf-8?B?dk81QXBKWExDS29MWXMxRmtOaEl6T3BqQzhsM2pyZU1sTW9aTXZJWnhDN244?=
 =?utf-8?B?cDhBL01PU2Jtd2pvU01QMGZJK2VWK3NDVERGb05FbllOTDAwWjZwYlJZWThq?=
 =?utf-8?B?Vnc0d2pGY001eHJxVUVnUVJ4alM5amZyQUhnei81YnBoQXpjM3l3MG1QZmNF?=
 =?utf-8?B?SXdzM3lpRkVJL2NTbGZHS1QrWEIzNmZJRnNGb3U2R1g5RzNRWVIzYmZYdndI?=
 =?utf-8?B?WHJYTWtZR3A1Nkg5NWpCYWM5VmlCbDRuZFNCN3ZzRS9pQnpLYVZ4dlhyVy9C?=
 =?utf-8?B?WUhBcXVwNFNkellzb2FGMzFYdGFvN2NHN3pVTEdvL2hWMVJDVyt0dE90VDdV?=
 =?utf-8?B?Ymx3dTRHWTZWSGw0QjZCYlg4RGJUOTlXc3JFNzczN3dPNzFiTDMwcjU4bWdp?=
 =?utf-8?B?dVE4V3FKWTQ4LzY4Q2MwVWlwdGV0UldnMjhtbUNCOXkvdUFUNWwwOHE3YlB4?=
 =?utf-8?B?ZHJHNXVxQ3RuMWowcDFVN1lPQ2U1TnBjS1JKY1J0Q1dNbzArZnpzM2xKaU10?=
 =?utf-8?B?US8zSEtvckZLTStFeURRdWNFV1B4RmNVWllHQ25xYnJxOXJ2dDhhZWNDNmxJ?=
 =?utf-8?B?OUdZNDZMR2xLa3Y1Q2thZFZHUmV0cjhqWmJReUFCTjNDWjhTS3kzR3FTeDVz?=
 =?utf-8?B?b1RIaldFTE1VTFRvMWhNU3BhUzZ4a0twalV1UytMUXhQOEl1M2RKSTdDcUJM?=
 =?utf-8?B?UkVqWDlvNGdHbjlPNDFYeG9nSFltYXRaSlhlcEkvTFdodmt5bkxaS2tCZ1pZ?=
 =?utf-8?B?ckRxUUFJWVNMY2hKMG04MERNSWlRNmxoaFhhQXVtT3dtVmRKM0VlQVlDTmph?=
 =?utf-8?B?L3F1eWZjalRXeWlndDZvYXFDeWxiOWp6RHprMUZlVXVNcFVqQlJXZWNQR1Jq?=
 =?utf-8?B?UVZlVnd3dHVrYXZpTHRPQjk2cFE4ZWtWYkUxVW42Z1ZNbG5wcVBONERvdEJ0?=
 =?utf-8?B?bDIvSmdSTzRlcHZxNkZUTng3WkIxUSs4N1c4bzliUDR2UlJZL3FiakJtVUhw?=
 =?utf-8?B?MCtvWnJOWFluVWtrWWsyK1pKYVlENmc0WjVUdklyOTJFUCt0L2srRTg0SXM4?=
 =?utf-8?B?WWVFb3pwcTZ4WGhwK3RyaVE4eWZPWUlmU0Y5Ykw1L0tTbWo0eElQUDFwR1NO?=
 =?utf-8?B?MlMrRnlHWVg5TzdLNExwVnl5NXhSQVVPVU5yZFFhUUs1eHJUOUoxdEdmUmg3?=
 =?utf-8?B?NE1aQm1OWk92a3dXYzJaYVdRcU42a2NaWjVPVHlsQXU2Z1JiSWpjT0lCcUxV?=
 =?utf-8?B?aUNKV01tUllNVkJYME92dzk2dWpOU1BybG9raWVCSEFLZG04M2ZqUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1a8914a9-a83b-42a1-b093-08de4f0b8264
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 23:13:18.6058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QwwCZGjj/UEXYrK6FfD3hciuOSmYn5v9cbO/VMAmR9JHY8YnbTbr2vXk2VEy1OIQrfVezSD0misxCA/sUD68bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9008
Message-ID-Hash: SFUJDCZ5SHK5HSFLZU5XAHZKLW5WSDVQ
X-Message-ID-Hash: SFUJDCZ5SHK5HSFLZU5XAHZKLW5WSDVQ
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SFUJDCZ5SHK5HSFLZU5XAHZKLW5WSDVQ/>
Archived-At: 
 <https://lore.freedesktop.org/7d2b8106-993a-420a-bb4d-1fd8900e360f@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/7/26 12:48 PM, John Hubbard wrote:
> On 1/7/26 12:16 PM, Timur Tabi wrote:
>> Although the dev_xx!() macro calls do not technically require terminating
>> newlines for the format strings, they should be added anyway to maintain
>> consistency, both within Rust code and with the C versions.
>>
>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>> ---
>> v2: added some more strings that were missed
... 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
> 
Hi Danilo,

Are you comfortable merging these two patches to drm-rust-next? I think
they are ready to go at this point.

thanks,
-- 
John Hubbard

