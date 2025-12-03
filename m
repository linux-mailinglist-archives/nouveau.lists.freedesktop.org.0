Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85976CA1510
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 20:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE48E10E198;
	Wed,  3 Dec 2025 19:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y5Rr1Izx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010033.outbound.protection.outlook.com [52.101.56.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7863710E198;
 Wed,  3 Dec 2025 19:17:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6yq1Um/8QvcZ6Qmu14iunonz/X3hVOOsn/Lhf4XJ1Jb/jsrQmnnbK68nOG1weyH2M9RehHYVhhDtYkq36IfEdKIxMqusc17n40ETy5mMLELzLaqbhOvtE9VJVTZPFO1KGtwlEgiIoW4yJgij1HtSxavBFzVg4h6WGQrKyxOAWr88iwdxKitYhnv6PP/klHEMdW6sranaymeypbXujwD50ayVCExvD++n6IsvME1VwuDq3CeqTVqxpc4Aiy+Gb6c7UmL2YgAmSgNdsTnEJuT/T4gbSzbCJ5QUUPHIzyp9P/UNg+hU26CD1zAVlutf0TsH3mED0TYEKtPrb5QKIQHHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qh+AVKPGlWDvJTQ1PhhHMnKx5WkIbbFKNgkZqJePL4=;
 b=NhYr2LI9pvV/A/CB39clZoFwrVd31Qbjp6ihRyPdtRyNSb6WXSZuGLZpVQGbJf+zbh7I1UfJ8Jv5ObhfoeW75WmSoUDDIkXjp3H3R4O1wz37re58k+yU7XQ6e1y7n9alBq2BbGTkCdpwwHtmgQA7YXafnH7+EluKS/EDSqcpv1npzayPrwK2ZBE33mdCzPJfwvw2ciLx6mc3mDkVJ/g2jJ4PVSU53LERgGgee/J4YRp/aLkqvf6lAcDNgFXTRr2/haiSUFPzzGEepy2bDE0lrYb+0DkKxSXnxnFvhWwVRsB2GIRyHGC57exaTStdxwIBS1l5lNy3GwDtzGWXdGqEEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qh+AVKPGlWDvJTQ1PhhHMnKx5WkIbbFKNgkZqJePL4=;
 b=Y5Rr1IzxBwAXPyIlSjxmDVXb4tkW+ErAOIR1bTBGm10ZCPohI/GidSK3hCX88X2VwiRi+5khdW4yjueR8Hpyyb3whrIhbfIa3CC2RdlUpu4goAV+I8/5fwzcmFbNCWiTmFCfmrPcfbMhZRgARTR3Uy5g391IXOfTChx7MXxQGy2JQWBm91jLIJ2owio/BeBb8oimkXKp0mSGks/PwsPEmX6TuyCZsXzUQsp9o6MBePyC0yg39qPUjO0bhnQT3UdpMxYHaM5TbqJrFrU/i9xaDKzcmZ0axcGGEP6igFDp383vs8q/DGxAPaBOpt+7UMXSHdlmuLrKKPMxorfNa80nsQ==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by LV5PR12MB9804.namprd12.prod.outlook.com (2603:10b6:408:303::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 19:17:05 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 19:17:04 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "miguel.ojeda.sandonis@gmail.com"
 <miguel.ojeda.sandonis@gmail.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>,
 "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Topic: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAb8yAgAAL2YA=
Date: Wed, 3 Dec 2025 19:17:04 +0000
Message-ID: <be248fcd365a1f6cb3074dee0a2e16202f8b76d6.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <CANiq72n-E3Yhgn=zioZvOLbKStLbrTfqDbEVY1-vbETqRYmWxA@mail.gmail.com>
In-Reply-To: <CANiq72n-E3Yhgn=zioZvOLbKStLbrTfqDbEVY1-vbETqRYmWxA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|LV5PR12MB9804:EE_
x-ms-office365-filtering-correlation-id: 014f7761-5d72-4bfc-68f5-08de32a08b40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aUt2WTZ0UkhqZmlkd2ZvS0VmMEtwMndoS2dDU3pkOXp3OXRXY2NVb1FudTky?=
 =?utf-8?B?WGNKUjRUWnV2WE9FaXVJQjlwMDlrYWNNakhkSDZQT2JuR21hSTMzUmRPazF0?=
 =?utf-8?B?TUhlN2hRRW1nOUVCSDFLVHJwKzZseUJONlZKNTlhZUVZM01jYklpSDM3YWtk?=
 =?utf-8?B?T3VNckZZWDRrSnZGdXVHNmVndGxwRTNhMmg4VU1kaHRSbWNZR2pKNG5odEtT?=
 =?utf-8?B?VmpwRk9teHgyU2c5a0Y0RXczZThZckx5QkF2VGlvQVFoUTJ1UFlXM1lhaXlT?=
 =?utf-8?B?SVhKYUcrTzJpaUpHVWZCaFB3OWpYWVpvZlJWMzZINkhvSnUvSENTY0xIbHBR?=
 =?utf-8?B?WTVSblJ2YnNmcndIMC81OHNsWDg1RHNFTVF3MDJZalR2UkRuMTArWnVscStq?=
 =?utf-8?B?OFV3Zmt6T3ZkRndGY1pKSDBOZGtDcFhoa3VkYTlVbkZ5ZDRoY043dEdNbGZk?=
 =?utf-8?B?bHN1U2ZNNDFPMXhUYTQweCt1cWdmZjZFU0R1ZHQ1VFZYdU9kYVpmRlRIbmFQ?=
 =?utf-8?B?eWx0dE1wQVZYQ0dPajI4cHBRZVF4MVN0eFYyVmJOMVpRWHNwekRkMkY1SGI1?=
 =?utf-8?B?WWVGMCs2WGowV290aUxkQ2dnYktCSjR1QW5BMVpibGlIT0JJSHFTeUp2OC8v?=
 =?utf-8?B?RHN3MDNTVE1RbVF6eHlITCt3aDZFT0EwdTdUK1A0eG41bmZJOHFuV1NJQ0xs?=
 =?utf-8?B?U0M0Z3VtZHZ5YnFLTW9yOCtTSU9sU2pkTUtPalo2T0wwbG5CZjdVeU5FTFdB?=
 =?utf-8?B?T3gvV1dpYWJkckN4bUFHbnpUWEtvY0ZtL0JrS1psNkF4UnExTnFMakJOdEZm?=
 =?utf-8?B?MjVCbWJPZDYwdmhCdWVpRWZTZE9RWlJMOGdqZEg2Njc4MEprcE5lTHpLcTk3?=
 =?utf-8?B?SFZiQUhvUEdvbUEvaWVOcDAxTS9DTnNaUi9HWFVZdU4zeWRSSE8xV0l1OVNL?=
 =?utf-8?B?dEEzTEJZNjlhSU1ZeDJWbGUzMkhVZUxRRTMxdmlBMisyQUlmdmswVzc1c3hx?=
 =?utf-8?B?RXlkb0E0cVRveGJqbThKUFBUS3dkY0lrVWpYeG5tMHhRQnpENGNqV0VlL0V6?=
 =?utf-8?B?c2ErUlVTM1lLdEF5MEJmQStacjQvVS9BSVNWNE5aR2N0MU5GeTZ5MUtJaDVl?=
 =?utf-8?B?Y3RHVTJjMDlvNzcvTHQ0WUVPNmpwdnBlbno0TU9ObjlnYmRRcTVXYUY3OWdB?=
 =?utf-8?B?NkJJQkV0bGNhWHBTc1FqQi9FdDl2SWtTZXg1aHhqT1JGU292ZVUwOTRCczFF?=
 =?utf-8?B?b0MzeE5MQXNldVQvUjNGYUhWQkhtYkl6cjNNSVNlbk5PWXZVejdiaVRxNTVY?=
 =?utf-8?B?RjlkQ0VQUCtaZHRyS0wrZUZDR0cvT0dvV2tOSW8xanZLdURWOVBwTjBVS1o0?=
 =?utf-8?B?RGZlNmNIR0FPREtPOVZyY1pZRTVlZWVxVGdUb1hUNTZqUDB1NGFaRThYaUlC?=
 =?utf-8?B?Skc2Vkc5Zk10bU0wbHZIa3RaY0hRdTBmbW84em1MNjJqbVUxSjYybzB2bFlL?=
 =?utf-8?B?YWtrSmFRY095ZzNOeHZpcVJzTkl5QndOZWJyWFZvRFkxeFEySUQyVXZmZDhP?=
 =?utf-8?B?TFhMV0ZrcC9BdWFjTWRCclVCaXl2MzczQWhrTGFnZzdldDhma25xVkNhVDJI?=
 =?utf-8?B?THdIYjVnVTBHd1BCQ2NieXVRWG1IWW1oQ294cDBkb0NZVElqODNyNHlQcGxt?=
 =?utf-8?B?bWluMEphZGFPaUJpK2NTcWwrdHhtdk9rY0pKVnBQS09vMXlGeXEzc3NxVExh?=
 =?utf-8?B?TWxDQmxsUi9nTDNDeExoeHYyQXlCVHVyVHRtak5TWGo4cVl0Q1BVaXhtU0NU?=
 =?utf-8?B?VFpYZUhSbTY0cHB5ajRrK3YzMmF0dUN0dEcwSWlSVlVnMXA4MHZKUlVVN1NW?=
 =?utf-8?B?cmRKaGpZelNrMWdvdUFoK0ZRMmJjQ0twUk1EaFhJRkFuRzBsbk1Cd2J2N3dM?=
 =?utf-8?B?QWhUREZVVEJGL2FLM1R1R29zeERZTG1UaUp6VjNSWG5meVp2WTl6VFhFNzhV?=
 =?utf-8?B?eDdRUVZPNzhnUEFmZ1dtUlI0U2kxTGEvTkx5dGhQVUlTcXU0VGJjR0Z4Qkpi?=
 =?utf-8?Q?40itcw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Uk9LTkV5UHI1UzdwU1o5MjA2S2VNanRwbDVXaFYzUmpYK1U0bDR1SUtlUFJt?=
 =?utf-8?B?RFpRZmswNXlnVDNMRkdxQTNDUWtYNHFUaERHNWtMdUoxekhydWhRN01tR21n?=
 =?utf-8?B?VUVDZkU4dnFhV1QrQVBiODBlMjlHNHl4Q2t3L0NpLzRBRHpyRFE5RThMc3Fp?=
 =?utf-8?B?ZjR5cGxlVHZkUEhDTnlDdWNvUW5URHJjT2tlRm9oSmtadlUzbUwvVklKeFFO?=
 =?utf-8?B?cHNnTmhydndkM3hCS0NIa3F1K0JpbG1QUktyckdKdFpobDA4dTV0THIzNllu?=
 =?utf-8?B?Z3hyR1BvbjAzdjEvQWs4Q3FNNG1qZFdsTzFLWTE4aHpFVEUvVHA0enZyZXJj?=
 =?utf-8?B?Q1RjcUpRQSt4Rjcrb0VINDN6OW1YS0k3aGlBcjE0SmVZSWJrVHYxR0FuT1RK?=
 =?utf-8?B?TnJXeW13NGF1QWFQS0lsN0RHQUlmYTRTQ25Jdk43NnVEckcwTFVQZFZUa2c0?=
 =?utf-8?B?Z1lMeTBaa3laMVRNMkRqU1BIVkRkelhOQ1BuUGQzR3VtcGNmR1Uzd29HQklQ?=
 =?utf-8?B?UVgvb1lyU2NxbEVCVzUvNVZ2UE1nU2V1SEpzZlIyMWxqNjRzeFZJYThJbkFD?=
 =?utf-8?B?azc5OEdGRENZRzdGZ1FmUE5hWW12YXJhcGVTUVVzYjRoZTFKUk52ZUhERUZY?=
 =?utf-8?B?dk1rMWlYbDJrS2J1YkRZOFZvZ2FzWXJvaGZnYm9xNnIzRHEybjNkMTZkR0FF?=
 =?utf-8?B?ejc4c1lWYUdrakhwbkxsYUFxYU5mT2U5Q3VMUFMyMDRzT3pSRm9GR2hUd2ww?=
 =?utf-8?B?cjd5TlF1ekdOMmcxaGZhK3M3RkdlTGtLSytCL00vWngxZWZobkZaK3RYdThq?=
 =?utf-8?B?ekdkOVlZVE1RY0xqQ1FKOHZFeGUyWjZhN2gyLytubnlweXpYTzZ3OEVUQVhL?=
 =?utf-8?B?UEJIYVJjSDFleVMxUVNlVWthTjd1NjVqTFBvWjZ4TFlqVExXVEdJUVVORnRp?=
 =?utf-8?B?TDlGTFRKY09NRFVaSDhIMXgwbUFrRHU2Yk1jSjhQeWxPdlIvTEs5ajZEcjdr?=
 =?utf-8?B?TWViSVBublF5RUtWMmdnd2FvS0JyRHN3UE8rdWlMcU81MWZpSXpCUkIzSmpL?=
 =?utf-8?B?TkFSNUNZakROMXNmU042V0tVVHYyRzE4MmJZZk43QVV4S3hFdys5ZFE3RXVp?=
 =?utf-8?B?NlBJNy8ydy9hVk9kQmZwZ2ZYMWk4RXJSUXFpRUVEOGxnR2UrSjByQmovK2hF?=
 =?utf-8?B?WVY1TXJMbUkrVm9Bc0NQUUtjZWFOa2t0UGpIQ2NIYi9OZUQrMUtXVVQ2MGZ3?=
 =?utf-8?B?NUF4bkl1RGZHZHB5Yk1PT1NVbXF5SCtwWTQzYjBXcnBzVkpwOGkzSHZhbWNx?=
 =?utf-8?B?TS9jN2tLMTVaY2FBVE5rRVh0ZWlyUCtlcGJSV3JqSnJSTFpiWnlrVHFucVBv?=
 =?utf-8?B?OFZPK0pOTStPOEMyYjdNcmRpb21ZRW1iYjlZalhOYWFTZEVwcmFYNEJRdXpE?=
 =?utf-8?B?MEIxNUpaMlRxZEN3dWc2bm5IWmlEQlBvMjJGTFIzR1NpNXljYWloZDZLQ2xC?=
 =?utf-8?B?UmZETmlzaU9XeTQ1YThrWHRNVEVIWGJUWmdtZUJaZ1NZakE2d0g0TGN0UGhE?=
 =?utf-8?B?ckxBMDhXd1JGVGZiaEdpMGhNVWt4R0c0ajVIL0ZNWEdwaVl6bGhaS09DaHo0?=
 =?utf-8?B?RlBSRzIxc2h2RlBkTzZEdjNjaWRvU1NTQmY3TTgwQzkwYWFwSGtlaFA5WFR3?=
 =?utf-8?B?N2ZWNGNqaVhmaHI0TnpiLzlXMHRZYWVaL1lGNzV1U0ZUVEtmcFhzZjRUZnpM?=
 =?utf-8?B?SXI1Sk0rMFcxOS9HSlAwc3ljQU4wT3JTMGhoMzFtT2tIVDlMckFMT0hkcVlW?=
 =?utf-8?B?ZmtvbFpuUENDQzdnZjYwaGFFOE5peUVjaWxicnZ0blB4MTVoeUJ0M1Q4YnY2?=
 =?utf-8?B?aStqeldUZithUExJUmFjU0owQ0JpNU1zcUxaV2crWHE1K3ZkZk5wcXl2S3Vq?=
 =?utf-8?B?ZmJtNlpBUVRsdHZETmRCT205bzBxMlp0Z2FxVHNSeTFEM2FtaDFsNUVFVDNZ?=
 =?utf-8?B?L2o1KytZa01oZXBhcGFaZFBVOUhyRndpdUhZdGxwQnEwSGNibGswdmtBTlBW?=
 =?utf-8?B?MnRLU0JNUkRUUHdUSjZpcEF3a0l0NG5Qd1d1ZkhDL1NvcGl6b1M0akhCRFVn?=
 =?utf-8?Q?HYw32DO7yQHgzWGtfGi0+8Bvn?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D31F917A3547FB4DBCB5206FD966EB70@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 014f7761-5d72-4bfc-68f5-08de32a08b40
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 19:17:04.5355 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5sPpkJANl01gUkBJC/H6Et+DeEqOcpwtO3U97c9LQlumgSSuMicuctYftC1CPfWupuAVLKxIwqlUrNC2uEMiTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9804
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

T24gV2VkLCAyMDI1LTEyLTAzIGF0IDE5OjM0ICswMTAwLCBNaWd1ZWwgT2plZGEgd3JvdGU6DQo+
IEluIGFueSBjYXNlLCBpZiBpdCBpcyBkZWNpZGVkIHRvIGNvbnRpbnVlIGV4ZWN1dGlvbiAoZWl0
aGVyIHdpdGggYW4NCj4gZXJyb3Igb3Igd2l0aCBhICJkZWZhdWx0IiB2YWx1ZSBldGMuKSwgdGhl
biBwbGVhc2UgdXNlIEVCLCBpLmUuIGFkZGluZw0KPiBgZGVidWdfYXNzZXJ0IWAgYW5kIHBvc3Np
Ymx5IGBwcl93YXJuIWAgKG9yIHBlcmhhcHMgYHByX3dhcm5fb25jZSFgDQo+IG9uY2UgYXZhaWxh
YmxlKS4NCg0KU28gdGhpczoNCg0KICAgICAgICBsZXQgc2l6ZSA9IG1hdGNoIG51bTo6dXNpemVf
YXNfdTY0KG9iai5zaXplKCkpLmFsaWduX3VwKEdTUF9QQUdFX0FMSUdOTUVOVCkgew0KICAgICAg
ICAgICAgU29tZSh2KSA9PiB2LA0KICAgICAgICAgICAgTm9uZSA9PiB7DQogICAgICAgICAgICAg
ICAgZGVidWdfYXNzZXJ0IShmYWxzZSwgIkludmFsaWQgc2l6ZSB7fSIsIG9iai5zaXplKCkpOw0K
ICAgICAgICAgICAgICAgIHByX3dhcm4hKCJJbnZhbGlkIHNpemUge30iLCBvYmouc2l6ZSgpKTsN
CiAgICAgICAgICAgICAgICBudW06OnVzaXplX2FzX3U2NChvYmouc2l6ZSgpKQ0KICAgICAgICAg
ICAgfQ0KICAgICAgICB9Ow0KDQpJc24ndCB0aGlzIGFic3VyZGx5IGV4Y2Vzc2l2ZT8gIFdlIGNh
bm5vdCBldmVyIHRlc3QgdGhpcyBlcnJvciBwYXRoLCBiZWNhdXNlIGl0J3MgcGh5c2ljYWxseQ0K
aW1wb3NzaWJsZSBmb3Igb2JqLnNpemUoKSB0byByZXR1cm4gYSB2YWx1ZSB0aGF0IHdpbGwgY2F1
c2UgYW4gZXJyb3IuDQoNCg==
