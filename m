Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2ADC82A3F
	for <lists+nouveau@lfdr.de>; Mon, 24 Nov 2025 23:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E814110E275;
	Mon, 24 Nov 2025 22:24:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="J2jB6EVO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013059.outbound.protection.outlook.com
 [40.107.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F49410E275;
 Mon, 24 Nov 2025 22:24:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcIX/uOIj5GBU4PmMVKTM8eVYOcz52B5thA6pQArUBz1HK8VpUAuNPO2xnr0FTfQ1F2vBEHn9b0rudqYNESwPX7l6B3Gz6vfIz8t17+Q77sq2Ykx/yxcB5NxsuY4Nntk0ZznpRoHfAfu0bK+vtTh1qCeSVRuYs0oWvvcZbAXWRq2xAUMEH4ZFK7rWdXazY34VSjnVjCtQX2Nawnwo36YAjtuPnp75MorReeoBnEU1sigbSnTqRYnLI7YKk8W5ye9jN30c9q/2d2tm6eMrEoUsO+IeYHn11YUtgU3vDzonwzjVaGwmt1ykl/M+Dnq5xHxxpCr+VcKaQXFbhEhtIe2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxZzSD1TSXxhlStgUFv6Moxrwt0J4hJiLLflid8hTMY=;
 b=VlPYQ9MmWuebedP9HxpNNKejwW6r8hgkw3VxMOzRohQfCMJzmZzogK0hx1OUM9FenUpGVq5ydrKBYh1aT244LGcv9f6tCHVvma1NuLEIhwX5apgWFAA61JJq7ftiRU66DeeyiWd/A3urBSBBK8rMUE6HKFrPiFmc8fPMsEe1as0w232p/WgNomGWxni7IbrEyA7LTdZM3bQN/gloyMzibvT6fzFsmglqIlMPfCSOny9eTla0ywCyq++v76qyvFlbjB28iDWo2ECGbjrW0BNP/AClIVqxU+JJjQD3e2BSR7X+U/JfKUkGNAAYlX4Ul84NZzDlCzudgZnj2Owb9Eoidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxZzSD1TSXxhlStgUFv6Moxrwt0J4hJiLLflid8hTMY=;
 b=J2jB6EVOq0gIx1JB9LcwWE9v9eh8k9aZFAzB0JndigibS/uF2pUsRePR021hiKLXChvoN3eBdLO5ZPuKnpg521BWjQr5tQZIXaRSz0zRfcluFblm5A97Y4vK21qwMvPZ5Ghkil+A4ag6trtQ3EMri3EvrJ/UdS1iJIRGkB2zLJ+TEboozTlL+oMv3M/NBbHES0FUfaAfuJiiyDtZOAQyg3WBgr9mpOCqXFuOmazGegu4yBv0mp42EY0ZIhzq2PidJgQLMMLMmvfYtpEf31z9rJ10Xqe+jqchZvo52zV6IpOfZFtef3FY9uitvkM18xAQUb8VMRgDLGqNQI8bpuxbBQ==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by DM4PR12MB7718.namprd12.prod.outlook.com (2603:10b6:8:102::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 22:24:27 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 22:24:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Topic: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Index: AQHcVb7HnZgTrM6ka0OpQ9aSKtoZE7T5Q12AgABNAQCAAAcFgIAA2aSAgABiJ4CAB6ODAA==
Date: Mon, 24 Nov 2025 22:24:26 +0000
Message-ID: <45178a8a150b303859092d0e3b41094b997cebfa.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
 <DED54Q5P8VGD.1QAL7L2J6DCAT@nvidia.com>
In-Reply-To: <DED54Q5P8VGD.1QAL7L2J6DCAT@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|DM4PR12MB7718:EE_
x-ms-office365-filtering-correlation-id: 141a5113-1316-49f4-1729-08de2ba83a88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TStFMVVGZU9pWllnR3grbmZzNFVGUHYwaFFMRlorODM5d3hJUmtabG4xd3RW?=
 =?utf-8?B?M0JXS3VKK1V1M0RISnp6cHFza1RRM1F4Sjk5Y2tVYlJjSFB1cVN2Sk4rT0Vr?=
 =?utf-8?B?UEhaUEY5L0tPZ1Y0eEdtcnhxN3I2UjRXSmVEQndsbUppdlJxYktKNUpoU0VP?=
 =?utf-8?B?RDJFQW5GVFgycVVrNFlNWUVseEhwZlY3V0FZaWlVMDBuWGc5ZlRXbjZjMThs?=
 =?utf-8?B?SGZobzZPUzBUUjk1RTl5Q2lBU2JMTkErN0FPcjVXTEtJUmcvZVVlWEdCaEx3?=
 =?utf-8?B?N2NyQks0bGVWQ2oxa0l2eEZkMC9vS1gxblNhbUh0Unh6WENoT2FPcHJIckFL?=
 =?utf-8?B?N2IxTGZZYlZMM0tPMlZJS29UTkttRTdQaitxRFVzWDc1RXBhWmxKQmloOXl3?=
 =?utf-8?B?bHlWWjRwM1lJWElWZ3ZtTUdNWFJsc2FmUmlGTXdnWDZWanZPTHEwYVdlMDZE?=
 =?utf-8?B?aTZrZVFxc0t3a0R2VWllN1FsNFJPS0FSUEdtT3dtZjlHbWE1SVhyUm9UZ3gv?=
 =?utf-8?B?N2pvbjI1WTQ0Ym5pS2ZVZmRUc0llODJoVmdGNUFGV0l3c0dLcHIxaHJIK1o0?=
 =?utf-8?B?bTAyS2hYNVNWZDVtYmVpUHFMVVY1VEsrRUtrd2hRT3RlSUhaS0c1KzM2ZkI5?=
 =?utf-8?B?TC9UTXpDWkV0b2FzQ1FmcVVDNy8rdDJGeGF4Sk4vWnM0NzZMbkJPTzRsU0J1?=
 =?utf-8?B?dmlSS2ZLZkdCcGNBT0dSYlpaUldhWTFMalJlMmVURC9idzVMbGZEcXJHZ2VH?=
 =?utf-8?B?alZLaGFtQUo2VHpEcTNBekczVGVSeGo4bzNYS3RkK2p2YWY4cFUvd3RIWGJn?=
 =?utf-8?B?SkgycGdteWVLS243Ylp0U0tXTGhJcWdTVGxDTjJkZnNjMUFkbjJMQzIxZHhV?=
 =?utf-8?B?ZnlmdmY2R1RDbloyQnFjRmlkeFI1NXVBOUF1WmRrSWZSR3FmMUhQMWRhdXdH?=
 =?utf-8?B?ajF2VGhPT2J2RHZGMHhoRVVnQmVuY3lKU2ZIMmFPUlJNZXA2QXovTU5MVVMr?=
 =?utf-8?B?aDRCd3pjQ2M0ODd1R1ZTYWJiQXc1VjhFRzQ0T1JGelhrUFhGUlBrUzh5Y1Vu?=
 =?utf-8?B?b0k2dG9mTnU1THVrUXNHQkF2R2R1bTFNWFU2VUdpWmUyZmZJbXVWYVhiNVBC?=
 =?utf-8?B?S01SVnVZZGNHNjdTNUprU0Q1MVRBYkVxUkVOVW14cWNENXFzWXBNYll5SnJm?=
 =?utf-8?B?N1JKeG1wcndXaDlDVCtUSXMxQnFPbWkzaHZPZllzN21JNzFOTFl5NE1YMllN?=
 =?utf-8?B?NVNPbU00ZnhBVXRJUlJ5TlZyKzY0VVl5T2c5amZYTmNXRmpvRFlqY3R4L0Ns?=
 =?utf-8?B?MmtQdjk2NUR0UDVubFk2Z1YwSFZPblhBZnFGdWRFWm5nRlk5MU4zZ3ZBQ2xp?=
 =?utf-8?B?RnN3VW9RbWVDb0JVZWNtb3lYMUFXbnRQcXBRS09kN0xsRlZNWWRZUzZ1VDN5?=
 =?utf-8?B?cSs5N1RxVklTMVBUSmxyN2xNcHdSUGFHVThjcElkTm9MVzQ1ejQ0cUp2dWda?=
 =?utf-8?B?UXVPZDg3dTNhNzU3REFvZXRkWllQZWtjRGloek9KRkdJdm5vODNXSWd5WHRa?=
 =?utf-8?B?dnJoRWRkdzJubGl4S01JODBrd0U0VHpXL25lTTVVUmx4Z1VqQmVqcmNtRXJ5?=
 =?utf-8?B?YU5KUUxmMThkbWp3cnh5MkxOL09yY1VRSVZSSkJGajVVWldNLzhnYmx5QXY2?=
 =?utf-8?B?ZEdUa0dnbkJ0OHZSQXF3UG5qOHdlTThybDNDTVdTKzc3bDc4djFiT0ZGK2cy?=
 =?utf-8?B?Ky9HbGN4eVJ6cU1VRE5sc3RyUWF5dGRlSVRXL3o3NlpUeHRYdGpsaHg4enJU?=
 =?utf-8?B?SlJRWWUybmdMZWd4ZnpZME9lU2xLMlpxeFR4dHdhQ1BmMi9pRzkrM1c5eFky?=
 =?utf-8?B?bXoxbUo1ZExDdkFIZThjUUtmQVJLS3p6c05LNkJ2dUJlZGZDUU02cDUrV0Jy?=
 =?utf-8?B?OWwzSGlZNHNYcnU5THZySkV6ajFWNTVaRzJ5TGMzYWthS1NIODVkT1pYYjJl?=
 =?utf-8?B?WVNyNDZrakcvUm5QdVRBTGh2RVpKUEtXV2pKZEUrdmsveldNblVxZ3kzWHNm?=
 =?utf-8?Q?gwJJjL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1dTTkx1NTVxeTRNWjVZajV6Y0JqendEaFYzMUpVdHBLN29HL2V5bG1oQyth?=
 =?utf-8?B?RlNuaHJ1ZktHQ3lhckh2R0xVSXd6M3FqRkVoREw2WnVJaVlsZjBJRmxjOGZx?=
 =?utf-8?B?ZG5iVkJSdlI5WHBFKzlkMnorNmpRbE5Cc2VDZ2pWS09BMXpVWGdjVmxzOTQy?=
 =?utf-8?B?VVZpU2d5ZU9qazJiNElreUVCL1hNaFppdHdWbjdzVFNveDhieTBjVzZPdkdX?=
 =?utf-8?B?Wi9qM01BTE1sRzVuZ3FnRzhiUzdIcjlxUGZNOTBHek1JK3dIYjl5a2xTem5p?=
 =?utf-8?B?anJodEI0VUFvNk8yWDBHTnNkbDRFL3RIZWNleWZwNkJISlMxUHdOSXpLd29M?=
 =?utf-8?B?UHBrWnJwVVROTE9wNUZXT3ZyTGYwaVlzYzNyMXFicVRGZTQxRFlKLzY0VlZl?=
 =?utf-8?B?azViTERZZnhGUjd6ZnI5R2xzVjFUd1VCcXFBZ0xxMURLNXlLYzV5QSs2UGZK?=
 =?utf-8?B?MjhUaTB3R3BwRS9ld0I5eEFydW5RdDB1Mkp5REdtd0RjbE1IcU14U3lmYWJr?=
 =?utf-8?B?dVVyelJVbUZENU5nWXFLMGloS3NrNjdjK0pabXRkTXZtblRrOEVjK2lmU1hi?=
 =?utf-8?B?aHc5R0NOdnJkeWNrQlY3eUtOK2h1S0VEaFVsczBtajNaTytLWmU3VmJJdHJq?=
 =?utf-8?B?MFhwWmNXOUVwZHNtSHFnQ0NVRGgzVlZjNk9KNDFEcU1MOEphY2FXNGswd3hR?=
 =?utf-8?B?bkxwMDNNTHhDdmMrZ3l1ZjBRK014STFGZ1hGOUFRRlRRbVVLK2t3ajQ1VEM3?=
 =?utf-8?B?WEpXemZmNmN0UllsSmhyOEZaYm9nSHRDL1Q0a2VJZEZTQ2hSZ3ZGSVFjQnhD?=
 =?utf-8?B?Yi93bnFINmQzVXFHQktmWXV0MmlPZjh5VG1vV0RUdW8vL3NuWmxEQzJmMFA0?=
 =?utf-8?B?QWl1NW9nYnVrSjVJZkprMG40RHpNZE1RUEtVTDgzYkpGeDRmR1BTcEFLY1Ur?=
 =?utf-8?B?WXZzSVBYMUFLVG9wRUV2QjZDRU1qem1FbkFBZ1NjSTEwR3pBS25HaVUxbisx?=
 =?utf-8?B?cnZNaGlXWkNCOTdCRzI5T2dKQWNXTU12YXRMaTNsZ2NOeWIvQjI4T1MxRmNn?=
 =?utf-8?B?UERKdVdqcWUrN1VhZDNpSlhWWE9ad25ONk9FZmdIOXpISDN2eHRMZFZ0RHBj?=
 =?utf-8?B?dW5YMjFtTFhSR2FTbFNrZURXU3AzcVdrYjhOdnZqby9sSzdyVWY5NCtlM0NY?=
 =?utf-8?B?Yzh0Q2ppNDRFTFNKQ3ExUU9hSmlTNit1dmJYN293b21vUjlzUndlYXUwTm1O?=
 =?utf-8?B?aDFEd0ZCdFpjd3d2REF3VmQ3TXRBc3podFlCRm9PUDlZdTU3ZXhxNGE4d2pl?=
 =?utf-8?B?Z3U0RkZVZ1F6dThETHpQdDB0Q1ZlRlBhNGNQN3AzZkVtOXh4ZjJEYUQ4NDh0?=
 =?utf-8?B?TmFSc3RrZFRQTzJBSkt2bzdTT2dyY1NxUXlMdzRBNlBzVWYvRjRZN1hGRFRE?=
 =?utf-8?B?alZseU5BR3E1NHVJT1JnQnNrNWRHbjhjZzBnV05QbG94R3NYMUd3aHl3Y3NV?=
 =?utf-8?B?NDd1a0dBL2ZUTE52d1lIU1MzZEFiWXFMd0xOZUFONFk4QzJteDRmd3Vjd0Vn?=
 =?utf-8?B?VXlKbXI2ampjRXk2R2l3SGFIS1gxYlhPNjdxa2h4UVJySlRlZk5JL2hyUDRi?=
 =?utf-8?B?VFVqeXFSaHFQT3BLMnZPSlBub1p3QkNxellXK0huMldJRnhyU0l1ZDRLa3gv?=
 =?utf-8?B?OE94UUlrTWI5aXZXWVhWL3lleHB4Qm0zcVFiK3BFOVM2and0UFE4Q0RvZ3JF?=
 =?utf-8?B?TG4vRmw5MXpmR25nQzYwR1h0U1B0MlJ4MHNid042L3NIb1ZmWEhONXREbUM0?=
 =?utf-8?B?U3BuM2ZZUUlKK0wza2NOdk1HZ0g5K09hSTZBM2EvMWtvdUQ4SWJ6SlZpYXpW?=
 =?utf-8?B?SHJTNENydDZOUjNRYXlsUXlRVm8zTnF2RW1yK0VOaFZiNWR6NC9JRWhUTkRP?=
 =?utf-8?B?Q1p1M3V5VWNDallKNkVwem02Ulo5YkFxbkt6WC8xK3dXQ0NPZCtQdGttUkcz?=
 =?utf-8?B?Y1BBSEI2WHd6VHphcFVmdkZmbWtoVnVQeENhSEpxNmtUY0J4OHh4eTdhanl2?=
 =?utf-8?B?YmJCdm5CRXBaSkMxbEFwcjRFWnA2N0VDUHlqVTluKytlTmVHK2RMekhVSmlr?=
 =?utf-8?Q?xUO9lEW8Ie1mH/D8ogO+KrNwD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FEFC7BC2CF5864189B47B668C6A7D35@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 141a5113-1316-49f4-1729-08de2ba83a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 22:24:26.9214 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CuuSNzfwvn2iRaOjoT0rsVeMuJRM+mA9Uh7OT1/hL9urTc70kfpgrAnqL8QpdCogXlIcauBJrHqjf9UPCvTI0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7718
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDI1LTExLTIwIGF0IDEwOjQ1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gSXQgbGV0cyB5b3UgY2FwdHVyZSBib3RoIGBJbWVtYCB2YXJpYW50cyB3aXRoIGEgc2lu
Z2xlIG1hdGNoIGFybSBpbnN0ZWFkDQo+IG9mIGhhdmluZyB0byByZW1lbWJlciB0byB1c2UgYHxg
LCBhIHBhdHRlcm4gdGhhdCBpcyBjb21tb24gaW4gdGhpcw0KPiBzZXJpZXMuDQoNClRoYXQgcGF0
dGVybiBvY2N1cnMgb25seSBvbmNlIGluIHRoaXMgc2VyaWVzOg0KDQogICAgICAgIGxldCAoc3Jj
X3N0YXJ0LCBkbWFfc3RhcnQpID0gbWF0Y2ggdGFyZ2V0X21lbSB7DQogICAgICAgICAgICBGYWxj
b25NZW06OkltZW1TZWN1cmUgfCBGYWxjb25NZW06OkltZW1Ob25TZWN1cmUgPT4gKA0KICAgICAg
ICAgICAgICAgIGxvYWRfb2Zmc2V0cy5zcmNfc3RhcnQsDQogICAgICAgICAgICAgICAgZncuZG1h
X2hhbmRsZSgpDQogICAgICAgICAgICApLA0KICAgICAgICAgICAgRmFsY29uTWVtOjpEbWVtID0+
ICgNCiAgICAgICAgICAgICAgICAwLA0KICAgICAgICAgICAgICAgIGZ3LmRtYV9oYW5kbGVfd2l0
aF9vZmZzZXQobG9hZF9vZmZzZXRzLnNyY19zdGFydC5pbnRvX3NhZmVfY2FzdCgpKT8sDQogICAg
ICAgICAgICApLA0KICAgICAgICB9Ow0KDQpJIHRoaW5rIHRoaXMgaXMgYWNjZXB0YWJsZSwgYW5k
IGl0IHJlaW5mb3JjZXMgdGhlIGNvbmNlcHQgdGhhdCB0aGVyZSBhcmUgdGhyZWUgZGlmZmVyZW50
IG1lbW9yeQ0Kc2VjdGlvbnMuICBJIGp1c3QgZG9uJ3Qgc2VlIGhvdyBlbWJlZGRpbmcgYW4gZW51
bSBpbnNpZGUgYW5vdGhlciBlbnVtIGlzIGJldHRlciB0aGFuIGp1c3QgaGF2aW5nDQphIHNpbmds
ZSBlbnVtIHdpdGggdGhyZWUgdmFsdWVzLg0KDQpJJ3ZlIHJlbmFtZWQgdGhlIGVudW0gdmFsdWVz
IGFzIEpvaG4gc3VnZ2VzdGVkLCBhbmQgd2lsbCBwb3N0IGEgdjIgc29vbi4NCg0K
