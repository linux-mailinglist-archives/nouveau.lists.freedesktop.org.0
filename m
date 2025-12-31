Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D73CEC7F8
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 20:30:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7B10E7E6;
	Wed, 31 Dec 2025 19:30:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g6BKgw3M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3AB8444C5B;
	Wed, 31 Dec 2025 19:22:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767208924;
 b=bq4DDlJ6wTTLNrLqxDaiSsw6oR7p0EBbrAW0f0vH4Ioj005Kf/vH4mqmPMXIFlwOZeQX7
 8Mr17L/P8gXias23XxKZ8jc6bENlTZ57JXxRgfwoJsa4tR/7Rok9vHNJtwQdEwTiG1vH++4
 EqooyL6+Z8RqjmNG7ssB/05h+Ico+xaq9xVuEdHvKdAJqrbXoVS9tzsWOjAyXFLvenjU96+
 mGrhc70gCUDcO2Yq3BmM6LpObOmx6/7q2+MWRh/Lqg+PiFpzBkC+aGe1UTlkno3T8m5iE+z
 04g+U/IWcFcOk/OoWqhiLA2h7jJweZ31rlTXpSYX0BHDrw0d0Xs7oiaor6wA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767208924; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7k+UEdnaM+Frd0/TFguOUuIUyzGkgFSnjemzKev+pnE=;
 b=ciPHNH3Bg0OYqmsQ67pV4iq/SqR40mVjBqbeY+Yp0nyKG/sn2FI1gLxmiWlwtwcCYIJ7z
 2uNDQNBoitcVtWH6lhEVm8ywoT5j2mTktH2DNIb2gnvRlWEaVEENm3DDEsUEyr03LXkP8jJ
 tDBSNnmHqtnNeB3AHObEkKCnzZyrq3oPxtNGQ8h6r+8ul1SWk0HSnjG07wmg/xa3B+eGwPp
 iIN75jOeqj4inzCGmIaUQoJwAmKHpZvQB62MNBugjqu4Ea9l24mdCUIXLQhNcNpRBGXria5
 7oVvxXNqPOfjZa8Q2+YqUXlRG8Zc6EdtpKEWCDP7GhNDHawwRRi3Vcp1UxcQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 77B5444695
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:22:01 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3D10E6B0
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wu1aQeX5MXQ8oAacASfwQ7sl2Gj0yiFva8569GutsEvsP+qhuprn+AWwVt8LytvVaeswIxGC9j169dsjxac1borv0Xd9ly0Y+s5Eh3fXq1o7tYxiOpcyQSi6zZMQ/jSZcGudEMZhbrg8pfy4tfibaaaMHHZ8DkCfiiFCiyqE/G4EYP+D5b8Ahn9/FeyPsMKg4hCQ35watow3l59m9aAJz0C+utU7+AROEwEhZeY4uGVkVIYIBzYI4mWGS1gC45MW+WA3KET2xdwLijPz/yoszEK1ATP4SpZHhXRAiAYzfDDffdRT2sIRzZftU5aEuHp3swRven8rKuWIlIsTmxVwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k+UEdnaM+Frd0/TFguOUuIUyzGkgFSnjemzKev+pnE=;
 b=uGIH9GdkG+qRu4uodc0ZSlMhcUoLOuGYFpN8lfgF9EO40YKY5sTErLbj+3uOyc8iY1nqoqVer3+JZM+F9x8X+7hckv0a5Fmvd5UJva+VuSipXmP/Q+kuU+Ln+wcs5P/t13sIlASQ0FbrdsGrqztdeEWqRwbDh/QefTM/3K4cTg6oWRKX14XOah47+YpXsuNB/gxitkXD8YmXAdCaqdpRB2DU9uEgsH4oFQyEls5/jmyf/UwTIT27oD9VHJCkWfGrvxZ3gat9cRrfASiu6vqw6AtJspK7mX+R6PtDoa73/ocZEu52PPXwR0OB6EjTfje7sle/yruDK7M+7Ivhyn488g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7k+UEdnaM+Frd0/TFguOUuIUyzGkgFSnjemzKev+pnE=;
 b=g6BKgw3Mp47eNhfXArUYy9Z28SJzT4ICnMNq4w01q15SmVCHE0FUjqwq6qFSt7MpQ0xKWBp/1R2TsrflAuYjEXXHBVeIc5bokvE2e8PrBFSF36D/cHHosp1LMldfE9rImgeAPAFVmqScO+pwYiMRRiKwv+x9mJihpZMXJFsH3T4aSsl/ZZxZp1dotT8q2xu2gCkUOXgHdb8Aek/CGAnICzY/Gxkdxdo3fM1kRn01sWtlLKw8rIdN8an1hBhnt2WXkoNQTMPzXq1e+vuCEDmEpLmVakcDA1S/YwZc0bYHjZon4lqhtK9B9H/LTQPgBHWf1mIdNxf4tJAhZAI/lZQj5Q==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA3PR12MB7950.namprd12.prod.outlook.com (2603:10b6:806:31c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 19:29:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:29:58 +0000
Message-ID: <a7405694-abd8-4c8a-8299-fb0d5e675145@nvidia.com>
Date: Wed, 31 Dec 2025 11:29:50 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] gpu: nova-core: rename Imem to ImemSecure
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <20251218032955.979623-2-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20251218032955.979623-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA3PR12MB7950:EE_
X-MS-Office365-Filtering-Correlation-Id: 828cf93d-fcc9-4e1d-0b02-08de48a2fbdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RTQzb0FhanIya1FHbDlOL1d4d0p5VzV1dWs5T29jWjdPdGtDMGdwNi9sWHNm?=
 =?utf-8?B?VHYvTVY0bEgzZ0wvVXlNT0pBc2VqYmZrYldFc2JWbTlTdnJHRTZnNEV4RWM4?=
 =?utf-8?B?cjRIeWlSbjRKTnhDY0NaOGx0Tmk4V0wxNEFVS3BNbnpWaTRSQzhuNHl4N1RE?=
 =?utf-8?B?d0Iyb2dmcFd1YllFclVvdFJmT3lkWGV4Zkh5V01oTWNKcmdIOVQrS242QnFz?=
 =?utf-8?B?TkVVT0J6UUorWjlBQzI1NEx1T296bCtPUm1QZDlCVW4vS3pNZlBNeitDdDNi?=
 =?utf-8?B?SzJWZEZ4alhkZlNKdUdUTFU3K3JUeWp3a21jTVFMZ1NCOHEzbGlja1ozNkVi?=
 =?utf-8?B?d2FORGdHUTNmakdySm1PSXZzT1FTR0pwYlRLaHBxODZMbnFOTDhZbVp2OFdu?=
 =?utf-8?B?dEhTVzUvWWdXNDV2V1JlUCtNdldrK3IzR3ZUTUIvY3ltYU15NnZjdWlhcHVI?=
 =?utf-8?B?VHNCcExqWDdPRGowMnRoby9pdUdSTWovZWo4QXZrSkxMb1JCbkhQNmZUNzgy?=
 =?utf-8?B?a3kyanVQNm1VSENVVkF2MWVaYTg1K0tRUmY0NFgxVEQ1OU1FYlo0VnVFWlBy?=
 =?utf-8?B?VzBhaUZBTmZ5TytsMFhjU1ROTmdlTEsyVlhBTTBhZ3NpV2xLVG16NFFyQmEx?=
 =?utf-8?B?UUk5ZkpMRDdXR0FPWi94R3hzNXlxYk9iU05WMW9VdFFsTVJJMnVHTzgxb1R6?=
 =?utf-8?B?SnJRYnhPZG5uTi82NHRRNExGdXh5ZGl2ZksydllmWVVucEdoWFhvcmJJQk5k?=
 =?utf-8?B?TjJ1UFpQQkFsMXl4TFlKZ0QrbGVJK3MrZFFxZ1FmdmltRnMwNnZJekQ0UFJT?=
 =?utf-8?B?M3hWWWJROXdzQm54QnUwWFREaWRweUxHQkRTcm5Ca0NEYXJzcnVlL2lIV2Yw?=
 =?utf-8?B?QjZCeDBVa0lNQ21ydVo4UmtrTGF0RmlDdU5RdTY5bDFvQmZWR3dibkN1eWNu?=
 =?utf-8?B?T250eFBmRGtCS1I4c0t2dFdmNGNjVTlsQloxbkwrdGFLLzJiNWtpWkFjRUN2?=
 =?utf-8?B?enZOQXYxRmFzQVd4UUF1L2kyWnVTZFRRQlBQSC9vQ3dlam04L21ZUi9GREtW?=
 =?utf-8?B?L2hzamtNSE5wRTVBemdLZ3ZDSHFFSFd1RXJaVkh6SHlSRkRqZ0ZoSDJ4WUNR?=
 =?utf-8?B?Umpad1EyOHR5Y2xXNmpiV0VEakY2Qk9rZU93dHBJWjFJc0J1K1JzcjgyZzc0?=
 =?utf-8?B?RUJVc1owL0dRbUNIM1hqai81aE1QdUtuWHJYcGNORnpyWUF1WGUxdlJRVmZC?=
 =?utf-8?B?aUMvUGhYK2JIRmk2R2J1THdadFpoYmhtWjI0WjhteDFnYmFvRENUdXYrdFJj?=
 =?utf-8?B?YTErdVhLbUE5TEtteUZkVVRzQWlkUUpEVnErK0FWeUZ4OGNLcksrNWxVOTF0?=
 =?utf-8?B?TUgvY09MMFdMMmNhME1mZC9VTGlIS3d6cDJnTkU1VjJWU1d5ckFjQjYxZ2hj?=
 =?utf-8?B?N25oLzZ1c2s3RWhNVWR4Wi91Y3FkMVpDRUlMY0YzOEpKS1hrdUE3VTNnMVl6?=
 =?utf-8?B?N3hQUm5QZVZqTmRtMFluNVN6M0tyQ1lJQ0laRGEvM0plK2dmZTJwczlVYnpM?=
 =?utf-8?B?U2MwQXhKRUhCL1d1VzVuWlFmNHNadCt4ZGc1eG85SEZpeTVBTFEzendLeEV3?=
 =?utf-8?B?SDg5Q3ROU1dxYi9yZWpYOXRRRVh4cUdOWXRISW5ZUi9ONXZ2K0F4Y2JMSGU5?=
 =?utf-8?B?eDRUbVJ6Y3ZZSDBxR0RNdkF3cXNiU1YwSWgydjloMEFZZnM2RmY1Qis1YmN0?=
 =?utf-8?B?QjNJNVJwRUdGa2N1YTUzcURWcDlTWHV5WEJudGVVbTRnd0dYcXBYdS9PUWxk?=
 =?utf-8?B?Nlg2SXhuVDBBc3N1bDJ1SE55UnYwMGROQ1JYSDhZZWsvMkVPNlZxeHkrdkZX?=
 =?utf-8?B?cVJ2UHA0Rm9KZFF2QUUwbEREVVgzaFRaUEkxSnVtV2pwandKMlRjZHhzeFZs?=
 =?utf-8?Q?7/C6wtqGnBmHOAa+btc4q88CiIdPuww7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NGJKbFlGYmtodWY1d0szTG9BczZVem9aeURsVndXTmduc3hPRk81bVlaeklp?=
 =?utf-8?B?SVR6dWtCRmJZK3c2c1NLUk5sUW91Rk03TFQrRkFrNENaWTgrZTUyRWpMNTNk?=
 =?utf-8?B?RmpHZEMxVkcxWFh5RTFVK01OSWhwZ2xEekR4aW9mQmlLV2NBOGZYbDFmMU0w?=
 =?utf-8?B?aGlFQTJlVWpTeEd2T0Y0M25jNjBiMythVlRyNGdJeXphN3FaaFNOczRRRzV0?=
 =?utf-8?B?MEtMeXQxY0VOUythQVNuUmFOV0tQV1lVcUJJZFFPb2Q4QWdQS2hjS21uUmcw?=
 =?utf-8?B?R2o4ell3VnRFZXd5eWgvMkdyc0dCTUgrUFdsQUQ5eVYvZ2xWeVN5bktoaWJC?=
 =?utf-8?B?V1J4cTQ0Q2t5RUtYUFZaNDlTK0YzTGJuV3FjYUwrS2YvV0w0a2RFbzV3RTJr?=
 =?utf-8?B?dHFjL09TVHdxZTIzdklTL3dubE14d2pyTVZHZkZ0ME5abmdoM0JlMzh1V0pI?=
 =?utf-8?B?RnMyWTJCVjBJUnd5Yy9JSVhpVWhEVW1MMFk1dUQ2bWEzaElGMWZiOTlIS0Jn?=
 =?utf-8?B?U3ZNa0djYm5xNlU4VXZiRFM5ZmlwY0FIa3FxZ09aUHdIQUMzb2RyZytqN2Uy?=
 =?utf-8?B?MmRjSnF4aVNrdVNTeXh6dkV1MCtYaU1zWXFVRVJTZlQzQVVKaEcwMUxNaGdQ?=
 =?utf-8?B?bHlLenZUK3ZZeDJlZnFONlZnOVlRdjJEdHp5UFdiWEZWSEJXQ3JEMlVCbWNI?=
 =?utf-8?B?TDFKUzlDMmhtTjFlV3lXdGJOb3BVU3pXai83RURGay9ReWZJNENQVWdoR2pl?=
 =?utf-8?B?a3JYT0RrZVp5QzBNVUVKb0dQcjZwNXR1VDRtZ2Q5MU5Kb2hrSTZRQzNWR0xR?=
 =?utf-8?B?ajZHeWdIRnRJcE1TUHd6TnNLNVZhRFk5aS94UnJtNTEvcXJHdFJPaDluWEZ2?=
 =?utf-8?B?aFhDamcyaU01NUViQXI3RzAxSHFVUmh5ek1xdzdNMkVocEdLcmxjR1F0NEZu?=
 =?utf-8?B?dmJnbWEwSUFiSlJ3SU41eGRxUTZ4WnREUWJDU0lkRXFyZmk4d2xOM1lObVZm?=
 =?utf-8?B?bkRVVnJ6cy9CWmgrT2JCb3A1WEVSYjBidkQ2R2gzaFdzakI2aloxNFBHZ0pp?=
 =?utf-8?B?ZWRyRTJYOVREb3M2djNKUVNzZXNpVXBUNng2UnlzMDh6TFk0UVFyWDdwcjNx?=
 =?utf-8?B?dXhTYzFUaFdwMjBSbUJyODJlc1VtTDNyeitzUnZSUEFNNzMwWitpSjVsdE95?=
 =?utf-8?B?TlNYVkEydVFaSnFBbk0vazdiTWh3QnNINTdtd1RTSkdMM1RSSlplNHhaUG5i?=
 =?utf-8?B?MWhEU2tGbXhMUWpic25ZUys2QnBRcUJKOXpiNnYzODNlYlNKekd4bk9WKzIz?=
 =?utf-8?B?andHMkFDWTRYZ1Z0diszRzYvd0laL2xNT3VLRVRRbU14MUZiUUIvZWJTd3Br?=
 =?utf-8?B?ZGt2SFFTRnNjdEI1OXI2Z253L3ljaE9QYWpiSEkvSEUrYVR0QUFrRzFnbGpE?=
 =?utf-8?B?Y3RUaXF1enA3R2o1Sm5FNGozTFE4YUc4UVZLYkluRjhVRkpBK2l0cHFxeVg5?=
 =?utf-8?B?TVlTcE5xZjlrNE5hU1BIMXdsK0xGRVdoVWtBemxmTFFZUzQ4N3RrOWVHYmdH?=
 =?utf-8?B?MjU1anQrUWJIRzNNSExEWGdyaVZOVVRoUFM5dmo3c2RNVnlFc0VzNEJpMXJv?=
 =?utf-8?B?c3l5TU5uaHdNcUROVi9KZUlWbmhEM3g2RGRWYjI0UjdVZnUvQ2dBYnlkTjZL?=
 =?utf-8?B?SG1IT3JsemlDc0RyaDhSVm1ZQ1Y0cE5taWh3b1dyUUtJNyszWk1SZEtVK0gx?=
 =?utf-8?B?M0lCZVYvNnM1djBuUnpoRUw4Y0lwQmFyNE8rMEplNmYvU21EREluSTBXL3cv?=
 =?utf-8?B?VUthMGFxcEJKUWdlakhNbEV6RFBySGc3UTFpc1M4b2l1TXlNcTVoYXpVQTZN?=
 =?utf-8?B?NkNFM084RmhueU1mR0hYMDI5aDRlUXFycHZVWFIrWXJubGY0aHYvN0FuS0F3?=
 =?utf-8?B?d09hZ2FGUU5IUWZsZXRwd1JOVmovbWlRZmdwMUQxa29FeFRYSU80UWkrempY?=
 =?utf-8?B?WEJqY0FSbWFHVXk2S3JpeVAzWWI0NUo0MDJjak96R1NuTGZvVEFVNlRmSWZB?=
 =?utf-8?B?Nk9JTVRMaGduRnJYK0dRdGdOd3hxMjZKd3duRmZCVW1VdFJTRzNtRGhwYnls?=
 =?utf-8?B?VHZqWUorcFlOeFJFanh2azNjYnRPTWFVZHNQcVlrMFk2N0lzWklzTzQydFNS?=
 =?utf-8?B?Q2RodFVNdmpKNld5c2JIZmZZTFNCYTNGZ0k3MURSTWJyNmZ0N2NWcnoyMmdo?=
 =?utf-8?B?Um5wTFFZVU9IVTg3UXFwSXVmZUxuVmkzSG13R1JpS3VqL1hRREprVldCSFcz?=
 =?utf-8?B?bEFHa3BacmU4UStxai9NVXYrZ3ZSWUF4ZVJ2UlNmTHp0WEJXcHFDUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 828cf93d-fcc9-4e1d-0b02-08de48a2fbdc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 19:29:58.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0geJo7ZonAhkZImhv913jfKDi2XmLLCOMKMLYe/gc4wjirTxcoRKxIg2/20tmLXZqdtXLlGkxaSL8GsJN0HvJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7950
Message-ID-Hash: 62YAP6NQCQUKAQL7DXYT75SHZINTWSHT
X-Message-ID-Hash: 62YAP6NQCQUKAQL7DXYT75SHZINTWSHT
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/62YAP6NQCQUKAQL7DXYT75SHZINTWSHT/>
Archived-At: 
 <https://lore.freedesktop.org/a7405694-abd8-4c8a-8299-fb0d5e675145@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/17/25 7:29 PM, Timur Tabi wrote:
> Rename FalconMem::Imem to ImemSecure to indicate that it references
> Secure Instruction Memory.  This change has no functional impact.
> 
> On Falcon cores, pages in instruction memory can be tagged as Secure
> or Non-Secure.  For GA102 and later, only Secure is used, which is why
> FalconMem::Imem seems appropriate.  However, Turing firmware images
> can also contain non-secure sections, and so FalconMem needs to support
> that.  By renaming Imem to ImemSec now, future patches for Turing support
> will be simpler.
> 
> Nouveau uses the term "IMEM" to refer both to the Instruction Memory
> block on Falcon cores as well as to the images of secure firmware
> uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
> instead, and uses "IMEM" just to refer to the physical memory device.
> 
> Renaming these terms allows us to align with OpenRM, avoid confusion
> between IMEM and ImemSec, and makes future patches simpler.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs          | 20 +++++++++++++-------
>  drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
>  drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
>  3 files changed, 20 insertions(+), 14 deletions(-)
> 

Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 82c661aef594..0965cb50568b 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -237,8 +237,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>  /// Different types of memory present in a falcon core.
>  #[derive(Debug, Clone, Copy, PartialEq, Eq)]
>  pub(crate) enum FalconMem {
> -    /// Instruction Memory.
> -    Imem,
> +    /// Secure Instruction Memory.
> +    ImemSecure,
>      /// Data Memory.
>      Dmem,
>  }
> @@ -345,8 +345,8 @@ pub(crate) struct FalconBromParams {
>  
>  /// Trait for providing load parameters of falcon firmwares.
>  pub(crate) trait FalconLoadParams {
> -    /// Returns the load parameters for `IMEM`.
> -    fn imem_load_params(&self) -> FalconLoadTarget;
> +    /// Returns the load parameters for Secure `IMEM`.
> +    fn imem_sec_load_params(&self) -> FalconLoadTarget;
>  
>      /// Returns the load parameters for `DMEM`.
>      fn dmem_load_params(&self) -> FalconLoadTarget;
> @@ -457,7 +457,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>          //
>          // For DMEM we can fold the start offset into the DMA handle.
>          let (src_start, dma_start) = match target_mem {
> -            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
> +            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
>              FalconMem::Dmem => (
>                  0,
>                  fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
> @@ -508,7 +508,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>  
>          let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
>              .set_size(DmaTrfCmdSize::Size256B)
> -            .set_imem(target_mem == FalconMem::Imem)
> +            .set_imem(target_mem == FalconMem::ImemSecure)
>              .set_sec(if sec { 1 } else { 0 });
>  
>          for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
> @@ -543,7 +543,13 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
>                  .set_mem_type(FalconFbifMemType::Physical)
>          });
>  
> -        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
> +        self.dma_wr(
> +            bar,
> +            fw,
> +            FalconMem::ImemSecure,
> +            fw.imem_sec_load_params(),
> +            true,
> +        )?;
>          self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
>  
>          self.hal.program_brom(self, bar, &fw.brom_params())?;
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index f107f753214a..096cd01dbc9d 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
>  
>  /// The `Booter` loader firmware, responsible for loading the GSP.
>  pub(crate) struct BooterFirmware {
> -    // Load parameters for `IMEM` falcon memory.
> -    imem_load_target: FalconLoadTarget,
> +    // Load parameters for Secure `IMEM` falcon memory.
> +    imem_sec_load_target: FalconLoadTarget,
>      // Load parameters for `DMEM` falcon memory.
>      dmem_load_target: FalconLoadTarget,
>      // BROM falcon parameters.
> @@ -354,7 +354,7 @@ pub(crate) fn new(
>          };
>  
>          Ok(Self {
> -            imem_load_target: FalconLoadTarget {
> +            imem_sec_load_target: FalconLoadTarget {
>                  src_start: app0.offset,
>                  dst_start: 0,
>                  len: app0.len,
> @@ -371,8 +371,8 @@ pub(crate) fn new(
>  }
>  
>  impl FalconLoadParams for BooterFirmware {
> -    fn imem_load_params(&self) -> FalconLoadTarget {
> -        self.imem_load_target.clone()
> +    fn imem_sec_load_params(&self) -> FalconLoadTarget {
> +        self.imem_sec_load_target.clone()
>      }
>  
>      fn dmem_load_params(&self) -> FalconLoadTarget {
> @@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
>      }
>  
>      fn boot_addr(&self) -> u32 {
> -        self.imem_load_target.src_start
> +        self.imem_sec_load_target.src_start
>      }
>  }
>  
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index b28e34d279f4..6a2f5a0d4b15 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
>  }
>  
>  impl FalconLoadParams for FwsecFirmware {
> -    fn imem_load_params(&self) -> FalconLoadTarget {
> +    fn imem_sec_load_params(&self) -> FalconLoadTarget {
>          FalconLoadTarget {
>              src_start: 0,
>              dst_start: self.desc.imem_phys_base,


