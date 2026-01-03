Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BE3CF0635
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 22:22:06 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D402E10E38A;
	Sat,  3 Jan 2026 21:22:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eSVjXRWx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C14644C66;
	Sat,  3 Jan 2026 21:13:57 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767474837;
 b=J1ftN5sFuJ4EE7OVqgzPmEcCtiib6DcffjY9XWgNCfVAD/+tDpvzc1O1a/3gXJZm2RjOz
 M5wPO1aggFkQlH0ZfyhG1j2jV8RIwB7lqF9lFvkpFUeqo6AngFbTjwmiosH63u4f52XPui9
 cjxCpjwgAiyHCTPHDApDu1HiugjQpscOkneuTEKKOVuQFWU1I0BpB7mmg3TPMFt+NBHugz2
 5DZ3+gtP8uImjYvO9+L4g/h2SKQUxznZZpCTsfz9ahzR7n3XDyc52Ktyl6eFZA912vVbfQ3
 5WMIHiIQqc1Tred+SLqyvqyOeDv6Uj4sVXsOjNIvvTrcavHR6o2JxocI9i/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767474837; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tnyM0AYEBOV9Qy7e1fWq1o227+2iTlSsNLFu8rOZr6E=;
 b=rXGOwE0U71doPyIlcaw1clPNSwg8jxoDkV8JFH7EDRw+jE0A8TjLTVfKXS+Wxv8fGVU9N
 pVoNVdYFuHPiNuTPbjGm9eQpVSZwL5+ucTzmmIpEQSQY/mU/vmN56HMz0scTuRdC+YW6+Di
 C8HU5fH8+hN0I4TUkzf+8PZe+liBFRZD/YtzAqEC97Tqb4B2K38xclby1G8S3wCAAdzf0R2
 iRkvOMBY26fMTArqLOCA2PeVJoelDK1JnIwQqlaipYVfRIPcTjjNSohCD+ZDdxx+r6lxYpY
 70wuJPPOf3FwqCkHCYQKC9SWJnOMp+F6OqMh7i+y26sfsJ+ytHNQ5hCK0m7w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 76BF844B9B
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 21:13:53 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010025.outbound.protection.outlook.com
 [52.101.193.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 60FB610E033
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 21:22:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKgDhWjNVZM//wEpSoYtsiajZuqhOhDaS2lihmOr4sjAIU6SIr8EhangGwJ46vif7uQvBBGIrq2oqlfmIT5/gtfnw1HynKyNTeTumYOxcGLUHUhyHMuIL2Mye3xKfyCm6bSXvJLqzuGTIpsOhcimlWKuOt1Zioz4+WbVxFakBzg5u1mtCql6I45Aje2UhR2NSXzvb9JFjrZ9vDzbiZq0yRXbkyP5Vhsw/bKJ8N9+B0QPCQ/NB/4Ys703bJYAqdzsFzBcBPfEoVBxXeDzROsGDlQ+Rt7uX7n2TAVTj/o+zJJG30POEb/3yBzj5KCritwmhCRFaqNGAtJV1DancLrzIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnyM0AYEBOV9Qy7e1fWq1o227+2iTlSsNLFu8rOZr6E=;
 b=VMyeHQlt+iqp1i97LfV7C3R6fv283Uz1Lvuw0wtorwt24uwYOun88dHZFlWr2+Yz18q4iwCL8Cw5+Vb7LvZzCsEju0/u8F7RztFdTche/6xtngXgbjuq1YYGQTNznz7T5aE2aW0mkyjBBLJAwl+omTK+utrBwslfAhvy+csbRkyCET66HjWGE4fuM4G89ldQgM7roMtcfQugr0qEcSy6Ufinuq8LLUuN/K/GYNkfiO2gqNERMnpliKyi+ahzxY+QSrP2A7sTOvw0I0FJBF9yFueAv4MVg8tcNKyaiLYYAqmsM9Zr6ta9IRI1FWtVuEvHzvHT+j5ptOQZqjfTZZh2Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnyM0AYEBOV9Qy7e1fWq1o227+2iTlSsNLFu8rOZr6E=;
 b=eSVjXRWxFQQ77YpiJ/5eqCyXfmmXbBoL0rBawbxnKzSnT3AJBSeTf6e7HN9eY8hQiG/hjq6QMleHDX2Q4D+41sX7RMCa7jTa4Cp5Fk+GQ10iIc4zFUqqmZEKiSp/PnOvUIWcVRD5SQggoZuF2F+xHW9hyaqYHnzVpYpdT3yJm+fqsM+xYJ5+Qn6EJozHJCmmsXyA3w4YGwUJqmxsZX+SzaoUV5AqQNF/f1fSSBVrxGC+xneEe7erY5HPfja+tGVjZW/fLFYfYKCB5GYaw4etRVOD3OxnQsPO9yyqcte1Y2he5dit6GfL2eWaXVVmohRohLchOxnmmHrE9pc2ldNWiA==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 21:21:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9478.004; Sat, 3 Jan 2026
 21:21:55 +0000
Message-ID: <4b589c75-c6d1-4733-80b1-a9a454445fb9@nvidia.com>
Date: Sat, 3 Jan 2026 16:21:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu: nova-core: use CStr::from_bytes_until_nul() and
 remove util.rs
To: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
References: <20260103013438.247759-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260103013438.247759-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0006.namprd02.prod.outlook.com
 (2603:10b6:207:3c::19) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH3PR12MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 225537ca-4749-409d-f169-08de4b0e1e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2tHWWFQTXVjZHhkZ2Jlbzhid1ZzTFdQYnBUYnNwdjgwUUR0eHBLWDArcXFr?=
 =?utf-8?B?bkdJQXY1Z3M0K2ZDcUZDaXJsenF6TTNjMjFPZm9tSGpRTjd2dXZFUXJqckFk?=
 =?utf-8?B?R3djN0hoSFBFVlZVVU5qZm1LMk5yT3VRMWdkTDJRR3kxb0lBS0tJdlZ1OUZG?=
 =?utf-8?B?cmc0ZHFwTVVqRkhMTHFwSm0xTXdZVnFRMmhMeUg4ODFNMEhqTUF0d0Y0V205?=
 =?utf-8?B?RVhQUk8xaFlITnp2ay9oTHRSR2pCNWJMNUFzb205cUNWOXcxZ3Mrc2xMZXJu?=
 =?utf-8?B?ekkzakoyL0o1WFoxbDc4TjcvSG1DRWFKN3BRWEtFdktLNU9mUjkwWTBYc0Jz?=
 =?utf-8?B?T2dxVTZoMkhDWDJnRlMySjhYYjl1QXRNaENiM1JuemRUYzRBb1RmeHVNeE1Z?=
 =?utf-8?B?NVNYYzFLR1BGOWxidk5qZ1pzNHEwZlNoWS9FSXNtcWdnSExpeFpFRVJqTU9M?=
 =?utf-8?B?RXBpNTN0c1VzUzNQOCt1bHo2eXRtS21wdjBEeVlFQzArM3ozVzMzdTJDaVlQ?=
 =?utf-8?B?cHJvTHlUYXh1THVYOGdpaW5leFd6a3hrRkdzRlI0OEhzMlRRUGVyTUVuSjRP?=
 =?utf-8?B?VjZzSTBoZ1hLeTNEZmd5d1F0OStrZDhpRVZWL2JDaWxhT0g3RnlsWHZwOTBt?=
 =?utf-8?B?NWhMUnF3MFl3bkJ4ZWJ4ajltUFN4SSt1WXk0T01JSElLMFBBQ0wxa3Zva1dq?=
 =?utf-8?B?aXlaZTlYNlQvSzUveUFHaEtJL2NhZzN1cWdsWC80cjEzalhnaHdZc2VIdVVJ?=
 =?utf-8?B?Znlra0RKcWxuSTlOdzJ1c1hWeURYbi9UZ2x0Y3hHNUV0U1NtdFk4ZTJGUUM2?=
 =?utf-8?B?Tk9SVDFaZ3V4WGh5eGZXOHpGQXhvamlSS3ZWVUhWZmIzYzRCTVFURFM5ZW9t?=
 =?utf-8?B?ZCtnTE5JcjREQnNlR2QyVFVDR0J3KzVSVnoyUkJ2a2t5OTk0L3ZtMDdMNDFT?=
 =?utf-8?B?aTRDY1E0OVFBclVsQzlpQ083MU1JMXkzRTIwanR2d1F3Ykt2L01KNThyLzVF?=
 =?utf-8?B?ZWxBVGM4dERLUUNJRDZVNjBNNHN0Z080Y1BlLzBHSzBQQXlFREZGeklGQm5k?=
 =?utf-8?B?OUYyOXBDY2toSXZ1UHNqcHdpOUt5ek93ZHRiRWpNQmVPamllOHFZM0daMUtv?=
 =?utf-8?B?NzJ5YmlxVnBUUmIxNHpiK0QvZEYyNXhqbnRoMEF4RGNhZ00xN09IZ2tKSVBo?=
 =?utf-8?B?bktwa1NJZFppQ1VyZzZuczNId2hTdHhFZW51Rnc2clBTK01JelRWZTd1WDZt?=
 =?utf-8?B?eFVrTHZmaTdxcmcwekY4Q1VobnNLN0V2bk9Zeit5K1NjRW1LclpCWjQwb3Vn?=
 =?utf-8?B?MjV1eitoc3JtRk1vc3REb0xuOGhGSFcwQVFkbEkzaXJ1SGt0SlIrMEY0bVlD?=
 =?utf-8?B?eEhYWjUrbzNIMTlGM1ZlNG54QjFRRHc1RlJrRS9sd0NUZ01tNXdLMzRUVklK?=
 =?utf-8?B?ZXRINmI5ZnpyQldpNFArV2hmS0IrcStKTWlUNWtNLzRPN1pnYmt2THNWSnN0?=
 =?utf-8?B?dTI0L3djWU9Rd05PUENIK3h3bnQyL2Zhb043L2Nza1hpcDhxQ00yVkJMVDE4?=
 =?utf-8?B?OEJCN3hxSElqTGdCd1gvMmdxTE1oRWN3NXJsQ1RoT3JlT3NrUnZUQjloaHda?=
 =?utf-8?B?OUh4Z2hVaStjMVVlc0ZESWsxM0dNUXBjbG5NT3hKQ2RuQlRoTit0WUNmUzJF?=
 =?utf-8?B?TTVRUm1zdXhwaXE1R0t3SnUwVnpMZDlnUXNyYTJhUGg5TVRJM3dERXJmZytp?=
 =?utf-8?B?dUQ3SXozZ1dhVjNuT3JWb1ZXRVp4WUs4ZHlFZXJZMTM3TzkrVGcvbktUc3Bk?=
 =?utf-8?B?VkhKdzBMbFFTUXByR2ZaclFPTi9xRFZyVndwVlh6SVdoTWVNY0kxVU4zeEJj?=
 =?utf-8?B?QWRITWdnNlcraXlESVFta2RwTDZrblBOU1VGbFMxNWRGNklubEcrTzQvUTJx?=
 =?utf-8?Q?D0i20x3Lo0VXHBZlQnUuT+K0hwq97JjQ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djF3Q3Azb0MyQ3dqV3BwaUhUU1ZWdFk0WCt4TWg5TGt0Wi9vZHY3c3ZKZmxI?=
 =?utf-8?B?RzRUYmtveVNaVWJrT1Y2V3ZHNUVCYW5oUlpPT2JSa3NCSktFYWZlNm1iTTU5?=
 =?utf-8?B?Qnk0bmJOMTRmVFgyZ2dHOTQ4THZhejRUc2RrVkV2RzZNTmh4dmdMUlhhRDZy?=
 =?utf-8?B?VFZZWU9Va2JPekgzNEZvOHpoU1NrOEpBdkdScjV3YS9nRmVsUStpanBUNDcv?=
 =?utf-8?B?VW9lTGJmTzZ4K01zMFpCajNoNVBjNXdrbzZLeUtpK3NTUEM5aXRjZTBid1Qy?=
 =?utf-8?B?djU5bDRIczIzV2gvQlVpRXdQc1ZRZDNuZTNxLzQ4N1lyam41cTJxYklTcWYz?=
 =?utf-8?B?QnZUbEVZUUowTGtHdFQ0bkwxR1JVaGRFWERiRGFqZkVlTmQyd2VYSjltbmJo?=
 =?utf-8?B?Zm0wVzAvdjhxRXIxUDJFRXRiVXFVaE0ycWM2QmZudnVQd3FVWjBCVHVvM2Ny?=
 =?utf-8?B?L2NIMzBqT1FWSTNUcDBOenF0aVNnaWdnbmZFbjk5b2lxd3BKOGdOUXM4UXl2?=
 =?utf-8?B?SkRlRGlQcVhDbU4zb0lKcVhJS3JYSWZ5clM4VDN5QzZyQ0RzeGRaME1JODhT?=
 =?utf-8?B?Q2ZIeVdCNnZieGxzQlhqK3JBS3BVSlROdVNYT1JtSGdISzdCdTdrVmMxQVVo?=
 =?utf-8?B?VmFRMlVMSERBMjJxdXMvQzlRUGR6c1ZKTGtJU0xud3Nnb3dLNFJ1cExlWWxC?=
 =?utf-8?B?R2M5d3pMZUVEbFo3b2d2UUVmdVNjcjU2T05iVW5YRXFWR0YzZG9Wd1BtNlJV?=
 =?utf-8?B?K244Sk9STENjS0xpQ21QWHhwY29PRTNoYzlvdjdWQUNXVml3Mkg2YWFVcjZY?=
 =?utf-8?B?WmZsQndCY0VTRWE3VGpWbFU4UlhjRk5Ic3VVbS93UmFPSWNxNU9Mam4ybU96?=
 =?utf-8?B?TlhRRDR3citjaUlTSkdtTDhwK2YrTkJZT2dyOHF4aS9BbUdPSXp1VjFIRW1o?=
 =?utf-8?B?TlJyOHZxNm5pcnlrSUpsNlNoVXg0UzVpWmlPRzd5RGJWTlBLcjVPcnJpekFG?=
 =?utf-8?B?elM2L2RYV0hrTm9pc1ozd0VkZFBWaVJkV3RXQ2t5WDFUTnpjeWVFNTVGTnQy?=
 =?utf-8?B?SytsZ1Z5aloxQWtvUDJqblBQQjlIWFRySENONE1ndnNvUjd5SHJLWGk5U1lw?=
 =?utf-8?B?VGw3SUNOSVNHQ1ZGUUlXcG1tQWpmaENyNnpOT1VNVzhsalZNcnlhUVJrZUd5?=
 =?utf-8?B?Mml2bzRtb1NBS2pCaXBUK2kxMG1XUlhIR1hZdUE0YjYxdFdRMTJLbDN4K25a?=
 =?utf-8?B?YzM0S2J6RHFGTWZ2WWlRWllIN2JaS3hwMVVobFZ4QUF0RUUwZ1NHT2ZUTExF?=
 =?utf-8?B?R2VCNUd1ZlBOV3BGTitTR05uUGJ1SHhWWXl1YlNGYmxJaytxRzZnTXh3RFVl?=
 =?utf-8?B?M1NQVHFoWk1OanJYcmlKcW12ZkpWaVN5UGtKUjBiYVlZcVJFeFFKSVNqaTlZ?=
 =?utf-8?B?S3JNcmZFSUJmajhJaWQzM3RpLzkrOHdqTzBsVXVHZU1ycmc0ZDFhZW5IM2tB?=
 =?utf-8?B?Wm1FbHRIOFd3Z0lWT3NoMW93dWtTYVZISk9DRGZuTDBXUU5VTExWWVUrTnBO?=
 =?utf-8?B?VXkwSnMvRGYvSXRISEVVWDFTeU1HTVVGY2VBWHc4M0RwZ3pPUHZ1NE8yc0FT?=
 =?utf-8?B?VWNpSXJnUmlnVnE0b1J6TGxTQ3NGV0RWUnpBREQrK2g5RWYvU2FsUzJKdFpZ?=
 =?utf-8?B?b2o5S2lnYlhEOXA0dXhQRlZ2cTBRZENqdlU4allQczhoL1JXQ25PUnhHOGV3?=
 =?utf-8?B?dHY4c1lNOUxpbmh0bGR6c2VrdVVLTGlqSXU2MjJiVEJmbm5ndnNNcnpIQXVi?=
 =?utf-8?B?U2h4Q2lSdExzSm5aOWNLZlJ2QjY2TEpwNFEyZnZSNGk3U3FBU1ZrNzNkdk9n?=
 =?utf-8?B?c3ZKYlpOcWZpdVFZZGxpRkZXNFZlcVdtSlFJTWN1aE51TWhGMjF3SGxzdVdO?=
 =?utf-8?B?ZWdWS0xhdEtBRGM1WDkwdkFDbEc5blB3OU1BSlF5TkF1dFJ4cm5UTjdKc2ZZ?=
 =?utf-8?B?RTFEeFN0MDllT3JRZ1dsUC83UjR2eUdtbW5SZUpDakVNaGpKbWQ4V0c0eStX?=
 =?utf-8?B?ZkNuTFpwbDZrNkhoNXg0QlFWMVhFMlR2c0tWOE9FZkFNZUcxcFV5RXA2cEpk?=
 =?utf-8?B?amlqODRvOFF6eDNwdHFER1NHUkIwUkN2azRWb3J6dnFwdGs4VXVTUm1tVjB6?=
 =?utf-8?B?Z2YwSVZ1UDhqaFRQeXNESXRKbk1mY2hpN0xXTW51SmN2Q0lFVFdlUys0c2E5?=
 =?utf-8?B?amdUbTdEWHd6Y0JCaXdrMy8vdC80L2wwYTZFMm9mazl1ZHhwS0NhdUFaZlZh?=
 =?utf-8?B?ajhaTzZNVWJuazNXMHdRTVBlVm9kOTRNN2JrVnZsSzJ5UytRT3U5dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 225537ca-4749-409d-f169-08de4b0e1e9e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 21:21:54.9633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wh/mzhiPQIdwh2LKahrIRmcctDC0VKrl7aUWeLQaIac1UflBiAeTds3yeoiZykwEMOyhOIYRfPAPTpkijFtflQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8659
Message-ID-Hash: VTMP5C2YVMYHRDPC4DSTHP2AAQXFKLA6
X-Message-ID-Hash: VTMP5C2YVMYHRDPC4DSTHP2AAQXFKLA6
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VTMP5C2YVMYHRDPC4DSTHP2AAQXFKLA6/>
Archived-At: 
 <https://lore.freedesktop.org/4b589c75-c6d1-4733-80b1-a9a454445fb9@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 1/2/2026 8:34 PM, John Hubbard wrote:
> The util.rs module contained a single helper function,
> str_from_null_terminated(), which duplicated functionality that is now
> available in core::ffi::CStr.
> 
> Specifically, CStr::from_bytes_until_nul() is available in the kernel's
> minimum supported Rust version (1.78.0), so it time to stop using this
> custom workaround.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>

Probably elf64_section() should also use CStr::from_bytes_until_nul() in gsp.rs?

Right now it does:
         elf.get(name_idx..)
             .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
             .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())

thanks,

 - Joel





> ---
>  drivers/gpu/nova-core/gsp/commands.rs |  5 +++--
>  drivers/gpu/nova-core/nova_core.rs    |  1 -
>  drivers/gpu/nova-core/util.rs         | 16 ----------------
>  3 files changed, 3 insertions(+), 19 deletions(-)
>  delete mode 100644 drivers/gpu/nova-core/util.rs
> 
> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
> index 0425c65b5d6f..a11fe6018091 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
> @@ -30,7 +30,6 @@
>          },
>      },
>      sbuffer::SBufferIter,
> -    util,
>  };
>  
>  /// The `GspSetSystemInfo` command.
> @@ -209,7 +208,9 @@ impl GetGspStaticInfoReply {
>      /// Returns the name of the GPU as a string, or `None` if the string given by the GSP was
>      /// invalid.
>      pub(crate) fn gpu_name(&self) -> Option<&str> {
> -        util::str_from_null_terminated(&self.gpu_name)
> +        CStr::from_bytes_until_nul(&self.gpu_name)
> +            .ok()
> +            .and_then(|cstr| cstr.to_str().ok())
>      }
>  }
>  
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
> index b98a1c03f13d..c1121e7c64c5 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -16,7 +16,6 @@
>  mod num;
>  mod regs;
>  mod sbuffer;
> -mod util;
>  mod vbios;
>  
>  pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
> diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
> deleted file mode 100644
> index 4b503249a3ef..000000000000
> --- a/drivers/gpu/nova-core/util.rs
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -
> -/// Converts a null-terminated byte slice to a string, or `None` if the array does not
> -/// contains any null byte or contains invalid characters.
> -///
> -/// Contrary to [`kernel::str::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
> -/// slice, and not only in the last position.
> -pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
> -    use kernel::str::CStr;
> -
> -    bytes
> -        .iter()
> -        .position(|&b| b == 0)
> -        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
> -        .and_then(|cstr| cstr.to_str().ok())
> -}
> 
> base-commit: 7acc70476f14661149774ab88d3fe23d83ba4249

