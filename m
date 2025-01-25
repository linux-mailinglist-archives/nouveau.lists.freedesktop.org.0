Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80544A1C359
	for <lists+nouveau@lfdr.de>; Sat, 25 Jan 2025 13:52:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821610E050;
	Sat, 25 Jan 2025 12:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cTXNw/35";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BAEF10E050
 for <nouveau@lists.freedesktop.org>; Sat, 25 Jan 2025 12:52:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImQ7cMMPtZzf6yCd7vKCtrWdSIWYz5Ik3IPdf/kXCXXqU5p3jIe4JQhHVkqb9y1HDAbx70JBbqBASOZTaXdGciwRL5rG+4z+yH4y7TASdGvWcp8F0QbaiooAmDmXJX0tFOcuexhPZ3MOn5TQji60Z9Px8O9dsnux0TZq4tgD3I+xUVE8Hukjn0VlKxmz6LlVpG5lZdbZo0yuWuPFKxSBV6Dm6N1RPjruvsqw3aZfjLy3zgNCFkXb+bX/C7ciBYwQqvzVLC/ZQdcYxCfxRn/vD+Yd9EFYDDshQlBHCe0C4t2gbFPkm5wYuXsIEsF+DJtNNSXqF/wMb9Q4UCjwZEM3bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2zUaCEweMuIJL2TbFJQ7usYlcpobohDrsDcyWE4vr0=;
 b=GKMkAZbphaQJkyhCxiy5fRs3fvhbNWa2x13Df1aFqBW95QIL5YEk2/6oV7gSEtTsqgkth7rkUL77q9frSJHWgdUzGjpK/QDboGHX7AgRnRKLrXgdlPEhNOl87iueIoCyobMHgPQcJqpnrVH2YNQ4u4O3Ptq3/67B48vLxEqAx/shv+RPE9NYr5kZJqICkPR/RzTMU0/39unsikwFWMiiMR+Ze16dmwXV2Ln0FfQoPA+YbJD3iKQhvYzeOi/9BTLFEXgL42x76WVrHg6F7ja6nPYZqsisL3RRThDNq0UPfplHndr7dBJgkVWBQjoo5pqkZuoVMYRfFBa2K9EjMtOmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2zUaCEweMuIJL2TbFJQ7usYlcpobohDrsDcyWE4vr0=;
 b=cTXNw/35xMBY6XXCiEPvOwUrz8FFFVXP6ZTspzdO4UF4vFtv5TMMxnzDKA1soRFtzcHllxqqVbwOgcz7JukA81bjq+hJ6Wy+ssKbez5X5G/DGvYAQJM5vMbmcdf+JAp5apTrANhBU8huG4DFZomwyPWQdk5IfVidVOmHroW6nCJNJG176m1SQ3u8Jqb9RXlhWWF9tybiNKZ2mXFvLEb/mBNThlMYIyI96MCdd3R6t+cFF6yxG0RuqjQfxYZu5itkA/gXpL1LlbB6yQak2YZ6b8mXbMd9cSaCxnNG9pOiY5lYEfQYLaPtyRUZs77zYgpxfrm1fE1DzHL2k3mY6mMitw==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by PH7PR12MB7115.namprd12.prod.outlook.com (2603:10b6:510:1ee::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sat, 25 Jan
 2025 12:52:15 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%6]) with mapi id 15.20.8377.021; Sat, 25 Jan 2025
 12:52:14 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Ben Skeggs <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH v4 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
Thread-Topic: [PATCH v4 00/15] NVKM GSP RPC kernel docs, cleanups and fixes
Thread-Index: AQHbbo4Um38K4K497kS7dTAmmjnme7MmmnAAgADYYgA=
Date: Sat, 25 Jan 2025 12:52:14 +0000
Message-ID: <7eb31f1f-fc3a-4fb5-86cf-4bd011d68ff1@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
 <Z5Qo_gPB_ySj4zSb@pollux>
In-Reply-To: <Z5Qo_gPB_ySj4zSb@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|PH7PR12MB7115:EE_
x-ms-office365-filtering-correlation-id: ebb38a5e-3691-4a95-0b87-08dd3d3f17bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WDJZM0x4ZE1XTTZlZWFYQ0VVM3Q2b0ZySTc5ZmszdUZYcEFvVUJ6RmtHblQ4?=
 =?utf-8?B?QUg2Q3BsczRCUTFyemxwcCs1SkdXeGFadys4anFmdldBL1JtNlZUY0VsM01p?=
 =?utf-8?B?NGN4aVdnZ1c4UUw2NW9Zemx4czMrbWVDRDI5VFZZRXJqZXNBa25GNklUaTJz?=
 =?utf-8?B?dzh4cGN3QXZySGp1YkczbUZHeFNsK1hHYnJ3N0NEanJEQ01FdFh1bSt4SWxu?=
 =?utf-8?B?UTBsdDVQMnpacVgvZEdTTHdwZ2RDcUFzMmVjVE4xUFFnZ3FOYUM3SlFVbk92?=
 =?utf-8?B?bDhpWGZJVVNWdkRWZmM4SU5ubDdwazl6US9tTjBHRVFrdWgzeTV0VHhTZ1lS?=
 =?utf-8?B?NkxuTFhRSmlQMjI4TGNzcEs0Q1B6M3hIUUhGZmRGSFgxRVlKd0hUN0YyYjFs?=
 =?utf-8?B?VDRDV21VNUpjQzZnNFBGVkErMjhrYmVwbExiTnd0NzhicitiVHhpdlFlREVO?=
 =?utf-8?B?dDhMTkVGRmJOcWNKM3ZheUxZY0VpZnRYTmlheXBLekI1L1kwUzlWeC8vZ0E4?=
 =?utf-8?B?bzR3UzdLa0lIN1E0VWRsOE9qMkd1S1NramJJbWhIdGRsMGxoODd3bzNrNndo?=
 =?utf-8?B?RXpWcVVyNVRRd0lvUGwzTXRBOXp5R2FyRmVVWDRvbWhuYzdXTnFDd2FuamlB?=
 =?utf-8?B?ZHVaeCtLazdoRWZzTTJKeVpCN0M2YkFDYlN0RXpyVi9PZmJRdi95V0xPMjhJ?=
 =?utf-8?B?Z2NrMWs5MFVIUXZhNU9wcGJhQUVVdjRDbVJKVGMvNkZkOCs1T3BEU3RjdWR4?=
 =?utf-8?B?b3BuRU8rVkw0SlhMYkRvZTBUYzBlUDA3RmFhNjNxd0FXWE5aMWNGYk1KVTNj?=
 =?utf-8?B?N2hWMFdIU0xWVDA0dEx1T0ZvNGhjdS8rRzY2NCs2QTgxVENDR2FQT3RmN09a?=
 =?utf-8?B?YkhYbm5aaEI4TmVtUmhudmI4NUtmSFg2WWRySlEzQkVpVkdBL2tCOGFpZFJ4?=
 =?utf-8?B?MzRQUzcvKzFGaENCOHR6aUhuMTMwY2dhSmRCYjc0ZFJRWjk4bGZyRklwdzVo?=
 =?utf-8?B?VGU3Q1B6aThsV1FFV040Q2hDWHVGSmljNUNGWktEUjhCNS9uOWpzcXBzdHk2?=
 =?utf-8?B?T2F4TElpd2dSOEc2YVJJMGtOaDU0aHArYkxaSzhHMTN4WnhZdGQ1WlhCNm1t?=
 =?utf-8?B?Zi9palV6VWtycE5aRUg5dzdNYlBaQ0ZnQXQ3NlBhWUhpa3dDOEpKc01PSzRK?=
 =?utf-8?B?T3U0TUhKL0k5Ky9McE93U0RRUk5xOGZZazhEbEkvWXg3VmhxUHpEUHV3MUFr?=
 =?utf-8?B?U25xWDRCUVgzVmVZL2tkTEFwZjJ3VjZRMXczTTZ3cWlJNndha3I2QUFqdU9h?=
 =?utf-8?B?RS9xZENyV3JJR3BvQmo2Y2RYcnR6dkxkTHQ2dTZJSnpQUnc3Mk9IbUVlbFNw?=
 =?utf-8?B?eWRvM2N0S1hGSUdrN3A0MENpbUkyZUJRWTRabWw5eFZialU1WTRlWVN5dkZi?=
 =?utf-8?B?VVB4SUZmU3BSOGlLRERjWjB4L0NwaU5MdXB3NW8zMjUvS2pmRyt3MFUwSFQ5?=
 =?utf-8?B?MFEyT1BTK1RSRUpkWHdFVGZKSWJLYmpBMmpEc0M2MURSeU45ZFRtenJ4WkJn?=
 =?utf-8?B?QXduMGlxN2Vid0dsWGtTTEdNNFNhR042Sk9vT3A5aWhIeEZLc0JIR3hYRDUw?=
 =?utf-8?B?TTBGZU51eURjWEcxN1FiQys4T1JLMHZ6U01zK1N2dmhxTHI4aEM1eGUreTd6?=
 =?utf-8?B?dWU0TGZwSGE3MDhwUVN3ZnRvRlF4bDUwOVlpa3pmMTEyN0N5M0UwUERIRllQ?=
 =?utf-8?B?elZYVnhCdDMvMkpiR0szbWhTenR0dlRHdlA0eHNkZXBscmJFcSsxczAybVQx?=
 =?utf-8?B?dlQxb2hNZ0RtSjlrTForaWtCRU9YMzFFTUFlZnV4YmdBbXgxMmNCTkU0cWNT?=
 =?utf-8?B?a01ya2xBVmxsS0FmQ2dDSGd3eUdMNXVTUng0alZIKzNGV29xaTJNM2UzdGY3?=
 =?utf-8?B?aTVoTHh1YUxXaUN1ZzlVb3JRbEJSOEozV0ZKdjlsclJqVjRrYnlFRGJhY2Vi?=
 =?utf-8?B?RVo0SVNBWlVRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTNJMWtSMU9LNkNyZW5SRjA2M3ZTV2ROTDVVelhtUFB2TTRKWFl4OEE3Wkhm?=
 =?utf-8?B?NjF3YURSZDMwRVhqVHlIdlhpdHpSRldlQmdSSzdPZ3ZvbEIybVJ2ZG8zRDRk?=
 =?utf-8?B?bnNWT0h0dHFjemFYUm1iMC9pMit2YWlEZi8yZmhkN29ZbVN6ZjJURjlHS3U4?=
 =?utf-8?B?VUsvdzl3ZXF4SnBUUXpXaVowTWIxRUs2YmtJZXZGN1ZpVHRYd2FseUpoWThW?=
 =?utf-8?B?ZUZaZC92dnVvZlFCbXRFS2dld3ZoNEdxQ09OR0lSbWtHUDZlejZFR3hjRDM2?=
 =?utf-8?B?Sm5SYUE0RmVOTjZsWmF2OUpaVko5QzdaVUhVbUpDQURFbkhseFBUR2tZMkcz?=
 =?utf-8?B?MHN6RWJXeEZkWiszMzdMS2ZiNnNjZEVOd0prdlRUaEc3a2lIOVA5YjNXcHJv?=
 =?utf-8?B?eVM3QzNLM09CNGdCN1Fub1RvNzRRc1hMbnF2YXJDR3Z0L0E2K2IrSGtJOXlZ?=
 =?utf-8?B?UFRMc1RtZXpWSlpqVlBHSGwvVDd5NFRmd0VBYzllK0tub2szaWl2OE1YSElF?=
 =?utf-8?B?RkdHTEhXeXEwRDBBSjEwU0lISXBQT21HNGtoWnVrYlQ3RDJKZDh3dHlvRCtr?=
 =?utf-8?B?Um5yWjBFTnBEaERneVpnbVEveEg5OHhPWXZrc3FtaWFQTjdiOVI4blZlVjN1?=
 =?utf-8?B?bUVlbjMyV3dlZ1Azc1JMRENRY2NXQkdoRHRhN0dZOEFUaDljd1RINmJwSDNh?=
 =?utf-8?B?bXRTTVN1RzlCR291bWF1SkQ3d3dKNEJHdjNtdU5RK1VHOEZPOEFJdFo3bEp5?=
 =?utf-8?B?aXcxUnNlRG9jZXIrUFpYT1F0cW9nM01GUEx6MXdiYnJrelphZDBkSzNFM2pn?=
 =?utf-8?B?b3FKUFRUaDVvVmVtZHpOVWxMUHNQbytwMjVsNlFvN01BbFh2OFFSemZDOGlY?=
 =?utf-8?B?V3Vyb0hvVmM2MGNHY3A1VTY5eDV0b0NLZzJiZldydEFvRXlvaTkvdDhrN2N0?=
 =?utf-8?B?Vis0UmxKZWVYaFVmVmZqVWlwS2VxTk81TGJwNlhCL1hSaUZuOUFsSkJDN25Y?=
 =?utf-8?B?NGNGK0JkcklJeEFNZFFXci93SEVFZkdIRnNRVDVyMWdNdTZNL0I5QkFCNXVw?=
 =?utf-8?B?UDhaOFNzWjFCVC9BYk96MVF6bHMrVG55WDRNYWtQY0s4bnpheU5UenRUcW1H?=
 =?utf-8?B?OFZ3Rzg3L1IvWkJtYi9JU0thSWNCb1FXZWtYcDNBblpBVGpySFplOFlmWWhp?=
 =?utf-8?B?RjMxQStycW83b2pMUVg1c2pqWHZxZ29CaER2NUxNbUpER1BOZUdNd0ZuVnlZ?=
 =?utf-8?B?akplb2VPaW1Pci9RWnk3UEY0UDhGM2txdUxkbHFnWG1NN1ZDQlNFSzNvQTl4?=
 =?utf-8?B?RTBZSHpUM3dSMTBOMVdVWHloc25ZMEtZcUtiYkp1WW1EYnZHRHc2WlpRcS96?=
 =?utf-8?B?USt4SCt2THJwTWZVQlMrV1p2QTdNMUkvcys1Zlcwamsxb1MxMGRYN0xOWFlE?=
 =?utf-8?B?Y2duQXVMZzd1TVYzOVdvWCswb2xlOFZRSCtpSEVCQ1cvV0ZpZzZBRDBzckJn?=
 =?utf-8?B?R2g0QTlMWGZYY1RleG40NUpNazN0ZUNvbUJ3TWZxTVNDcTRmT0U1Z1pvN01y?=
 =?utf-8?B?NTFRYVd5UzlkU3AxbDlqWUxwZ0hWdk4zY1ZKZ2JJcURWbDR5c3VQUS9DZG12?=
 =?utf-8?B?MXFtb2hVZ1pkSC8vbzR5TmM3QXRlSUkwU2J2Ry9UWWpyUzZEOCtBM2gyc3Np?=
 =?utf-8?B?MzhoYTMzdzdHUlc3b25nWDF5TzZqc25zNGVEMWR4aFdKejgyRnNic2x4bXhT?=
 =?utf-8?B?RW9JRlJ3TEFpUGpTcUhNUDVLcEt6QWFaKytib2w1RjFDUTY0bkxpM1B3MXNH?=
 =?utf-8?B?Um5kYzIza3doMW5VVGFXUWwvV0ZPekdEbnJ5dzBHbEZoZUVFck9SZ2gyY01F?=
 =?utf-8?B?WnA5RGRqNFI5ZDl6Ym5CcnRnd3YxZld3TzFhNThITW1TSVNhaTRiVFJzVXFZ?=
 =?utf-8?B?eXkzbW5FbGpJRXFjWmltRU1NdWdQV1NWVDF6eHZkdEcrVlhSK0V2dWpjZkJR?=
 =?utf-8?B?ZlZBTUdodFNldGlWdUZWZzMxaXVuNUtVYkhLaU13Qnp4ZWxqRTlhNFN0cGg3?=
 =?utf-8?B?a3RvWFlKaUpXM2pjOW4wWDJTVVkwZ0dGT3NxNW9UZUZYTGpkcW5MUDJPeWJu?=
 =?utf-8?Q?mKPM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F84E440A58EBFF4AB44B326AD17D9DDC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb38a5e-3691-4a95-0b87-08dd3d3f17bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2025 12:52:14.6953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fRHS1wS0qbNWqWBP28zzvnUJ+F5Rn37m+G6dcwMjrlqEZV4HP/aHrT4ksDxDa1T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7115
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

T24gMjUvMDEvMjAyNSAxLjU3LCBEYW5pbG8gS3J1bW1yaWNoIHdyb3RlOg0KPiBIaSBaaGksDQo+
DQo+IE9uIEZyaSwgSmFuIDI0LCAyMDI1IGF0IDEwOjI5OjQzQU0gLTA4MDAsIFpoaSBXYW5nIHdy
b3RlOg0KPj4gSGkgZm9sa3M6DQo+Pg0KPj4gSGVyZSBpcyBhbm90aGVyIHJlLXNwaW4gb2YgaGFu
ZGxpbmcgdGhlIGxhcmdlIEdTUCBtZXNzYWdlIHJldHVybi4NCj4+DQo+PiBCZXNpZGVzIHRoZSBz
dXBwb3J0IG9mIHRoZSBsYXJnZSBHU1AgbWVzc2FnZSwga2VybmVsIGRvYyBhbmQgbWFueSBjbGVh
bnVwcw0KPj4gYXJlIGludHJvZHVjZWQgYWNjb3JkaW5nIHRvIHRoZSBjb21tZW50cyBpbiB0aGUg
cHJldmlvdXMgc3BpbiBbMV0uDQo+Pg0KPj4gRm9yIHRlc3RpbmcsIEkgdHJpZWQgdGhlIGZvbGxv
d2luZyB3aXRob3V0IGFueSBwcm9ibGVtOg0KPj4NCj4+IC0gcnVuIFVuaWVuZ2luZSBIZWF2ZW4g
WzJdIG9uIG15IFJUWCA0MDYwIGZvciA4IGhvdXJzDQo+PiAtIHRoZSBHTCBDVFMgcnVubmVyIFsz
XSAoY29tbWFuZGxpbmU6IC4vY3RzLXJ1bm5lciAtLXR5cGUtZ2w0MCkgZnJvbQ0KPj4gS2hyb25v
cw0KPj4gLSB3aXRoIHRoZSB2R1BVIFJGQyBwYXRjaGVzIFs0XSwgYm9vdCB1cCBhIHVidW50dSBW
TSB3aXRoIGEgdkdQVSBvbiBhIEw0MA0KPj4gYW5kIHJ1biBnbG1hcmsyLg0KPiBBcHBsaWVkIHRv
IGRybS1taXNjLW5leHQuDQo+DQo+IFRoYW5rcyBhIGxvdCBmb3IgdGhpcyBzZXJpZXMgYW5kIHRo
ZSBpdGVyYXRpb25zIC0tIHRob3NlIGFyZSByZWFsbHkgZ29vZA0KPiBpbXByb3ZlbWVudHMuDQo+
DQo+IEkgZml4ZWQgdXAgdGhlIGZpcnN0IGNvbW1pdCAiZHJtL25vdXZlYXU6IGFkZCBhIGtlcm5l
bCBkb2MgdG8gaW50cm9kdWNlIHRoZSBHU1ANCj4gUlBDIiwgd2hpY2ggaGFkIHNvbWUgaW5kZW50
YXRpb24gaXNzdWVzIGluIHRoZSBidWxsZXQgbGlzdCBhbmQgdGhlIG5ldyBmaWxlIHdhcw0KPiBt
aXNzaW5nIHRoZSBTUERYLUxpY2Vuc2UtSWRlbnRpZmllci4NCg0KSGkgRGFuaWxvOg0KDQpUaGFu
a3Mgc28gbXVjaCBmb3IgdGhlIGVmZm9ydHMuDQoNCkkgZGlkIHNlZSBjaGVja3BhdGNoLnBsIHJl
cG9ydGluZyBhYm91dCBTUERYLUxpY2Vuc2UgaW4gcnN0IGRvYy4gQnV0IEkgDQpkb3VibGUgY2hl
Y2tlZCBhbGwgdGhlDQoNCm90aGVyIGRvY3MuIEUuZy4gRG9jdW1lbnRhdGlvbi9ncHUve2luZGV4
LnJzdCwgZHJpdmVycy5yc3R9LiBJdCBzZWVtcyANCm5vbmUgb2YgdGhlbSBoYXMgdGhlDQoNClNQ
RFggaGVhZGVycy4gSSB0aG91Z2h0IGl0IHdhcyBhIGZhbHNlIHdhcm5pbmcuLi5XaWxsIHJlYWNo
IHlvdSBpbiB0aGUgDQpJUkMgdG8gY29uZmlybSBpdCBuZXh0DQoNCnRpbWUuDQoNCj4gV2hlbiBh
ZGRpbmcgZG9jdW1lbnRhdGlvbiwgcGxlYXNlIG1ha2Ugc3VyZSB0byBjaGVjayB0aGUgcmVzdWx0
IGFmdGVyIHJ1bm5pbmcNCj4gdGhlIGh0bWxkb2NzIG1ha2UgdGFyZ2V0Lg0KDQpUaGFua3MgZm9y
IHRoYXQuIEkgZGlkIHRlc3QgdGhlIGRvY3VtZW50YXRpb24gZ2VuZXJhdGlvbiB2aWEgbWFrZSAN
Cmh0bWxkb2NzIGFuZCB4bWxkb2NzDQoNCnRvIG1ha2Ugc3VyZSB0aGUgZG9jIGdlbmVyYXRlZCBj
b3JyZWN0bHkuIEkgdGhpbmsgeW91IHdlcmUgdGFsa2luZyBhYm91dCANCnRoZSBidWxsZXRzIHBh
cnRzDQoNCmluIHRoZSBjb2RlIHdoZXJlIEkgdHJpZWQgdG8ga2VlcCB0aGUgbGVuZ3RoIG9mIHRo
ZSBsaW5lIDwgODAgYnV0IHRoZXkgDQpzZWVtcyBmb2xkZWQgaW4gdGhlDQoNCm91dHB1dC4gSGF2
ZW4ndCBmaWd1cmVkIG91dCBhIGFwcHJvYWNoIGhvdyB0byBmaXggdGhlbS4gSSB3aWxsIGNoZWNr
IA0KeW91ciBmaXhlcy4NCg0KPiBJIGFsc28gZml4ZWQgdXAgb25lIG1pbm9yIGluZGVudGF0aW9u
IGlzc3VlIGluIG9uZSBvZiB0aGUgb3RoZXIgcGF0Y2hlcy4NCg0KSXQgd291bGQgYmUgbmljZSB0
aGF0IHlvdSBjYW4gc2hhcmUgeW91ciBjaGVja3BhdGNoLnBsIGNvbW1hbmQgbGluZS4gU28gDQp0
aGF0IHdlIGNhbiBhbGlnbg0KDQp3aXRoIGl0LiBXaWxsIHJlYWNoIHlvdSBpbiB0aGUgSVJDIG5l
eHQgdGltZSBpZiBJIHRoaW5rIHNvbWV0aGluZyBsb29rcyANCmxpa2UgYSBmYWxzZSB3YXJuaW5n
DQoNCmJlZm9yZSBwb3N0aW5nIHRoZSBwYXRjaGVzLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXch
DQoNClouDQoNCj4NCj4gQWdhaW4sIHRoYW5rcyBmb3IgdGhlIHNlcmllcyENCj4NCj4gLSBEYW5p
bG8NCj4NCj4+IHY0Og0KPj4gLSBJbnRyb2R1Y2UgYSBkb2N1bWVudGF0aW9uIGluIERvY3VtZW50
YXRpb24vZ3B1L25vdXZlYXUucnN0Lg0KPj4gLSBGaXggdGhlIHJlZmVyZW5jZSBsaW5rIG9mIE5W
SURJQSBTREsgaGVhZGVycyBpbiB0aGUgZG9jdW1lbnQuDQo+PiAtIFJlcGxhY2UgdGhlICJkZWNv
ZGVycyIgdGVybSB3aXRoICJ0ZXJtaW5vbG9neSIuDQo+PiAtIEV4cGxhaW4gdGhlIGFkZGluZyBv
ZmZzZXQgaW4gcjUzNV9nc3BfbXNncV9nZXRfZW50cnkoKS4NCj4+IC0gUmVwbGFjZSB0aGUgbWFn
aWMgbnVtYmVyIDB4MTAwMCB3aXRoIEdTUF9QQUdFX1NJWkUgaW4gdGhlIHJlLWZhY3Rvci4NCj4+
IC0gSW50cm9kdWNlIGEgRE9DIHRvIGV4cGxhaW4gdGhlIEdTUCBtZXNzYWdlIHJlY2VpdmluZyBm
bG93Lg0KPj4NCj4+IHYzOg0KPj4NCj4+IC0gQWRkIGEga2VybmVsIGRvYyBhbmQgY2hhcnQgdG8g
aW50cm9kdWNlIHRoZSBHU1AgbWVzc2FnZSBhbmQgZGVub3RlIHRoZQ0KPj4gbWVtb3J5IGxheW91
dC4NCj4+IC0gQWRkIGEgZGVjb2RlciBzZWN0aW9uIGluIHRoZSBrZXJuZWwgZG9jIHRvIGV4cGxh
aW4gdGhlIHRlcm1zIGluIHRoZSBjb2RlLg0KPj4gLSBSZWZpbmUgdGhlIG1hbnkgY29uZnVzaW5n
IHZhcmlhYmxlIG5hbWVzIHRvIGFsaWduIHdpdGggdGhlIHRlcm1zIGluIHRoZQ0KPj4ga2VybmVs
IGRvYy4NCj4+IC0gSW50cm9kdWNlIHRoZSBjb250aW5hdXRpb24gcmVjb3JkcyBpbiB0aGUga2Vy
bmVsIGRvYy4NCj4+IC0gUmUtZmFjdG9yIHRoZSBjb21wbGljYXRlZCBmdW5jdGlvbiByNTM1X2dz
cF9tc2dxX3dhaXQoKS4NCj4+IC0gT3RoZXIgbWlub3IgY2xlYW51cHMuDQo+Pg0KPj4gdjI6DQo+
Pg0KPj4gLSBSZW1vdmUgdGhlIEZpeGVzOiB0YWdzIGFzIHRoZSB2YW5pbGxhIG5vdXZlYXUgYXJl
bid0IGdvaW5nIHRvIGhpdCB0aGVzZSBidWdzLiAoRGFuaWxvKQ0KPj4gLSBUZXN0IHRoZSBwYXRj
aHNldCBvbiBWSy1HTC1DVFMuIChEYW5pbG8pDQo+PiAtIFJlbW92ZSB0aGUgYW1iaWd1b3VzIGVt
cHR5IGxpbmUgaW4gUEFUQ0ggMi4gKERhbmlsbykNCj4+IC0gUmVuYW1lIHRoZSByNTM1X2dzcF9t
c2dxX3dhaXQgdG8gZ3NwX21zZ3FfcmVjdi4gKERhbmlsbykNCj4+IC0gSW50cm9kdWNlIGEgZGF0
YSBzdHJ1Y3R1cmUgdG8gaG9sZCB0aGUgcGFyYW1zIG9mIGdzcF9tc2dxX3JlY3YoKS4gKERhbmls
bykNCj4+IC0gRG9jdW1lbnQgdGhlIHBhcmFtcyBhbmQgdGhlIHN0YXRlcyB0aGV5IGFyZSByZWxh
dGVkIHRvLiAoRGFuaWxvKQ0KPj4NCj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9ub3V2
ZWF1LzIwMjQxMDMxMDg1MjUwLjI5NDE0ODItMS16aGl3QG52aWRpYS5jb20vDQo+PiBbMl0gaHR0
cHM6Ly9iZW5jaG1hcmsudW5pZ2luZS5jb20vaGVhdmVuDQo+PiBbM10gaHR0cHM6Ly9naXRodWIu
Y29tL0tocm9ub3NHcm91cC9WSy1HTC1DVFMNCj4+IFs0XSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9rdm0vMjAyNDA5MjIxMjQ5NTEuMTk0NjA3Mi0xLXpoaXdAbnZpZGlhLmNvbS9ULyN0DQo+Pg0K
Pj4NCj4+IFpoaSBXYW5nICgxNSk6DQo+PiAgICBkcm0vbm91dmVhdTogYWRkIGEga2VybmVsIGRv
YyB0byBpbnRyb2R1Y2UgdGhlIEdTUCBSUEMNCj4+ICAgIGRybS9ub3V2ZWF1OiByZW5hbWUgInJl
cGMiIHRvICJnc3BfcnBjX2xlbiIgb24gdGhlIEdTUCBtZXNzYWdlIHJlY3YNCj4+ICAgICAgcGF0
aA0KPj4gICAgZHJtL25vdXZlYXU6IHJlbmFtZSAiYXJndiIgdG8gd2hhdCBpdCByZXByZXNlbnRz
IG9uIHRoZSBHU1AgbWVzc2FnZQ0KPj4gICAgICBzZW5kIHBhdGgNCj4+ICAgIGRybS9ub3V2ZWF1
OiByZW1vdmUgdW51c2VkIHBhcmFtIHJlcGMgaW4gKnJtX2FsbG9jX3B1c2goKQ0KPj4gICAgZHJt
L25vdXZlYXU6IHJlbmFtZSAiYXJndiIgdG8gd2hhdCBpdCByZXByZXNlbnRzIGluICpybV97YWxs
b2MsDQo+PiAgICAgIGN0cmx9XyooKQ0KPj4gICAgZHJtL25vdXZlYXU6IHJlbmFtZSAiYXJnYyIg
dG8gd2hhdCBpdCByZXByZXNlbnRzIGluIEdTUCBSUEMgcm91dGluZXMNCj4+ICAgIGRybS9ub3V2
ZWF1OiBmaXggdGhlIGJyb2tlbiBtYXJjbyBHU1BfTVNHX01BWF9TSVpFDQo+PiAgICBkcm0vbm91
dmVhdTogcmVtb3ZlIHRoZSBtYWdpYyBudW1iZXIgaW4gcjUzNV9nc3BfcnBjX3B1c2goKQ0KPj4g
ICAgZHJtL25vdXZlYXU6IHJlZmluZSB0aGUgdmFyaWFibGUgbmFtZXMgaW4gcjUzNV9nc3BfcnBj
X3B1c2goKQ0KPj4gICAgZHJtL25vdXZlYXU6IHJlZmluZSB0aGUgdmFyaWFibGUgbmFtZXMgaW4g
cjUzNV9nc3BfbXNnX3JlY3YoKQ0KPj4gICAgZHJtL25vdXZlYXU6IHJlbmFtZSB0aGUgdmFyaWFi
bGUgImNtZCIgdG8gIm1zZyIgaW4gcjUzNV9nc3BfY21kcV97Z2V0LA0KPj4gICAgICBwdXNofSgp
DQo+PiAgICBkcm0vbm91dmVhdTogZmFjdG9yIG91dCByNTM1X2dzcF9tc2dxX3BlZWsoKQ0KPj4g
ICAgZHJtL25vdXZlYXU6IGZhY3RvciBvdXQgcjUzNV9nc3BfbXNncV9yZWN2X29uZV9lbGVtKCkN
Cj4+ICAgIGRybS9ub3V2ZWF1OiBzdXBwb3J0IGhhbmRsaW5nIHRoZSByZXR1cm4gb2YgbGFyZ2Ug
R1NQIG1lc3NhZ2UNCj4+ICAgIGRybS9ub3V2ZWF1OiBjb25zdW1lIHRoZSByZXR1cm4gb2YgbGFy
Z2UgR1NQIG1lc3NhZ2UNCj4+DQo+PiAgIERvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0ICAg
ICAgICAgICAgICAgICB8ICAgMSArDQo+PiAgIERvY3VtZW50YXRpb24vZ3B1L25vdXZlYXUucnN0
ICAgICAgICAgICAgICAgICB8ICAyNyArDQo+PiAgIC4uLi9ncHUvZHJtL25vdXZlYXUvaW5jbHVk
ZS9udmttL3N1YmRldi9nc3AuaCB8ICAgOCArLQ0KPj4gICAuLi4vZ3B1L2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L2dzcC9yNTM1LmMgICAgfCA1MjYgKysrKysrKysrKysrKy0tLS0tDQo+PiAgIDQg
ZmlsZXMgY2hhbmdlZCwgNDA5IGluc2VydGlvbnMoKyksIDE1MyBkZWxldGlvbnMoLSkNCj4+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZ3B1L25vdXZlYXUucnN0DQo+Pg0KPj4g
LS0gDQo+PiAyLjM0LjENCj4+DQoNCg==
