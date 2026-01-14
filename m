Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A79D1F84A
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 15:40:32 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A982C10E19B;
	Wed, 14 Jan 2026 14:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="lCLEi2M9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8425C44CAF;
	Wed, 14 Jan 2026 14:31:59 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768401119;
 b=vfF1VNhw12wKk62HnFg3l6AQ43JRsVREOlF8wT9IUkdIVlQM7NaAuJ050Tmv1IVe2t7re
 7DMODAYAOhJbE1zke0Zw0mhafgQLJz77IHLc+a25yugq7UumGmypbcWI3PlI7om/rIa5DBP
 IG+NB/FPcJnAcgN0Gm6vPCvwwL90sGUtEQVVQh//WGuF3VpwKdfHvVHeZSR9nxNOpzmNrcx
 cjMe2PgZRO8B0gEr8vJIfpeEUQmxT1UX5/CffNY1nIpvjgIuBbv6nIXnvCbwAM5c0a083qP
 OBOoV2T8MHK/NWGERN0MLpEwTqs0NLiuxAeKZCvJYm2l8nwVuPR0kF35FHtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768401119; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VC1iCchxroW5+pw5j8qbgVBkZIdFleb2G8VFukUkfB0=;
 b=vB9XcdWlx8UpySFombeb+JNR3kaYd7x0rD8Z3BoT0koojkQoqnnbXHqWD8QFIuGuMM2nu
 eHUxdPloG6VFxorhZW19HzYfYWLfhdnhYKo9NyxQ6wwNv6z1s6aXnHgK0jCd8EcT5KBNlpC
 TIzGdzjmiIDrJAjBJD3ocqa+0L/VrkAD6AAa4Htw0DF3EcMsNDPiYUZyCz5+4KOlDwdKRSI
 TkQJ760M6UtoQzAY1DN0Gq6SmJfeznj/doUunzqJqlR2nJ6jrhsvVmjR1QNh9etJpgKNsV+
 Hhw0ThhcrD6xrDGeYv+TNCjVurEUbNSUwK43uDJmuH9L7YsGQvleilrbmU+w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=garyguo.net;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=garyguo.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=garyguo.net;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=garyguo.net policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 23537400E0
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 14:31:56 +0000 (UTC)
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022121.outbound.protection.outlook.com [52.101.101.121])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1F1610E12A
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 14:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLjhhKHvZFox2jhLcYAbDi9fm16snrbisArk33fa8EDnLoeXU9nmuoiu8nuAL9v9TbY8uJcwLNMSKm0qcwG3/omMa92OQP24IG7B4fPHrkCY858IV/rwNg40AUmUbcqLQhg4JSklXSEzbOB/zsDWld532N8OStPCepf1m+YYBpoOJR7/8DZuTK5u0y3xF/Psws323Mm29B4pd7bJvCVgUVRBjEaqyv8VHVZ6fdJ1/1ZmoqTbatS4vR1huE/HW6OHyAQc6DdjEcSSaubh8famHV28uk5wpc78w/3HoLHitoeoRRYK1kmoEIf8i4MI6phqtOlCYbkfAdEa11calNumUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VC1iCchxroW5+pw5j8qbgVBkZIdFleb2G8VFukUkfB0=;
 b=xBNitx9id+VQ1hyGRCPAo8KEd4JiKXbjke8lvZs3jIQEgfPMnFALTyEiFPOclwydAcsal2v7GqxXbk1T93fTWW4PfgUoi1cwGqfjXkqCMa2XaHrOcZ5SMlrZhebDgyA6b5eqGFe2zwXy2HuyBJCIqR/LEKVSnSvCkJGGWcH9UwZohEK28hhzO7TSsfGq+fSN+SVrK7poS4lzYWgQ15gYrHA6Diuv/0nwWyZbhEvysHvZYWIvPhoV4UipLXdJ3nPdTNY7AahInCjzaD0L1/N8aYyspEHeQ6gc86pzlcmS8DK4jWMw/Oi542hItzfZ0QA8XufvT3d/8GUg//NqglKk2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VC1iCchxroW5+pw5j8qbgVBkZIdFleb2G8VFukUkfB0=;
 b=lCLEi2M9AX/tYGMUSsBErwMAuil+Lrt2umv38K64zMiLB2wMcWW4w+ufv01NPC9WKeJUmZKxEJ7FgaeYlUDXWrvk8Sppt1XQmVaWbPyCG7iQZiQ7Kwlmfm+ZKr2WGzq3lcovMJLDiwpCVYLAmbi/DGAL3wvNqto/paKHGPLiBJo=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB5875.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:1ff::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 14:40:22 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 14:40:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 14:40:21 +0000
Message-Id: <DFOE21LUE819.88ZKEDFEOB19@garyguo.net>
Subject: Re: [PATCH 09/31] gpu: nova-core: factor out a section_name_eq()
 function
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Gary Guo" <gary@garyguo.net>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-10-jhubbard@nvidia.com>
 <DFNIIJH106EO.35SYTYVJYK0N8@garyguo.net>
 <1dde9813-1084-4174-90b8-d9910309f530@nvidia.com>
In-Reply-To: <1dde9813-1084-4174-90b8-d9910309f530@nvidia.com>
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c71254-232d-4c28-ebe4-08de537ad8bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dDVzaE0xTVl1dFBRcnJ0UkpqSjJYMzVuYXEzaGxpRU5ubHg2L09BWFBpREh4?=
 =?utf-8?B?NmdqZHNBUWJhQk9IZjF6Z0RoQlN6d3JtRi81V05tVGk2Y21kZ0w2K21Zc1Qx?=
 =?utf-8?B?YkM2VmVqOXByeFVaS2lCNzU2OCs1YmhSc0xoVDVZQ1gwZkNMUHBRd2Z6NXdN?=
 =?utf-8?B?MmcxTFZnenBIQkRQSlBycU5GYmVCQzlpT3FTcURGNVZtWWNPSEhsUU8rbWNz?=
 =?utf-8?B?ejVvNmNaODZpQi9yWGF6a1VGT0JmOGFsM3F6ZGZhTml4Y0NGZTJNdjFkbXN2?=
 =?utf-8?B?RTJiK3UyYUppSVlwSHRNMTJBUXNZcHB0cXdmZ3daaFdNVnVoWTE5S05qcVZh?=
 =?utf-8?B?cTFMblNhL3F4RTZuOHdsZHFDQlJJdjZPLzNnb250SE81L2dUQklONWtIV09x?=
 =?utf-8?B?dkp3c3krZDFlNmNrU3Q5YmxpN3dacTNXRmVYTzM3SmFNVFlrUExyaGtQYVVV?=
 =?utf-8?B?TFdUeERia24rRGgzbEhwbnFxTXduQkxjT2RrVnR4WTY5ZkZ2bHc5OHpja1lK?=
 =?utf-8?B?RW5JUmJOOGhIVFk5TGRocE96cm1LcmJ2WVhmVkVyTWpmc3lXOFZLaHUvVXQ2?=
 =?utf-8?B?bXpZeFpFdDRwTzRwYXVQbktzR2cyZmRaQVI3clEwK0R4RHdQc054RFkzOEhk?=
 =?utf-8?B?Mi90UU5SUU14NGh3UUtjRDl1WC9OeFhKbGtWcXF2RnRyWFpWNmxRUHZ6c01J?=
 =?utf-8?B?K3Nza2ZmSFFyaGd0akM1UVlHTXBRZ2toVmthV1hnK2tMdUFkSHppNER0c1o3?=
 =?utf-8?B?MWRCNTFYUmJjTm5mUHNyZk5sMzJNOGVzam9sOER1ek5RNCtnNkhuUVVWMjEr?=
 =?utf-8?B?bXVkMDY1a3g2dUVTZjlXUmVuNWw5VytvU1lxdmthWWFyQ1d2ek51QlRSc1Vm?=
 =?utf-8?B?OTU2aVhUcm0wUHk5ZlRmK01IVkpPcXQ1TUhlWU9XOEk5V3pnR1ZMYUo2QWox?=
 =?utf-8?B?a2RQVHM3ZFg1T2thMG1WelM4UVhDUlhia3RSV3JLR01SYisxanJKNlBxTFRW?=
 =?utf-8?B?L3RpVGFJY1VxN3pWRFppeDlDNnBmZW4yVm5FTDgxWmdxUzhldUVvWDZQb0hK?=
 =?utf-8?B?R0R1cVVvZ0NHNlJhTG5vSGxmL2lqbjB0NHZNcml2TnE3NDJDMEEzTWNoR1l0?=
 =?utf-8?B?OXZhYTQ3Njc4RjJWK3FqdG0zb1dLNWhtbjFFTGhrTWFDdTAxNnF4NnczYzVy?=
 =?utf-8?B?WlJiVEh3dkJkWERZQjBpYmw0d2ZIb3ErZkwxcXpIYTl1eWF1NmJCTStxRG1P?=
 =?utf-8?B?bVU4L0UzcWUzekU0VWkvL0Nyek54SUttVFBwWTh6eGxxS3Z4RlZEUWhxU3Zh?=
 =?utf-8?B?TG9ISGE4YnM0cXhxTlI0bjR5Ky92a0VPNFFOMk9WcUFMSWpSZWw1WmZqWElk?=
 =?utf-8?B?bEJ6NWpXZHBaS1JTWWVxaWg1UFpJOGRJQmpaNWxybWsvcytoeUdiTmo1RjVX?=
 =?utf-8?B?MlFWVmRwY3lDM3NPQnJWNVZNbkdEWTN2ZTA0NXVDaDJhcVpocFFRcWZhNWE3?=
 =?utf-8?B?UG01Z3JJa1RxRk5lMjNHNU41dUpWRlBLTWcxUTlmN3JSUi8wQnRhYjR6cHJu?=
 =?utf-8?B?dzZyeTBhRjhuRmx6dWJjWjdSRGR5ZS9jVm9YMmFScXNTSHRUbDhWYVZQSHR6?=
 =?utf-8?B?RGFQNWdJZUh5blhMRmxzeGRXTTNXcUFSL0NNNEF1V0pXTDJXYm5ETkxHV2NW?=
 =?utf-8?B?V2N6bkRNQkZPMHlMVlYwcjRZSmdjZzk4ZTBoNEllY2FYb3ZnbWg4OXlaWGFE?=
 =?utf-8?B?S1pnTDBaUnhEeUNJdHdYTkhybjVpaDkyMzBBTkNnNkt6M3RaN2FHM0lJT0x1?=
 =?utf-8?B?c2dFcmYrS0FzNitIVkVSVVZCYnFzUVk0ZU03b3dzOExOZUhDcWhiYy96bjJ2?=
 =?utf-8?B?cVU2OGJTL3NxZzQ5UG9sYURKTlpJR0N1dG10ZnlobVkrY2RuZnViZndJTUk1?=
 =?utf-8?B?YmRuVUVvRTRkdm83akVpbjhLcGNOeUczc0VOWHhSR0lBYUExTFE4MUYyUnFX?=
 =?utf-8?B?bEtVb0k4cmNLcVhqMThLR00zRUNLU1EwNEpaUS93T2tqMGxFVG9JOHYzbElS?=
 =?utf-8?B?ZEZxMTIvTmozSUxSNmxVWEk4b2tLUXJ1QTViWkdSOEt6UG1MNWpWbHhWZFda?=
 =?utf-8?Q?igc8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(7416014)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVhZemlYQThPOEdMNzdwU2w4Qm55TGVhc3ZEclhaWi9qTGdEMHlzRk1jcDZk?=
 =?utf-8?B?bW41V1ZGQjBwNUFZVUkrNWhSVkJReDJ1OThIaVJaRmowZmd6bTIvNDIzZC92?=
 =?utf-8?B?T3JlY2J6T2FEc3ZYYlBiK0JLaCtucU4wbzB3b3MrTUNIWlhvTkVXWC9URVdl?=
 =?utf-8?B?VkgvQjJDcHFhbThCVkovM0tQWnNCMThTTDZodlgwZnNGU3dRTElyVGp6amtP?=
 =?utf-8?B?em5QeHJSRDl5a1BHc0l4R0JpbkM3eXBNamxyT2U1emY2NnJuMlBoTlcybno2?=
 =?utf-8?B?NkdTTW9kSnFsQisxNFd0eERGT2liN3ZxU3Vud1NYK0NrUlVoOTg5UWVWYTAz?=
 =?utf-8?B?aDJTVFVLWDRibm9YSW9LeGdDeVN2NnQrMkQvVmRKaFNORlFpNy9xSm4rWC9v?=
 =?utf-8?B?eDhQZVpzRHNXTVZUQUlkWnRuTWVNLzNMOUh2UmxkeS81dzA2Rm5NS2JjNjFU?=
 =?utf-8?B?azJ6aFkydnZydlhJcmlING10U09FNFV1dDZEaUFpb2Z2T1FSVXM5TlNlY0Jx?=
 =?utf-8?B?S0srOGwyS0JUVE5RWXgzZ2twSnBNM05TelNWYlR0WU5zUTJLY2xDanJtaU1U?=
 =?utf-8?B?VnE5OG5wRGtaSC95S1RLTTRsRm56UnV6WTBUVWdVMHNaeUxlWFk5dGVUYWhh?=
 =?utf-8?B?OWduNWVYTDQwZXhndmtOUXMxM3owSkdsNDhsRHhCUGxjaW45TERSK1pUSnVE?=
 =?utf-8?B?ZUpKUklHYS80ZHh3bjdOb1U3UEZFTmNNYW1JcVZ5Uk55NHNlK1ZzUUlGYTFj?=
 =?utf-8?B?enFkRTR4aEw4ZGZDM1FqbnUvQXA4bzNKTjRndlBCUS9OQmFadVBoRnhoMHJE?=
 =?utf-8?B?bXIxVTl2cDNuaDYzc0diSGxBbXZVZnRPdXVVcTBHWHpPS3FydFJQemVuVkpE?=
 =?utf-8?B?ajNRYlkyMUVIRStKRTZicjgzOEFPM3lpOHlob2p4YVVQNHVVQUhiS1FZZU00?=
 =?utf-8?B?SUJBVnpnOXdQVVFJeHJLNXRtOWdKeWVkTVgyMXVyakRDU0FrU29ib2NkU3Bz?=
 =?utf-8?B?UXZCUEF3SGhmeEdUQWx0TXZuN3ZxL21OSXNrV1o5b2RhWXA0QW5Sc1VheWl3?=
 =?utf-8?B?NmRBZ2JqNWRNaytXQjA1VW9ObjlNZDhhbTc4NXUzeThvRkVJRmRHYWdhRVRT?=
 =?utf-8?B?dlo0cnlWbkFVak5QM2V4Tmk5STBEVytaT1kzSkNxMHBEL1R2QWswUWZETlBx?=
 =?utf-8?B?emtLdEsyYlgrdVdTRlZ3LzR5alRTUzBpNHpGb3ZmTGVRUTNyUTZ0K2ZXejBy?=
 =?utf-8?B?RjhidUdHOTMrSytMcHpodUg2Ri9lSkljK3h3SjQ2a1VkVThzODhTQjNxanF4?=
 =?utf-8?B?VGQzam81NFZ2Vk5kRS9jRWQ4Ry8rVkJMa2VKQytpRGVRYUl3T2FRcWFSNEM4?=
 =?utf-8?B?cDBtRnIzNWtSTlRxM3k4UUFZN3dLbFF2SlBZNnhiT3BrSEtEY1hmeEZDZVp1?=
 =?utf-8?B?TkNCc3pHZmcwdTlzOGNETmNwRlhmR09IOWVCanpIVXVzZzBZTGlCem16MytO?=
 =?utf-8?B?RGFVZ3pUWTluck5WYkNsQWlxTlNDVDYyREczaUFMZThMMmltTVA5ZDJBMk9D?=
 =?utf-8?B?a3Bnbk05eVRIOS9CRmJSdkRQZVR1RGtWR1hSdXZKZEJUWjk0aWFWeVlCaE0y?=
 =?utf-8?B?STNNOWxVRFhkSG0yMWd4NTNtdXdRSllMU1dNdm80QnNIV0F6VXVYcno0RzY1?=
 =?utf-8?B?SEFSR1JVVDEwcjk1K3k2TCtaNWJLRzhuaDFya21IM0dhOTYwc3duSFk3TUNG?=
 =?utf-8?B?MWVNZDgzcCsweDhjRWxtMVdjbENETGVIdWF4QkJQc0tid3d0a0swTzVuVWZq?=
 =?utf-8?B?S3N3T1lJOFVFL1RWcE9SNUlnWmhxQzZxVGVWbXJkeHY2V085NTRZRDhadFNx?=
 =?utf-8?B?dG1YMzloaGhtNUNPQWkvZ3Rib0xCaHNXWXZFTGhrem4vUllranNEQ05vZmZX?=
 =?utf-8?B?RSsvR3Z3eWFRV3RlZzhhTUs5dHRMV25oTGhZcnZVa2E3WVlONDdtT2xrUWdi?=
 =?utf-8?B?WUtRWWJ3U1BXaGsvY2JOeUMvYmlsWmxISkhMSnBrOElDUlVLd29PbThyY2pI?=
 =?utf-8?B?UExjWUxGMWFXWXl4L2drWkF0bjRhT3BhZEFNQkVGSlZSWmxTWG5NSTUxeHYx?=
 =?utf-8?B?OGMzeERYSzJPT1VlTWdWbktOOThLZ3NlMFV6eERHcWFXcmtMK0hjaW13WFR0?=
 =?utf-8?B?NTV5cXI1ZGhnbHI2ZUdQb0pYYXM4aE1zMXNHQk1oK0VDTVNBUjd3eGJVYTIw?=
 =?utf-8?B?OUlwZlV1YUM2YlNMQ2NJa0t4M2pVejV5SFNxajlvaVlzQWJpRDJpYTljUGo1?=
 =?utf-8?B?NzBxTmRMamxBMnNDVTA5UmlBUFNCZkpOM2QxQk9WeTZROGI0ZUlnZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7c71254-232d-4c28-ebe4-08de537ad8bc
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 14:40:22.1713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GOC9aXON7aYcEiPc3WUrIuI4piO97WLZH1On9ICDEb2fhmV5kY9f2tJ4RDkJj9/GkqsDk7eem/JahgrBJxX6UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5875
Message-ID-Hash: L4XTLXYS4SDPI7MMTRC6ZTJCG6B2JJMA
X-Message-ID-Hash: L4XTLXYS4SDPI7MMTRC6ZTJCG6B2JJMA
X-MailFrom: gary@garyguo.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L4XTLXYS4SDPI7MMTRC6ZTJCG6B2JJMA/>
Archived-At: 
 <https://lore.freedesktop.org/DFOE21LUE819.88ZKEDFEOB19@garyguo.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 14, 2026 at 3:18 AM GMT, John Hubbard wrote:
> On 1/13/26 5:57 AM, Gary Guo wrote:
>> On Wed Dec 3, 2025 at 5:59 AM GMT, John Hubbard wrote:
> ...
>> What I would do is to provide a helper function to be obtain a NUL-termi=
nated
>> string from ELF:
>>=20
>> fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
>>     // Note that you have a more efficient `from_bytes_until_nul`, you d=
on't
>>     // need to iterate yourself!
>>     CStr::from_bytes_until_nul(elf.get(usize::try_from(idx)?..)).ok()?.t=
o_str().ok()
>> }
>>=20
>> and then you can do
>>=20
>> strtab_offset.checked_add(name_offest.into()).and_then(|idx| elf_str(elf=
, idx)).is_some_and(|s| s =3D=3D target)
>>=20
>
> OK, will do. (I keep thinking we have found all of the older places
> that should be updated to use CStr::from_bytes_until_nul(), but still
> not there yet.)
>
>>=20
>>> +
>>>      /// Tries to extract section with name `name` from the ELF64 image=
 `elf`, and returns it.
>>>      pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) =
-> Option<&'a [u8]> {
>>>          let hdr =3D &elf
>>> @@ -298,26 +316,7 @@ pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8],=
 name: &'b str) -> Option<&'a
>>>                  return false;
>>>              };
>>> =20
>>> -            let Some(name_idx) =3D strhdr
>>> -                .0
>>> -                .sh_offset
>>> -                .checked_add(u64::from(hdr.0.sh_name))
>>=20
>> I think the change is making the code hide the error when ELF is malform=
ed. The
>> old code fails early which is arguably better?
>
> OK, so something like this would be easier to debug, but I'm not
> sure if it is as Rust-idiomatic as it should be?
>
>         // Find the section which name matches `name` and return it.
>         shdr_iter.find_map(|sh_bytes| {
>             let sh =3D S::from_bytes(sh_bytes)?;
>
>             // Compute the name offset; fail early if the ELF is malforme=
d.
>             let Some(name_offset) =3D strhdr.offset().checked_add(u64::fr=
om(sh.name())) else {
>                 return None;
>             };

I don't think this really needs to be functional use of iterators. Using ju=
st a
for loop might be easier so you can just use `?` inside.

If you just have your function return `Result<Option<..>>`, and turn this i=
nto a
loop, you could just use `?` or `.ok_or(EINVAL)?`.

Best,
Gary

>
>             // Get section name; skip if we can't read it.
>             let Some(section_name) =3D elf_str(elf, name_offset) else {
>                 return None;
>             };
>
>             // Check if the section name matches.
>             if section_name !=3D name {
>                 return None;
>             }
>
>             let start =3D usize::try_from(sh.offset()).ok()?;
>             let end =3D usize::try_from(sh.size())
>                 .ok()
>                 .and_then(|sz| start.checked_add(sz))?;
>             elf.get(start..end)
>         })
>

