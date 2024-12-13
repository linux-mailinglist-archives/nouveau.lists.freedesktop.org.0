Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392B9F0EB5
	for <lists+nouveau@lfdr.de>; Fri, 13 Dec 2024 15:12:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC9F10E1A8;
	Fri, 13 Dec 2024 14:12:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="je0inEYj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA2F410E1A8
 for <nouveau@lists.freedesktop.org>; Fri, 13 Dec 2024 14:12:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0SY0aFa6otklsKKIzTwVRoYPQ/zIn7kRAllsgFmKhHN+hAp2tI7OWTyI9AfkMgznMIQEbab/dn4CxOZFsy8rFSelA+b4jAQkVvrTiS4K+cJU8lg0o5V0Q+7kGt1ZxObicmRiDojj3M1jHjKPXNxttneVmDVmb5qTVjs+dfzqzYXvAUEn8QRwwdZLOWfykBUXKtYOxtimbnFcCvkZxaFmYwDsFK1LW9EOpx2QUsaifyI+oa6qZ+eurdyMHOhY7+qU1BirCVoRtjqcrdRZpGKz4/KsLRzIkzF6JO+pntYgka1IHDAHvUACjyB4VCF+qQVrWgwh8QoP9/uEqZep8TWWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMsDwcqdXEYAxRDAGcl+5CDEoEzFDTQUHxGc+zaGfQM=;
 b=Y4fnzflasxnHmnFdYfwatKqgbQfChmWEjJLcLLJ6gt4RUe1FxXuTQuhORsOlSnt+9aWMfD3P5BLpcurWHhS8puFFiuV0gCwhqd525gbr/tYEwlpUJZ2oUnLubfm3eRIoL+m8gl/nSGZxTsTvFWqLzhQOP+HM1N0vF5g0OGmDrrWOwUWbtnSdYPNPR3EKtQ0s9ukF9QYKjP+GDMw6H/zylame9MQ4PsQxCECmLhmtTt2Ec7Jlp9Kdz4fk9OCJJ6cA/iVG6jJc1aooLhFYiUZx4yD0VH909bUyXLgXFqfx5HxYHDeTZ3tlTrDroUaeiMocmz0xJDd787B7lyJGAR9HCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMsDwcqdXEYAxRDAGcl+5CDEoEzFDTQUHxGc+zaGfQM=;
 b=je0inEYjjvx/FXKthLXbt0ZlpnEeKnjkN5VHxWH4b+BNuCuTHoYtJWpW6jz3RwOil0/zPoBCnziqLYgQpp1bXIeDW4OBqYHgQiEX9jCmnWm6OFkUqSoidP+1agU42AaLHnjx/aPPmyPvifWWix2yqZUq7+VUAlTvIoU42578474pPXRmozmgA/WrO6EpfjIfvonqlbzQlb/19fIyFbDODr+TXQz+FcZXNsEncVvC4OKUNlWUrdrF7ALMzbNi4v1LgssVFDrPnrv2/dZ05oLfo6fpgNzM3v+atUBP/Jib45hTqo3YwZS2p+zec8bI8P4zT06pMbackrr746oXqFT0xA==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by CH3PR12MB8902.namprd12.prod.outlook.com (2603:10b6:610:17d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 14:12:28 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 14:12:28 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH v3 02/15] nvkm: rename "repc" to "gsp_rpc_len" on the GSP
 message recv path
Thread-Topic: [PATCH v3 02/15] nvkm: rename "repc" to "gsp_rpc_len" on the GSP
 message recv path
Thread-Index: AQHbK3JfmoOXYP2CM0y++B9b2Tc5p7LhF3kAgANjtwA=
Date: Fri, 13 Dec 2024 14:12:27 +0000
Message-ID: <2cb522d5-6072-4d24-b7a8-7f5a6681c333@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
 <20241031085250.2941482-3-zhiw@nvidia.com>
 <Z1lo6Oj_gQ7J2CeE@pollux.localdomain>
In-Reply-To: <Z1lo6Oj_gQ7J2CeE@pollux.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|CH3PR12MB8902:EE_
x-ms-office365-filtering-correlation-id: cbda6b29-8e6f-4a12-5e81-08dd1b802ceb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TTh3UXpXaFAvWFh6NmpybnltbXBDZTZWY1o0S09NaUVOUjg4aVhpTUFRUjJm?=
 =?utf-8?B?cXU1UVM4YkFlZG1yeFNWU1pLWmNtYUlJaStPQkF1eXI3b0g4ZjlZbHlLRWdR?=
 =?utf-8?B?OVpTSHBiUHVzSGxwNHBaS1llT2tQOU5VZzhsU2MyZDdMZkRUTjdqb2p4Z3ZY?=
 =?utf-8?B?YTlNbGRrS0ZHRWFWTjBENmpFMTZYeHZMb1hudEtwZjZOOUZKdmFha3VTcElw?=
 =?utf-8?B?QnhtTmsxVStKWUlIZGtGOTRqaEVtOURsME11VktDUmozTjdHcE5xVWhCVURo?=
 =?utf-8?B?aU5BTGsxMjVNd3o0aGN0THlDN2MxdWgvMy85dTZRM1ErZUhyRkVZZVNLNGRt?=
 =?utf-8?B?YWtGM2Nzd3hIczA4b1ltdjJxMStpc0pNMVgzNmovQW1XSFpFaC9Zd2RVTjZX?=
 =?utf-8?B?MTErOXE3aXRJRy9qTVR0c2hEaG90VW1aQU1FRzY5bm9ua3ZkeE8rOXJKQW9V?=
 =?utf-8?B?MUpibkNCRW5rd01FaDBOMzJ3THBTamhjOHhUM2RpU21HWWZHTFZYL3BraldE?=
 =?utf-8?B?a0tyNXEzcUNVbW14K0tFNFFRWDBadmJrNEQyT0t6ZjhtbEVMWXc0SEZQWkZs?=
 =?utf-8?B?eXh5T0lsZ2NLelZIUlVnVUFxZXh5azhhZytJeTR3N0NEZ2xKQk9nSWwzaVpN?=
 =?utf-8?B?Z2dSYTVnTEhraTNnaXhRMWJXdTFlNWxZQm9CR3lTSGYzK09uNUthQXllcmxu?=
 =?utf-8?B?S3BwWVU5UHRCcm9xdGcva3NEdnRqa2N2RXhwTGpaaDk3OGdMVUJ4SDM5VUo4?=
 =?utf-8?B?eHY1UjRDZ3Yza29uY0J1OXhDWlI5TzY4UTRlTitZNWFxdi9GdDh1QXVFUkFk?=
 =?utf-8?B?SCt0SnBYWVprOWRORlRKOHE1TzY2WjFCL21NNEMzVUhnM1ZrMzZaWmRDcFdt?=
 =?utf-8?B?d0cxeUFwOFY5bWxmSnBGaGFEb0IrRlgxM0trRTE1OW9qWmxFUUxJUFJRRXdR?=
 =?utf-8?B?TTk4TEpnTDJXVG5tLzB3OEtLUWF0TnZjQS9lRXRFbWFDOFAvZWpnOUtDU2Fr?=
 =?utf-8?B?SEtVbmE1V1hXZ0FPN1p5NkQzMUNicjc3MTFXOTBLQnB1dGMvZ0hpczhoMCsw?=
 =?utf-8?B?T2dzUGJpY1d6bU42L1JVTG5UMnVhTVpRNFhlbnFMNElQT1A0VjJkQ2VaMlgv?=
 =?utf-8?B?MVlGbklMMTEwUWNpWWRmSE1hMm1yRVI0YlQxb2YyOXovVytSNEhMYVNTZGtB?=
 =?utf-8?B?UW5NNkNPL3RQNXRIOG1BR2pjUEowRE5HczB5Vm1oWXlJQXZDcWR1VXgrTi8r?=
 =?utf-8?B?b2t4WUtxTXlCcjlZOTZvK2poYllBS0VFMkdldHJZVVhqbWR5bFJ0SEpMUkE4?=
 =?utf-8?B?cTlpRzVRUUZmWDJRdlF6TUZFZ2hlTzk5SVFoNzZDczhNYUN0UDB5MUhVODFG?=
 =?utf-8?B?TCswMlYyN0FPbHQ4WkpqUDI0NFVrSFpkckNXc2dVTklTRkVYaEMvZHRiNU1z?=
 =?utf-8?B?TkVES1FOUGRWdmlyL2czSEdydjFxamd6TCtqOWd6a056VHVFelNuYzdtTXEr?=
 =?utf-8?B?ZWcxd29oQ1ZBdGZId0xaOFg2bU43VXBqYXZrZHBnMjNXVllTZVIxU0JTSUlj?=
 =?utf-8?B?UXoyclEvNDVsb0M5Y1Nic0E0bmdPV0MzaWlLUSttWUg5ejdNTEhUZ0xGWHM1?=
 =?utf-8?B?aGFOdkFMeTFFdlNpZGhEajNWUGRiYzdRVFI0YmdIYWRJZmRNVnJaZXdudWhG?=
 =?utf-8?B?Ynl2alNKSXp5ZzQ2UmN4MGhnNmU4NSswc3ZRcjlOVk5zeTBDMHh3ZnE1UG9u?=
 =?utf-8?B?b1V6bENmNVg1MmU0UlB2U1k2WVlzVVpvVVUvNGFpTGFwOVFMVzljaklyQ1Vs?=
 =?utf-8?B?V3RleEUzejllNm5XUG5tL09LQTJWZU9md2ZEVmpPem1OYWVrd01nNG1mMFYy?=
 =?utf-8?B?aDlnRFVpS0RGenJVMnhHOGUvVmJKTGZnMzFBZndUYW9ac1FlNm9nNTY5WkRT?=
 =?utf-8?Q?oh1O811Dh+rdIivpykqbRGO+LxDbymj7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0pTZ3R2aU9HakFUbnh6ZUx5VDlicm5QOVNiMUozQlJJMktud0NLaUd2VGow?=
 =?utf-8?B?ajM0Q3ppemkwYlNLZTJmRHk2VUVUZU5NVk1kVzFjcldlSDE1ZGp6MjlxdVNs?=
 =?utf-8?B?ald2enlIMGRIU256M3JCbllySU45Y044dlRmalpkRURTdUZWYkV6RjVRZTVv?=
 =?utf-8?B?amxlY2J5akFuM1VoTW1HY3RqL3JhVnl5eFV3UURDUGZVbmtZbFVFM2o3ZjRh?=
 =?utf-8?B?OEJTSEhiNkZVc2pCaGFqQWxYcHJ6RDhzQStmTmVxZVdYekN4dkUrd3dKY1BC?=
 =?utf-8?B?dkpPZWFxZ1RieTRsRWc0bWdob2FpdUNGNjZsSUdkWWxkTzc4YW9qVXBvMDJj?=
 =?utf-8?B?ckVCOTU4SGVQZWxYdlplSkJhYnVpano0VExjVGxmTGFqSmVLcm13OEhoeTV2?=
 =?utf-8?B?RHFhRHhSY1B3RlhZajAxWHJ5alFnSldwL2w2dzYvL0VMZ2VaempCZDcvUHZs?=
 =?utf-8?B?ZEx1Vis0YnM3bU1uM2tPYVZQdFNUZS8wdVFjSFliWFRBMTI2dFlUMkJQUGxC?=
 =?utf-8?B?and3UlFLWmRMOTBubElOMjk5MThrblN6cVd5QloyZ1Vjb1ZlSXptK2VFa2FV?=
 =?utf-8?B?R2hjZjFhcEcrdGlNMVhvRTJBL1hqVkVwRDlSS2NmQUpxNktpRUVmYjN4NTNR?=
 =?utf-8?B?aTA5Vm9VelFnNHRsdlVEWk14Z0VRZUZCN1VRU2R1RTBUdDNuN2ZDOHBPZEk4?=
 =?utf-8?B?N1Z6bHJmVUtjTWlCQnN4UWMrUmxJa3NxdXZ4ZUlEclFDMktGRVlUTk1xT21y?=
 =?utf-8?B?MjEwY1ZDQ0xGZ1VRaXV5YmZodm5aY1FZZkFPV0U1NmpMTGF0T1puNzBmL1lP?=
 =?utf-8?B?eVVMeWQ5NEUwaUduU0pMeVEwcnpiZVphaG1jNGZXS2xZdVBoVlZHSys5T1ZJ?=
 =?utf-8?B?RnZzU3lrQkdFNUVtNGhjb3gyQnk0VHdJVHVLOWRCcUQxTzl5RjNzZm9xVnFt?=
 =?utf-8?B?VzFyVis4eUZRK3dkZFFTTjdvb0tIcGNJU0o1ZHhSM1Z4Rjk5NkkyZ0QvOXVz?=
 =?utf-8?B?elNoWE1DSDJINjdxK0dicHZpdW4wL1plMkFZYm1oUzlhaUZ4ald1WG1qTkNB?=
 =?utf-8?B?NEFoeEtIMWxNd3FmMWR6UFlOa0l3dDFJaktIR3RicFhIcEtLdnNWWW9lVDVC?=
 =?utf-8?B?dFAyaVpGb1J4NmtTTDBDUTJmYzh2UUd0QU9MQzlURllNcjRKeTdaN3cyYTA3?=
 =?utf-8?B?TG0xd3dqcHBueDEySTg4ak0xOUN1ZHFOdFJnYzl5bytkcHNVSGtCczN2dkM0?=
 =?utf-8?B?RWdEeXhhR3J3WnBWUUZHV2dZWUU1aEFwcDJObGpLcjArOEo3d0NGcVBIaWRI?=
 =?utf-8?B?TmJ1VHppZkZrcVRPbURhL0x2Q09nOG93RlRvTVp0RStjQjd0UzNVSmU5ZFln?=
 =?utf-8?B?ZmtyaG9VVlFEKzdmZmpTNm5HeTFUekZHWlNYU0krVXphR0NVaU5xQWExb29J?=
 =?utf-8?B?VmVWTXhOb0RVdmZod2VFeVhjOGN6NTNlV0RtckJCMXRWYzVFR1pPRTJsQlJX?=
 =?utf-8?B?WWpVeVZDTTZwSGVkT1VDejFrcW1mMk1PNFFOR1hQNVl5RU8ydWNjRkh6cTRK?=
 =?utf-8?B?R09ubldVcDdvemIzTDkvajVKcmVocEZpSHVKK1VnWUJnblNLZlBMMExwaDRp?=
 =?utf-8?B?d1k2R2NTQW5MRlpGdWhzdjI0NUFKVVkxN2lNNjNZTXpzbWMxb21pNXE3QUlW?=
 =?utf-8?B?eVhQTVIxS21EYXJuTzFWRXlhSTdROWhiRDJmQmRpVStUUm1xMm1Ua29YMGtx?=
 =?utf-8?B?Zmo4VEFPUFFFK2xsRlBDaFIweVBkZ2xqdWpyZ2JaSWlIcmNiL09SaXdCRkhH?=
 =?utf-8?B?dkd0eUhIQlVWcFMydmZDRWF1UWtjajlVcWJPdXJjVHB6a0h0WkZNOXlCMEJF?=
 =?utf-8?B?YzRtZzZTbmoxRUs2MnNTd25pM29uUUR3ZzZFSVQxNXhLcWNOSk9NVmNTS1B5?=
 =?utf-8?B?ZXBpaXFCaDlaazI1OVlGOFJZZWY4SWRYWEFoanA2WHk5MTRPWlIxdlNOVU93?=
 =?utf-8?B?MDZ5bXV1ejgveHN3V3BrWk1VajZYekdyTnNUeEt0ZjBoQzAzM0gvOUVuVk5K?=
 =?utf-8?B?WjhmL1dwaFVuRWR2M3RuVHpFMndXSVl5NDdTNW52ZmNMdlpKa2RsNEloSndp?=
 =?utf-8?Q?6d4M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9BE7E83E4164B4D820136B65046DB96@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbda6b29-8e6f-4a12-5e81-08dd1b802ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 14:12:27.9010 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cPYix8wv+hPX4RwzHp+IPTacDdxEGkTqlrYWcmCLX88LyeFyXteDfMkcCc5MnQjt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8902
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

T24gMTEvMTIvMjAyNCAxMi4yNiwgRGFuaWxvIEtydW1tcmljaCB3cm90ZToNCj4gT24gVGh1LCBP
Y3QgMzEsIDIwMjQgYXQgMDE6NTI6MzdBTSAtMDcwMCwgWmhpIFdhbmcgd3JvdGU6DQo+PiBUaGUg
bmFtZSAicmVwYyIgaGFzIGRpZmZlcmVudCBtZWFuaW5ncyBpbiBkaWZmZXJlbnQgY29udGV4dHMu
DQo+Pg0KPj4gVG8gaW1wcm92ZSB0aGUgcmVhZGFiaWxpdHksIGl0J3MgYmV0dGVyIHRvIHJlZmlu
ZSBpdCB0byBhIG5hbWUgdGhhdA0KPj4gcmVmbGVjdHMgd2hhdCBpdCBhY3R1YWxseSByZXByZXNl
bnRzLg0KPj4NCj4+IFJlbmFtZSAicmVwYyIgdG8gImdzcF9ycGNfbGVuIiBpbiB0aGUgR1NQIG1l
c3NhZ2UgcmVjdiBwYXRoLiBBZGQgYW4NCj4+IHNlY3Rpb24gaW4gdGhlIGRvYyB0byBleHBsYWlu
IHRoZSB0ZXJtcy4NCj4+DQo+PiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpcyBpbnRlbmRlZC4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBaaGkgV2FuZyA8emhpd0BudmlkaWEuY29tPg0KPj4gLS0tDQo+
PiAgIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUuYyAgICB8IDQ2ICsr
KysrKysrKysrLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyks
IDE5IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvZ3NwL3I1MzUuYw0KPj4gaW5kZXggMWEwN2MwMTkxMzU2Li5mNmVkNTE5MjFlNTAg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3Av
cjUzNS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3Av
cjUzNS5jDQo+PiBAQCAtMTA0LDYgKzEwNCw5IEBADQo+PiAgICAqIHwgICAgICAgIHBhcmFtcyAg
ICAgICAgICB8DQo+PiAgICAqICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+PiAgICAqDQo+
PiArICogZGVjb2RlcnM6DQo+IA0KPiBNYXliZSBub21lbmNsYXR1cmUgb3IgdGVybWlub2xvZ3kg
aW5zdGVhZD8NCj4gDQpDYW4gZG8uDQo+PiArICoNCj4+ICsgKiAtIGdzcF9ycGNfbGVuOiBzaXpl
IG9mIChHU1AgUlBDIGhlYWRlciArIHBheWxvYWQpDQo+PiAgICAqLw0KPj4gICANCj4+ICAgc3Ry
dWN0IHI1MzVfZ3NwX21zZyB7DQo+PiBAQCAtMTMzLDcgKzEzNiw4IEBAIHI1MzVfcnBjX3N0YXR1
c190b19lcnJubyh1aW50MzJfdCBycGNfc3RhdHVzKQ0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0
aWMgdm9pZCAqDQo+PiAtcjUzNV9nc3BfbXNncV93YWl0KHN0cnVjdCBudmttX2dzcCAqZ3NwLCB1
MzIgcmVwYywgdTMyICpwcmVwYywgaW50ICpwdGltZSkNCj4+ICtyNTM1X2dzcF9tc2dxX3dhaXQo
c3RydWN0IG52a21fZ3NwICpnc3AsIHUzMiBnc3BfcnBjX2xlbiwgdTMyICpwcmVwYywNCj4+ICsJ
CSAgIGludCAqcHRpbWUpDQo+PiAgIHsNCj4+ICAgCXN0cnVjdCByNTM1X2dzcF9tc2cgKm1xZTsN
Cj4+ICAgCXUzMiBzaXplLCBycHRyID0gKmdzcC0+bXNncS5ycHRyOw0KPj4gQEAgLTE0MSw3ICsx
NDUsOCBAQCByNTM1X2dzcF9tc2dxX3dhaXQoc3RydWN0IG52a21fZ3NwICpnc3AsIHUzMiByZXBj
LCB1MzIgKnByZXBjLCBpbnQgKnB0aW1lKQ0KPj4gICAJdTggKm1zZzsNCj4+ICAgCXUzMiBsZW47
DQo+PiAgIA0KPj4gLQlzaXplID0gRElWX1JPVU5EX1VQKEdTUF9NU0dfSERSX1NJWkUgKyByZXBj
LCBHU1BfUEFHRV9TSVpFKTsNCj4+ICsJc2l6ZSA9IERJVl9ST1VORF9VUChHU1BfTVNHX0hEUl9T
SVpFICsgZ3NwX3JwY19sZW4sDQo+PiArCQkJICAgIEdTUF9QQUdFX1NJWkUpOw0KPj4gICAJaWYg
KFdBUk5fT04oIXNpemUgfHwgc2l6ZSA+PSBnc3AtPm1zZ3EuY250KSkNCj4+ICAgCQlyZXR1cm4g
RVJSX1BUUigtRUlOVkFMKTsNCj4+ICAgDQo+PiBAQCAtMTY3LDIxICsxNzIsMjEgQEAgcjUzNV9n
c3BfbXNncV93YWl0KHN0cnVjdCBudmttX2dzcCAqZ3NwLCB1MzIgcmVwYywgdTMyICpwcmVwYywg
aW50ICpwdGltZSkNCj4+ICAgCQlyZXR1cm4gbXFlLT5kYXRhOw0KPj4gICAJfQ0KPj4gICANCj4+
IC0Jc2l6ZSA9IEFMSUdOKHJlcGMgKyBHU1BfTVNHX0hEUl9TSVpFLCBHU1BfUEFHRV9TSVpFKTsN
Cj4+ICsJc2l6ZSA9IEFMSUdOKGdzcF9ycGNfbGVuICsgR1NQX01TR19IRFJfU0laRSwgR1NQX1BB
R0VfU0laRSk7DQo+PiAgIA0KPj4gLQltc2cgPSBrdm1hbGxvYyhyZXBjLCBHRlBfS0VSTkVMKTsN
Cj4+ICsJbXNnID0ga3ZtYWxsb2MoZ3NwX3JwY19sZW4sIEdGUF9LRVJORUwpOw0KPj4gICAJaWYg
KCFtc2cpDQo+PiAgIAkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQo+PiAgIA0KPj4gICAJbGVu
ID0gKChnc3AtPm1zZ3EuY250IC0gcnB0cikgKiBHU1BfUEFHRV9TSVpFKSAtIHNpemVvZigqbXFl
KTsNCj4+IC0JbGVuID0gbWluX3QodTMyLCByZXBjLCBsZW4pOw0KPj4gKwlsZW4gPSBtaW5fdCh1
MzIsIGdzcF9ycGNfbGVuLCBsZW4pOw0KPj4gICAJbWVtY3B5KG1zZywgbXFlLT5kYXRhLCBsZW4p
Ow0KPj4gICANCj4+IC0JcmVwYyAtPSBsZW47DQo+PiArCWdzcF9ycGNfbGVuIC09IGxlbjsNCj4+
ICAgDQo+PiAtCWlmIChyZXBjKSB7DQo+PiArCWlmIChnc3BfcnBjX2xlbikgew0KPj4gICAJCW1x
ZSA9ICh2b2lkICopKCh1OCAqKWdzcC0+c2htLm1zZ3EucHRyICsgMHgxMDAwICsgMCAqIDB4MTAw
MCk7DQo+PiAtCQltZW1jcHkobXNnICsgbGVuLCBtcWUsIHJlcGMpOw0KPj4gKwkJbWVtY3B5KG1z
ZyArIGxlbiwgbXFlLCBnc3BfcnBjX2xlbik7DQo+PiAgIAl9DQo+PiAgIA0KPj4gICAJcnB0ciA9
IChycHRyICsgRElWX1JPVU5EX1VQKHNpemUsIEdTUF9QQUdFX1NJWkUpKSAlIGdzcC0+bXNncS5j
bnQ7DQo+PiBAQCAtMTkyLDkgKzE5Nyw5IEBAIHI1MzVfZ3NwX21zZ3Ffd2FpdChzdHJ1Y3QgbnZr
bV9nc3AgKmdzcCwgdTMyIHJlcGMsIHUzMiAqcHJlcGMsIGludCAqcHRpbWUpDQo+PiAgIH0NCj4+
ICAgDQo+PiAgIHN0YXRpYyB2b2lkICoNCj4+IC1yNTM1X2dzcF9tc2dxX3JlY3Yoc3RydWN0IG52
a21fZ3NwICpnc3AsIHUzMiByZXBjLCBpbnQgKnB0aW1lKQ0KPj4gK3I1MzVfZ3NwX21zZ3FfcmVj
dihzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdTMyIGdzcF9ycGNfbGVuLCBpbnQgKnB0aW1lKQ0KPj4g
ICB7DQo+PiAtCXJldHVybiByNTM1X2dzcF9tc2dxX3dhaXQoZ3NwLCByZXBjLCBOVUxMLCBwdGlt
ZSk7DQo+PiArCXJldHVybiByNTM1X2dzcF9tc2dxX3dhaXQoZ3NwLCBnc3BfcnBjX2xlbiwgTlVM
TCwgcHRpbWUpOw0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMgaW50DQo+PiBAQCAtMzE3LDcg
KzMyMiw3IEBAIHI1MzVfZ3NwX21zZ19kdW1wKHN0cnVjdCBudmttX2dzcCAqZ3NwLCBzdHJ1Y3Qg
bnZmd19nc3BfcnBjICptc2csIGludCBsdmwpDQo+PiAgIH0NCj4+ICAgDQo+PiAgIHN0YXRpYyBz
dHJ1Y3QgbnZmd19nc3BfcnBjICoNCj4+IC1yNTM1X2dzcF9tc2dfcmVjdihzdHJ1Y3QgbnZrbV9n
c3AgKmdzcCwgaW50IGZuLCB1MzIgcmVwYykNCj4+ICtyNTM1X2dzcF9tc2dfcmVjdihzdHJ1Y3Qg
bnZrbV9nc3AgKmdzcCwgaW50IGZuLCB1MzIgZ3NwX3JwY19sZW4pDQo+PiAgIHsNCj4+ICAgCXN0
cnVjdCBudmttX3N1YmRldiAqc3ViZGV2ID0gJmdzcC0+c3ViZGV2Ow0KPj4gICAJc3RydWN0IG52
ZndfZ3NwX3JwYyAqbXNnOw0KPj4gQEAgLTM0MiwxMCArMzQ3LDExIEBAIHI1MzVfZ3NwX21zZ19y
ZWN2KHN0cnVjdCBudmttX2dzcCAqZ3NwLCBpbnQgZm4sIHUzMiByZXBjKQ0KPj4gICAJcjUzNV9n
c3BfbXNnX2R1bXAoZ3NwLCBtc2csIE5WX0RCR19UUkFDRSk7DQo+PiAgIA0KPj4gICAJaWYgKGZu
ICYmIG1zZy0+ZnVuY3Rpb24gPT0gZm4pIHsNCj4+IC0JCWlmIChyZXBjKSB7DQo+PiAtCQkJaWYg
KG1zZy0+bGVuZ3RoIDwgc2l6ZW9mKCptc2cpICsgcmVwYykgew0KPj4gKwkJaWYgKGdzcF9ycGNf
bGVuKSB7DQo+PiArCQkJaWYgKG1zZy0+bGVuZ3RoIDwgc2l6ZW9mKCptc2cpICsgZ3NwX3JwY19s
ZW4pIHsNCj4+ICAgCQkJCW52a21fZXJyb3Ioc3ViZGV2LCAibXNnIGxlbiAlZCA8ICV6ZFxuIiwN
Cj4+IC0JCQkJCSAgIG1zZy0+bGVuZ3RoLCBzaXplb2YoKm1zZykgKyByZXBjKTsNCj4+ICsJCQkJ
CSAgIG1zZy0+bGVuZ3RoLCBzaXplb2YoKm1zZykgKw0KPj4gKwkJCQkJICAgZ3NwX3JwY19sZW4p
Ow0KPj4gICAJCQkJcjUzNV9nc3BfbXNnX2R1bXAoZ3NwLCBtc2csIE5WX0RCR19FUlJPUik7DQo+
PiAgIAkJCQlyNTM1X2dzcF9tc2dfZG9uZShnc3AsIG1zZyk7DQo+PiAgIAkJCQlyZXR1cm4gRVJS
X1BUUigtRUlPKTsNCj4+IEBAIC00MTQsNyArNDIwLDggQEAgcjUzNV9nc3BfcnBjX3BvbGwoc3Ry
dWN0IG52a21fZ3NwICpnc3AsIHUzMiBmbikNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIHZv
aWQgKg0KPj4gLXI1MzVfZ3NwX3JwY19zZW5kKHN0cnVjdCBudmttX2dzcCAqZ3NwLCB2b2lkICph
cmd2LCBib29sIHdhaXQsIHUzMiByZXBjKQ0KPj4gK3I1MzVfZ3NwX3JwY19zZW5kKHN0cnVjdCBu
dmttX2dzcCAqZ3NwLCB2b2lkICphcmd2LCBib29sIHdhaXQsDQo+PiArCQkgIHUzMiBnc3BfcnBj
X2xlbikNCj4+ICAgew0KPj4gICAJc3RydWN0IG52ZndfZ3NwX3JwYyAqcnBjID0gY29udGFpbmVy
X29mKGFyZ3YsIHR5cGVvZigqcnBjKSwgZGF0YSk7DQo+PiAgIAlzdHJ1Y3QgbnZmd19nc3BfcnBj
ICptc2c7DQo+PiBAQCAtNDM0LDcgKzQ0MSw3IEBAIHI1MzVfZ3NwX3JwY19zZW5kKHN0cnVjdCBu
dmttX2dzcCAqZ3NwLCB2b2lkICphcmd2LCBib29sIHdhaXQsIHUzMiByZXBjKQ0KPj4gICAJCXJl
dHVybiBFUlJfUFRSKHJldCk7DQo+PiAgIA0KPj4gICAJaWYgKHdhaXQpIHsNCj4+IC0JCW1zZyA9
IHI1MzVfZ3NwX21zZ19yZWN2KGdzcCwgZm4sIHJlcGMpOw0KPj4gKwkJbXNnID0gcjUzNV9nc3Bf
bXNnX3JlY3YoZ3NwLCBmbiwgZ3NwX3JwY19sZW4pOw0KPj4gICAJCWlmICghSVNfRVJSX09SX05V
TEwobXNnKSkNCj4+ICAgCQkJcmVwdiA9IG1zZy0+ZGF0YTsNCj4+ICAgCQllbHNlDQo+PiBAQCAt
NzcwLDcgKzc3Nyw4IEBAIHI1MzVfZ3NwX3JwY19nZXQoc3RydWN0IG52a21fZ3NwICpnc3AsIHUz
MiBmbiwgdTMyIGFyZ2MpDQo+PiAgIH0NCj4+ICAgDQo+PiAgIHN0YXRpYyB2b2lkICoNCj4+IC1y
NTM1X2dzcF9ycGNfcHVzaChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdm9pZCAqYXJndiwgYm9vbCB3
YWl0LCB1MzIgcmVwYykNCj4+ICtyNTM1X2dzcF9ycGNfcHVzaChzdHJ1Y3QgbnZrbV9nc3AgKmdz
cCwgdm9pZCAqYXJndiwgYm9vbCB3YWl0LA0KPj4gKwkJICB1MzIgZ3NwX3JwY19sZW4pDQo+PiAg
IHsNCj4+ICAgCXN0cnVjdCBudmZ3X2dzcF9ycGMgKnJwYyA9IGNvbnRhaW5lcl9vZihhcmd2LCB0
eXBlb2YoKnJwYyksIGRhdGEpOw0KPj4gICAJc3RydWN0IHI1MzVfZ3NwX21zZyAqY21kID0gY29u
dGFpbmVyX29mKCh2b2lkICopcnBjLCB0eXBlb2YoKmNtZCksIGRhdGEpOw0KPj4gQEAgLTgxNyw3
ICs4MjUsNyBAQCByNTM1X2dzcF9ycGNfcHVzaChzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwgdm9pZCAq
YXJndiwgYm9vbCB3YWl0LCB1MzIgcmVwYykNCj4+ICAgDQo+PiAgIAkJLyogV2FpdCBmb3IgcmVw
bHkuICovDQo+PiAgIAkJaWYgKHdhaXQpIHsNCj4+IC0JCQlycGMgPSByNTM1X2dzcF9tc2dfcmVj
dihnc3AsIGZuLCByZXBjKTsNCj4+ICsJCQlycGMgPSByNTM1X2dzcF9tc2dfcmVjdihnc3AsIGZu
LCBnc3BfcnBjX2xlbik7DQo+PiAgIAkJCWlmICghSVNfRVJSX09SX05VTEwocnBjKSkNCj4+ICAg
CQkJCXJlcHYgPSBycGMtPmRhdGE7DQo+PiAgIAkJCWVsc2UNCj4+IEBAIC04MjYsNyArODM0LDcg
QEAgcjUzNV9nc3BfcnBjX3B1c2goc3RydWN0IG52a21fZ3NwICpnc3AsIHZvaWQgKmFyZ3YsIGJv
b2wgd2FpdCwgdTMyIHJlcGMpDQo+PiAgIAkJCXJlcHYgPSBOVUxMOw0KPj4gICAJCX0NCj4+ICAg
CX0gZWxzZSB7DQo+PiAtCQlyZXB2ID0gcjUzNV9nc3BfcnBjX3NlbmQoZ3NwLCBhcmd2LCB3YWl0
LCByZXBjKTsNCj4+ICsJCXJlcHYgPSByNTM1X2dzcF9ycGNfc2VuZChnc3AsIGFyZ3YsIHdhaXQs
IGdzcF9ycGNfbGVuKTsNCj4+ICAgCX0NCj4+ICAgDQo+PiAgIGRvbmU6DQo+PiAtLSANCj4+IDIu
MzQuMQ0KPj4NCg0K
