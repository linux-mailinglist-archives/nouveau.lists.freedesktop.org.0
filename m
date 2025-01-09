Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E075BA0830C
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2025 23:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1385F10E4A1;
	Thu,  9 Jan 2025 22:58:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AFVmjCl/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9062610E4A1
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2025 22:58:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NGTZrEIA2SEz4kBbGmeNZS/vmUlIyKtsnXe55ITDAaNOmhL05saSHB6WfnK4HeLu1QgD+a1JBl6yIuhJpI+TAGkJhdzk9lktm4Diihj4cfOeL3VYI6Zt4WALVoERHSxx7FUKjvHCfGv3mFJkdngnZ81Vxosz9Fk8/DFBo/KYrSGo5nyHJDBusDiswvUQQFdjDqXI8p9r36ID8L2ZRnGp04CVuMuv/l7+iAFqfVN6nIV8wfZ/Fw3syGuYA6DTLWTCKDSShXZfQvsXD1rHUqb7d9tthaSv3nQG7EXg4bU2hCEDdP8p8rQQVnwte5ujSw//mPCZRIdzKklEhheN0KOBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dChHf6kJfcK9odFfKHhr5E+vwsPEFcnzdAcSmPOqMXw=;
 b=Ppa4Mh3cUU9nxpzTyINdMJGJA00lb2xDlaVX4gBxVqcAw2NAv33lOfifxNJ+u+cAI+kWMT8i1lguBfIHZl7qVGu4E25TxvUaUxjcLUekrzYGdrQblIIij3p3yJ46Pg6Wj6YBo3QbgV/ABmnjNaNiIMfCC4PZFHROyMpR72oDbrzMPYL5XhzZBYPl0y0tNgyCbZKH9AxT4bmLFgF1APB7Z8TrNz4+lU8QWFNgCiZs9rBFbcAt7nC85sDU3BwBFlVzVUPk6k6P5KEdWK7Qt+zTKmunmyh8mPtmq3ys7wNl2eP2J1pZ01ArzHmL6l4v06llXOCJfPnCdfJNxqYcKRtIoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dChHf6kJfcK9odFfKHhr5E+vwsPEFcnzdAcSmPOqMXw=;
 b=AFVmjCl/kGXZkgb2SPXzzBkunIR350GPH0t2zVMXK/w5aCKyYkca40RMLXqwTDHAguatqTQ1L/6i8bdhNc507ErwXiXooOlQsVlCGr2N816EZsHKwrqupahB9SJocCgUAtu7H7ByrlYAEei5Mek5WErfOIbAJOCM+sqIHeSeDpfGpkTV3T+4TPtqSrOT/25RKw/6eRMRjfSO5mazBsH6E0BfNvPOOZ+MfF/X+N6x9Lr0n8Hyb97rwDZPnBGxg/xFv6WphA/Rq1wY2xiArSb6WKtFlWzfEV+pQspsKByoQYu7mfQDlua9Kjeyq5ToEkoCkJPrKt6PdX0TZURHyAz/gA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ2PR12MB7896.namprd12.prod.outlook.com (2603:10b6:a03:4c6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Thu, 9 Jan
 2025 22:58:45 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%3]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 22:58:44 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Zhi Wang
 <zhiw@nvidia.com>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, Andy Currid <acurrid@nvidia.com>, Ankit
 Agrawal <ankita@nvidia.com>, Milos Tijanic <mtijanic@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [RFC 4/8] drm/nouveau: scrub the FB memory when scrubber firmware
 is loaded
Thread-Topic: [RFC 4/8] drm/nouveau: scrub the FB memory when scrubber
 firmware is loaded
Thread-Index: AQHbPN4dhsadhaBX1kGZSRoeC4u+27MPWlOA
Date: Thu, 9 Jan 2025 22:58:44 +0000
Message-ID: <3df5a9c78e79d46680812fa6354fa9606b3166b2.camel@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-5-zhiw@nvidia.com>
In-Reply-To: <20241122125712.3653406-5-zhiw@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ2PR12MB7896:EE_
x-ms-office365-filtering-correlation-id: 4535298c-ef0f-43cd-9b47-08dd31012b49
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Rmh0WXl1cmdQQXlRM1M4cGxaMUxyQTFIaU8rL1ZNcEtYMG1ydW9qSy80eVZJ?=
 =?utf-8?B?SmRxZDhhSzhPU3puK2lSWnZyMnNDY3pMWVBPSU15MUVseEpHQ1NjMUhFcjJj?=
 =?utf-8?B?RGpQdFFURmNrOFF1ZVNKSHZTeFB0SVdPc2wweFZmcjdseE5zL1hhNkkzaEl6?=
 =?utf-8?B?Qmo1dUtiSEFORHdCMGEwWVJnTFJpTUhuTm96cmVnenQ5MDZtZlZYL0Ezck44?=
 =?utf-8?B?K3d2R1h2bDFTR0hEam82WHZTT1YrWWdQTXh2MUxERmx2blBuRzY4Rm45UDZ5?=
 =?utf-8?B?MTNJZEpIOUxDNXN3UHhNWmRJV096dG4zOUFJd0krZ0lFbmlTUzVZS1FsRHAx?=
 =?utf-8?B?VUVFV2xZWEJJQW5pUThIcDlKU01KTExNcFZlc2lzaEVxOW5uUm1aNVhsckVr?=
 =?utf-8?B?YlVibGhTVlMwUDVOSFJ3Z0VLSjkrTUh0b05URkVTMFVVclk0emJqZEZFWlpy?=
 =?utf-8?B?NXBZTmZBWXg2Q3ZUaUdySkNQR000dWxMeGJDdlRmeFhFVTlXb0xEUFJYMnVq?=
 =?utf-8?B?ZC9GeEV5R2tvbnI3VExmQjZNRFhOcmNsS2ZLM0k0NmtEeGkxNUJES2crbGN1?=
 =?utf-8?B?cVltV2NRZnFTUnUya0tYTTIreDQzUDNBZ2thSU4zK1hFOU5ETStzMlA4Tk1k?=
 =?utf-8?B?MUxTaHFxdHNHUDFCeUNBVjg0V3E4c3BhYzJTMXRpU0l2TG0yOFV1Y1VzazNn?=
 =?utf-8?B?b3FwSWtzb3Y3aHhxemVzTVh2WGVCaDNKWU9zNktmdFlUMDhFU1AydWdiMWE4?=
 =?utf-8?B?Z1ArTEZjaXU0ZW5odUhISDdyVFV4bkdnUmlZb1hZVmtleGo0WVF1cHlJSStl?=
 =?utf-8?B?S2RlN2h1NU1wejFrVGgzY0xSMlVsRVo5SzRGUVFXYmRVSEU4bmhWOENvVjR4?=
 =?utf-8?B?N1dMWWxWNGxMMWoxMkQxR1Y1SlBTbjRUNnNNVStBUFZMV0tFZ0hVSDhNTk5p?=
 =?utf-8?B?bnZlTFVqSXRtY2M4bUJxV2JIZ01pTUljdks5RGh2ZUw4ZnJPMlh4MDRCQnpI?=
 =?utf-8?B?eFp5UWhFM0t3ZDBYRUNMNEFzb2RhVVZBZHBrVlZHNitDOVZ1ajNRdE9JTjd2?=
 =?utf-8?B?eE9xZStlNk5vd3lpbG9YU0U0TWZ6bithL3FpRjVqM0ZGZHVQOGRlRkdxSGpx?=
 =?utf-8?B?bHZUOGpSWE9tNGUrSFhLcHpTWnBHQ3ZNMkRqODN5OVlBSWlrdmVacEg3UEJv?=
 =?utf-8?B?ejg0UkZVdEdoMUkwWUFBZGxaZ1FDdmpEdXdMM0ZKWVNzeEx5TC93MDdiMG5y?=
 =?utf-8?B?VlY3YUc4YkpSTWdYR0UrVDhpME5BWGV5dVExWHhBVnF0QytxaTZ0UlFXcjB2?=
 =?utf-8?B?V0dwL1JxWUNvMFg5SUIxdC9Td1FiNW9UR0JzYWxoWGlxaWJzdnRsSGRvcHpN?=
 =?utf-8?B?WlVjYm5FZDNnaG9BWFo5cHgwQWFudlVrUi9zckxrWXVIVjNtSmtCSEhpbVFS?=
 =?utf-8?B?Y0haWmJEZkdsRXdxUXREWkcwNE5jWmY1aW9ReFQxL2I0VVBQY2dwN3hMK3JU?=
 =?utf-8?B?ZjVUU0dONmZHU1N3STdZWEZmeUlCYVJDeE96b0g2QTBDOGNINTEwMHpGMmxt?=
 =?utf-8?B?ZkxhbjZkNnlOL0UyTm03UFk0d0d1WGJkMm1UajRRUEtubEx0THVzN3ZOcWI0?=
 =?utf-8?B?TVY5SlFyd3JBMFYxYm04eDNSd1ZwZlp5eFl4N0Frd1JLdVhRUEdEbFIwN1E1?=
 =?utf-8?B?ZnFEQ2lycUNqWWl3UE02c21kRGo4TUNPU3FXM2hmYXJ0TG1WQklvRlN4QWNO?=
 =?utf-8?B?OEhXQ3dLRFRoZEdGMmN1VE9kMGV5MlpvdG1EV0poejc0QU5WNTNDaEoxdjhq?=
 =?utf-8?B?SWQ3UVVhSFkxSlg4bEF6NUhxOTg1VjkwMnN0WTUrQXFWRXZqZU1SN3dSMXMw?=
 =?utf-8?B?RHl3dG5lWXpqTzRvdWU2eDJocjdCbnRJOExZMTBNbE1TZVUyRFRYRldwSW9U?=
 =?utf-8?Q?CXPbJxOFjUUQ4kEl2TJjyE/vkur90ndg?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXpMblVDSERCdmR4Z0VycDJLTnVteXVvdVVuamwxeDZNaFlaVEZwdE5OcjZw?=
 =?utf-8?B?THFjaFZIVzNycUJxUnBUQ2RkY2NFdlFWbnhsb2c4Ynp3cy9qeEkySGNQS3RT?=
 =?utf-8?B?VTE3OU9Eeng3a0lQUndYK2NvNnY1b1M1M1NVSWN0ZUJ0OHA2cjhybGF1bWVi?=
 =?utf-8?B?QUM0T1RDQkhKcWQ0eFh2VXRxeUpUazdoTkVjZTIzUjl1VXhZdzQzNk8vVE5r?=
 =?utf-8?B?dkdQc2gwRkRkMHFQYUxxR201ZkhGTnRrMFdxRUVSczAxekc4MExpS1VjbVVj?=
 =?utf-8?B?UWVDQkpIaUE1R2p2OTA2cCtobk5DL3JiaHBnK1UxNURwTFpBNE1USXZLcUtn?=
 =?utf-8?B?VW5RZzR1ek83eU1pZlRWUzFOSGtTTjRUSDZMYVVDa3p3MHRmMWc4L1RUaVZv?=
 =?utf-8?B?WEVzNEx3QTlWRmZGOGZQUGZ5Mk91MXY3bS9wbjFSd3V0ckgzZlVtUklYb0hv?=
 =?utf-8?B?Vy8xQXVSamdRRHlNVXl5enNac0hvZTkxQ2VuQ2JMbWU2WW1rRlpuOW91MUp6?=
 =?utf-8?B?WWl1dWxGeDJLTXBEdFJKSnE1SFd2QVJvWlhSZmMwK3JzVUJ3Z2l1Q1NCNzNn?=
 =?utf-8?B?czJDMXZnMUExV1dpTUJ6NUZzajc0dVR6YWdSSHFvM0FjamxRSUZDRzRiZk1U?=
 =?utf-8?B?ZnlXeXJrbTdUQXBkcTB5bzhqc3QzVDZweFJ4bG5XYzE4MXRhQ1FsT3F1bDNZ?=
 =?utf-8?B?a1FFREkwT0JPSXlMNGNkYUp2QVNjTFIxR2ljOTRyMXFhWEVPN0JJN0F5K21N?=
 =?utf-8?B?anpLdURUNWlxNDNxK2FvWmViZGhtNHdOZzM1OVVac0V6cjJBdCszUnBpcmV6?=
 =?utf-8?B?Rm9ocno3UGNkNzJlY3ZqR2M4VUg4YlBWR1ByTzl3OWE3eGxzNEFXWjZhRm9O?=
 =?utf-8?B?Um9OZjlSdkZXS2RSK1JibmN2SGtqbC9vZHY5dEtHd0xOZFhtRTR6cHRzaFF3?=
 =?utf-8?B?UUdNdjV5UGJ2ckRrRUtHNGJjbzRzQ2ZueVJEdy9venVHVmdpVUFYckJrdmky?=
 =?utf-8?B?NjNLbmJsSnVYSTcxNUJVR3MrVlhkbE96ZFcrdlN3QkR0SVdSVHc2NzgvQ2hY?=
 =?utf-8?B?NzdnaWVHemNyVnA1MHlaR1BDcmRicDE4MCtYTGNMMWxkTE56SzFUVk81VXc0?=
 =?utf-8?B?NnhYZlJnaTRmdVdwd0ptYkpsRmhRbjg1S243b2JGZEhaaklwdXRxSldMLy9B?=
 =?utf-8?B?SGoyTmpsem1KdnROc1o1YWFzN3hmYzBtb0hib25lL296NFBZWHpiOWF0Mnls?=
 =?utf-8?B?UHBkTjRXV1BNLzlZOTVyZmtpN1ZRN0ZzYi94VXZULzZHWjdXNjdJQVF4TWh0?=
 =?utf-8?B?d0E1eS9aaFBZQjdGWFU4amZ1b2JRWm1VNkNwVXVJRGlPSUNuYjdFQ0VCOVFO?=
 =?utf-8?B?QnpUU1FFbWxhRis4U1ptTEkydmFaRk5KSGVqZnJkVnNFOUp1c0gwVjI2QWc3?=
 =?utf-8?B?NkF2VktLbHNhYmswZld3ZnhDcWJBM3VYUHp3VVFDeVhaVGNYVlpObS9CL1Vr?=
 =?utf-8?B?ellJYTFmUGduQWhoeUVRN2ZleDk0UW1xQ0VDSmp0VEhSY0FEajdPaGZlSWQz?=
 =?utf-8?B?azBTbWNBZUhQNEw1Z0kxR0kremVVM2tZQWJwcHRIRmd0TzdqRHZManNPNU9k?=
 =?utf-8?B?UnBqYUlURUhyRWIweDhLS044RnhMQ2FTc0ZyUVZMbUdaeTU3ZFFJZS9KQUVk?=
 =?utf-8?B?c0c0MU91Smh3YUxUSDJoNWNpbEJOSGozbEpIOVhJS3M4NlZDUjZUWGVBTDVt?=
 =?utf-8?B?Z2V5cnlzUHQyaENLU3pKVGN0bVpIVDlSNnJXL1h0WjFtUlkrSU4zUlRaT2RJ?=
 =?utf-8?B?QWFhd1V6dzBESm5mVUwwM3hQbHhSS0dkWFJCY2tBTTdhWnp2V1E5cEFvOVN6?=
 =?utf-8?B?aGdQRlk2Um83ek5ic2JwaTNYNFBzYXJxaVhPbDFGaWhIWkgyc2RzZGNlOWJH?=
 =?utf-8?B?YjVaYWVtVCtiTkFXd0xrY1hMcllGblhSdnJ4bXV6d3JMaUdraE0zVUQ1YTJu?=
 =?utf-8?B?SjFsVlNFZDhiWHVScWRQWkQweW9JM1FjbWkzTUxIelJpY0MyL2ErTkJYUDJX?=
 =?utf-8?B?VW9SaVBGTVU3anFUZzMxMHZIYTFVQzNabFYzQ1FNV1NOcUFxR0cwbENuRzNC?=
 =?utf-8?Q?ImACLZV0AIE0WU0rjzMSCZ5U7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4BA1335801431E47BD44DFD987D446B4@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4535298c-ef0f-43cd-9b47-08dd31012b49
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 22:58:44.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axYqtxdNBskmNvT0fhNCwWRV5XkKgeUMPbIb93Yqd4DY6PiaaAqRKltEETf7MuDjuh5Ed+Cu/ES+4Dq21z92yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7896
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDA0OjU3IC0wODAwLCBaaGkgV2FuZyB3cm90ZToNCj4gK3N0
YXRpYyBpbnQNCj4gK2FkMTAyX2V4ZWN1dGVfc2NydWJiZXIoc3RydWN0IG52a21fZ3NwICpnc3Ap
DQo+ICt7DQo+ICsJc3RydWN0IG52a21fZmFsY29uX2Z3IGZ3ID0gezB9Ow0KPiArCXN0cnVjdCBu
dmttX3N1YmRldiAqc3ViZGV2ID0gJmdzcC0+c3ViZGV2Ow0KPiArCXN0cnVjdCBudmttX2Rldmlj
ZSAqZGV2aWNlID0gc3ViZGV2LT5kZXZpY2U7DQo+ICsJaW50IHJldDsNCj4gKw0KPiArCWlmICgh
Z3NwLT5md3Muc2NydWJiZXIgfHwgaXNfc2NydWJiZXJfY29tcGxldGVkKGdzcCkpDQo+ICsJCXJl
dHVybiAwOw0KDQpTaG91bGRuJ3QgaXQgYmUgYSBidWcgaWYgZndzLnNjcnViYmVyIGlzIG5vdCBk
ZWZpbmVkPyDCoElmIHdlIG5lZWQgdGhlDQpzY3J1YmJlciBhbmQgaXQgZG9lc24ndCBleGlzdCwg
dGhlbiBJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBzaWxlbnRseSBmYWlsLg0K
