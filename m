Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7632D0096D
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 02:52:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2898610E2FD;
	Thu,  8 Jan 2026 01:52:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CrQcsPzH";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7EA8E44BB7;
	Thu,  8 Jan 2026 01:44:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767836668;
 b=vcNQc+4hIebeVLYAPJKNJe/eD1EKVpLAIzbYqvONWIj0RqRibnGisBLGz4N7i0z3ZLz7W
 kcRIGa/VZqskRf3HcGHqDcYfqCLPhICi8clUDdVR25fokHc00WCS0NG4WzIQtMTcfvUB8yJ
 yFptqe+VR/0Zpk967hXX7H3mRfTN/lD7f0YGwjSg9JpHHm/LSMgulu3iGvYa+jsKdBoaMM7
 8i4wrKbsa5NS6VzJ4yQdnPujSCZ/eiSj+VCVscFyoyZyCPWB5lkQO5/PAHaKkuACiWJsdib
 CbkzYgUI3ImkeIXqQaTRjliSw6Jzv+tdwN60JJmY4jPjFqEX34Z2T9kZ4JrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767836668; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IJQNWV+YwKl9N+jdmq9C/YwhRo5JHiwHqjKnDZZ9mk0=;
 b=YFjV+E8Ey51V/JH759G7oKc7K2IqLF8FLwrtGzRmFPea2mJ+Fye9Ijvo+xF9jb9U3GUUS
 GspaEmKD5aADJetQEL+xSqkF90X4rElJwPk6xYyTOtG6LT+Ns3Crumbq3B3ktFdFedTwVOd
 /DaNvups95SU8vhaNrqTRvO2ttoxWHzr4VDlbVOW/Fnf6OJFtTcmp9PmcZ8wKeaAACGIL1g
 tMJTsgmKDi905Lmcxu9l+W46QEZhQbXyzSJT0IWtwBw5qmJvUnkTcqqibpcmogOv2B/TtX6
 6cHP53pIIvLgNi3+wL9+Qz2dRekW/rqhlTTmQaroA1vttNuOHPVfuXfEWq/w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 05D8541AB3
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 01:44:25 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 53CA110E2E1
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 01:52:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTcc/3U9jmU5DkWanpwBxB2CJVlp1Qtfh5P1hC290wvOj/vUVggKjd60uATUYrw59ktrX3VGpAg+P+Qv+IN9HY1IEJBiD2InBmLPcMO5rqNl+Ad8PUhSVzdzw/4RavXGfRanNocLP5kLNqacw60q0UsS6xg5cnrP2+47U1LN84mnTr6nmo3IN9eJx60F618dCwRiLJPN7v2qavi9QBxJrm0CctyRWLGETpDEsPQWsP/FP65D+D87u/VvTryxqQw9iLg/ojQl/k42tr+8sQvqd7avBttAlwZQ3+sDT6dVVRWteexg7D/63MdNjT5F0B4Q/X78uSlpLkRIxsRlvkGimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJQNWV+YwKl9N+jdmq9C/YwhRo5JHiwHqjKnDZZ9mk0=;
 b=fWOLm0FKd7U8f5P9NBgGqDHqLhIQ2YKTUneQG7cjkpGTKlwBNHGJlCcwiKcdkrQmj3WxUP+Fl54qWwMg56hRqaoD2dB7luAEJChZq0qbNlh6KNIbOu6GhFXwRL+B8lTvDFp/uUjYzPo1k2x/v5sjKz5L2MdHKGNTPpBmHOLh68HBOV2Je+CHmH8NuYksUq7d+6Q4p3gZ4OAZwSYhyXmp8VwjXspAkr6v7ozPkqhu5MypAMo4pIkgZyRBKuhq7TSVbjl6QKrJZuIaOyS7HS/lPSYN4sZpd1xHycTivIchxf9yCFvPi2M9sqFPTWefwtP+NMVhHBbT2GMAfaiBKNGhHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJQNWV+YwKl9N+jdmq9C/YwhRo5JHiwHqjKnDZZ9mk0=;
 b=CrQcsPzHwsxRcaJw966zfqypGGPqfvWDIbCUUp3O3Mkag90l18oz7Fw7gUe4Cc9onqdZfsxmbni1yghVM/3iFg4o3yzjPVDj7osLVRcrVxcNKPUI0gr2nZzu4LNkVv8vr4ReJKP+8q1RnRj+gD0wQIHMki70DH4WBL6Q3T+y/2lVXCcVEg7JVT8UkH+wfNNM9AkjRsjapJUyqimdg7kjIW3Omx4xIBZyQLzc/5V165JjJJqIz6s2wg+DOB7Chjyh3oEJhU7EmEXfWsDFtX+RkwjPFYllKXg7DsQVBlU4uhNKZqrtzfnI5ls7ZmNuI0NYt8tJEEVHjBF0q4d1W7OStw==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 01:52:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 01:52:37 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 2/2] gpu: nova-core: don't print raw PMU table entries
Thread-Topic: [PATCH 2/2] gpu: nova-core: don't print raw PMU table entries
Thread-Index: AQHcgDng2SYWytHF/E6L1W7S22auxLVHgnlw
Date: Thu, 8 Jan 2026 01:52:36 +0000
Message-ID: <6342AE4E-DB30-4367-8C3A-53EDD02C3D19@nvidia.com>
References: <20260108005811.86014-1-jhubbard@nvidia.com>
 <20260108005811.86014-3-jhubbard@nvidia.com>
In-Reply-To: <20260108005811.86014-3-jhubbard@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
x-ms-office365-filtering-correlation-id: 476ba4ae-36c6-4809-b640-08de4e58995b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K0NJM2YvVm1veCtZeXZHMm4yUDJscEMvVHlTK1BLNTVVbHBNdmxQWTY1dElq?=
 =?utf-8?B?QTFTbjVQVVUyYm9qTTFRVDZqYXplT0U3T1BXcit3MGdleHhSamRFRkZ5UHZ5?=
 =?utf-8?B?M2plRVB2ZTYrU2ptRG84eWlxR2tjdmZWNG5LYzhkeFNjWWVqN3JCdVlZOG8x?=
 =?utf-8?B?Q0R5UVNSMllnQWk4aVVlZFNXZlYwdXBYWU9iLzV1aDQvVnA4RThzdXVrZTMw?=
 =?utf-8?B?WXdldm8zYXJJdVkzd0VrWjRRc2lQK0k4MTVnTHpsQUl5NFFMTHQ0bWFuZVd5?=
 =?utf-8?B?Z0JudVl1YndxU2FiODA2MGliS0RYYk5la2ZyMWN1SVlISVp2MkN4SXdSNnRI?=
 =?utf-8?B?Q2hXNGtFUzBvYnZQU1NaMlZJa2NKYmpuZXdrMkduV29KSUZmeTV0bXc2d1dh?=
 =?utf-8?B?UXozdjRLVWcvY1Q3cStkVDhjSDBOKzBpUjJOWWhqTWh0LytrdWszdTF6OENP?=
 =?utf-8?B?MmhjQjFGQkNUa2pmWUJJUjB3WmtTZzRhSTFRNFV1cmJxWFZIWUdhOXBhNTUv?=
 =?utf-8?B?NGFOM1RxK1o2Z002SmlOdnFKTWw1ZWpxZHZKVjJoZHE4bzcxRVovaVRzSjBH?=
 =?utf-8?B?c1RRN3NwSThCMW05eWZ0bnE0cE0zelVOaHU2RzYwb1laRVQ4VzVxWmo0UHEv?=
 =?utf-8?B?UnFGM2VESkdibm5BM2lqUnpha2VOQzhQbDI1RExyaG9lbEtPeTNnUnUxTFJk?=
 =?utf-8?B?aW1oanFlNGhwakQxNENKVGJTV3lxQzVvTjZBc211N2VZNTlmNWpFQUVLek10?=
 =?utf-8?B?TUIvT290cG5ZWlFLTWsrR0IvUkZpU0tPTmxCbVBWWGRqelo4ZVYzbjMzNThV?=
 =?utf-8?B?SWZFZC9PcCtVZFJnMGMxaGdXSGYwY2FEcldVSFBHRytQZG4xY2pPem9lS1lq?=
 =?utf-8?B?MVJwalpVVXluemhqSWd5c3pQVG5Bb3hMYzg2NEVkVDhtcDB1WDJ6bjhIMDBw?=
 =?utf-8?B?bUtFUllCang4WHhjMEdhMjRxczQxbERPcEppSDA3ZG5CTS9JNms3UFZZLytP?=
 =?utf-8?B?QXBDV0VyTnFRM2x0cEY5MnFWZk16UElUSDcwaHlab1hhNVd6L2o0NEV6SDd6?=
 =?utf-8?B?Zi9uZWxGam5iY3BZREJUL1BsalFmNjNsMGxGSGtMUGRVeFcwRDFTMXlHa0R1?=
 =?utf-8?B?OXBhK20yb3g5L0xGVEpQdzdTMzFrNTZzOHdKMmVibCtuaGl4MkNkMm4vQkNi?=
 =?utf-8?B?THVkcGVZSTkzc1RCLzBWbWtCWFZxSzZDZHpRYi9iTDBNZXFWTUx2L0U1enVq?=
 =?utf-8?B?WllNb2pSQ1JCQ0dwRlc1M1J2Z3J0NG0wSEtYemErZnIzelNiUVd3ay9CTkRh?=
 =?utf-8?B?QTdQdzZGdjFENVhRbW0wWmQ5VXo4UWM2T1JIa1BpcjBHSGdPNlpLQzROcHgy?=
 =?utf-8?B?eFRUQWNNTzR0Z2wzbWQvY3BRZWpPKy9JU09kWGowZ0hWejR0V3dDUTQybURQ?=
 =?utf-8?B?aXJlekF1MktkdHlyMEdzT0p5OEFmSjYxaXZ6OGprKzFhY29raW9EQmUxd2c4?=
 =?utf-8?B?TmhrTzkrcU1RdWlKamNpS0trWjlGSWNiZWcxdURsV3ZKaXA4bE1QZ2dNL2No?=
 =?utf-8?B?K2IyaW1VYndGa3BobHNBSTRCQzN6UXlxNkc1L0FXWFNpOXpzZ0I1WjF6OGVu?=
 =?utf-8?B?SXZTd0tjZFVsbEo5TnNwbXFXZ3NwalhPMkxmWnVVREEyVTdjTWkvODNoN1Fa?=
 =?utf-8?B?QXZlTm1yS3hnY0w1bTY4THhOcU8zYnlMLy8reXNyZUFwQjMvNlJjV1lXSkpN?=
 =?utf-8?B?eFhKdUN0Sm0rTW9OWnBPdEx4NGNjOWxFeUlSbWxrQ3Y2VC9yc0EzbDU3NkRh?=
 =?utf-8?B?aFg3YjluclFsZW5uUzV6eXoxWnBJcjlXVy9UeUh6cWFibnR6MWdTdnJWSXVV?=
 =?utf-8?B?OVFtZGFiWFJubVhYOXpKTkdPNmxsb0phaDlCbGNmRlFRWURrMGMrQ0dWUXN5?=
 =?utf-8?B?ZmFZVnc0VmpsRlRFbUxUTFVwZDBqZmZOc1Yzd1JzbGFlWWpMTlZiS3A5aVd5?=
 =?utf-8?B?QU1LT3ZEQWVFNG1hVTArUmEzUFNCS1hlaTlldUtqc3p1VFl0SW5Ub0IrTUlm?=
 =?utf-8?Q?YRMM8f?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?KzVoaGswRENQUE85bGVmMjkvSzdReklFVzFGV3lURTFLM0FPQUpWWm9WcnN2?=
 =?utf-8?B?QU1ubWZqOVBiOGNwd3R4b3hlSWE5Z25TNHV3TkFET1B2YU0rdHMyZ3JabGdT?=
 =?utf-8?B?Tkg1cDNjOThLcWQrMGlNRzFDRmQxNGs1ZEg4dkk3NE9qT3BmejBFa0N0SWNW?=
 =?utf-8?B?OWkxam9YcGRFMHp3STlBcWNFSmVicWVmTTFoeDluVEdzK3NHd2ZWZkwzUUh0?=
 =?utf-8?B?Ukd2K1V1S09NZFRDWGJPaEJpc24zUDRKeitORERCem1STVh0MExTRDZsRnYr?=
 =?utf-8?B?SlUyYW00b0pzN2VZdHN6ZkZHeUgwNlU2NmljQ1h4V1lQcG40bDk1M2xmOWls?=
 =?utf-8?B?eCtjNkFGcGMwbkViQlBlaGdHcm9MNlVTRWFtbXkwdlRUZUllQXJmL2w4dG5m?=
 =?utf-8?B?bzk5YTVSelYyNGp2dXZQNXNEY2RzSFMzem5VckpxWXFtcnpqQmJnV3AzMGNK?=
 =?utf-8?B?Mmt4SDdKa2xIVUMyaU91N3cyd2ErZjhVekVuQTh1bHJ0VmQrNlNxSmlrSkxM?=
 =?utf-8?B?UnhEaUpxUlhITkNrWnE5akJVcVluaVprcnpyZ1Z2S0lqb2JJNUFKODErZTNL?=
 =?utf-8?B?NWdBV0tDWTVqVEp3N3oycHNVVUdRcVdIQmxZNmhYQTJVWkQ4SmdyVVJwck9t?=
 =?utf-8?B?ZTF1d3RlR3M3c2hRREM3L3RxMEZDR1ZhWlU4ZG5xKzdXaFBvYldvZUpIb2lP?=
 =?utf-8?B?TkZGQ3BuMGNpY1FnanlIak0xQUVGSkN0eUdIbk1jQlpyQWs4YUNxN1RKOEJJ?=
 =?utf-8?B?SFE3Qjhzck9OaUt3bkI4dHBrNGU3RXE0dHpXTmRFbzl3THhRNm1IakczYjJs?=
 =?utf-8?B?RXhtZHFxYThUZ3dSNG5OYzFScUVESE1rS3NDOGpmbFZGUUppTlM3NG04bXZM?=
 =?utf-8?B?eVNSSHpIQ25CWDB5UVVnR0VyMXZ4cTRaWktRM3R5VDNqNi96OVduVWQ2bUJ4?=
 =?utf-8?B?QXhkNU5WRmRxUVZPYVd1V0FIQnN0bzk2ZUZEUUo2RjhHSTRFRE5RdXl3VDBw?=
 =?utf-8?B?VytQb1Fzd21PdHlUUGE2QktxSm1DVkZ5U3JPS0liUWJOR3FEUkp5OW1tM1FF?=
 =?utf-8?B?SjI1SnZGdU8yUDFwOGlTZXBPZHdDRzhQTEcrU0U3eEZYRWpwMVBMeWNXblRx?=
 =?utf-8?B?YWpIbzg2MjNuRENWNzVlcHo4cVpNVk5WLy9nbjg2cFJzVTc3OW9tQUlvWVdr?=
 =?utf-8?B?OEhZKzhWVDA4WEVxRkRHMmhiSzFCWkZlejNKMHlCckRndjhoWDhaOWtTVW1E?=
 =?utf-8?B?bXlFYkhVZ056Q054dlVVMFZvWWFMWnZJdU84MW1USm5qNDBBTTk2d3F4cDJ5?=
 =?utf-8?B?WmpOTWV6bThIa0xLbFNuL3BUN0VLaGlzMzJKMVptNFBqbUc0Q2RnVlJPYU9p?=
 =?utf-8?B?S0I3a3BpR3R4MjVuZUlWZ0pMalErWTVPbXVqYXFpRm1DeG1GSytVNXNQcUhs?=
 =?utf-8?B?L1hyZlNzdVB6a0dqc204eitxTDB0YnJmanRTOE5INU1qek5LQng2TnNrMkZM?=
 =?utf-8?B?ZUsxcjBaai96S0hjTjVtaU94OHJGbzRhd3d4L2NPdWxBWlpoZkhzYkVKU2V6?=
 =?utf-8?B?aHJrQzlQU3NqMEF4QlBueDErYWtSR3dIbG1JdjM2U1RwdWl0SkljOVcrMDN4?=
 =?utf-8?B?RDY1NENsVjBxdjl6Y3N4YkNHMG54SEFUdmkrMFBVWHVleUZCVEh0Q1AzZkxY?=
 =?utf-8?B?QVFHSWhWNCswdUhOUmk0T2JsN3BDTEs0YVZ3akc3eHBjVEQweGNUUGhpVXd4?=
 =?utf-8?B?NHdUVFdSLzdzRzFKQXRtVmVvYmhyVDdVR1dpVXpBWFFHNnRETFNjbURJQmhs?=
 =?utf-8?B?QXNhenAycjdVVWRQandFdDhDVVRySjJaUUdOakd2WW83S1REV1FISjlQdGk4?=
 =?utf-8?B?RXhkeitzdWY2V2xOMVVjZHJoNEgvSEkyTkpMM2dDRnE0WW1tNVBkM3REMnBQ?=
 =?utf-8?B?dWRub1FrV2hGeVBNdDNEckppTFpkUGNOcXVZMG9wSWZPQ2pwOUhJWktpa0Vn?=
 =?utf-8?B?ZXpRaGxiTzc4bisrSjQrSUppNkVod0tLbmpLYi9jcndMbWZTaVJWQUhGWGhQ?=
 =?utf-8?B?VkNEYmsxd3ZRMFZMRGRLaVBDeUdXOFphd2FScHIrelJhYkNKc2xIRGJMaTky?=
 =?utf-8?B?NFRRVnB6aGhoaUE2N25PTkx0QXQ5RlBJUHdpc1A2WWxvR1VTSmRlSVFBMkpC?=
 =?utf-8?B?Wm1OWVZ6Nk5kY2FHSjBNYWNGYThlOEFTQXczVVlzNTN5SW1hK29Nbkd0MDVh?=
 =?utf-8?B?c3A1NG9yNjU4UkdXRURXKzJCZkRNTXFnd0xNc2RBSUxvZkNYOGJTZkdrY0hI?=
 =?utf-8?B?aG5yYW56bHVtaVQxaWZ4YlJ0SWEyN3ZXMXI4RmdvdlRDOEhYeDBLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 476ba4ae-36c6-4809-b640-08de4e58995b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 01:52:36.9805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CoLGaqjjGLwGzwlHRR5Irg4wGKI8OmS3wvI6r7iFRcLsTRlu/xlgevTiRelsdM6i3sX/oQKG6r7EjYU6tNCxgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
Message-ID-Hash: S567VDPLV3SYUSVA3JBHDLXVBZVZHR2Z
X-Message-ID-Hash: S567VDPLV3SYUSVA3JBHDLXVBZVZHR2Z
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S567VDPLV3SYUSVA3JBHDLXVBZVZHR2Z/>
Archived-At: 
 <https://lore.freedesktop.org/6342AE4E-DB30-4367-8C3A-53EDD02C3D19@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gSmFuIDcsIDIwMjYsIGF0IDc6NTjigK9QTSwgSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPiB3cm90ZToNCj4gDQo+IO+7v1JlbW92ZSB0aGUgKGxhcmdlKSByYXcgZm9y
bSBvZiB0aGUgUE1VIHRhYmxlIGVudHJpZXMuIFRoZSByZXN1bHRpbmcNCj4gUE1VTG9va3VwVGFi
bGUgaXMgc3RpbGwgZ2V0dGluZyBwcmludGVkIChpbiBtb3JlIHVzZWZ1bCBmb3JtKSBsYXRlciwN
Cj4gYW55d2F5LCBzbyB0aGlzIHdhcyByZWR1bmRhbnQsIGV2ZW4gZm9yIGRlYnVnZ2luZy4gVGhp
cyBvdXRwdXQgKHRoZQ0KPiBleGFtcGxlIGlzIGZyb20gYW4gQW1wZXJlIEdQVSkgaXMgd2hhdCBp
cyBiZWluZyByZW1vdmVkOg0KPiANCj4gTm92YUNvcmUgMDAwMDplMTowMC4wOiBQTVUgZW50cnk6
IFswMSwgMDEsIDU0LCA1NCwgMDEsIDAwXQ0KPiBOb3ZhQ29yZSAwMDAwOmUxOjAwLjA6IFBNVSBl
bnRyeTogWzAwLCAwMCwgMDAsIDAwLCAwMCwgMDBdDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAuMDog
UE1VIGVudHJ5OiBbMDAsIDAwLCAwMCwgMDAsIDAwLCAwMF0NCj4gTm92YUNvcmUgMDAwMDplMTow
MC4wOiBQTVUgZW50cnk6IFswMCwgMDAsIDAwLCAwMCwgMDAsIDAwXQ0KPiBOb3ZhQ29yZSAwMDAw
OmUxOjAwLjA6IFBNVSBlbnRyeTogWzAwLCAwMCwgMDAsIDAwLCAwMCwgMDBdDQo+IE5vdmFDb3Jl
IDAwMDA6ZTE6MDAuMDogUE1VIGVudHJ5OiBbMDcsIDA2LCBlMCwgYjcsIDAzLCAwMF0NCj4gTm92
YUNvcmUgMDAwMDplMTowMC4wOiBQTVUgZW50cnk6IFswOCwgMDEsIGJjLCA1NiwgMDUsIDAwXQ0K
PiBOb3ZhQ29yZSAwMDAwOmUxOjAwLjA6IFBNVSBlbnRyeTogWzAwLCAwMCwgMDAsIDAwLCAwMCwg
MDBdDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAuMDogUE1VIGVudHJ5OiBbNDUsIDA3LCA4OCwgZGEs
IDAxLCAwMF0NCj4gTm92YUNvcmUgMDAwMDplMTowMC4wOiBQTVUgZW50cnk6IFs4NSwgMDcsIDM0
LCBjOSwgMDIsIDAwXQ0KPiBOb3ZhQ29yZSAwMDAwOmUxOjAwLjA6IFBNVSBlbnRyeTogWzQ5LCAw
NSwgN2MsIGIzLCAwNCwgMDBdDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAuMDogUE1VIGVudHJ5OiBb
ODksIDA1LCAxYywgMDUsIDA1LCAwMF0NCj4gTm92YUNvcmUgMDAwMDplMTowMC4wOiBQTVUgZW50
cnk6IFswMCwgMDAsIDAwLCAwMCwgMDAsIDAwXQ0KPiBOb3ZhQ29yZSAwMDAwOmUxOjAwLjA6IFBN
VSBlbnRyeTogWzAwLCAwMCwgMDAsIDAwLCAwMCwgMDBdDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAu
MDogUE1VIGVudHJ5OiBbMDAsIDAwLCAwMCwgMDAsIDAwLCAwMF0NCj4gTm92YUNvcmUgMDAwMDpl
MTowMC4wOiBQTVUgZW50cnk6IFswMCwgMDAsIDAwLCAwMCwgMDAsIDAwXQ0KPiANCj4gQW5kIGl0
IGlzIGltbWVkaWF0ZWx5IGZvbGxvd2VkIGJ5IGEgbW9yZSB1c2VmdWwsIGludGVycHJldGVkIGxp
c3Qgb2YNCj4gc2VsZWN0ZWQgUE1VIHRhYmxlIGRhdGEsIHdoaWNoIGlzICpub3QqIGJlaW5nIHJl
bW92ZWQgYXMgcGFydCBvZiB0aGlzDQo+IGNvbW1pdC4gVGhhdCBsb29rcyBsaWtlIHRoaXM6DQo+
IA0KPiBOb3ZhQ29yZSAwMDAwOmUxOjAwLjA6IFBtdUxvb2t1cFRhYmxlRW50cnkgZGVzYzogRmFs
Y29uVUNvZGVEZXNjVjMgew0KPiAgICBoZHI6IDc4MzgxODI1LA0KPiAgICBzdG9yZWRfc2l6ZTog
NTk5MDQsDQo+ICAgIHBrY19kYXRhX29mZnNldDogMTQ0NCwNCj4gICAgaW50ZXJmYWNlX29mZnNl
dDogMjgsDQo+ICAgIGltZW1fcGh5c19iYXNlOiAwLA0KPiAgICBpbWVtX2xvYWRfc2l6ZTogNTc4
NTYsDQo+ICAgIGltZW1fdmlydF9iYXNlOiAwLA0KPiAgICBkbWVtX3BoeXNfYmFzZTogMCwNCj4g
ICAgZG1lbV9sb2FkX3NpemU6IDIwNDgsDQo+ICAgIGVuZ2luZV9pZF9tYXNrOiAxMDI0LA0KPiAg
ICB1Y29kZV9pZDogOSwNCj4gICAgc2lnbmF0dXJlX2NvdW50OiAzLA0KPiAgICBzaWduYXR1cmVf
dmVyc2lvbnM6IDcsDQo+ICAgIF9yZXNlcnZlZDogMzc0NDksDQo+IH0NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4NCg0KQWNrZWQtYnk6IEpv
ZWwgRmVybmFuZGVzIDxqb2VsYWduZWxmQG52aWRpYS5jb20+DQoNCnRoYW5rcywNCg0KIC0gSm9l
bA0KDQoNCg0KDQoNCj4gLS0tDQo+IGRyaXZlcnMvZ3B1L25vdmEtY29yZS92Ymlvcy5ycyB8IDUg
LS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL3ZiaW9zLnJzIGIvZHJpdmVycy9ncHUvbm92YS1jb3Jl
L3ZiaW9zLnJzDQo+IGluZGV4IDdjMjZlNGEyZDYxYy4uYWMwMWViMTk1ZmIyIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvdmJpb3MucnMNCj4gKysrIGIvZHJpdmVycy9ncHUv
bm92YS1jb3JlL3ZiaW9zLnJzDQo+IEBAIC04ODcsMTEgKzg4Nyw2IEBAIGZuIG5ldyhkZXY6ICZk
ZXZpY2U6OkRldmljZSwgZGF0YTogJlt1OF0pIC0+IFJlc3VsdDxTZWxmPiB7DQo+ICAgICAgICAg
ICAgIHJldA0KPiAgICAgICAgIH07DQo+IA0KPiAtICAgICAgICAvLyBEZWJ1ZyBsb2dnaW5nIG9m
IGVudHJpZXMgKGR1bXBzIHRoZSB0YWJsZSBkYXRhIHRvIGRtZXNnKQ0KPiAtICAgICAgICBmb3Ig
aSBpbiAoaGVhZGVyX2xlbi4ucmVxdWlyZWRfYnl0ZXMpLnN0ZXBfYnkoZW50cnlfbGVuKSB7DQo+
IC0gICAgICAgICAgICBkZXZfZGJnIShkZXYsICJQTVUgZW50cnk6IHs6MDJ4P31cbiIsICZkYXRh
W2kuLl1bLi5lbnRyeV9sZW5dKTsNCj4gLSAgICAgICAgfQ0KPiAtDQo+ICAgICAgICAgT2soUG11
TG9va3VwVGFibGUgeyBoZWFkZXIsIHRhYmxlX2RhdGEgfSkNCj4gICAgIH0NCj4gDQo+IC0tDQo+
IDIuNTIuMA0KPiANCg==
