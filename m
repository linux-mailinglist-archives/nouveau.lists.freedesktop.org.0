Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DACDBC9994B
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:25:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118B310E4D6;
	Mon,  1 Dec 2025 23:25:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RHQ2BxMG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012037.outbound.protection.outlook.com [40.107.209.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E301A10E4D6;
 Mon,  1 Dec 2025 23:25:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpcVieiKmt+JIOg+K3sy/5Qa2CHBjaf098+/IMJ0jkzfy4Er86Njkd0mhcTvx7tZmoxFJfDFAdhpdbxnoUm3y/Le4uCskSRRDeoI3bSrsUhIGTz28TRah893NGkEpWh1FSMyCFoqoh9emB8Ppbk5yI9NrjO9RLxyfQAKVSjRERn4MxQRbyi7DmZgGLOBOc3kwn5xz5E32veYjLsIPkrdS+FckH2/jug+urcBJ39Uzz4A+BSGN0O7ppvhnIkrji1+h/RhcOog3hBUO0iLxWFp7vJcWZO1MSP2mYQYOmwxshJI6PIhqeO7z1SLeXJ82W0ehFycCJcUZEAiNdOAJCui1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozDjPJqhHb6TUb+nI4xO2YmwNTljsuRGaoYkI3MvPKQ=;
 b=TdUsKPuJyrV1KQ55bQso9zZ7aHD4MRy5hDnw6GVXGpOUu+eW8W11t5kYFAbQV3L9yW9YlN9Hb0+pckk1rKGAO0Tt2Bb0r9PvjM3JzNHF+55NsgRKirtgxQNpwWF07dXmFurlA4yGufJNRHm/MzStel6YDremhMS2hzwBgIaBtTtMRm1JNVc/a7itzHkgygHp+X1RWoRpIVNpJqCwUZc3EmAfIjP/OzoFUC0CzDBG3x2/7Bf8KLkY56Gbx2IfH1A2zo+f2Cc4mbSVV6obYXfR4bc6oPpiIHkH9fychbTKbK0Rfgl3oYAndSHVZNlVWvnK7qMKxI7AP2zkgvFfcyhrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozDjPJqhHb6TUb+nI4xO2YmwNTljsuRGaoYkI3MvPKQ=;
 b=RHQ2BxMGW/51vZs10SdcKdiAZzLgpYBQ7VntulmGo9z5Zbt/ie+yMrskci/k8MWcQP4bsqmQPuba2okJxz2aTjoRvwYsHUvCkl/JFjk8PaOx/XSkyE1PS51F6k+Zrdb9zDJdsw37xS/gLGyFsv+Iv5T7l/7ukNpVTq1g57EkeKIIRsDci8t2flIF7sagWUcpY56UUpbBRTHCzbyEJxkXHAQ/3lgzEK2EbEHMeDBZd71g7iU72WDD3IgZ5u0NvvPbLVgm5M77CoPRGzrCcqoSBOFTLWDYpNgu6phxduNnY1CKeNjaQS2d5yY/8HRpXViMaANSLeWzGPFjnbFByc1+Gw==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:25:31 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:25:30 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Topic: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwA=
Date: Mon, 1 Dec 2025 23:25:30 +0000
Message-ID: <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
In-Reply-To: <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MN0PR12MB5955:EE_
x-ms-office365-filtering-correlation-id: 8cc22294-2ebf-4dd9-574f-08de3130eb4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eFhIbFRCM3lBbWpKWUl4SDhWY3JySTI3YkNBOWhNS2YvY1kxMW9UM0Qxa3Rr?=
 =?utf-8?B?eElUK3pVRHZDelNWU2pGd2pqME9QRXZPUlhJTUovRzNvdzJYMWdRYjE2ZDlP?=
 =?utf-8?B?TVVFL0liYTVNdkpXcnhCVGFMUm1pWituT1JxeTZTazcrbjl1alVIaDhTdWVh?=
 =?utf-8?B?c2dPU3NxanI4aDliYXNBbnVIbnpXZWhoU0tZL1pLWlJkemdwOVJ6ZFlIL04y?=
 =?utf-8?B?RGVhTW5VQlRLNVpOTTJHR3k5RmpTQnhMeHpId0tTMFd5cFRoVS8wMWtiT2xh?=
 =?utf-8?B?TXhSOGtHV2tvdEtUSEFkdjlveWZaR1NCYnJEV1NxSWhaYitBR3NiY3BJMXY0?=
 =?utf-8?B?aFhLWnFZWXdQeUluakxYS1paYStHeTFsV095S1NVN05wWjRJdTNPRkN5OEpj?=
 =?utf-8?B?RE51YkZDeGY3K1dQaFBqenhoeCt0NVNzbm9hMTdvVmRQR1FIRi9HQVcvREFq?=
 =?utf-8?B?MmdmeVhYVWxybXN0N1pYWnBGSTVVdytyRmZLMW56Q2QwVlBGRzJ4djdKb0lX?=
 =?utf-8?B?UDdmZDhlRDgrZGlmaUtFY1MwNkt0WHJoYWczY0taa1c2VWl0UnBSTHA3TGVW?=
 =?utf-8?B?WU1RajdNM3o1ZFBZWkVzbHlRQ3VWUmFUbkp1clovYVRCM3NvOXJDNEdISmlJ?=
 =?utf-8?B?MWZ2MnFHNmdjNCtvLzFvOUwxOXZuakNJK2tvY3pxT0VkTkh1VXY4N3FNbXdZ?=
 =?utf-8?B?Y3l4dWRzMERxeDZYWUduYUloSDAramNkempiWTVoTlQyclovOHFyNVU5WDdV?=
 =?utf-8?B?N2cwQmVGL3grVDRJL1BqWW5NYVM0alFFeHdXRER1c3U1akxkQ3F6WnZHQStp?=
 =?utf-8?B?YzhBZVR1eHNGTElvbCtUZVc0eHgxZ3FQck5nQ2w0MGZHMWRPUFZoa1o2dHJI?=
 =?utf-8?B?dlUrdzBTWHNhSkJNaGl0V2R0VzNheVFRQThxVTVaQSs0M3BMVElqOUlYL0Vh?=
 =?utf-8?B?cmd6MGhmNnQ2VW5iQU9ZSVNDSlpjclpTQU5xak1NaytPR1RrM1laWE9KU3Jl?=
 =?utf-8?B?YmZWN201RHpYaUg0dWcvVVlya1QvRGRXUlR0ay9KWEJ4V3Z1d01sQWNyZ3Iy?=
 =?utf-8?B?dmdTemRYNHdvd1hPcVlHMnhZc2txeFBrOVBHK2ZDME42djVBaFNLSDZVd2ZN?=
 =?utf-8?B?Y1V3Y1Y5VTVNY2tuVkZqdmorWk01dHM2TXZMc01ZSC9hbSswKzZFL0FNRXdF?=
 =?utf-8?B?VFB6SGR0c0loL3VyTmdZYSswMDF1MVRVTVhoTjdZb2JIMlRFZkRENUxEa3Fz?=
 =?utf-8?B?Q0N1MHRGMEVKN0FvcGlWR1F3Z0NZMkpaWUE0MXcvd3FDdU8wcnVLMGhJMTN0?=
 =?utf-8?B?M0xGWmRKcmZadUM0cmV6UHNvcnN4NlBhcVNGN2Fra3d4S2hvZ2VBV1ZwMUhG?=
 =?utf-8?B?OWdGWUY5LzAzOFJWcHd5R0FCTFFRanVpNGIvWUZnNG02RThJMlo5cHZ6N251?=
 =?utf-8?B?MWswODhhZmluUWRySEFlUkh1cFYzM1NjdnNtWkJ2RDBXUUw1NURpbnk4a1Yw?=
 =?utf-8?B?WEQwVXpobFJ0S0QyMkdjVVpheGZwM041SzRHalFtYVZ4aWMzOXRMWGJpdjZh?=
 =?utf-8?B?SEVIWC83UGxHK3prUSs4SkZCY3ZnWjZWUFlpdTFxM3E4OTZieWcwSmNjOTBZ?=
 =?utf-8?B?b0hUVFpmVU5rbDlZZ3FOK25YTHpWNVd4VFNwdlhpK21jU09iTnNiTFI5WGU1?=
 =?utf-8?B?QkdXeXE1elRQR3hXaG5LVGhHcVF3V1VLNGwvaGJGTldMOUdRbXB4cTlsSXBL?=
 =?utf-8?B?R05nVTBXRTl2WUprZmVFUkhlVjFtVDgyL1Q2WDNPdHo4ZW9YUzU1aS9QNzcx?=
 =?utf-8?B?TEVwS1lFUkxNNFVFT0hIKzJtd1RzaUhETjZFcUErcjVuTzhiYmxaT3RRMno1?=
 =?utf-8?B?N0lsUndMQ2syZzNzaENZaExmTHdKVVR5d2N5MFlJb014Z084V2g3eGlIZmJ4?=
 =?utf-8?B?aUh1RllpZGlXWVU0WG1ZTXR5NjJGWWFra0I0RnNUTGNUckJDWDFOS1ZqNys4?=
 =?utf-8?B?SWlZQ3lBcW9pekg3K2ZuaHorVTJjQVJSTkJUWFhIMmNuZ1F3cDNlK0ZMd08y?=
 =?utf-8?Q?Edhxg+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGdTN0h2UnkzSU4xaVJwalZmOVoyVkk1Tm1IUkpVMVIyaW5kYmx5R0xkbDFz?=
 =?utf-8?B?azdhdTB5bjVlRWNSeVdkQ0tqRlZGcmdJdHBjUzJ5OUtRdFBadVFIdlhoMHR2?=
 =?utf-8?B?QjVocUFYSXJxejFtYXoyM3RWVGF1aWJXMWFzdVhocDNKMXJ6WXhicHptWis2?=
 =?utf-8?B?STgwVS93dmVtSGp1SVEyaWhnekRHN2Nma2ZLTHdNcFphdFFuR2loblVtSmpC?=
 =?utf-8?B?bWRoR25pSytzQkxQNnV0MGxxMXFVejhyOFFTOFVpS3VjaUFnVVJZalRIOGpo?=
 =?utf-8?B?WGMxYW5rTUp5dnNKR0tQR1h5SEUyS0xRaVVlUXdQZE0rc2cra3hrOElycHZS?=
 =?utf-8?B?WmNnd01uQXJRMkdPSTgxSElHNGxoakNjR3NwYjcrVUpwTWVJOTE1dlFvUlZm?=
 =?utf-8?B?eFp5NUZlUDZBV1piT2dXUVBWMllNMzIyWCtScG5mdTNvK3R3QlBqdDNpQktJ?=
 =?utf-8?B?RmVmVXZmVkcyVkh4K3RDY0t0bWViYWpFdUU2dXhJV285Ty9ZNHhBd2MzY3Bo?=
 =?utf-8?B?VHZjM0M3SmpQdUp2SmZDR1dBVkNWLzZDZDcyMzd3Wis0NVg1Q2M1Y0oxV1Rp?=
 =?utf-8?B?UnJHRU0xQytWQWkrYTNVdnFsNUdGTVdBRTI4aWpGRm1NWjBubWtKSVRXWnU3?=
 =?utf-8?B?S0xOakE1TGFiU0ozSU9ZVkJoM1NjNy9MdjU3b0F5MWlCeTNOMWxXRmtGQWU0?=
 =?utf-8?B?MHR4YlJJOUtMSEFsaGZkd1BpL0FiN3lhY1pGLzJUQzd3cUpPMFRzb3lud2RH?=
 =?utf-8?B?NXNjbjV4WnF6ekU3WlhpSXh6bUVRRzJNUXhadVBDUVFWOXplamNwcTFQelM2?=
 =?utf-8?B?ald0dU9xalZJN0RpTzl0NWcvTTRtQ3FBek1JNGlZdGU5Ui9iSFFLcStLM0t4?=
 =?utf-8?B?eWJlSmlGbnRPL0xoSldWZmFYUGRwNzRvMFBNNmphOS8zdTJwYS9zN1ZXYnh4?=
 =?utf-8?B?WUhGNEZVNzBkQkgxQ2RFZVg4VCtUdjdhT0JkRWJOTXFRTytvR2poRzZ2SSth?=
 =?utf-8?B?cTZQaEFzU3ZQUDhteHYvRC9ONm5rU1RoL3IzSVVaak5KQlBaa2FCOFlDN2M2?=
 =?utf-8?B?Q3pPUHBhaDBGbktJKzFqa012N1FCVi94YXNDRm5ZaDEwMmNJL2d3YkFQdUdm?=
 =?utf-8?B?dEcxRVphZWtYRURzNEhwUE13dVFvK2dKMi9GOXdqRituUUxwTExCaTRUeThW?=
 =?utf-8?B?MFJITzhkdzlNdjk0cXlMdjBXUy8yUDdQaEVPQzlydk5UUlp6cisycFJ4MzM3?=
 =?utf-8?B?WTM5T1JKeS82N0ZnSDdkVzFQNWJFY2hMVGtvNlprdVhqSkRYbmZ1WnpDa1BO?=
 =?utf-8?B?dncvTWhPT0orMjk3aU5GQ3ZuRVgxWXdranljbnh2K0ptV1F4cHpHUGtybjNL?=
 =?utf-8?B?VkdObkwwdFl0UGZLRGhqald2NEhvdUFldGx0NFhTN2RRa3UwU21tMVQ5UUxH?=
 =?utf-8?B?ZXp4TG55SVl6dHNuRHZGUXFlL0tQSjYwL1dySzNhMmdBUjkxWFVta0x3UjJY?=
 =?utf-8?B?MzVIM0xvSXZJQmQ2NTlNUk4xcFRQRzRWKzQvTDkwMDJuUUlYVVM5MFZsZ3du?=
 =?utf-8?B?V1FjRjgyWnB6cWZBN0x0WXpyaUNVVGlIeGxGRVIxNmdVb25rZk5BbVMySGZl?=
 =?utf-8?B?ZGdsKzV1Z1lVTmVIdXhnQStpWUNtN1pKVjRVMk93aHZ1N3FjVW9QY0U5Umxu?=
 =?utf-8?B?QUdCMHE2UVE0bTB6NkNIK2tEZi84T2RRNW4xaFV6WGQvaFlwVVBaUDVZekYx?=
 =?utf-8?B?YWk2empMYVIxMkxtMk9mT0t1QWlBakNZb2RJQTcrczY1a25uZE52cnpVeHRF?=
 =?utf-8?B?UWJMSE9VYXVxRXVNelIveENMWkg4VjBxaUw4M1g2bk5sOG9DTDRmMnlMYkNM?=
 =?utf-8?B?eXBXbnoyLzZXbUdPTG0yL21HTVN0MXVpbUlJYjJ5S3J1VUcrbGNzYi9oMGtQ?=
 =?utf-8?B?VTVIbmdFQjcrZVlTUnpVTmswZXRyNDV0TVJxeFZNYWhuclZ5Y2tLNEQzQmlZ?=
 =?utf-8?B?NnpQeGhEQlJCNlNlYjdTR2xCbCs0TW9JZ3RuMWJhS0lxeHJXdnNFRnVFVlBV?=
 =?utf-8?B?RklrZk5VRmlTSDUzNkhoVmY2enIyVzdiUjhjSFhGbUxSY1lxWTFScVF4Z3JK?=
 =?utf-8?Q?X7YZT6ZiCOHtjUWT+pNaHEJIg?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1179441C0C91E9478E2FE9BE9DEC7F54@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc22294-2ebf-4dd9-574f-08de3130eb4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 23:25:30.8800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u/BT7Zji49u2hBm6skwcwPmS6X6c1t2/szAyt6JQ0Jalb3jCuuWLn2wfsFsC46S0XCiJAV7usaNldI+evLHu/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5955
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDEyOjM2ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gWW91IGNhbiB1c2UgdGhlIGBBbGlnbm1lbnRgIHR5cGUgaGVyZSwgYXMgdGhlIHJlc3Qg
b2YgdGhlIGNvZGUgZG9lczoNCj4gDQo+IMKgwqDCoCBsZXQgc2l6ZSA9IG51bTo6dXNpemVfYXNf
dTY0KG9iai5zaXplKCkpDQo+IMKgwqDCoMKgwqDCoMKgIC5hbGlnbl91cChBbGlnbm1lbnQ6Om5l
dzo6PEdTUF9QQUdFX1NJWkU+KCkpPzsNCj4gDQo+IE5vdyBgYWxpZ25fdXBgIHJldHVybnMgYW4g
ZXJyb3IgaW4gY2FzZSBvZiBvdmVyZmxvdywgdGhhdCB3ZSB3aWxsIG5lZWQNCj4gdG8gcGFzcyBk
b3duIHRvIHRoZSBjYWxsZXIgYnkgY2hhbmdpbmcgdGhlIHJldHVybiB0eXBlIG9mIGBuZXdgLiBJ
dCBpcyBhDQo+IGJpdCBhbm5veWluZywgYnV0IGJldHRlciB0aGFuIHRoZSBiZWhhdmlvciBvZiBg
bmV4dF9tdXRpcGxlX29mYCBpbiBzdWNoDQo+IGEgY2FzZSwgd2hpY2ggaXMgdG8gcGFuaWMuIDop
DQoNCkkgc2VlIHlvdXIgcG9pbnQsIGJ1dCB0aGVzZSBhcmUgdTY0cyB0aGF0IHdlJ3JlIHRhbGtp
bmcgYWJvdXQuICBUaGUgb25seSB3YXkgbmV4dF9tdXRpcGxlX29mKCkgY2FuDQpwYW5pYyBpcyBp
ZiBvYmouc2l6ZSgpIGlzIGdyZWF0ZXIgdGhhbiAweEZGRkZGRkZGRkZGRkYwMDAsIHdoaWNoIGlz
IG5vdCBwb3NzaWJsZS4gIA0KDQpJIHdvdWxkIHNheSBpbiB0aGlzIGNhc2UsIGEgcGFuaWMgaXMg
cHJlZmVyYWJsZSB0byBhIGNvbnZvbHV0ZWQgZXJyb3IgcmV0dXJuIHRoYXQgd2lsbCBuZXZlciBi
ZQ0KZXhlcmNpc2VkLCBiZWNhdXNlIGZhaWx1cmUgaGVyZSBpbmRpY2F0ZXMgYSBjb2RpbmcgZXJy
b3IsIG5vdCBhbiBpbnB1dCBlcnJvci4NCg0K
