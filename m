Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68207CC6481
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 07:40:53 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5981910EBCD;
	Wed, 17 Dec 2025 06:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WKGX9JKl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5CC4E45629;
	Wed, 17 Dec 2025 06:33:23 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765953203;
 b=Sl3CudydeOiRaZETXdqZw2zljhDnmchnPOd9oks27WYWdPPUER/3DPESnYc47Ztrn2PD6
 cFyPh3CUG2KRoBgFQxg+Re/fDBPifwU6zLYqgkHOsG0DOKtnIf/Zy8LnrXPSmEil30LYmOB
 3Cw4JDCR4zyO8lkeI5WGtgOTxSkipJw1dTrc12LA/j0Px+EEXzkFOSTQ+M/lO8aqjKdxAhs
 W2P9v4yqDfyVDW/IJu7xpLjBUBhF54ghfZx5v+3GtJQkx8WEdTeL/e1Ykz9R+Pf4jUsVFoG
 7Ai6tqxQ+ALKovJG9D4TMqqNOutlkiskOCKy0WgZKQBoWhQjYMup7aixus4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765953203; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eeVtHrl299uuzuVYuB5FjRhB5j1DD1pquJIHk+O+Z6c=;
 b=g+0Sm9n+dlkCB2VWVpC7N2ZcAQCZes12+Q+ceg45FL6qwxEhteEnPPg7dbokT8+PFbuwm
 0PhNTclaIgIMqAMtNIb8IdSQsMWf3pkCBNG4jzpuK9fDbOUJY30k4m79H6nelhAuntDxh/s
 WHFmMIC7klyA+3zDvRI3V3LLoJoQ7QTD/n9iRhS0t6SiTDVuofhE0cwL4mjWAcR9H2aDqlA
 UWZqFG1VYlVG5AZQpYpu/u27em63KNgbdWauWQuSdcPhGgkzFCh7UxWMl4Fe2OUhc4o+QUW
 o9Jd+681dLwQz5TIolnu1/ieEPJgOLMwcAPrvlbBc65uzUq0reTsg88SjVLw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 54BC045623;
	Wed, 17 Dec 2025 06:33:20 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08A3D10EBBE;
	Wed, 17 Dec 2025 06:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McUyGc9PFybQ4Un1Q8ppZezXmspDuTYX/ZP1GRSudR2YrIyZAB+w1icp7HevqVE2LMknaWSfxl83pUGoR9gFx7QR0Y6FbB5hicZAGlOqwfXOP4xKQeLu2RQe796dJyeMsG0tyVq/0IAxNLZ+NnjcdD57V/0HGj3QbNXioVNTdHCgw8+PZuYJFYEI5JyOtEsXcx2Z1AholDYvy16ljoHyvpzIiLcdiv2RHQP0vhoNyHB4LJH9jSpThmahgyYCu83FYC5aqPgEe9+EmLE1E7hMhQFXcldqLBPzVaSBE7Y+unLUSDRWwSJb/tmQincLM3GDRCLlc2FB7ZZNbg2i3HHfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eeVtHrl299uuzuVYuB5FjRhB5j1DD1pquJIHk+O+Z6c=;
 b=xJnZGfFXJ4h7UZU+fOdCaqYLYVoXc7jhS2wDWKtUe2EZkuuq7E/kdxTX6u9EAkHRLMfA6mtcCxMK6piabTD9EEWDioAQj8YaIuXmVTENX6GN0Hf16YJDiJ1uOaUkIt/bNnEU0P07fUV5o78hEwoO3f/Ix5CpRDkHyphNaJzJmFH7mY3Ovj2xXHFuuBhKFHNrc16ZHnyRr4wFMWw4pW9aQdbzHogusdLhhmodTcvcfb1Klud1DiOC9sLjYFnTD1grhXq9RaGVLqxxM16w7QK1DByr0DM0o9yo7miVdvMjls1OaRC9xY3XuGI8SKn0pWT0uYNQLoGutO+cFvDpN/yoHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eeVtHrl299uuzuVYuB5FjRhB5j1DD1pquJIHk+O+Z6c=;
 b=WKGX9JKlEb1rCV8ggmtbSiTJGjXQnZ0ak4HWm61n6eREquFCloCAWSsWbi/gooyQpTkfzZX8nCJDfOkMtNz8pYEGmCM5JI2rG7wA9gpNfkOFFmOe4Qo+SCsUFZmvvH4MV4e+eS4MttOW8Q4Hn79AU8O/qQPsCSkwC5F2OooKdU4MnPWHMrn56Nw/aZ6OHcc7UFiwO0+igmQ09wWHZqEanTeFEvo9RjzVt6cKkFseTu/iaMs/hA/Ikn1IVgwdawVC0xqvGLvGZ5Sh2Ng2gUqDe3M1hI0977yB4c4PGDkbgHP9cnTYLPFcAZ859DTFlxQ2FiUzQqBJ4AUO9C64GGoTPg==
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7342.namprd12.prod.outlook.com (2603:10b6:806:2b3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 06:40:44 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 06:40:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:40:41 +0900
Message-Id: <DF0ABJ3I9PXO.1IFQVY210KIV3@nvidia.com>
Subject: Re: [PATCH v3 08/12] gpu: nova-core: Add basic Turing HAL
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Lyude Paul" <lyude@redhat.com>, <nouveau@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251208231801.1786803-1-ttabi@nvidia.com>
 <20251208231801.1786803-9-ttabi@nvidia.com>
In-Reply-To: <20251208231801.1786803-9-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a5e2fb-df57-453c-2734-08de3d373440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NEpmb3Q3Ti95OS9rK3oxWlhPOUJ1ejhVSVRNM0pqcnFIaldvUU1MTXdFY3pQ?=
 =?utf-8?B?M2ZXUHYxWVpOMzdrQVNGKzdhdDd4RmJwK3pVQlRFSDdxalFQejZIc2d5THRy?=
 =?utf-8?B?dDNjdHpHUFFjSWwxVTNaakkwMSsrQ3FiZHJZTTdLQ3VEcGxKd3A0WkVkakp4?=
 =?utf-8?B?endIaEdZWHpMZWZXRVdSSk42LzJDQzFiZ1ZRa0s4dXFtTDRsYzNEZ3JyV2xM?=
 =?utf-8?B?ZmY4UnhxV2tYcmV6d3NqY3NZdkhPSkl2QUJQK1JybW8zMTBrejR5SWFRRU5X?=
 =?utf-8?B?cDM1WGdPL2pRRFZVdlBvSms1V2dKT0Q2d3dPVjA1OWhxcWpMQjlzWU5LRzNJ?=
 =?utf-8?B?RC9PYWEyVHl0UFk3bmFxMThZUWhLbzZXL1lLbDUzQlFUbmp1RFc3cjR3eURK?=
 =?utf-8?B?cUlpS2Z5bE5wY3dTcWNyblc2MXdUUkVtZUZSaS84RzB2ZlVkd0JkeEhPV2Q1?=
 =?utf-8?B?Y3ZVNXJsdTBjQW9ubnYxZW1PbG4vZmp2U2dKU0c1RTRjY2NtdWlEZlNFZmww?=
 =?utf-8?B?TGpJcUpKc3F6Mk9rWUcybkowS1NkdTlDSUNHaGIwNGhPYXpyc1Jiamk5SkFV?=
 =?utf-8?B?L2RmcFJMTDk0YlE3UEFrRFFEaUp1c0FlQlpzSEpveEFsWnM4YjVVMXRIYkV4?=
 =?utf-8?B?TWIvY05jSTVic08zRDdPckhOSFcvbDdCZ0ZFbWZ1eXFYaTIzRUFCNmhNRGNz?=
 =?utf-8?B?aTVjTC9BeFAzWXJ1REs0MGxiWlpZNUw4aXo5ZngweU1HcGZNclVwZmxFVlpM?=
 =?utf-8?B?TjF3Ly83UFlNS2ZWSWcvWHBsUEY2ai9UaUZwU01uM0VPRWpTbWwzY28rc0pX?=
 =?utf-8?B?Q2QrZWt0QWVYZ2J1NWVLQ2hpeUtOYjA3U1lIczlmdWN4T2dBRVlPMnJrYU51?=
 =?utf-8?B?alRjQUQwQ3ZDc1ZLYm10MnlQTm1Vem9DUERLSFNkMTVRM2RCcVR5TWxCdmht?=
 =?utf-8?B?dDM3MS96WHF4S1ZQZ2V3K0FYSzdBYXZKMWZ0ZzMwbTZqSWFiNHdoZnNxSlcx?=
 =?utf-8?B?RkZkanJkdzEzVWVwaVFmZXBhRjcxajlvVTdTWVl1UE4wV3FhOW1PMHJZdUc1?=
 =?utf-8?B?eWRZNkUrZitNdGZnTGtZU1h0bzd2TXB0TjBUYkk5azRXUytNU0c1OVlRSUxB?=
 =?utf-8?B?ZnZTNnRIeFdpNmE5Y3pvc3Q5VzE5RGxTcStnTjUzR1Q2SUlma0FCWGhOZkY3?=
 =?utf-8?B?Tm83UFhZYTFmN0VqanNtYXlIV3VVYm1DUWNMMDJ2UzlsWldDVTVFaUZhVW45?=
 =?utf-8?B?bzEvNnBnWEJ3RWJyNFJtQ1hFMHBuTW9MVFpoM2wvZ2EwOWthVEhSbUV3RWVW?=
 =?utf-8?B?VnlBOVp2TkJ5cXhmNFpQVUkyRVdidHNPUS9vck5zOXZnVjhVaDdWM3oxTjE2?=
 =?utf-8?B?YkFJMENGK0ZOa25xVk4xYWQ4ZFBweHI3MVZCMnJUYmd3Y2tnOFYrU1JoTXJD?=
 =?utf-8?B?SWdHalNwQ2c4N2RMUS9lQlNpVVJMQUxibEVudEN3TCtsait0Y0diSmtMckZv?=
 =?utf-8?B?ZW9KYkhBcGlsTWhRMmRtUERWdm5nNytUUy9SZXpCdUYwMTBCTm8rclp2N3V5?=
 =?utf-8?B?WndtUjJ2cFh5blF4d2ZzeXhtemx6Um5ST250VG5WemhlWjg5N2FtZ1NuNDhV?=
 =?utf-8?B?aTI4ZWVJaWJpaWNsNVNVTEltaEl1Nzg1UFZFczJyU0F4Sm1PQ3FTOVZjVU15?=
 =?utf-8?B?dy9JcGROaWFRV0tFVk5PMzhwNTlHTXg2Q3JEN0xQd0QrWlF1UVQ1djhuTkJr?=
 =?utf-8?B?TFJHUWVFVFhxVG1lR1J3MFZZazBxVnYyWkdoMWptL3U0TE4xd3A4SXVmVzAv?=
 =?utf-8?B?cWgrQjF6MjVPVVlKcXgwWWsxdmpuUTZMYnBZaTB2VldnaXk0L1RDN01FZytk?=
 =?utf-8?B?Z2RkNGJFTXo0eFBwbGdCQnl4RENZUWtYbW9QNmMxSHJPckNtU3lVQmZFNmlv?=
 =?utf-8?Q?RB0/h1tdVvovhUUY+vLwRSegsnUp8m8j?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OU1UTW5uK3ZyRGl2MENzTXNFTFYxSEowNmJOQW9HTlFFdU1MYm1tQ3EyU0tG?=
 =?utf-8?B?UVJqTVlhSzFQNlNaZzk4dFpxT0NOZzJVOUN2Ry9lQ1BlVWNyT0QxVU8vQXlY?=
 =?utf-8?B?MmNTMmJaTmh5TDJHVmNjZXE4d2dkREtSc3hOWFFxR1lJNXpscVZ6Y3haY0VX?=
 =?utf-8?B?Mjd2eUJjR1dPc21jeFFvMHRpMURNV0JOVXlmVGZMNW1oUDRORFUvQVp2NnFS?=
 =?utf-8?B?STQvQmw2a2hoN3JuYXd6RXpHZzVjczYzVDBaLy82NjFPZ0JtMmErMEhPVnBy?=
 =?utf-8?B?bXVmSERvNnFUQk9QUjlWTEJCTW15TlZhNW5USnBaT0ZHNVZjVXppTmRCeWg3?=
 =?utf-8?B?OEJCWjhXQ2wvSExmZXlyREdHcGJpSXlCRlFNMlowNzhJTXFlNCthNlZDT2Zo?=
 =?utf-8?B?bVdhR1dHV2lXU1pNeEVPTmxPTTRlUXVtY2ppVzFJQ1FpbjVrY2lubFpubE9I?=
 =?utf-8?B?QU8wMWFISGgxa0pNbWlQV0ZPWUwyZlR5bXdjVWxLQysvcERZQ3dDWVU4Umt5?=
 =?utf-8?B?RHFJRWs5NUhPdFJZaWR2WUhoZUhQQXNlazRpK3JXbXR3azRicklIZE5OWUYw?=
 =?utf-8?B?NVlCemhzcWhSZGJVNDJMdjM3Q25sR05yQmRubGJXMVlZWGxzd2ZWUlJLNFQ5?=
 =?utf-8?B?VnZRVGVRSnBOZnlCeXlidnZiSWVQTWxHZFNSclNMUitSUnBZNFYzTDc2TmJn?=
 =?utf-8?B?VjFWejNrb2pvR0xRa2lkRkp4QlFzK0N1Y3Rjb2YyQ2pweFRqYllvcm92aFVG?=
 =?utf-8?B?ZkR5QnNkM2NaL0hXcWFoUmIvOE82REcvUWJXOXRQWXhTNnRkQ016QjExMFly?=
 =?utf-8?B?amlTUXZTZi9mVk5pYVlLd21acmpJOTE0eURJZFV4Qkh1ZncrV0kybHBQTU90?=
 =?utf-8?B?R1V4UmI4MjBGZkZFNTBFNEErZzA3REFnV0xpeGRteVBEbnF6N1Q3QmpyNFYx?=
 =?utf-8?B?bDliM0hSY0IwZVV6bG5qbnR5enB1OFJnRGNZNkt5cEpYQkhKQTBtam1UckZr?=
 =?utf-8?B?YVhjdGwzL0hEZkhNZGV4WkxLWENMTkdqSE1rM1dZS1V5NmRCNklhWHhzTDZE?=
 =?utf-8?B?V1dFalZnZUd2Z283ZWZzcDJZVUgrWnRRRGlNVmVRMS91WEtEVkswWWl0aUdX?=
 =?utf-8?B?L05DS2s4eVIvUjFRSHdqdXNNTUxrUzl2RldXUVU2dVhRNm5QdHlnOWdvNzFm?=
 =?utf-8?B?ZlJWTHY4dWFON1lRa01PYkZJeWkyYytSN1JDb3kvMTF3ZVZUV1loSW4yVGJX?=
 =?utf-8?B?SVJTQ0U3SEJiNEpZRXBIcHgxSEJGSENha0tBQ0g2eFZwaDQvTGVuSkxLTjNY?=
 =?utf-8?B?OC8vMGJDT3FQWTdjNWFYUHFPZ3k5OFZNOVlPejJGT25rekNhQUUxMHNXWUh1?=
 =?utf-8?B?M2JNSHNCZG14MWRpTU9GaHdVL0crOXNiSkxPa0VLRWU0bW83Z3hDME1XSXZm?=
 =?utf-8?B?b3Z5K0pVM3ExVkRsL3liN0VzNWx5RHAxbXZQaGZZQmhORmJIeS94MEJMK3Ry?=
 =?utf-8?B?RkpNZTNCMUc3MlZrVkFvNkRqdUFvbkF6KytGc0JsZG40SW4yQmxuK1FGY0ZX?=
 =?utf-8?B?ZTBXQlozQnRVU1lLbkZ3MHAyVU4xL29ZTnBQdC84SFRvMDRmd0VmR2VnVVRl?=
 =?utf-8?B?UXFhRU5uWkJJaHZsTUdaRDVBRU1tTE0xSEVVYmt6Z1JBa3lGTTZPdVBGWnF4?=
 =?utf-8?B?SGYzZ1E5QlFMQlUwOHAxZHMvU2pITHd3a2VYM1ViVGtFL044dlZtdTVqeDgz?=
 =?utf-8?B?aXpORFQ0WVNCSlJnblVmc09kd3JYbk1yczNPR2Q1VkdzSjljc1RCWTcwNmRt?=
 =?utf-8?B?N01UMDhNcjMzNUlIdCtNOTlYUXNMdWQxYmgzbmNIZmVjUWhzL3ZXM29MOWZD?=
 =?utf-8?B?VDBlZ3FtNFp4WmM2TllnTUJHZGlWdjBZT2g2TkdFNDlJUjc2V2VWSUhnaG51?=
 =?utf-8?B?N0FxenhScXJHSWgxM3BJMzJjajVUbGI4SjVwbFl0K1gzZ0xnVEJjNFF6MFMy?=
 =?utf-8?B?bUE1NWd0aW5JcEtkZGVkUzB4cE8yQjd4RVlYRDdSZ3VsQTVvcHA5d3J3dmVF?=
 =?utf-8?B?N21xeDc2akFnZUs1SUFvUytKQUcwbW5HVGNabzlnc3NGckQ4eHoyZzJZTnIx?=
 =?utf-8?B?NDk1Q0w2d3UrNVlsRUttY3o4bHM0S1BaQ3JiQ0hpNDN0aUY0a2dZbnNuMFRj?=
 =?utf-8?Q?k/YTzu93/7qk5bScHUAo8ODQyWdWvhU/iLLxycYBaG+p?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3a5e2fb-df57-453c-2734-08de3d373440
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:40:44.3596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 f03H/hRsCKv1hy3u0/frfD0IYrBtjNgMDypu3de5I1UAQnUiYvChudP3QT1lOa1U2ky9UqjCoYJuJ3zazJUVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7342
Message-ID-Hash: WYMINFVR5NCDJMM2CGI25NDWGDVIYZUO
X-Message-ID-Hash: WYMINFVR5NCDJMM2CGI25NDWGDVIYZUO
X-MailFrom: acourbot@nvidia.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Nouveau <nouveau-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WYMINFVR5NCDJMM2CGI25NDWGDVIYZUO/>
Archived-At: 
 <https://lore.freedesktop.org/DF0ABJ3I9PXO.1IFQVY210KIV3@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Dec 9, 2025 at 8:17 AM JST, Timur Tabi wrote:
> Add the basic HAL for recognizing Turing GPUs.  This isn't enough
> to support booting GSP-RM on Turing, but it's a start.
>
> Note that GA100, which boots using the same method as Turing, is not
> supported yet.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs       |  6 +-
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 74 +++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
>
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/=
falcon/hal.rs
> index c77a1568ea96..7a6610e9d0a8 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -13,6 +13,7 @@
>  };
> =20
>  mod ga102;
> +mod tu102;
> =20
>  /// Hardware Abstraction Layer for Falcon cores.
>  ///
> @@ -60,9 +61,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>      use Chipset::*;
> =20
>      let hal =3D match chipset {
> +        TU102 | TU104 | TU106 | TU116 | TU117 =3D> {
> +            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
> +        },
>          GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | =
AD106 | AD107 =3D> {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn=
 FalconHal<E>>
> -        }
> +        },
>          _ =3D> return Err(ENOTSUPP),
>      };
> =20
> diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova=
-core/falcon/hal/tu102.rs
> new file mode 100644
> index 000000000000..19a8b49ca2cd
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> @@ -0,0 +1,74 @@
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
> +use crate::falcon::{
> +    Falcon, FalconBromParams, FalconEngine
> +};
> +use crate::regs;
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
> +    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &F=
alconBromParams) -> Result {
> +        Ok(())
> +    }
> +
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool {
> +        let cpuctl =3D regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::r=
ead(bar, &E::ID);
> +        cpuctl.active_stat()
> +    }
> +
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> +        read_poll_timeout(

Please add a `TIMEOUT:` comment here, similarly to what is done in
ga102.rs.

