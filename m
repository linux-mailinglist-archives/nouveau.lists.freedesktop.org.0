Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 098B0CEB556
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 07:17:43 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACA2610E97B;
	Wed, 31 Dec 2025 06:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G475OKIn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 73EB244C66;
	Wed, 31 Dec 2025 06:09:42 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767161382;
 b=kA714px3zBY0jxBI41MBHWGt2+zjnUAy9RRUcciwzmAKtMzscU4qtNvs5ShNeZjJVhOQ9
 tzkDAidWn8zSBpaOKhnernBRfOlAgC7u78GPmOO2Fkp65WO+mlpvL+9QrJmL4gIAxSQrY4B
 GO+3QLQYWfmZe1PtCKTVTeSMbR6J/zF9eDf/3t6xeAPqUWlgDr/zh4gIcho8xGOWeMKcmfr
 RWbR4aamSOXJlNO6AgZ8elop63zuDBheB1f/bIBE8KEgzsrZZTOFrmfdTk78hENfC9XO0d9
 kwdzFrPmU2rBTUi1O1DuIy3wRW8M0IQWgY3wvWnz2OC51wwmbmkE6zahXrlw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767161382; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zPpCD0qbXpiVw+kXT5NcZ8slvj3RFzsuK3bpt6xndrk=;
 b=fmLKoBjyO78av/3/boD/TS4wRRbnz50Ly1q1su7Zqhv1+rGYy1SrZAb550DhKlI9wfFRf
 tyRH1yZUKpccXS/Jh78R/o7YbVY+HhPHTjy2UM77WSJYfOmtLSA/bB8Q5+bXBPqAbAtj33s
 DNe1670jU8EQbskQfeKd6sFMBkTOqXM+hixURghMuMmGYnbWPcBFTpAzgsts2ba3n/cYiMg
 J1Q3fOhpn9jd2HVSQpq/bnROicfl9Cng6Vt2MOao3BLQhUEWUEAHFkACusMHozrnUF/MHBO
 1th38FeAfSUn8bnpWsc8yy7XppP8w+6iTZKKyI0jAy58r1lEkeKj4J4eweAQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7710C41C6B
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 06:09:39 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010036.outbound.protection.outlook.com
 [52.101.193.36])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3110E22B
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 06:17:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBsKdRLVn75+GjC3XaYxA82q0EFs14xbKX/GccSFaBppai2sDzABSMMtaTDaiavOIlOUqwbtiPJinvN/NxL/lIflsNho+KUzWXl6axmvM3OKw2jU7/CQjl1oBgX1SWGS0HmMnzCs3TTLJmHyi7PkUkFWMKXMobzRFibQT94Gtqrhrb4NGqkP3SUXTbSvhbDYRA7W54wkIfk4sxyHXNDTMRcqIUckJ67CB35XHFMTClKcRZcg7d8pzr2epdwchvotTBUBKv+6QaxZA4nC4jEzIYBkWoOpvH3lZvtJe62jsgPGV3sFggBpFnLM2ohKLsaDtJYXM06nU0QXMI+EGJVUdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPpCD0qbXpiVw+kXT5NcZ8slvj3RFzsuK3bpt6xndrk=;
 b=NKAq5YpdrCHzQD8Lm3etX9ECCxaTjVgSlfXd5qOt+GO8F3eYYkze7boJecawX7QglB8wUKVIDS4OwbVYbLxesRv7/PYV7bncbiv8znVsuFqHsXG9xX/TJQPGdJ4g0jBG/SxIBX/ko/FASxHt7xUVxWqjgfTpfUGqtDujxIvg7eaxsspTn30636fqJWxj4d0Erx70V1UxeEA3Acco5O7/3nX+Nbe5JEtBGOozD8bQWBFRYcd9J1mLdL9SEKqMluAokQXAC9KoZSyaovnpzwOJHYIflKsGReNLnKQrXIHGToQgl/HNPLv93CMd0XK7LI3/MLiVZ9c08PhnqZp3mUvy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPpCD0qbXpiVw+kXT5NcZ8slvj3RFzsuK3bpt6xndrk=;
 b=G475OKIn3RFULtPWSkTeyFBS5JhXY6NHdVANbNVj4JoTOUp331rIsmvGwM2pQepBmzAfKGr4lvgjep+Gt1hcTGVBY+woC6cCzqy/I9MeMKk92B+T82+X8oImMu5agW99LX9wG11wlATB8JuDr/7rc/u7M5Ag3CiH4BQ+YuOEb9kOkx1MpoMEFgQMQ6nkDIoE7LXsqx5y/WY4FApBS5sv3R9NLIUC+qMd15wV350tW5a9wirwsb+ng+4UTT7kySU/gtlF3DHjWqZ8UcnRK72aL6WCUzMe/l87clOJd6cwUCX6eiOkXWMvNJvznWAF4N26JyZ+8MQD+yvGwuGZsFOuzA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH8PR12MB7256.namprd12.prod.outlook.com (2603:10b6:510:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 06:17:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 06:17:32 +0000
Message-ID: <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
Date: Tue, 30 Dec 2025 22:17:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <20251218032955.979623-1-ttabi@nvidia.com>
 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
 <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0077.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH8PR12MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaf70e0-bcda-4488-fe8e-08de48344840
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aVNKOG9WdlRKc2lZZ1NudVZDYmN0TFZHUEgxM2FiOG1ZZXphTXg2c1NvQUR1?=
 =?utf-8?B?RUFjSktSbGJsK2NzMCsvSDlTNlZ1Zm9jVWUrang4dkU5akFVcUhkaFhXZmY4?=
 =?utf-8?B?TzJNQVJjNDNBMGErcGRUc3FhNXJHTDN1UWNVQVUrZDZ4MDk0d0pucHpmL0VC?=
 =?utf-8?B?WVRSWnlRblh2QlBWT3BoVG53MUhjekswQXBqeVY3S1BmNDlsYjAxSC9FclRK?=
 =?utf-8?B?cE0vNUdOSnZVdDVXRDlFaEp1c042aVhld0txeTNjL0FLbmY5Wm9lZytCYlVt?=
 =?utf-8?B?M2MwSDd6dElmb0xQZWlSMXplTjdxOUZYajk0MmxpcnVvL25ybEtFL0NMWXM2?=
 =?utf-8?B?ZDYwQWJNR2sxLzZNS1hXcHZkczN0dHVSWWFRZk50TTVuSWgyMXVFWFFHa05z?=
 =?utf-8?B?WWJYK1JDcksrNnF0YXY0SnJKbC9tWm5DSUQ4d3FzeEQwc3FFNEJ6TGl1cDlw?=
 =?utf-8?B?OUZhYkJGU2hjczFmZ3dZcTZsNlNHSHRvd3kwTXJTeVpZODBvVWNnL2Q0dXMz?=
 =?utf-8?B?YXF0OVA3T2E4MEZMSDBsUVkvc1QzQ1NFcnppUFFqcTljVlN3RXprNE9XVnh0?=
 =?utf-8?B?VUhTZUVrK0hyb20xaUo1ODRXUEpFbkxwR2NxdkhSTGNBQTFUOXh3YWE2WTdL?=
 =?utf-8?B?S01zMnJCQXVQckh4MDRKQ1lobTVqNTRnbDN3ZXBtdnZMbEdjS1JkekxIRUJJ?=
 =?utf-8?B?ckh6MkN0ODE3ekZIMWErN2kwTEowMHNPZHFjMGNveFQ3RUNGZ09xY2RQT1Bn?=
 =?utf-8?B?YlZwYktLeU84K21TVzBWaDRPZ2t6SGthWllZcWcvMldMU3d1OWc2Rm9yblk3?=
 =?utf-8?B?dVkyMlhoZkdZY2JONVNjQ0ZhYzJGejlNNnppRVIrOGxZY1dsUnNBWEZ0RHA0?=
 =?utf-8?B?TUxqbTZjSXFuaDNmazh0SW1NaXhHMmM3bWhqOGNlMEUwbnRIcjN1TmY3OEVX?=
 =?utf-8?B?QXgzTktEeXNHVy9DdFNoODlaK1hRMTVOYWNjaHNCQjVNSFZqV01tOXdMbHFZ?=
 =?utf-8?B?NFJJZUdWTi9ZaktYM3FrNFRmeDZoVmNHT2RPQStQVlkwQ3Z3NUk5b2NvbWg5?=
 =?utf-8?B?UjQ5UUw3ZWVyYVV3V3dmcndORnFSdGdXMVEyU2svUi9wZW5JRmI0Q0w2cVJG?=
 =?utf-8?B?azJ6WkdvRTd6dUM4MXp0WEJIOVErdGV4eVhBZHo2amQ2TGIzdXA2QWRDSUh6?=
 =?utf-8?B?aFNiNW9Vb3hVanRkK2dVaURtdVBZTHdwTTI1Yit2ZUFsUVZpUmtnN2V6SC8y?=
 =?utf-8?B?Y1ZMUUQrZitWV3lQN2poY291THlaclByWEZFTG5DM3ZRTHIySlpuTS9SWk9G?=
 =?utf-8?B?VHlpelpZa0hkV0haMXViYThkSXU0VGZOMDNHMm00dTFncDV5elY1WFlTa25h?=
 =?utf-8?B?YWZXU1FqeStPaTlZRnFrOUR5dXBMTi9qYzczcXAyMXVaZElRbGZmZlpaUHBC?=
 =?utf-8?B?UDVmNjJFWUtOODdackpiU1FrM1NWTTQ0TnJuSGFocSs0Q0NGb0RWdDM5Q3Ar?=
 =?utf-8?B?a2hnYTNZTDFEOTJ3TzB3WnBMRHdJRFI3VVBBcHR2RXJuaGJ6UHdadW9DdThp?=
 =?utf-8?B?RWoxeTZ2TmdFOGZSdUlZVnQ3bXJ0ckNnVkxhZ0ZTRm9aczU3QzJZWURrR2xB?=
 =?utf-8?B?Q01jZWY3bnVSWko0RmcyZWFndTk1T2g5V3Z4bEI1Q05WL296NGxCaU9OdWVr?=
 =?utf-8?B?d1NUTHJ0dU9vMURwMzFIM2JzKzhSZ1ZUK2VFK0ZyamhJT2dUUXFrSXJtTmlv?=
 =?utf-8?B?WExzMmptWlFWSzA4MHJGcFQ1dHFTUW83UzgwSTNNVGRPbDk2RDZZbXVCQTNv?=
 =?utf-8?B?OUZjVGhiRHFxY2svbWhEaDBrWWNlVVFFUGY2US9wblV0ZUdIZ1VSWnRCYUpI?=
 =?utf-8?B?c2taQjJLR0ZrbjVaMXN2YmduNGpmcUJncWxuM2diOGFDQncxeDBRM1MxWHEw?=
 =?utf-8?B?N1NFblVnaFlZbGxHS09BV1pvM0c1Z1JaTXJtT0ZyUi93d2d6M0xBVEYvK01T?=
 =?utf-8?B?UkU4L251SXJ3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TjJrTGJCSmVEWW5wdFpKYk5QQXBwd0owUXUrQWZadW5Tc0VBRVBzQzJLNTVt?=
 =?utf-8?B?RmI4V2dRcWk1YXh5U0JUemZBUjNHUUUrSVkxTVFwT0pybG9GZk96VFYyUVFT?=
 =?utf-8?B?Q01rT2laREtIV1B6MmpnQ1Z4OE9MSEN4RDVKbzl0cTNncm9TYk9aWWJjTzUz?=
 =?utf-8?B?MXdETUhGZ2hEeDkxbHJOZm5kQ3AxQVNhNHQ5MytRQU1Wa1lrb203TDlEVEc0?=
 =?utf-8?B?UVhkU3hxbXkwTzhxeWxKeW14WTVmNzlOTE85SmhTMW1ReS9scFdzVDhxaDlY?=
 =?utf-8?B?c0RyUC8vclpDT3NRMzEyOThXazhNZTVpTnljOVl3UE9oSnBzNW5MalV2YVQ4?=
 =?utf-8?B?bncrbnhYSm9XbWxqVmRpK3A3NWpNbkJvcDlESDVqQ1VPR2MxNXlCTXhGNVJX?=
 =?utf-8?B?cmZGMVJQWDF0TjJMV04rNG5mRkNVZTZxaEkzcXR2dlBwcUdpMjI5aExVekJl?=
 =?utf-8?B?M2dkZHM4eWhTTjJZbzVpTncvNUtGZFhsRUUzTkFMZ2g5Yll6NTIwKzFUOXBB?=
 =?utf-8?B?WUVMbzZENUs4bkk0aFNjSFVlcjJGZnRndFRhNGpPclVTblh2NTJFSGVGTWRG?=
 =?utf-8?B?Q0s4TDFnTW5TUjJFVVdnay9GY3QyU1hTY2JLa01RSitDa05HVlFnTWNTbnI0?=
 =?utf-8?B?ekJwRWI2MmlmdmxTd0Q5YmhzVnp6Wm5BYURWYVpWaVY1NTAvZkZWNk80OTZn?=
 =?utf-8?B?QlRrSzdabFdkZ0NhMzhsYmRJNll5Qk8xQ3FzT1dpcm1vYmhvMmVyVWJhOXZi?=
 =?utf-8?B?dk44UndPMU1odFFNYUxYY3BGVjFveE9vVExYSGwycm0wcys4RnJyNmUxNm12?=
 =?utf-8?B?dHBYMDloeUdSR1EyemkvaFJyT2c5NzlZS2FxeXBzTjRCSHNia3pTNzlNNnQx?=
 =?utf-8?B?NXJBNWlER3FRbG1uOTJMclJxQWQ0TGZvQVZLKzhCL3FiMXhvR1RFTUIwYjJD?=
 =?utf-8?B?b2hoUnZpVGh2ZGxaWEhycGlpb1RvWHV3TkdIYXZjRjBiczJ1VjFwblVXZGhD?=
 =?utf-8?B?UjlhWVBlalhGM3FhZUhScjZ5cWhCZlpxYmU5bTd5RUxhRjFDYy9rQWZ1VWxM?=
 =?utf-8?B?WnZMak5IUTNFZ1dtWUE5dUZyZ3BzNDRmMHdnWmJsc3VzWlMrOE5mOXUvT2Vm?=
 =?utf-8?B?eTB5aWptNVZUWGVGUW4weENleTg2dzY1b1dldXhzVXl6OVhjczFsL3Z3U2ts?=
 =?utf-8?B?VEkvQko1ajVYU1RDaUNWcndIaFdoSWpBVkp6eG9zMWFoak82RVlnRzhBSzA0?=
 =?utf-8?B?Rk9EakoyZ1kwNTVMWEJ3K1J0L0VBeU82TTNPVktqYlZBbXNwNFg2emtaYndB?=
 =?utf-8?B?cnQ4MVVscUMxemFFRzVDUWdjNHNaV0pyUGFadkxCVURtRldGL1VQQWZFZ2NU?=
 =?utf-8?B?NmE1L3grbVBBV21pUXpnbFdWVWxkUTU2dzBvU1hUeERWSytPcXcyaVplZ2la?=
 =?utf-8?B?ZnVxRU9zclh1eGd4R1pkMkk2R0pvTURqMGdTK0RrRVNhRUVocldnSTFDVUtv?=
 =?utf-8?B?bG44cXBXZ2NWdkRsWkk3U055UnpTK2NGNmNwVThxbzRBZ3hoU3ZYbzhqZTQ3?=
 =?utf-8?B?VXRYdER2TFd6eGw2L2U0c3dIWTFSSlBuL0FCaFBMS2psL0R5eEM3Z3lkZ2pl?=
 =?utf-8?B?N1cvaXJ6UGFRNVE5OEpjOEQ3RkV5cXlQekJLRW5yVURNMkVvRytUTUhEdUVi?=
 =?utf-8?B?MlJKQ1NmOHAvdmk3ZTE5cDNFYkZjUDF2QTQrdFFlajNMZm90NTd2b2NXUm9M?=
 =?utf-8?B?eWlZSVVrcGJ4N1ZjWHArdUZ4MThYK0FlZUJKSkFmY3pjYXR1M1RoblRUUU9Q?=
 =?utf-8?B?RVJIZ2FCNWpVOXVIMmx0eTJpYzVwNWwzbG9veFh1TlVrSlJqTEh2elFVS3Zn?=
 =?utf-8?B?Smo5OEIzQkpxRGtpeGdIcHo0K3c4UlhROG9TTEp2ellmNmlnanF0d0haYk1r?=
 =?utf-8?B?UHFGTWYvRVBqN01zcDJzVCtpWTVOcFNaMXlCZ1EyVFJ2cXdhaGw1TCtKZHVn?=
 =?utf-8?B?NGIyNmFTK2xCajJvTVBzQ0h4LzFnaE1LZnUzTlhPYnhIdGxIQmx2bDM1QlM0?=
 =?utf-8?B?b2l4NFpmSE5lMi9uRzFkYnFSYThYaTVYbHNZQVgwcEpHRnBZZlVWYVJJV2o2?=
 =?utf-8?B?UFBGdW5zb1c5QWV6ajVHeHgrR25KVWJZNDFsOFh3aHpEeTg2dUdsenBOaUt0?=
 =?utf-8?B?b3ZPZWlHcFo3Q1BNQ0RRYjZOTi9YVm9TUHJwTHdSUTY1NVNLYlFLckdzSGFJ?=
 =?utf-8?B?L2dIOFZUbFlVNkFaaFFHbEIyTzRPdlk0OVVYMEZGcGZlRys3TkplL3Y5Qmc3?=
 =?utf-8?B?b0F6dWFTQnZFbnNrczA5R2RiTFp5czdsc0NqY0I5WDEwV1c0TjFXVkZlcG0x?=
 =?utf-8?Q?sbFaPvUv/wUago34=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aeaf70e0-bcda-4488-fe8e-08de48344840
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 06:17:32.3431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Kzia3GjlwZPzFRQNCTLp6BxPXeUdTLUAywEYOkNFslRS3TQtDFqrqqS6cvlno8kzCycmJWfqSxfcgiTtJ1SXUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7256
Message-ID-Hash: S6AZ4HBH4UQ5YLQCX2ES7MOYYOCDFFAT
X-Message-ID-Hash: S6AZ4HBH4UQ5YLQCX2ES7MOYYOCDFFAT
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S6AZ4HBH4UQ5YLQCX2ES7MOYYOCDFFAT/>
Archived-At: 
 <https://lore.freedesktop.org/91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 12/30/25 8:26 PM, Timur Tabi wrote:
> On Tue, 2025-12-30 at 18:58 -0800, John Hubbard wrote:
>> On 12/17/25 7:29 PM, Timur Tabi wrote:
>>> This patch set adds basic support for pre-booting GSP-RM
>>> on Turing.
>>
>> Hi Timur,
>>
>> I gave this a quick test on TU117, but it is looking for a firmware
>> file that is not on disk.
>>
>> Should I be updating linux-firmware? Or something else is wrong?
> 
> I mean, I literally say that in the patchset description, about two paragraphs down:
> 
>   That latest linux-firmware.git is required because it contains the
>   Generic Bootloader image that has not yet been propogated to
>   distros.

Actually, I should have been much more specific, and should have
asked, "what git repository and branch should I be using for linux-firmware?".

Because none of the branches in either of these seem to have any file named
gen_bootloader-570.144.bin:

       https://github.com/NVIDIA/linux-firmware.git
       git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git



thanks,
-- 
John Hubbard

