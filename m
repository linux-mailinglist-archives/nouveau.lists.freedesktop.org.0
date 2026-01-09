Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F2AD06F1B
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 04:15:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15A3D10E7EA;
	Fri,  9 Jan 2026 03:15:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uow5H0EP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1182444C4A;
	Fri,  9 Jan 2026 03:06:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767928018;
 b=gsOsmwd1PsR12hWup8RhZwzi8fM3rSlWGYGRundIVmbg8vpeX3mwjQh+4T/fSxg5fNKbb
 9IoF6G/zFXHe9xpBOTRpUpORMgTZjiFCkfArgNkJUXO5B7Y9iKy7MvdgmHGT/d6uwzSIOkm
 3n1H5hLyPU5kzLzzaTGRROb46IkK99LTjpOPFfdStG9J99kwB3oQpLGrQqlP97Cwz1yjEs7
 N7FDnx0T4Bsek31a4hP1QVePQwayTGz70EEsoeAXuGVe1A/PvEXZXY+UXcuafNEOCFGDwyt
 YCwqS/hO+TTbNzdobuNsjO0vVzVke61aIQZ5xtNV4h7lszmBZPGWD6LPJNaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767928018; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IuYNlTscofLsGR2OI+fEDAM0/33bvrncXAc6zBtC3DQ=;
 b=raFv8hqBIyqWkibtDCfDHJf5nWZDjGVNcaKGVAe5yOGfMCSNyir7BZ8nJFUKaxtIfHMO0
 Du+FDIAtKfLbotxUYO/ePmcKYirSXSyvzWg4LxVA+lzhtJsIygKTRwB/73zEeQRfIm9e+4g
 Ed8snjs0Spqo5F87OmqzUfECHvRYQLmjgIdr0nV8RzctkR5VODfO8SNv02Sr4oe9jE12ygk
 VOnd5LtJp0JD0KOXXtElCc/9m3KgP7F1aSHfCEtSGdpJqJR2k1x4ncK6HWXSmQ/BQkuh5Yd
 oKTLzuzflaKNe9YxQJwMIBEAAWhNEvbng9a3/q1L4bBqP9YWX+jRdAVoQEPQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C9FE044C4A
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 03:06:56 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012071.outbound.protection.outlook.com
 [40.93.195.71])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77AC310E7E5
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 03:15:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6tvJ/3NDgLb4xqQFUBoPd7jzpyneLkEuyVY1itA1hmtRSpX2lPTkyrfOOQbx6HEdRCX6m9hudj5hgKC10ZxEKSq9F3FvUW38+Ev8EVsMZh1bI2XnSFU26ciEdkQTjTxXyn4uXBVQDn+Gej7pYwd/mgcUGsD/JcN91syINCac+iK4rSrNFpiOnjvHaj4zDwqc6iE6LA84xZIQdPggiyMTwwUiPg7hcdLjTqbKMP6ZATMkBmnfaMFPD57tb1kBbVE5H/VxWtVnWWSfGLvJEqaJ4crj+vnKKI4BFvf79NUm5J0jsbnxkbGeFJ9rA/0WnuX9+fDsXlOTZKhfPj4jDSM4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuYNlTscofLsGR2OI+fEDAM0/33bvrncXAc6zBtC3DQ=;
 b=ADw4wbFJ0nte5ac+A+pfztyYe0Pgu5jLQelVAfmEwTtM925WyaQlANrIWa1oPDUd2kQ1eKQcsGBPnqSFR1KovCrbQS5ucO4cmOkTlMF+7OUwYtVataJrN/Gu5SsYi325BnTKAvyqOn21Q9Ia7q27VlB7dQ2d1ojOYw8YVNvH+QLfq/Y8q4r7mAOMHe4Wa0PQlSipW4o6J6iEBJivpxo4SEfOgBXiQubY9djlYX+CLh6r8kAgqxHcv2gQqsW8DfeKf0D4ytHTHlCt+aR7dj1ViWg5Pg2m1hbn5zftUU0j3ncyZ3oJAYwdASR/qdSmkc6IchHpWXRhBGNINkMbgSRVkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuYNlTscofLsGR2OI+fEDAM0/33bvrncXAc6zBtC3DQ=;
 b=uow5H0EPD/6Ma/m9g3ooq3sEJCA35rdc4to+r/eSEG14XebM8eMwq8vF7TUb5jyiCYRdfFYJulVtNOIBtPRrVC6RvgzJ1oYcRy1VbziAiXupabKV9coUHOB61hcoh/R6aQu8s7t8BWNk3n3xmPKO/dzp4t5U/zNbJhOXZWcgE89agJqs/pLaXc7w3YIJck2ME1wIh559eJs060f5yFZDL8k3V+vdx8klaQG6KocCyc+nsGm5ETV1gLCNuW7mJZJtWxabeYrTlylNDkRS2kapKCbwNuiftbrYUKOt7m/TMpRlWKn9EKoROjVhVTq0OLmsypAmNSaKdP7M3sqyR9LH8Q==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH2PR12MB4295.namprd12.prod.outlook.com (2603:10b6:610:a7::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.4; Fri, 9 Jan 2026 03:15:12 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 03:15:12 +0000
Message-ID: <264c8361-1962-47ad-accf-6fe5e1cc9283@nvidia.com>
Date: Thu, 8 Jan 2026 19:15:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/11] gpu: nova-core: align
 LibosMemoryRegionInitArgument size to page size
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20260103045934.64521-1-ttabi@nvidia.com>
 <20260103045934.64521-11-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260103045934.64521-11-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0034.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::47) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH2PR12MB4295:EE_
X-MS-Office365-Filtering-Correlation-Id: c55bb3a4-795f-4f28-1574-08de4f2d4d3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M2htOUtVazJMRFBBWFljUVd3dXB5aTZHS1VBMFU3SnpISTV4MXBJQnAyQit3?=
 =?utf-8?B?TndCUUQ1MWNWek56Qi9wM2kzd3k4NDVhN05YYW0xS2V4WldZaDlURVlzT3l2?=
 =?utf-8?B?VUJZMWNNVDgvOThEZ3NSU0laMHViaEJaMUdReGxCMWxDM1NQOGRHM2t1dDEy?=
 =?utf-8?B?aEoxdmtiTVJLZlRrY3A4aXlxV2lGUiswN2VreXhFQmlzMlIyb3JnZWxtUXFN?=
 =?utf-8?B?Qjk4UmlnZGd6NGFpZVljVE9PUXNwL08xS0E2dllmQkFoeTVhRW9VNkVWQ204?=
 =?utf-8?B?L0VOUS9BYk9KZWhoNVdwOVQvV25LQUIxK0lNSkVGcWsyQ3dxUFo1VC9IbmRB?=
 =?utf-8?B?UStoblp4eURrMDE0dG0vUVcwVWNYSnJYTkRaVEVMT3VPZy85Q3dDaVI5N3I0?=
 =?utf-8?B?L0lUWGRVZ0VLRHdGazNMdHF0NEtGUlUxbU9sNzdDRXg4elM4TTFXWG1HcldN?=
 =?utf-8?B?cUY1RUJvdnloY3l3TEhITlE4SGdVbVdyR0lwYUlvNHV0ZnlKR2VDQUlaMDF4?=
 =?utf-8?B?OVhIWDhXeHVHN0ZhWitYRnRnZ0hLUFoyVVlhOENpSjdxWmhxQVFQN3pCdWdN?=
 =?utf-8?B?eEFWWkhwb0pMRFFEVGFOM1pwWjlLcUtmVnJINmFkMUM3b1RoL2E3V21Ca3J1?=
 =?utf-8?B?dlM0dU9wS0xpeElsME5sODJsNWJvQlhDSVh5NFRHRFh1eHREWHltT2hEOUgx?=
 =?utf-8?B?c1hYTlJrNWdmeTlndFd6WFkxeVp0djFRY2hSM25LbjZKTmZPRkJFNkhCWG1X?=
 =?utf-8?B?aFl4VFZ3aXlBdkFnSXVIUnBnU2VFQ2tmNG8ySnkyWDNvUjdqazhaNHR3YlR5?=
 =?utf-8?B?emhuTGY2TWNEcmNTckVhaENNeWVXN29KL2dSUlZJdlJQbHZPUkNuU2NBZk81?=
 =?utf-8?B?V2h1eWxmbjZwZXQzM0R1UGZKbzBzSVhUZjMxSkYyTm5jSkduMFFKNGVMazR2?=
 =?utf-8?B?bnhiOHFxUWtDN3U2Um16VjBXR0xEMkt3NGxsTHZQZXpJTmJwbzNObVEva3JW?=
 =?utf-8?B?NHEzdUhMZjV1Y25SUjBTeFhKVWxYaDQyOE90bmdHNE4zdWkzbWJHWDJZQ2Jm?=
 =?utf-8?B?cU0rT1BYVUtaUENxUjMxdXE0TjFnejBjT2RxU2Z4VmZPZFlVSDNyYzloSjFU?=
 =?utf-8?B?bWt4TU1qSTZFSWRCVnduY3R4eGk5U3BLaURYbUlKREtIVytnK1VSYU5GTTBw?=
 =?utf-8?B?ZThNNzkzYmZjdTlyUE9tZFRmaDJtUXFCK3RRcERqZjlaZ0tDRkhZNG82TnJN?=
 =?utf-8?B?OTJuYnFRMW9oZllZN293MEFhRG8vZkpkTzRUaWFWR0xhbEdRWWlBVE9tSS9C?=
 =?utf-8?B?RmdQb2FjczdpNk5ma05lRjEvMjA1ckpQWHpKb1V2NUdNcFJ4VHI3cklVYjVy?=
 =?utf-8?B?Rk9YZXRzaFFwblFBazBJelY3N1g0OHRBSDdVUlYwYkMzakpZMzU3REU0eWpx?=
 =?utf-8?B?R2l4OG04cy9ncmcxY2NYR0lXZW1KTXlJODU3UE44cDdURjZ2aG1udWlhRFlm?=
 =?utf-8?B?T0hVV1hVZFUzQk40RDNoS0ozM3JnUmhxZU1kUXBVbDZGUzk3elJWU0FGV3U2?=
 =?utf-8?B?MWJiMDZMdEx5amFJcit3TlQ4UWYzKy8wWmxteFk1Q3pwNnpnV1ZvN2piNWF3?=
 =?utf-8?B?ZUlLVGRWbnRkT1IwZjhkQWFWc0N3ZHl2Zk1JN2VJZFRFdVdGTnZ5MUNVR0xu?=
 =?utf-8?B?K2ZDdmF1b1ZzSjVnc1RJOXZGNlRxMUFRWE8rbURyM29HWkQwWUdtbGlpOWFG?=
 =?utf-8?B?UnJQckx1ZWYwdFhPcmxsL29vNHloeVlncHdWRWF0ZktYU094Z1lzTlJZUjg4?=
 =?utf-8?B?eGJxZ1QrZGVhYXZUU3VBWEo0UTJRcmZJcDI4RTRLWGpBQnRjVmJtLzg3K0hQ?=
 =?utf-8?B?Nm02a1dmbWprb0R5YzlMTGpuYnlGL3hUUzdHSnJrRWJOT1hPakpMUE9QUzJJ?=
 =?utf-8?Q?INpUO5S6g0Mu+wKb2qR90Ye/01o7TWQk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?enVBTDIvU1RSL2JSSm5tWWJYNkhJVlI4cXpOSmZ1Ym1JVVNSZ1BBZjBaVklK?=
 =?utf-8?B?NUVrUHZud1NjQzFWbGlYcnI2TWRSemtsOHhwTWU0QTZzcTFtWlZUUmprS1A5?=
 =?utf-8?B?Q055TGg4QUovN1l2ZFJ4aDBtVkpCWHY3VC8wUFdJWnB1OUcyL211VVRhSTNU?=
 =?utf-8?B?QVVnOFJvUXVteFRPTXdGSmhHUXRTeXMydUdLM2pMV2ZTM3VHd2pjRU1kL05v?=
 =?utf-8?B?ektjeVNRZTVEeTBpZThKUmxOWjF0T21CdjV1RE9iNXNlUXNwMmh1eVZZOGRv?=
 =?utf-8?B?VXFSZ01sOVhIbVBEOHU1c1JUNnhrYUttUXJCck9YNVk3OHA2SVkxc3J5MnFK?=
 =?utf-8?B?QmQ2aVFpYy9TYXdvc1ZOUEkxR29pUmtQRXRoVFRnS0VBcU5aSjNVZXJ4TmdI?=
 =?utf-8?B?S0YrMklEMlVTSjFobjdEc21nTkF3a0ZPYWU3em9NUmpIaGU2WkgxWm1ETDZY?=
 =?utf-8?B?MTlENWFRc0hub2dwQzFhS1BqZnAzYktnOTdZUS96NjZXOTV4VS9kaEpGdm9k?=
 =?utf-8?B?MjkyMDk5Q2h4R1I5ZjMybkhsalJjYU5wWWduYlIwZThYSERpNUFnTHBSL3A2?=
 =?utf-8?B?YjNmRzVWc2RMWHlGWk9keUFPc090b0JoRVRiSTZranNjbmJ0VUtZLzVmRE5D?=
 =?utf-8?B?QWh2OFMzaXBBdU1UVXo5ZTM1QnBtS28xbllxSDA3VEdxdkU1b09WakhlZ2dy?=
 =?utf-8?B?RkVjaGVhalhTNVMzYWIyTFpwWm1YQ1YzMVFHaTVrMkZEdzYrb3FZYi9xVGk5?=
 =?utf-8?B?NDRhaVUxUlo1alducXdERU12ZWdyV0dTVFZSN29rTzlrcEpnc2hmZTlqWDdE?=
 =?utf-8?B?bmI2NWFXSk0yeUJZQlZXbGl3UzAzMGRTbXR5Q2Q0VHU5L0Eza3BVZWE3Uks0?=
 =?utf-8?B?UTIyZnpxUVk5aG9Fdlh6blgvQWxKUWl0WUZPdWJ5TUhGVGpSM3lxVjlNQjBp?=
 =?utf-8?B?cW10UU5rR3prRnBKYzF0cVZ3YWJBNjk5MGRuMXNLNVBvVXdLaURGVTNxQVVh?=
 =?utf-8?B?UGVFRXF4SDVBUUtSdGZqN0xFaHhVeWkzMktSTGZmWjdJOVZOMXd4RUZ2M3A2?=
 =?utf-8?B?cGYwMlowTEFPbDBpWXNzTE5raVU0WnYvd1pwbmF3c1QrNTBuWWxONHV0aU9E?=
 =?utf-8?B?bHFJQXVoaUVycTh6TVB6SCs1d1hia0dicmh1Y2JCd2xTNmxoTERDTVJ0SlR6?=
 =?utf-8?B?dXo3LzZLeVhRYnk1VW9QQVd5RXRaZi9YbGhoMzZmUTQrb2FFRTRobVhrRzVM?=
 =?utf-8?B?OXZBR1kvTGt1dXZXMjZBS3NndWptS3NqdmM3WWluekM4VDZxMkVIMm9qa05i?=
 =?utf-8?B?ZHFtQ0JHaHViMWY1WlFsZWY4aU9WZDdNTllBb08wMWVnUFAxeVNpc0p1UHZP?=
 =?utf-8?B?U1B4SFNScFJSN2ZWKzBpZE1RaVhOVXpKODJSN2t3dCswRW9JN2xTNEs4YmY2?=
 =?utf-8?B?SHQ3T0J5SThBWXAwNllJSmgzR2RlZ05ZTE9IcUpnVlVjQ29BcUthTHdFU1hU?=
 =?utf-8?B?MW5MajlEVTVVcnZpemQ2bEZiNll3aXVrblRxRlRIbUY1dlVDYnkzSTB2OUlK?=
 =?utf-8?B?K2RXMlF2K1loeHY0M24waXYvKzduMTNNNzVnaHpDMlBKWTVKOXRIdHRqb2Jw?=
 =?utf-8?B?QlA2cndRYXVXUlBWV1R2SXdwWWhaTmh2NHZrYXFXS3phUnpjL0pFemhUOE9h?=
 =?utf-8?B?MllQWkJaMWpDSnQ3S05tRUYxNjBoRE51WDNaUkNWaCtGSmVHdnNDZUlVMWo2?=
 =?utf-8?B?RWNwSW1OOVU2b1Fka3F6YmZPSzZ3UDFjNjhQNGlyOHh2b0paa1NWRktxSmVU?=
 =?utf-8?B?RXIwbEZWM3VBaFBJT2h0WmFzV3duM0dYUkhKU0RyT1dQc0ZyRFVYUnBNV3dZ?=
 =?utf-8?B?Wk8rdm5LOE55elE2RFN1TzFlTWNwSXpqVmVOZHZsTzlwYXJhb3RLQTR5YUVM?=
 =?utf-8?B?UGdmYkRYem11WG00YjNUck05a1Urb2xsYkVieTh4Y2dLNWtYa2xKL2dqbGcr?=
 =?utf-8?B?eXdYTnNkNWRMVjNrR3dLK000bFVaZUVLRUtJcEU4YW5rdWdNS2hrSGJDNHBu?=
 =?utf-8?B?b1pNTEgzMHUzbm1JS2QwV01UQzBMeEFLMzlWNzNpMmd6UlVlcmkySGtaQUpW?=
 =?utf-8?B?a2VWR2VSeW55cU1kZWd0b2VVZ1ZYUmlUV3JqS01OK2pSaWNGMGhPN09keWxM?=
 =?utf-8?B?dHlrbXZvbDZrcWU0bVUrajlPR0JKdUloT0kyenArQUVaY3Y0b3ZtMmc2bTFR?=
 =?utf-8?B?M3Z2cGlNZEdRSHVycTNWb1lMeGZIYWNoVEYxbGpSSjBIT21lWVZVckVaM1NC?=
 =?utf-8?B?bkVrbDZWRk1xdFlQeTNkNGJzS25udWR4ejlJL0xkbzBuTVltSm5rZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c55bb3a4-795f-4f28-1574-08de4f2d4d3a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 03:15:12.2449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wWiO2hPG7X4vDhUv5cYCKl77qCSvIoXDSrR33ptwVQjfiyigj5nMZ7VOqXeTkCSpDvewVdZgGKxDSI0QAsNV4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4295
Message-ID-Hash: NWQOZAUHQLLU7DISEUGV5RDLKAOL3QWC
X-Message-ID-Hash: NWQOZAUHQLLU7DISEUGV5RDLKAOL3QWC
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NWQOZAUHQLLU7DISEUGV5RDLKAOL3QWC/>
Archived-At: 
 <https://lore.freedesktop.org/264c8361-1962-47ad-accf-6fe5e1cc9283@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/2/26 8:59 PM, Timur Tabi wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
> 
> On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
> that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
> aligned to 4KB.  The logging buffers are already aligned to that size, so
> only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
> adjustment by adding padding to the end of the struct.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/fwsec.rs |  2 +-
>  drivers/gpu/nova-core/gsp.rs            |  8 ++++----
>  drivers/gpu/nova-core/gsp/fw.rs         | 14 +++++++++++++-
>  3 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index 1c1dcdacf5f5..5d2323b07241 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -433,7 +433,7 @@ pub(crate) fn new(
>          };
>  
>          Ok(FwsecFirmware {
> -            desc: desc,
> +            desc,
>              ucode: ucode_signed,
>          })
>      }
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 766fd9905358..bcf6ce18a4a1 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -27,7 +27,7 @@
>  use crate::{
>      gsp::cmdq::Cmdq,
>      gsp::fw::{
> -        GspArgumentsCached,
> +        GspArgumentsAligned,
>          LibosMemoryRegionInitArgument, //
>      },
>      num,
> @@ -114,7 +114,7 @@ pub(crate) struct Gsp {
>      /// Command queue.
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
> -    rmargs: CoherentAllocation<GspArgumentsCached>,
> +    rmargs: CoherentAllocation<GspArgumentsAligned>,
>  }
>  
>  impl Gsp {
> @@ -133,7 +133,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
>                  logintr: LogBuffer::new(dev)?,
>                  logrm: LogBuffer::new(dev)?,
>                  cmdq: Cmdq::new(dev)?,
> -                rmargs: CoherentAllocation::<GspArgumentsCached>::alloc_coherent(
> +                rmargs: CoherentAllocation::<GspArgumentsAligned>::alloc_coherent(
>                      dev,
>                      1,
>                      GFP_KERNEL | __GFP_ZERO,
> @@ -149,7 +149,7 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> impl PinInit<Self, Error
>                          libos[1] = LibosMemoryRegionInitArgument::new("LOGINTR", &logintr.0)
>                      )?;
>                      dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0))?;
> -                    dma_write!(rmargs[0] = fw::GspArgumentsCached::new(cmdq))?;
> +                    dma_write!(rmargs[0].inner = fw::GspArgumentsCached::new(cmdq))?;
>                      dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", rmargs))?;
>                  },
>              }))
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index abffd6beec65..15ca9c183ae1 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -906,9 +906,21 @@ pub(crate) fn new(cmdq: &Cmdq) -> Self {
>  // SAFETY: Padding is explicit and will not contain uninitialized data.
>  unsafe impl AsBytes for GspArgumentsCached {}
>  
> +/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
> +/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
> +/// to that size.
> +#[repr(C)]
> +pub(crate) struct GspArgumentsAligned {
> +    pub(crate) inner: GspArgumentsCached,
> +    _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
> +}
> +
> +// SAFETY: Padding is explicit and will not contain uninitialized data.

Sort of a pre-existing problem, but "Padding is explicit" seems meaningless
here. And if we're going to write anything here, maybe we should say *why*
we know that the padding can't or won't contain uninitialized data?

Otherwise it all looks good.

> +unsafe impl AsBytes for GspArgumentsAligned {}
> +
>  // SAFETY: This struct only contains integer types for which all bit patterns
>  // are valid.
> -unsafe impl FromBytes for GspArgumentsCached {}
> +unsafe impl FromBytes for GspArgumentsAligned {}
>  
>  /// Init arguments for the message queue.
>  #[repr(transparent)]

thanks,
-- 
John Hubbard

