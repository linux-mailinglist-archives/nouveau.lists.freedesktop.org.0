Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A24CFBA92
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 03:10:29 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A34D410E55F;
	Wed,  7 Jan 2026 02:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kE/8xVbS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3378144C9D;
	Wed,  7 Jan 2026 02:02:13 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767751333;
 b=Yq8uaQC9XFATilxxePT0xfmh+vhELKBZXJnBOxNjSIrhlXcXaNaSWsE86GT++GYlvdYDB
 Fcoi9lwOcXOMZRVW+QGHJ4Ak6TIUGFPhhcETqNsgt1+E/7RFxikZDgr6D3u1k+xEvVUswpQ
 voAwpmob+AJb5FrjMJ0fTkOhzyOlfRNq7reIzvx5B3g777wuGnHc73J1UccncG2tVdYtGjG
 o71dithBHkE+IGYEgIfy/xdzLMS9uK69WzR64kX1bAJ7NCWGzN9XijXQPvjmoKmcMUq5Mcc
 EusIJ7eWKuEGo5fweJbLyJNBoGwiILsP5rSIOObB+3bTE02FyvhZM6//wWww==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767751333; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2VTUGIs7lafZDqDVbI0kz8GWD7xRpXtANUer8L+lNDU=;
 b=Lz8BedATh00+JVv7ekRPy5+M6EkNN1YPuLjHmNZkrBz0GpNbgM3lOtkH6uOJxP/A1TRZs
 AjeWofXKQNbR5/x+0TtojtlMpeZ0jrZmo4+cTveUfASXRPjPAZglRP2POPRhlt/1wHpAgSX
 zDSvnx7FSRjI2G4FeyDGehpqZe+iiikz5pX0bh/iICMy+OqvrMLJGm0DbjFn4sbHJOjCv5I
 ueeIuIYouzeyrYCOSo5bYcrAjqqpp0/tMES09Bk70AdlfiM9Y6VDliiPP67CE+OUgf1G9aM
 cLen6l3LYnsh6pXEUGM+Lmy4gLw39iJzfcH5YUao513jyQszkU8a3jtZgU+g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C4CEA44BB6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:02:10 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010048.outbound.protection.outlook.com
 [52.101.193.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB0E710E25E
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:10:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmzI1UdFEvBV8tU6ZoYRL8v4GY/K69ur+FdqQCmyOHhmYubEBZgi0/ENZDvARyNUhXfmuis8U6y1W0Nircn7LY0CVCeu9A8kbE1hjjYv9eBwweJfno8EY37TnNch2BoN6hTuecisHlTz0tLuRRaN/UNc/muLCPNZHYbEY+F7TMLbeaQsp1Vi4Op35lVES/MqbdNEbjmdBBDPxQ4IkdCai58cayMJchS+p9OwQXbvosVM10JgS8dvUhi1qO3/tIL/XnPrtvSVwi31yYv9GmrdKCaFKSwckQ/wq3CRDa7kG6QCr+6U7Ig+P8KPHonTQmU8w+1wMerjm3EmkqG/qg+32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2VTUGIs7lafZDqDVbI0kz8GWD7xRpXtANUer8L+lNDU=;
 b=mVrQ2mmJUff2REx8z+G4JtSjmojBBzPjPebZZYYG0WadrzPTkIgtJKwmsUphAEWajjSP5TGx9bGJKZo3rQ910skKYbPEaoO6GQB8BmDBTpn+T8ZO10nyDbhr4AqQ2H9hdToKfIf6iRr3qT+5naSvvUUm8P45wlecyNrzCKhFUKvEydhSIjo4Ujpm024lrGt7uyCG9YOhHAyA1gzzwqGTXB79h1K00a2UudXDAuJqXcIX8YqnfrzrKGuLR9YgLtp7enu+F5k6O4UMrZJUm/aeghjUm3wdSxxTphbAFQIKzyoOJoVChWqz/Bjlw8KyX/PBCgthSKBE9yUqUv9Ic6alZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2VTUGIs7lafZDqDVbI0kz8GWD7xRpXtANUer8L+lNDU=;
 b=kE/8xVbSt8DZZjh2h0hnop4DwIkHIphS2Xbrk0IoDCEiCQh0eCVu9+y4q1EVMGZk9DjfCrRiXWpFG4EYea/Z9WgfuYy8lY27lHddHQECRUGMpsDHNf/HpmCKuxgxI0kksznGXBClZwBY8wuQavySuSfP9yccVtXhgOKlR3YymBUvkK2NbKrQJ3Tm26SDLXM8m46HRAE2eT6EYOjzuXthItNr3sz/VNtU5aYBMoOuJoBgER7BJmi5+fqErd1wGpWcWccerIWyzXgYtT+OnmBa7oAc/D754Y4R3/ouNveTZJFHb8cewv9LPByrnlBaYIYKN8yGFUQf7eh0UoUWgi3SZA==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SN7PR12MB6741.namprd12.prod.outlook.com (2603:10b6:806:26f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:10:19 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 02:10:19 +0000
Message-ID: <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
Date: Tue, 6 Jan 2026 18:10:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260107012414.2429246-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0035.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::48) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SN7PR12MB6741:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff08b20-7b2a-4105-0700-08de4d91e845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVdoT0hOSXEwQWZyZGJHN1Z6Qi80cnhDMzU4SDJNZVVxM0M3MDFIditwODk3?=
 =?utf-8?B?UVF2S2RJRGY5bXRMbTdqUm9mUnQ1TGQvZzl5TFFWaHVCc0I3WExYM21IQzJy?=
 =?utf-8?B?VnQ4RGJOU28zVk1lQ2cvSVNQdzlWbnZJOWJoM0xROXNvSmlMU1NDejhLdXd3?=
 =?utf-8?B?Wk8zMXJlQzFOZmZ6WVRTeWFUTk1OWVcrOEZ3RFkrZWJIZWNUWkM0WW9xekNk?=
 =?utf-8?B?NjhnRTRNUVRvU1k4RGVkenBIWHdPWTVSUEpKR29FSXFJWStaNkRJYlBWdDVq?=
 =?utf-8?B?cWEvcko4Y2Jub2RUU090akRxWGM3Vm9HMTduMGxRWGp4Wk5lQmZSZFNNZVFy?=
 =?utf-8?B?QkhXTVlhMUxTNU8wczVUNkR2L3ZqTE1tdVFCcW5mQUZwVlgxMFlDZ2hDMlda?=
 =?utf-8?B?SjF6blN4TGhHWC9TeVJ4UUxLU1lHU0JpRGEvRXRrbkZxVGpsRmdqempjVW03?=
 =?utf-8?B?aVNPcFo0UG5iZDZSZkMvT0ErRnJNSUhwNnFwMnhCYXpsRVNydnBITnI4WUwx?=
 =?utf-8?B?bEZDYnpZSGxYWjRrampwS2Y2L1IydmtJdW9MMG5tTDVFeG9FUkI0YWRldHBy?=
 =?utf-8?B?QTFyNTNhL1BoT3YrZDVadlhZQ1k5YnpUbHg1cVJMTTJmMk5GNEwyVG04RWdH?=
 =?utf-8?B?eUd5STRCOE4wQTdJQ2pabFk0UFdpM2Zmck9hdjhpNHNlZ0E0c3I3bHJzbGVv?=
 =?utf-8?B?WXBBNHdjUTlNMmJKSjE0SkpuT0p1N0VhVGRBN2t3TlcycUlPMDB2WkgxeDNm?=
 =?utf-8?B?eFJ2dHRob2l4Sm8rMld1WUExYlN3ZFUzUWZZVmZPWHdUNkxwZlFxNzVTaFlo?=
 =?utf-8?B?K1Y0Y3pyUitIKzVwd0JuRmJUKzNuTTN2blAzZXRJZDltNExSRGpoU3kwN1dT?=
 =?utf-8?B?LysyR1VjeEgrdnhISlNlTi8vbCtoRHhycUNlbXI2dmkvMkNrTE8zMWhVWVFn?=
 =?utf-8?B?dnNyMmZBdW5UVHRtZ0w4K1UwV09vRDdEeUhuVzhYdWxJTFFxaVoxdEVqZ3ZE?=
 =?utf-8?B?cGFUQklvc0NiWEpCN09zb0dPUFdWUVBqSDJaU3RWQ3g2YTF1b2tiT0lnQ0lm?=
 =?utf-8?B?RmJDTVZNQjRMamlFeUs0Qy9YOGJwTmxtWEZnLzRkVmEyU0pSZkJpRlVmQ3Yz?=
 =?utf-8?B?NUt6dmhNZHFpZGVVQmFCSzRiNFltSkRDTXJNS1NpYkliaHpQSzdUbzFTOHQ3?=
 =?utf-8?B?R2FLVDYwQ0NaNFA0bUxSbFNaeEp3YmJjb0MvOVZ6ZHVudzVjaWVxWjJpM0FL?=
 =?utf-8?B?N3d5L0NYa3VlelVFb1o0cWJKVVN0Y2pDcHNTM1JlaU0yWU94VjdjOUVINDdj?=
 =?utf-8?B?UTljNUpRQkUwY0dNa3o4aUhvVEVrZGdvVHZlLzY4MkxvUnFlSTZRV2hKeXZW?=
 =?utf-8?B?Wm5hNEplODlNTVM5NkUzSDgyeWRmY2VxSFRsbnVKd29CYUdQNm0zSWV0amdm?=
 =?utf-8?B?QlB4ZXp6eHljYWdSMHZQa01NZ2pRWVE0RFVOWWw1TS9NS2tGUUx6SEdjT3RV?=
 =?utf-8?B?ekI3bUxOZ29tRnJLL3NRTmZJdEs0aElFRnczZlUrbnp1OEtUd3lBaFJCVHp3?=
 =?utf-8?B?VHJ2VkRKR0hOem5JaFdKaTRKWUZoOENYdHVReXRwMkJUdVd5OVlDZHVsekxq?=
 =?utf-8?B?MWlxcFZpcE1ORnJ6b2xRbVZjVDgxY1JtT3hscHQ5Nzl3bTkrem5LM2JNTExy?=
 =?utf-8?B?M3pNaHNHbHVuYTRHaUVKMTFtNU9oRWhrT2NnLzJGVU1UNWdGTExtMmxqSFNO?=
 =?utf-8?B?THFRMEhzMjdLUHl0SmE2RVVGMXQ0QlhUK1k0Wkh1NkdLVmVMUFZCZlJoTk1N?=
 =?utf-8?B?TzY2QzhTUHdtb0t3SWZ1S3JOcXB1UzhkM0lHUjZJN00ydWliYW9WWnY3VUZj?=
 =?utf-8?B?Tk1tclVzU3lsbzlldktXajV1Y1MzNnhVMWVJRXVEVGozeGhFZkQyMDhYNTRw?=
 =?utf-8?Q?jY4hlA6VjQHaV5phaT0icLZu74VwdYE/?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y2tPSzR4cVZPODRVUHVxNEVyUjhIT29LcjRORTRQUFJOYzRLOXdHRWFETTlv?=
 =?utf-8?B?NC8xeWp3YTE2TEQ5ZW9xUnBHZ2RldXYyUDdnT1FncFd6RnBlQjUrUzQ0bjZE?=
 =?utf-8?B?MGQxZG5WeGtqNUdTY2paOVVoUy9oVXMyNnlOcjBNckZPUUhkVUN1b040eDRp?=
 =?utf-8?B?ZGF6UGs4ZTZ5WC9TVGE4UEI5aWN4V0dDU2NtRHBWYlZUSm11UWxDVVhpQ1VC?=
 =?utf-8?B?NHJuRm1uaU5FaXVOS2JHTmtiWmtaQU1CVUVIRi9BSTBuSm9xYk1WdGorNzFB?=
 =?utf-8?B?cTAyaUpya2FqWVFyUnBqRXRld0lOMGtPL1I0RGZsdDNSSStNVlJXbjlSSmdp?=
 =?utf-8?B?ekJIS2xNakpROWVkaDFyWEZuRXV1aFNBemNmb0RLTEU5WmhBV0Y5WEZZbFFQ?=
 =?utf-8?B?SWdCd3BzZW9CQnFmRGRaNjNnaytQMDRUcDBxK1NvZU1yenFGcWdiZFhyK1Rn?=
 =?utf-8?B?N3dkcWdwdml3NlR1U0R3NjU4QS9naUhsUzh4UGcxNjNZaHZ2WHZDYnZIMGpp?=
 =?utf-8?B?L091QitnbGdCL012akhxVDR0NmVvQ0Ixc01XR3RTWDU2cENJKy9zYTBnUDhs?=
 =?utf-8?B?bnE5eDB5OVdLYkRoSllqeHVVVVE5YlVNbjVLWmNORXpzc1BuZ3lvb2l6VUNj?=
 =?utf-8?B?bG1rMXYvVVd2VU9WWmI4c0ZDM3d6VmY2eTZwd3BGekhKak5iK0wrZmZwOHB0?=
 =?utf-8?B?a3dWUUp2Y2JMRFJDdDRGS0s1c0FGeXppcjh0Q2R2RnNlZ09IUTNhM1BsQTNo?=
 =?utf-8?B?RkV0Y3RCcVVzNDAydWF4dDdRTW5XdmRLWDZnUldGK3FCOFFIbTZxT3ZpT0V6?=
 =?utf-8?B?bHlMbjVtN0UzYmhUaUw4VWlybFdlTnMwL3VwMGVFc2ZCc0luM1UveHdNbW9X?=
 =?utf-8?B?RnVsU3Q1MGJBY0QzcGp6M0RkUU5sMGVNUjl5RzEwZFZrMkE0b1JzK3IrVEtn?=
 =?utf-8?B?clJsWndZK0d6ejdvQk82RzdwTmNJalFEdXc3TUdvamh0V1NBUExUZFBjNDJ5?=
 =?utf-8?B?VHlvcDZaSXFFSlJza3RsUStVL1d2ZG5tQ1kwYzZSYlc0b01vU2JxcnhVaHZY?=
 =?utf-8?B?cXB3Y3NCbXFyVFo4SmxjbUFxM2hrY2xiRHpwUjBHSnRVUXJiSDlFdmYwb1dq?=
 =?utf-8?B?Ulgyazh4UEFZMGlxK3RnR2dhSnhIcm9jWmVCQkU2RnhIVjAzNi90c1dDQ3hJ?=
 =?utf-8?B?amMwUndhdnloczFVWEx6QkpiUm9oQ0t5ZTlyNHFDTEVZc25Ga2E0ZjR5eWli?=
 =?utf-8?B?UFZhVnRRcFJCbDhKc0RDdUxRaVZEOGZCWkVMa25pb2FhN1dYd0xjQ3ZuY1ds?=
 =?utf-8?B?QzE1bVZHYVFYMmtqNXI4RUR0MVNsOThhT0wrd2RoYWw5N25zcVNzM01mVkZj?=
 =?utf-8?B?OFBUUEZkSXJPTjRZK3ZKU0sxM1FOTUl4V21wMitEU3hZODZ3OXJJd1VJTDUz?=
 =?utf-8?B?QnlvSTI2UFc1Q0pkZExpRkN0OEtvUVRPNGpZc3E2Q3lSY1hoRGg2aDZlQWNS?=
 =?utf-8?B?K081WnRqdGtoSEZuRVRxdCtZYTBJVnNScU94Sk1Yb3QzZ3VqSzZIU3RqbVF3?=
 =?utf-8?B?WDQ0eko0UVRLWUgxeWk1YmhHMGVSZ3VzQjZ0c1JpdTMrRUFoTWRxOGFvOWwy?=
 =?utf-8?B?ZHpMaFVRNjA2ODRXbnR2eUpEOXh0UEw4bXNaMDB5RzZkVFU4S3BFVzZSblhx?=
 =?utf-8?B?dHoyYVY1UjJxR25nOGhRT3pYZkozcWVxcEdOdmN6S0NuK0hLMUZYTGNQWTdN?=
 =?utf-8?B?ZktHR00wNFZYeXpadmFlN1JDZno4SVV3MUU3Kzg4dGx4Ukc1TGpDeTV4Q0Jr?=
 =?utf-8?B?VG5lODFlZ2lUUi9hazBwcjM1L1o4b2xzYVB5c0xGZSsybGJzMUF1M2xqbGFj?=
 =?utf-8?B?L0xMbXFFRUtXNXMvL1VMZHBXeWM0L3FrL2MyWExKTkhObUpRSmRTdmZqQmdx?=
 =?utf-8?B?VFBHbkNiQVZOa1k4enVpMHIxYlo0MWhrTDI5TW0wVGZiSHM5K1E5ZG14a2pY?=
 =?utf-8?B?NTdhVTVSL2xsS2FUekthaEZDbVZsQWhZM1dFb0QzRnpMV3krUFpaR0YrUGFa?=
 =?utf-8?B?STJEZ21KSE1QNjdUTjhhd2x3ajUwRVJIMEkwQU8yQ245d3I4OTN4M3RaS1ox?=
 =?utf-8?B?TVhYMlpxYlFCaU9GNTJlQUluUDQ5SnM0ZzlLV28zYkNZcG1pK1hidUp4VUZI?=
 =?utf-8?B?ak91a3dLTEVDMEJ0aHdtanVERklwdVZkWDVJY3I4WlNmSS9TTWROZUNzSStl?=
 =?utf-8?B?c0JVejk2OE1oaVA3SlBSdnRMdzNndEdKM3UvaE1iV1BrVmFqeWVmamdtcWtp?=
 =?utf-8?B?aFJIWE5IaHdKVGFod0luZHcwRVJnOUxaUmh6dW5OVC8vRUZXUjRidz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8ff08b20-7b2a-4105-0700-08de4d91e845
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:10:19.7030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lMmMA3VCDsU7ncD3f1IcfFU60bFa+3f7d3jBsY0kk/7+gwZTbdQu6/dmpj8ZsPR0rgaeFTAUIS+Sa65mpe9ing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6741
Message-ID-Hash: X7GZTZR7HOFWAQFTBBVGE47RO4QWSX7B
X-Message-ID-Hash: X7GZTZR7HOFWAQFTBBVGE47RO4QWSX7B
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X7GZTZR7HOFWAQFTBBVGE47RO4QWSX7B/>
Archived-At: 
 <https://lore.freedesktop.org/1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 5:24 PM, Timur Tabi wrote:
> Although the dev_xx!() macro calls do not technically require terminating
> newlines for the format strings, they should be added any way to maintain
> consistency, both within Rust code and with the C versions.

I'd *tentatively* prefer to *omit* the \n's, because they are 
stripped out (and then re-added) as part of the printing
call stack, and so it seems nice to have less dead code on
the screen.

On the other hand, the output always gets a newline, so seeing
it on screen is actually informative in a way.

And yes consistency is important. But which way to head
toward? I checked the Rust for Linux code in drm-rust-next,
and we have:

Codebase                      WITH \n    WITHOUT \n    % with \n
----------------------------------------------------------------
samples/rust (dev_*!)              30            10          75%
samples/rust (pr_*!)               20             7          74%
nova-core (dev_*!) [after patch]   39            32          55%
nova-core (dev_*!) [before patch]  32            39          45%
nova (dev_*!)                       0             0           --
tyr (dev_*!)                        3             5          38%
pwm (dev_*!)                        3             6          33%
binder (pr_*!)                     17            62          22%

So there is not yet a clear convention visible in the code.

Miguel, Alice, Gary et al, is there actually a preference already?


thanks,
-- 
John Hubbard


> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs           | 6 +++---
>  drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++--
>  drivers/gpu/nova-core/gpu.rs              | 2 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs    | 6 +++---
>  drivers/gpu/nova-core/vbios.rs            | 2 +-
>  5 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index fe5abf64dd2b..c1cb31c856b5 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -466,7 +466,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>          if dma_start % DmaAddress::from(DMA_LEN) > 0 {
>              dev_err!(
>                  self.dev,
> -                "DMA transfer start addresses must be a multiple of {}",
> +                "DMA transfer start addresses must be a multiple of {}\n",
>                  DMA_LEN
>              );
>              return Err(EINVAL);
> @@ -483,11 +483,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
>              .and_then(|size| size.checked_add(load_offsets.src_start))
>          {
>              None => {
> -                dev_err!(self.dev, "DMA transfer length overflow");
> +                dev_err!(self.dev, "DMA transfer length overflow\n");
>                  return Err(EOVERFLOW);
>              }
>              Some(upper_bound) if usize::from_safe_cast(upper_bound) > fw.size() => {
> -                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object");
> +                dev_err!(self.dev, "DMA transfer goes beyond range of DMA object\n");
>                  return Err(EINVAL);
>              }
>              Some(_) => (),
> diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> index 69a7a95cac16..0bdfe45a2d03 100644
> --- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
> +++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
> @@ -52,7 +52,7 @@ fn signature_reg_fuse_version_ga102(
>      let ucode_idx = match usize::from(ucode_id) {
>          ucode_id @ 1..=regs::NV_FUSE_OPT_FPF_SIZE => ucode_id - 1,
>          _ => {
> -            dev_err!(dev, "invalid ucode id {:#x}", ucode_id);
> +            dev_err!(dev, "invalid ucode id {:#x}\n", ucode_id);
>              return Err(EINVAL);
>          }
>      };
> @@ -66,7 +66,7 @@ fn signature_reg_fuse_version_ga102(
>      } else if engine_id_mask & 0x0400 != 0 {
>          regs::NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION::read(bar, ucode_idx).data()
>      } else {
> -        dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
> +        dev_err!(dev, "unexpected engine_id_mask {:#x}\n", engine_id_mask);
>          return Err(EINVAL);
>      };
>  
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 50d76092fbdd..9b042ef1a308 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -268,7 +268,7 @@ pub(crate) fn new<'a>(
>              // We must wait for GFW_BOOT completion before doing any significant setup on the GPU.
>              _: {
>                  gfw::wait_gfw_boot_completion(bar)
> -                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
> +                    .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete\n"))?;
>              },
>  
>              sysmem_flush: SysmemFlush::register(pdev.as_ref(), bar, spec.chipset)?,
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
> index d78a30fbb70f..d965ffe9ba89 100644
> --- a/drivers/gpu/nova-core/gsp/sequencer.rs
> +++ b/drivers/gpu/nova-core/gsp/sequencer.rs
> @@ -121,7 +121,7 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
>          };
>  
>          if data.len() < size {
> -            dev_err!(dev, "Data is not enough for command");
> +            dev_err!(dev, "Data is not enough for command\n");
>              return Err(EINVAL);
>          }
>  
> @@ -320,7 +320,7 @@ fn next(&mut self) -> Option<Self::Item> {
>  
>          cmd_result.map_or_else(
>              |_err| {
> -                dev_err!(self.dev, "Error parsing command at offset {}", offset);
> +                dev_err!(self.dev, "Error parsing command at offset {}\n", offset);
>                  None
>              },
>              |(cmd, size)| {
> @@ -382,7 +382,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
>              dev: params.dev,
>          };
>  
> -        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands");
> +        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands\n");
>  
>          for cmd_result in sequencer.iter() {
>              match cmd_result {
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index 7c26e4a2d61c..e4eae9385f47 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -790,7 +790,7 @@ fn falcon_data_ptr(&self) -> Result<u32> {
>          // read the 4 bytes at the offset specified in the token
>          let offset = usize::from(token.data_offset);
>          let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
> -            dev_err!(self.base.dev, "Failed to convert data slice to array");
> +            dev_err!(self.base.dev, "Failed to convert data slice to array\n");
>              EINVAL
>          })?;
>  


