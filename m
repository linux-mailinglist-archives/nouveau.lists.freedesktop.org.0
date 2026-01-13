Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D262D161B9
	for <lists+nouveau@lfdr.de>; Tue, 13 Jan 2026 02:08:31 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 254D810E448;
	Tue, 13 Jan 2026 01:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GiD5v1fD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69AE444CA2;
	Tue, 13 Jan 2026 01:00:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768266002;
 b=pVrhd4ALNOTyfy+feVRpVOKlQQtVV/6xHGePLchTFO2C7EwqPLeli4ZVoyHqJ6JRo3+xv
 kAtQ1wzTFBdWOAs/BDhXGa1Tk4V6XotB1ds0QgYwz6MPw7udtqscrlhsEk1h8E8B4swi8bk
 VgzaO7IXXijmvcjS5oFj4ZCYOPtErcaLpOLHH/mI1upJTrGXt4USQM7QAlxw4NGuHIRZ5ZE
 Dey71++qKCYONLOwRt42E+cIx5ZRNMhXpyZH2x1eQKHThcZAO2itk9CnO//CidiKk7oSiph
 w20t6T+99qG/AR4Aj/JXeofTy09NiPyD3DgSW+Z1p3bWVHS/a59fTD0YRBMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768266002; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SEhpoNdUNqP3u70ulaw/JyFf1Eqcijxemu8LBOeZaIA=;
 b=Dm7ZXckfwqVXvePsexG7MRfCQ8rA9J41X0K5W2rcKEiciK6ZcqXL7Q0luuxQhCkkFNcsJ
 IeWs9T6Vxcud6WWEzrdkzTyHFskhox7fGDd/Lo6sfl9ve8BX+sCjEGucd6RYMa1CJJ0lHJe
 bR2AVFAwfl9bOxTW24rmir05YZgmIvirTORf1Tdtz+k4HcARd+DJ7VJKQMuBihsP06ng4gx
 FaiwISZrVnAUM2PiSM5jrBjpeUd4Ee+3I9A58ys2VvYmEOvnvWLpUqUvK15Wf/JWPt9FGB6
 TpI1L0AMTU/rKBC4GJwfY//96wXQj5SlfLfwJ8wNGKgq0ZRJQLUbDqHqfbEw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A892144B95
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 00:59:59 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012061.outbound.protection.outlook.com
 [40.93.195.61])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16BCE10E446
	for <nouveau@lists.freedesktop.org>; Tue, 13 Jan 2026 01:08:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpfvpNDQSsjPufbP+auQzxUHmnhbkG3w60KPqm5dkaZ1Glnjl6R0UfEqn9qyYHq0G/BOrFaS94Tkfbz6pZxcx+gSXlVB5Z/C7WGpa/fPzDe2eMNMeMkSLkIIMJCKVXMKS8LuzJEDzsZqGgScLVz9jgIvmuXE/swPpAjwO4VwS3cbfcApVfX4QO0t41Iixw+zpSai8VFHlVBYj0fWqqqKJ2S2/cwDXNur6eh6pkaFRpUQ2Zr5povNbaich/Gy9hPneIZ8ObSh/q0PhWzN11Fd3vd/ZfztzDTrDIom8HcTFALDkaLCp962W2MBQLGWbrHeaMkShu2jgZ78JtKKkgMCyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEhpoNdUNqP3u70ulaw/JyFf1Eqcijxemu8LBOeZaIA=;
 b=kGdykkT/GtbcJ8Hb+TpTC73ivqZf1flv9Vkdxa1OqzPdAfMnCmPHiLYzJjY7VjXtV+EIDIWLFfYGzgA+NqC6qPXV25/pfxj1vdwUjniHLk+QJH+kc40ICq/4ONwcEhYvEpHfuLl/g9qXnXl/gr8IIadDMQ58PUhNOMoPP8L2VgH76CcnRBhPjy+g0LS/6ImM0/cU6+wdx5/08KbXH0CK9oMX5AGoDXCfnRdS8tGsihjuD5KB0Zcpi/ZBApFD4S88uD4eY1+ARu8HAgRrJdd7q90OnNl/AkJ9pou3g/rwxg9fkMxD3dGB6HJT6dUxdNC4fWN0i5tHEM6scgglUdy1tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEhpoNdUNqP3u70ulaw/JyFf1Eqcijxemu8LBOeZaIA=;
 b=GiD5v1fDJYpTFqBsJdX4WEVfo3O8Fdcb+8cFkucOWk6dB5MfelQEhKE9IXyJTetQ0nQBAAPzyZk1Okp4Ik1tbjQUQerCyTJNGLm4BeNaTDPg9Gib3ae8z/nUjbSA5LRoDfdYzY5AxSC/SC10WY9DACYO/wnz0zQ3GsCBatjUWOoBr74TncdATxbFbfibeJ4WssGLai6lObsTjk5KeeawUFgySY77xK+q/P4s9hmkn3l64t574cXQn0ztuzsQWm7w87kOfWw9taUczpU9jTqi0+A0VZBjrjUXjB6+JhpQ59AKgrSkQAnZm1AEMGGKliLRFg1a2NurzizC/S6dnq8whg==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:08:22 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 01:08:22 +0000
Message-ID: <8dbf1b24-4e69-47e2-ac8f-20f17c460e16@nvidia.com>
Date: Mon, 12 Jan 2026 17:08:11 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
From: John Hubbard <jhubbard@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-10-ttabi@nvidia.com>
 <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
 <d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com>
 <84b40c4d-ef8c-4b7e-b8f8-055e57516a55@nvidia.com>
 <4a11be38-e752-407d-98d5-658086107d1e@nvidia.com>
Content-Language: en-US
In-Reply-To: <4a11be38-e752-407d-98d5-658086107d1e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::31) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: 44c09603-2d1d-44d0-da2e-08de52403f29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RE9hMkRYSTdkR1l4Rk5ETlJZbHNIUFEwdXhpeXhjK2RlZXZUUVdRZHo0VEtu?=
 =?utf-8?B?V0w5c1lHL0VSaU1PN3grMWVkUXNGbkhMZTNaNHlPenJPa3duZ2Z3Vi9XRlNJ?=
 =?utf-8?B?M2JqT0JKUDAzdHo5TWVlUk5kN0VPU25KdWJlVENUMmlqUTVjN2NydXM1S0gw?=
 =?utf-8?B?UnFoWjQ2TDdXNUR0ZVBEYkt2ZXo2bWdJUUZ2Z1hzVWlKR0wydzFKay80SHlH?=
 =?utf-8?B?RnM5QVdYek1TZHZ2b0xBZU9wTGM3SXdINmRMbHByTTR0YVRHTU1PZWw1cTZU?=
 =?utf-8?B?a3JqV0tBRmw0YlJHMnZmTEhXNG85K0pIblVaUExlNHdKdVY2dWlXb2d2dm4z?=
 =?utf-8?B?aHRvWUt5YW5ScmlIYlVFa3ZKNjNuaUR0K1owWlIwb3ZpcFhGNUlqS3FCNjlO?=
 =?utf-8?B?NWhRMGJ1M0p1N2o2ODVVU3ZZTlhPbS9VeGZpZjd6Tzk5U2UxTzRFcTVJeko1?=
 =?utf-8?B?ZUNoN1RjMVM4Q3Y1UUwveVVyZWJSMDkwT3h6NGx5SHlCWXlCSlNRZ0svaVA0?=
 =?utf-8?B?b3Q1d2g3YnJlS3RERjhNL1JCZkFiOXVETk10TkUwN3ZSYWU5aW9KNEVpcU9M?=
 =?utf-8?B?bjdBMXdOM3AyejMzc0NJM0V3SUNUbmcxNTFtSXNuSEpBWGZhZENQR0llWkd5?=
 =?utf-8?B?VEFXZGg1Sk5heGRXVExha21ETVlVdzdFeldrd2c2SHZMcFdzdCtuMkMzWXB2?=
 =?utf-8?B?alR1dndhWTBxYXpMT2dwZ0hTU1dhV3psZ0dXVUt5SG1oNlpvTFdEdktMeU1M?=
 =?utf-8?B?aCtVWG16UlFiNi9FVUZOd09RZlZBMTBtTUxUbEFQdkEvOTZjL1UvUXAvei9o?=
 =?utf-8?B?Um8xdXpocFMxYXROaldROWZUdGZRV256Z1VyN0gzVnNBRnlSL044VHFjNUVx?=
 =?utf-8?B?eGp3MCtqSlpvNE55LzdjK2U3MUtQZkZpaTJpMEUyZ3VENTlSOGFDUXJOelA2?=
 =?utf-8?B?OGdDSVpodGlYSHhCZUNFVXJIM2syclRyelJiOUFyUkI2dXBBeVJBTDd3QVZW?=
 =?utf-8?B?dEJhT1pKVVV6UTdWTlZtdmNrNUlFcy9mTE1GQ1JkdlZRU016L1RoTjhESld4?=
 =?utf-8?B?ZjQwQnVhb0FVOGRhM0NjeWtXU3dUWFl2eWRFbnZ4cW9HSDN4U091TU5yMG5h?=
 =?utf-8?B?OUZSakdPVDJ2aHlDdUNVOThPcjNoeEdCcjFBRHJPVnFyK1ZzdUlBcEdRQm1Y?=
 =?utf-8?B?MXN5WnNXZlQvTjBjMVVndGhkRkNQU3JEMlViR242d2cyT2thd2dWRVNkalUz?=
 =?utf-8?B?YVdCclZHdnBGeUg1MnRZaWxRN2gyeEljRFJCbDNJeTRUa0RlOUJqYlNvSmMy?=
 =?utf-8?B?Z2huR09pMTM0M0JERGFoMytwNTV0WWtaZFFhS2RKVjRES2E3MERhTGRIdlVR?=
 =?utf-8?B?Uml2Uk4rMFYyWnhnZnJabDlpVkxsdHJxQW1HVEVRR3RqbkhnVFpveUJONkNR?=
 =?utf-8?B?bTVFcm5ibjd1L0F2SzZUeDl4NzVzdjN3YWNpUmNHY0R3UjlveklFeTJyQ3g3?=
 =?utf-8?B?UzhrMi8zSnB4alZFRitPZHBsOFlLREFlZGV2cml3MWIrNk9iTWtXTFZZTlNP?=
 =?utf-8?B?TFlHOE43Y0J3WnREcko5WnBUZ29DQXFIcUtjTXA3bFRhQzJacW1VUmNQQ1Bk?=
 =?utf-8?B?K2NPVnJyaHk1ZVJkOGNzTVBqR0xLYUkzUXY1ZDA2c1hmTXdBTmVuRG5ZaDNt?=
 =?utf-8?B?eFB0Q2hIUGdDbVVZOUw3cHh1M0U5VFlzcVAvbEFmaFAxS05FUTdNaUp2bUtn?=
 =?utf-8?B?dm9QaTJMQnBabkJHRnFiNzBnRytiZFo0VjZwU3lpWmtPY09tdDk3YzNzWndW?=
 =?utf-8?B?Y3JNRGNIREJzeWdWMG1HMzJDRStodk5GZ0ZLajJZcW4zS2M1SzA1Z0lzZnd4?=
 =?utf-8?B?cS9vNm9mbnpacmpobktybTRzWnVVUGk3R0pFZ2c3M3FDakZkL0R2MmRjQ3lR?=
 =?utf-8?Q?QAh0mUYjY0wgw7mJb7kePafoB9PbI+TX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjhiUHpWNW10Qm5meGd5c3lVZ2x5bkZUeC9jSWQ0cE9jT3FWQThOSStxUGc3?=
 =?utf-8?B?TkNaVW55YXpLUEROTFVCK0tJVFpCdi95ckdqL2p6NVBuNnptNkk5aHRNZVky?=
 =?utf-8?B?elhPQmd3UjhMNFRsd2tNUDdDVHpjY1lHUHJEa1ZnV0VHQlM4THJwcnlsUG1I?=
 =?utf-8?B?dS83Y3NhZVJ1Uko3SU54aWFvaUhUNERCS3dPbUF6NWpIY2Zld0doTTdmZVlX?=
 =?utf-8?B?U1RxOWZFb0E2Nnhja01PSTZKZEpIRU1EdnR1R3BmcTNUb0YzWVI0cG1pOHk2?=
 =?utf-8?B?WUJPUTZTdG1IZXhxM25rU1RWQUpzK3NmUnVnZUdNWnlEVHo0SUJ4SVJpWXlh?=
 =?utf-8?B?Y2hYRW5YOEt0b1c3ZzNQL1ZaMHBrTjBEaURmWXJTNHJZUngySE1ISkE2Tyty?=
 =?utf-8?B?VjRCaFlvUDRMczJYZmdBS2p3YU5oSmpaVXQyYkRwZHoraWdUUy9nVjJEbFFx?=
 =?utf-8?B?cUJLYmsxOGRqSEFqK1BBcnN5TU9qcnViYllaaWs1N0R0cHhmRWFSWXhVUnVX?=
 =?utf-8?B?WWJlZ3JSRkY1M2xndmR2R01sRjFaM2ZicGE2WjVoMGszQ3duSDFoTTZ4YStN?=
 =?utf-8?B?ZVBkU2x1RzZaYnl3ZnNTTTBCWGtjWWdDQVZwdVpRS0p3bS84emhxKzQ0eHR4?=
 =?utf-8?B?YklFREExRnMwc1JjQk9KUTMxdWZsa2pHZTYyWWFSUVVZMCtmdUNFVzgyTDM3?=
 =?utf-8?B?ZmNyWlQvWFhGejZPQk9ScUhVQSs4VVlweGZUUGlacWJRdXNRdVBCZmtpdXgv?=
 =?utf-8?B?aEl5empud001bFVaVjBMakU0U1daQmtlRWl6bFlEbTgwTzJ2UnhFRmsrcHla?=
 =?utf-8?B?LzVRMmU3U1RsZTBHVWw4SmJGakg0d2crQTE5ZEtkLzZUMEZ1aXg3OTlBWllP?=
 =?utf-8?B?Yms3dVlCem5yYWYvWUptNE13U3RiRFFrVkk4aHVNWDJ2WHlCN21UbE9ja2hy?=
 =?utf-8?B?TzN3a2w2NzltK1h3aDA5TEZnMThCc1FIMmRmZzhWdEJSWHp2YXRiRjltcXY0?=
 =?utf-8?B?TWhSL05XUkVGcmVZVHhmeHpHMDRvMzlyRHlSTGp3cWxMOHdpTjZEK2prYUxu?=
 =?utf-8?B?S3B0SkVTdWZKVFZERmxtZ2FXczkwdGRLSzlWZzV2VUNIQmlDN01vbEhxbFI5?=
 =?utf-8?B?MmE2TnFsWk1NbHNGTTMyMXo5V0ptam14MHlVTjNEQ1VzY1dMU1hmZEErcG9C?=
 =?utf-8?B?Zzh0Wkh6cTVCTDArY2swd0xwZ2h6MlpHTCtKeXlLcjFLV3g0ZWJ0b09ERitC?=
 =?utf-8?B?aEJ2NEtrN2V5Rk1nakhpR3I4WmduUGNxcWZXcTk1blIvTGxQNGVsdU0yT25J?=
 =?utf-8?B?Nzh3akVHOEp0K1lRRVpHMmtYTHliYktxL1ZGQWIxYXdnR1hPbnluRHV5M3Ay?=
 =?utf-8?B?MnpFUWlLSVoxZWp6MHFSMFJwbmdPWUNlUU9FalFxcjFTSkwrVTVLK09yeStB?=
 =?utf-8?B?RG9TOFNEaC9BM3U5YjlYUkptWjdINlBMVzJzSWl4RzBoU2hYTmFuKzdaNkxH?=
 =?utf-8?B?dXNHeXpGU1dRSEpXUmFYYkI1K21ZU1JJdWxSNEl0YThLZnBBREhDbHhJRWJQ?=
 =?utf-8?B?aFlIT201RExuQU9lZkxQMUVUcFJGanZveVgwY2xpVjl1cHZCcFVDZkRTbUhL?=
 =?utf-8?B?ajhCV2xPWjFqZ0hpRVZ1Y1JZdDcwZXpwRW4zYnpEN1VGRmkvTFU5T1RsbkNt?=
 =?utf-8?B?T1l1bnMvMHdhbnloK3FBQ0Q4SG91MTV5dXVyQ1RIdVh0MFhlYmVkUnVWT1VR?=
 =?utf-8?B?SVg5cjQzcTZERlROQ2YyaUN1RzZ2ZzJxMk43N1oxR3V2aWxUODFOOTlIaFhZ?=
 =?utf-8?B?eHFRQ3M0VlVhVCs3Z04xQmkyam5SOUxGbnVlY0hneVh1NTBud205OHc1TS9J?=
 =?utf-8?B?QmdyZ1kxcWw3bHd6MWVXMTdPTE05Ui9KM0trM3puQ3NXN1RnU0ZKUk9FTGhR?=
 =?utf-8?B?eDY2Nm9vWkdwcUtoYTNSMnRQM2RGZzh3RnFSY1U4R0dkSStIdnVYM2lRN1Y1?=
 =?utf-8?B?Q1RSWHBOdXpEWjc4QTJRNk8yekgzRXp1NTZFQkt4QVVPbWxjWnRMdmo1cEdL?=
 =?utf-8?B?bDBhMkNRa0NvbmxUQUo1Q2VCVTJnQzZJZGZKN1krcytBN2lwMjdKS2ZsS0xv?=
 =?utf-8?B?emN6RWFVbmxiYklKTXhoRGFRY1NZM1Yzb0lQUm1vWXMzT0pwSGNpTy90cWt6?=
 =?utf-8?B?V0Fmd1p1ejdTQTM0dVhENjhUL1NPdTEza1N5U2RtWXpscUtPU2oxcVd3cWZs?=
 =?utf-8?B?OWxBVlQ3ZXZmTVpkKzZzclFaRnl0NVJ3QmpRc29xQ3BNZk8xL05OSkRLNjZ0?=
 =?utf-8?B?N2ZVb3Z4aTJ4RW1BUVljbnUrUnFDeWtKcUJvV05SUjdoREdmK3hMZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44c09603-2d1d-44d0-da2e-08de52403f29
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:08:22.6784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vxu1oemTLX1yvT0UiQ6jLPoNC7A2p9VP5aBmrVL+cQHYvOIBOuAgw5tL1i04EL+WSwM4g4uTGBzOqR6Ugzj96Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
Message-ID-Hash: OYRQ4ZYMVHMRCCHKJJJO6BP6L5E6ELPL
X-Message-ID-Hash: OYRQ4ZYMVHMRCCHKJJJO6BP6L5E6ELPL
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OYRQ4ZYMVHMRCCHKJJJO6BP6L5E6ELPL/>
Archived-At: 
 <https://lore.freedesktop.org/8dbf1b24-4e69-47e2-ac8f-20f17c460e16@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/9/26 11:13 AM, John Hubbard wrote:
> On 1/9/26 10:59 AM, John Hubbard wrote:
>> On 1/9/26 10:11 AM, Timur Tabi wrote:
>>> On Thu, 2026-01-08 at 18:53 -0800, John Hubbard wrote:
>>>> It may have its own imperfections, but this is *approximately* what I'd
>>>> prefer (below). I believe that it strikes the right balance between
>>>> simplicity and Rust idiomatic code--and it's not any larger than what
>>>> you started with.
>>>>
>>>> And it won't cost you any time to implement, since this already works:
>>>
>>> Do you realize that this is almost identical to my V1 of this patchset?  We've come full circle.
After chatting with Alex Courbot just now, we were thinking that we
can debate these Rust abstraction improvements as future patches.
Whichever way the debates go, I'm certainly OK with merging this
working version asap, and making any changes in follow-up patches.

thanks,
-- 
John Hubbard

