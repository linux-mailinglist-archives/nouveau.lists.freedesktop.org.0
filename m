Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A0FD000E3
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 21:49:15 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2D75210E65C;
	Wed,  7 Jan 2026 20:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Lbn7isrQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 06E8744CA9;
	Wed,  7 Jan 2026 20:40:58 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767818457;
 b=vl7SXlQhCQ+zCPyCpTOT1c4Q41k8sgWAQN4JbfsQmOyfGWXlwao+/H3K0/Gza8INRRUtU
 Xz/yMdYJ/fmssEh+YDGIhQmry9BWCO5teixUncZrzk4Wr+/lRldxnY0k0DosuilR14cQtPz
 HwA71dNhMnx6cIvHJ2p84zueOqfTJgAdg8IZ54MAS5TyKj8/vnbWMSEdnsyfFBma63Jzmy8
 ndqceSeEo8sOomTJvhkEBonZz2FKNHHuo7QpASAbshuaPyj/syFofpY3nXSKqreioUMzlbv
 Tk9OAzR6MIvldH+AgmtLvR5KCCl0ZHlvcDv/36qtP2+Y/5D4WPN+DnPq66Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767818457; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pv5TjPVcuInHPVVk585ZpzNJ844r8gdyMCrKvJwFToc=;
 b=nDpAy8532gxMOmpXOYAGVjElnmnTPOTmYWj58t6FWn7Mthn97c0QprXSglrtucMMv5Meu
 CZrnwS5Jh4v1DZd5L3zS+YmzzxKMOF9EQYky+6b+LBM1Q0LWcjU1TAOYawC0K3AEBuqMMOj
 utCaFINDNVXOEq//X2tOR1tZSGD36ADbzVfpIdYR33j7bonFQxK6JjZH2skjfrc909uhAN0
 Wp3ZIL//a7Al9bWK1BOtVNf9ZKzu5dYZv298iYYFrDkpLlam4wVG48c1341pJ2GpQN5x7vh
 IhUly7T+Ku7YyzQrFGDinxcmweb9bD5g0awIiSssO84w2gsnH4u7rWw+Qvtw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF8C744C9D
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:40:54 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C332110E65A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ys8dkcYeIRlD/bfxm46Rj9epvT1jz7TwBJ8pGfButbQezO3h8hOS1OzXxf4fr4tz2ej9ebGeipGRG37+cbhbvanOmRDf9HtihyDM5VYfD9LjXZEapZDegqka1Fr/0TOeAv2EUCgfVX5ICfIzZHyxDfra8m7QRYAYUFREWJc9ditICqspMMRyoTVKMIYY9BRdfoZ2oo7eibyUMNAumZUPs4zsUFL04vcBPBsE02oox8Re8QK9wx4o8y9lZ5URhusjcjMwN1hWxwoNALcQVx7OV1XR+uFAtOg+oPIUZgknInIvslnGkOtLsvVJUOb7MJt8H9SfY7syWCW/kLEiDXje+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pv5TjPVcuInHPVVk585ZpzNJ844r8gdyMCrKvJwFToc=;
 b=sQA87Aq5MBHyS5x5IxrLz9BZmvA9H7aiMC2jhoPWU3xs0YlpM7ov8IWR9umPEz4heDkJT82f9gqsWhzMDIIhf55FyJr18alwM1dRQcKuEh82xMgNzrKT8QkhEqwMN9C9rmfe0vEgdk3Oqwb89f82KrL2SrIBTQ7HsDk9bpZmtpf85JsOeaY2bnRq+ZXdLvNxy1clLXw3obZMD7TRRg+UO5Bs2/m4+Xo2sgTnCWqudKLCu+HKf/AZokc9xtAVvJDL3wDg7V6wqmVA3Czlv+aXOFzQPwXNIRz7XOsGeg0St9zjrtFipPyGq0qYqsR3WUcUwzSCCstFbxqvLiIdlo97xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pv5TjPVcuInHPVVk585ZpzNJ844r8gdyMCrKvJwFToc=;
 b=Lbn7isrQVU5fJYRi/cssz1JFiC8v2StnaDlwJA5068Qg5pNc29FXtq+GTQElXDy2Bjz3/UD4xpzGNSHYWot7wwhDcequEfOt/Zzuixc17NB27/lPMquo3BYDzk7BSqWNXz46qfcyTV9W7RtZ+fPVe/k9UKpOocFhlP3vunlEEcjZEoNKaeF4Ob5xgu5yKeLG3fKmlRtbY7mF69R7jP02ZKjQD8JhlISiczAblNIhLjV0/YLSNW3EjXhFzZndRwFKHEYT3VcWPoApLB80dOgIJ3ctd8mBOJNotHqTDwlhWmYyoN+SyQWyhi3hEsfoQmn+bPE7F+qTYluxW2seWaFZig==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 CH0PR12MB8578.namprd12.prod.outlook.com (2603:10b6:610:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:48:59 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 20:48:59 +0000
Message-ID: <49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com>
Date: Wed, 7 Jan 2026 12:48:52 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] gpu: nova-core: add missing newlines to several
 print strings
To: Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260107201647.2490140-1-ttabi@nvidia.com>
 <20260107201647.2490140-2-ttabi@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260107201647.2490140-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR06CA0069.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::46) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|CH0PR12MB8578:EE_
X-MS-Office365-Filtering-Correlation-Id: 686f1f4c-84ac-4a9f-4d29-08de4e2e2e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7142099003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MW15R3FIdWQxVmNqVUlQR1RIUDBBMXZyQkZCVjdEUUhjNHNlUnlmTmpSbmhs?=
 =?utf-8?B?Vy9NMm1nOWlSN0oyc2dHcy9ZOGdLWFNXZDJHTWVNVjVUa0lxOHZudGhQS1dB?=
 =?utf-8?B?NzBueldMVFk5MVNwdVRMdVl0K1RuU3RZbXNSZTdWd3U5WWtKRXRUeGMxck9k?=
 =?utf-8?B?bTlEMDJOUUcrOEI5TEhSbmgrN0tncE15R2tUNjFXbi83akE3cUxaYWxmTXJq?=
 =?utf-8?B?bGNndzJsVTFpb1pFeUdRdlpGU1diclYrNjZGZjN2LzZuRHF2Mi9vc2ZnY3Bi?=
 =?utf-8?B?ejBOWS9aeGVCZnpZNjZyblEzUXpRNzJRdXZFTXQ1Q0hsbGFxRFlKekxCMlYx?=
 =?utf-8?B?a2RhMlhodDZNWjB0Qmh4WlZJZGJiQ011VGlXSVpSNVZyaWt4TmJCczJlbzVp?=
 =?utf-8?B?eU5BNnJFeGpOcFEzT1c3TDF0MXM1UlAxTTRwRy9IYVhzSmtGZzJFTU1XbEl1?=
 =?utf-8?B?dUtIczZXUURQMXJLUFdiQ2plUmNtVEQ1TUNBUG9XMHlMczQxSUlXbFdFWXNs?=
 =?utf-8?B?dXU4cHVrUGh1bkJFNVNjdlJ0Q21ZQy9QS08zaDVyalNqbWNtSkVOWjhXS2FB?=
 =?utf-8?B?SDBDLytsN2h1dzNPVFpPcjA0aHlxdHBzSEtIQXZ1UENXRmlETVpoVXJYaXha?=
 =?utf-8?B?RjRDNGR3UmV1VTE4R09LOW1DSTBtckxhaUpnbDYrVVBubjhpbmNEMmc4RUJK?=
 =?utf-8?B?VXI0TE11NHBvRzJOdWoyY2xHK2pRaUsrSDF0SEVPYVhGbjc4cGU4VnBHcFpK?=
 =?utf-8?B?U2ZZUCtnRGxVakIzU2pNaEJqQ1FJZkhadks2bXJBTEUvRXVORExzWkFnK1F0?=
 =?utf-8?B?eFFEbmVtOEx3MlBuZk9FRjJGY0NRdCt0YUloT1dkTXMwaUlJdUpqNFFrUzRT?=
 =?utf-8?B?M21DU25KR0w3QjY5OUo1UE9RTHdEQ3dlTzEyZ2YwQ25qUU9iYXF4RnkwZHg0?=
 =?utf-8?B?ZGNPM1VxaWsyQlpHcGkyRmtiVGJTY1FUTmFZUWp3azJ4amlZNmk1OTh4b3pt?=
 =?utf-8?B?eDlmd3B6dERhTjNWUVk2eitLTjU0UGp2WHQ0ajh2U2d2Y05PcWppMms3b29E?=
 =?utf-8?B?b2hnSzJTcy80RXh1YlZCSVJHSTExV29yQ0V1TVV5VXd1dDJGVktiQVFHOG9z?=
 =?utf-8?B?Nm5NcjR5SXdFa2RhRmhodFppMG56WmVtbXM1NzM1dHJTSVRoTmJXdnA4bnht?=
 =?utf-8?B?eUxuWjhHMUtiMEdzZ1dEWlRxbUhLRW5pSnFsZ1phRWF5SWJmOVJIbDNuM0Mw?=
 =?utf-8?B?MW5XV1ZnMnJmV29kMHV6V0pKTjZLTUtlakthNEs0VEhnNzN0cFF1NFFpQnNs?=
 =?utf-8?B?U3JhWlN6ZHlVQXVhNDNMbEhFb3N4alF4RTQxU2dCMkViQWdTU24wbE9RV2M2?=
 =?utf-8?B?Y3JMRXA2RU1Ea3NUcnlFU1Y1WG5tRDYxNVpacERzY2VndHpsSk45dmlhK0VQ?=
 =?utf-8?B?cWVyTDgzYlFaV2F6cURDNnpQV2NLRlVJYlFhQ1I1bWRnSm4vbGUxeTZlUXNq?=
 =?utf-8?B?QWhCK2F0dWhPSTdZeUJoa2RTcmlGR1JLd1ExWFBFdFZpSnM5cU1mamUvUUJO?=
 =?utf-8?B?K0QrcndvVTZCOEhjT2hlbDRKSmMrbTQxUEVFWjhLVjBHM1gwUEFaQW9OV2wr?=
 =?utf-8?B?OEFRNXZxWFFVUGJxNmdLRlBIc1BURGYzc2J4K1hTNnQ3WVhmVGZ0dlI3ZUl0?=
 =?utf-8?B?clNtQWJRa00rcktnTVpRWStIYlh2WmxudktKS0ZFcnI2ekY1bTZGOFZ2Tzk1?=
 =?utf-8?B?aE9BUW42aFRJbWhsNHNaLzJqM0h6QmJGUzYxTlpPNTNxVGpmY21jMG43QjZK?=
 =?utf-8?B?cUtUVGdQQnZQMFpaMS9lSEl1SFNOUDVINXZ2akpoY2JqUU9kVk9Jd0VrYkRF?=
 =?utf-8?B?Q3FoVTZGaUNwQXBCdysyanBvT3hiZTczQ1ZGWWp0cHRMUUhmUk1XWHVQRDhu?=
 =?utf-8?Q?C8d5SdCEYw1+OZbM5dF8IItftLCLt3kS?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzU5eTQwR21SY05YRU9xYm1lV055aGI2RmF2VjNXVXA0ckUzS3Y0bVZSSzYx?=
 =?utf-8?B?Z2lkSksydUtvOVRvMmdqcjJrd2RPQm9vNzlTM0N1cWxZUE1ieDJxQVN5cmVX?=
 =?utf-8?B?cVBMQmRPcWp0dEJzRVhHSjJtZG5GWXU0WHI5TTllNVhmSnlZMjZwN2ZSY0NR?=
 =?utf-8?B?MVZJcXB1WFlwOXk3RkpPY0t3S29BckdHS1ZaeTNpdVFZRGZKamtPTmdmbjBC?=
 =?utf-8?B?aThlbjJ5SlNDb2VZZXFrWHYyajJSQXo3cWxWZENDdnBaWEhGT1diR3RLNVRp?=
 =?utf-8?B?NXRIRkN6dCtRSmlEb0E3TnMvVnRORjFSZWxxakc5TlEzWE9nYW00dFlmMlV6?=
 =?utf-8?B?RUIzZjNpNFh6TCtGM1B0NzhHSEdNQ0ozVitodWJEekdVZ2RvK2JWRjYrK28w?=
 =?utf-8?B?VG1wK1NYaGlHVmNnN1kzZVBDSlpLMmVKTkR6a2w5blpONWs3dlZSUTIveHg0?=
 =?utf-8?B?bkhNZ0RsckJqSzcxaG56dXpLak1layszR0xyczFNZzFKbG9hYlh6clVteWhO?=
 =?utf-8?B?S01GWUZnU3l4TUM5Z1NRdjBGbHBMVzNtUkdnM1lheGh1ZHp2YnFrek5rTkFZ?=
 =?utf-8?B?alArRktxOVRHTktYL0xzVndnQk11TjUxamhvUzlnUVFzeERoNGgyRFhVajNu?=
 =?utf-8?B?ZDJkanh4SzNXTi9KL213VFMrL0NnMTI5SHJUV1NkQnMzOC9TTHJWVXZVZ3Fp?=
 =?utf-8?B?bHo1VGIyU2g1bHk1T0dqM1VuVk90bVo0cEtlbzFjaS91TkR4TGFDOVczY1NM?=
 =?utf-8?B?c3F6dkVGWVJrWjJjbUp4Yjh1WmZjY0psTU1uZmM4RmhBZ09JNkxuTzJaSmlj?=
 =?utf-8?B?Vm40cWFKdHZJeGZhd1EvOGNmeGk0QUdCQzF6emRzTGxLS1lKZDU2K3F4RzY2?=
 =?utf-8?B?dkdsMWZmamZMeEdRTHBrMzhNYzlucjlzTWt6enJqelVSUGtQT0QwVDNXMWF1?=
 =?utf-8?B?M2s2N1F2WXZ3MHRZM2FLbVF3QkFUNzRYdENSeHZWRy9vWkwxUmxyZUVKZ3Zw?=
 =?utf-8?B?ZUkyUDFXZXNSaENMLzh1VWJ3REpiK3llSUxHMjhsa1NteDhkU2dlekkvWjkx?=
 =?utf-8?B?TkRMSFBLZytRbUp3UU9iMitxVnB0UkNneUhtMEhGMjRZRnRGcys5dkVZdStG?=
 =?utf-8?B?N2o3bkppblYvLzJ5ejZsRnVYVERmQXFoaUlyVEFqRTdtTFA3NDF4RjdWWUhB?=
 =?utf-8?B?MFB4M1hmbjAvUE94bHBmdGhzRE1qb1ZOYzArVCtwYlUvTU0rQXlVTEtJaUEz?=
 =?utf-8?B?M0Y2Y1dxbVI3UjdUTnV3MDVOOC92cGVNRUpJL2l5dVNpelZOS1dkdFpKTE9T?=
 =?utf-8?B?cnJVdFlDcEZRaEVIQkJDTll5eTZjM2VjeHlKZ0xkMDZVLzBKcVlEMTNYMFVI?=
 =?utf-8?B?MmNDQlc3TWkrd08wcGtQV213OTA2dmlyYjc2VWxqR1dvcFVQdGJ3ZFB6S04w?=
 =?utf-8?B?Vk1YSnBHdktFdXFueFFzUGZHRTRCbk05cGx4WUVDckNuM1NyeWFheHlsMGVZ?=
 =?utf-8?B?Vmlubjl6V2lFamtZZGVwTEpxZ2Z1N0tHNmNTMzlpb081VlcyWEhNRE4yL1M3?=
 =?utf-8?B?L2RjU1VUelV2NlRxN0pBZXFlUUVvRUhxQUQyQkJDZk9UUTNYdVl3bXgwSW83?=
 =?utf-8?B?SVcxS29xaksrdG1YMk9XTUEwMXdNa2dQR2k1TTJSZE9LaS9rV3RqU1oxb2RN?=
 =?utf-8?B?V2ZMR1VTV09XWTJjNzZuT3dKeDZ3UEROZnhVZkJuWGNpYmlBZElsRks0RnFI?=
 =?utf-8?B?N0Y1VDJoeGVteGFEU2xHVDNRdjZ0MG1CeVhKSnl0VytjazFUT2puTUhXaGIy?=
 =?utf-8?B?VTNTb2pRSXp3VjV3Ync5bWQybkM5M0twMzNYL1FBSE5qVWp2ci96TUluRFUx?=
 =?utf-8?B?RmtDVU1oOC9yUXdOd2Z6V013UHJ5ZmJEVmVqWGt1bDNobmJCMy90Ni9EODdm?=
 =?utf-8?B?NHNxU1NxeXpEd3gvZHFuZ3crcGxrZGVTZzlLSTBhRmJwS28vYUcvOWFjNEtz?=
 =?utf-8?B?aERISXRQeVRCTU9JTWhYUHZ5YWMwcVA3TGVwMzQxeG0zVlZXTjZ5Rk1VQm52?=
 =?utf-8?B?MEtZb2RKVHhiNGRxZDRkcElpYlBzcXkveCs0Tnc2UnVmbmtiRWFkWkxjQndY?=
 =?utf-8?B?REN3WUV3bmZ3Rk5EMzBoZ2JtcEhlL2Z3ODBMeG5LNklCRDVNZ2xnWFVPaTd1?=
 =?utf-8?B?dFlnSnN6WDg0d3BCNnZkVUtXdlVYbkc2TExIeWxzaWtCNG5VYmJzVkZQSHhh?=
 =?utf-8?B?UXFMM1Y2UU5oQ0dyQ1FITFdJTWZnK2VWMVlMU0ZpeEsyclErclJoQzd3SXN2?=
 =?utf-8?B?T2FWdGllTzVWUnlqYVI2SktpMHc4bEtZNEdzeTB1V2h3eFU0WWd2QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 686f1f4c-84ac-4a9f-4d29-08de4e2e2e7d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:48:59.0541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rr06tQs39lXMBFGwoZhruO7uLlgWx1OGNWFLX7RKJ8jW0tqMN+39RrKEaXXcC4Ns/Jyl6k7inisB9wbhEj8cLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8578
Message-ID-Hash: FZU56KLDS4EQI2WTHVGLWEG56N2MWQ7K
X-Message-ID-Hash: FZU56KLDS4EQI2WTHVGLWEG56N2MWQ7K
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FZU56KLDS4EQI2WTHVGLWEG56N2MWQ7K/>
Archived-At: 
 <https://lore.freedesktop.org/49a83146-f292-44c3-8ca4-d62cbdc6a438@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/7/26 12:16 PM, Timur Tabi wrote:
> Although the dev_xx!() macro calls do not technically require terminating
> newlines for the format strings, they should be added anyway to maintain
> consistency, both within Rust code and with the C versions.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
> v2: added some more strings that were missed
> 
>  drivers/gpu/nova-core/falcon.rs           |  6 +++---
>  drivers/gpu/nova-core/falcon/hal/ga102.rs |  4 ++--
>  drivers/gpu/nova-core/fb.rs               |  2 +-
>  drivers/gpu/nova-core/gpu.rs              |  2 +-
>  drivers/gpu/nova-core/gsp/boot.rs         |  2 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs         |  2 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs    | 10 +++++-----
>  drivers/gpu/nova-core/vbios.rs            |  2 +-
>  8 files changed, 15 insertions(+), 15 deletions(-)

OK, looks like you got them all:

Codebase                          WITH \n    WITHOUT \n    % with \n
-------------------------------------------------------------------
nova-core (dev_*!)                     73             0         100%


Reviewed-by: John Hubbard <jhubbard@nvidia.com>

thanks,
-- 
John Hubbard

> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 6ae0490caffa..4e1da0b9cf4f 100644
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
> @@ -489,11 +489,11 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
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
> diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
> index 3c9cf151786c..c62abcaed547 100644
> --- a/drivers/gpu/nova-core/fb.rs
> +++ b/drivers/gpu/nova-core/fb.rs
> @@ -80,7 +80,7 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
>              let _ = hal.write_sysmem_flush_page(bar, 0).inspect_err(|e| {
>                  dev_warn!(
>                      &self.device,
> -                    "failed to unregister sysmem flush page: {:?}",
> +                    "failed to unregister sysmem flush page: {:?}\n",
>                      e
>                  )
>              });
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
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index a53d80620468..da21447be663 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -82,7 +82,7 @@ fn run_fwsec_frts(
>          if frts_status != 0 {
>              dev_err!(
>                  dev,
> -                "FWSEC-FRTS returned with error code {:#x}",
> +                "FWSEC-FRTS returned with error code {:#x}\n",
>                  frts_status
>              );
>  
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
> index 6f946d14868a..3c01fc6e6b6a 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -615,7 +615,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
>          {
>              dev_err!(
>                  self.dev,
> -                "GSP RPC: receive: Call {} - bad checksum",
> +                "GSP RPC: receive: Call {} - bad checksum\n",
>                  header.sequence()
>              );
>              return Err(EIO);
> diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
> index d78a30fbb70f..d6c489c39092 100644
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
> @@ -390,7 +390,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
>                  Err(e) => {
>                      dev_err!(
>                          sequencer.dev,
> -                        "Error running command at index {}",
> +                        "Error running command at index {}\n",
>                          sequencer.seq_info.cmd_index
>                      );
>                      return Err(e);
> @@ -400,7 +400,7 @@ pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
>  
>          dev_dbg!(
>              sequencer.dev,
> -            "CPU Sequencer commands completed successfully"
> +            "CPU Sequencer commands completed successfully\n"
>          );
>          Ok(())
>      }
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


