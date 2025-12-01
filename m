Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D302C99963
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20DC10E4D7;
	Mon,  1 Dec 2025 23:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AhyEp2q9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012018.outbound.protection.outlook.com [52.101.48.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9310E4D7
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9mIi2sMbTEeXZU33+nf6JH+Vt4HpKpb4S+bjXPDHQm3c54onC7AkIBNIcEi2XRpAHCt4reaphmB2rVuZJH/uNCW9hS/XeaAAi2w4DuKk8iuecy06gSxEcSNxqFcQrqUEuEWcDl79VdiRIiDrRDl0C3WI/SGD3GXX5PLjHa6P5elweV8kw/uimmj8SLt2RF9RQZII9Iss4C7W4Tgpfk+xgKq3z0jBa4p7mElOwd53Ah2oKW6S4TfBycMBGDHnnB9jDT7Anc/GoI3PWm2OSwXKaj85fM4XzIaESNY6Yhl99K99bkoyGFJlwmNfx3vNWQt9liopqLwJOda7F+/Kb9BLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTBLNIA6Bu0sZEgzpwgN0kVqFizHxXOo5fWkaLXkHU8=;
 b=Jfd0xDVn/RW7/jxQQ81VB+h7AbAjEhDBK48CnZ2jCA10mezAc1Yrrjuv8GDO342GRqPMezH8mveArgk3NIfSlZPwR5p+ngSD5Z+cciJ9FuLToht8dRgSzXhnuerftx4VyTckjLglZYAw4rC4STKdaxqX5nVeEDbRRL12Qv1FbhcbKo5H8fPXKaKazjOPseY3VqhV0qBvTcs8SIyKyjdiBWcsYkWXkw4OzSsHh2PD1aHAegDCWtpi4iMhJWD+K406Ero7mzV7CQG/kZ6sxCy0WJOwSbRGg/kJ24P4rkHJk5j/ddfk4qUDDGfWfbxdB1gL+xGlFMh4uNqJpKlBI4ts/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTBLNIA6Bu0sZEgzpwgN0kVqFizHxXOo5fWkaLXkHU8=;
 b=AhyEp2q9b/ptQ5F7n6tZPXOtUm0PXbyaZQ9bVTSa/r68ZSetFpGMggJHKajn8J2wFWM/v/yB1yGp4nRz+Q/l31pg6wLrgVG7qmMH5tnAUr+jQLCoK1KZV796FF4Ucqxfy6oOEEEr+eIjSS7+K/flkFOjX1++e+RXL3Oc494QrLwOlzaYbmnbarffJnEusO9nnx2YI7EZcHEaPBUQ3OQlnIa1V44Q7uluZblGwtVRdeipGXUxBHp6b3ZYRUIVtEQ+lhucAGRpyOQtPkOzMifmSZYK8t9/aSn+HQFChLxMgbrTcUiBRXveNPxs/cUHDibEqnhtwddIBhI/OodqjevjoA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MN0PR12MB5955.namprd12.prod.outlook.com (2603:10b6:208:37e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:26:35 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 23:26:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcVb7P7cDBcNUbVk6IIYQkq+irY7T3ifcAgBX+aAA=
Date: Mon, 1 Dec 2025 23:26:35 +0000
Message-ID: <e4f9a103b111260019446647fd44f50c7aec5787.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
 <20251117233434.GA1095868@joelbox2>
In-Reply-To: <20251117233434.GA1095868@joelbox2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MN0PR12MB5955:EE_
x-ms-office365-filtering-correlation-id: dca05321-c017-4ab8-92af-08de313111ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?QVY4bURvWEVJR3o2SnlicDRod1FkNTMxMGlYY0RNcVlReVp3bWx4OUZmWEYw?=
 =?utf-8?B?QWovVFdEUzJuNFFQWTNTUlpHeEIvbllXN3hJbnQxUThHZm5aVUZ0bkdEb1NO?=
 =?utf-8?B?dkFHNUJNZ3ZtdzRML0g2bGJZd1YxeGR4RjczWTUvZ2NuY1JxSzBPTEVGR014?=
 =?utf-8?B?QVhJbTdta0dJR3YzNkw2K3lWZTZtNWJqZ1VWWGl4ZlQzdDUxK3N4ZTYrTmR2?=
 =?utf-8?B?cHVBaEtLNHZPc0wyR3hjSVlNUFZoOVEzL0hwcVBITXY2OTdjOVpBQVR5U0RE?=
 =?utf-8?B?UWJsSDk5dm1ha0JXalVRVU1zdE9hYkJiMnNmSzhQbVZwY2pwTWZyRkZaanZo?=
 =?utf-8?B?NTM3MHM4ekRNVlRYZXQ1aXF3MFJPalBhK3NSampXREoxemg4R2FMU0VDL21P?=
 =?utf-8?B?Qjh6U2xxTVVocVpPa0NCTjczeTFKbkV2Yk1sallNdnFoZHhKU2JEZEhINGVs?=
 =?utf-8?B?UDBlZTJqMkhLNEZ1VkE1MEZOYkY4MTV5bEdGRFVJcWpSRWxtOG9Zd2NtTXA0?=
 =?utf-8?B?Wkt6NHpNWnV3akZqeENTN0krL3ZoZ3NoRS9FaUJ0dHp4U0hnL0dUK0d4c0pa?=
 =?utf-8?B?SEZMSjhxMVNzclBPZWtGRzJpSHRrdDZjaDc2RXJkWTUrV1Y3bFRDU0lhNC9x?=
 =?utf-8?B?QWlRT0paalQzb3dQMEI2czZQQTFkTUxPN3VwNlFKY3gwRHlBM1FxRnphS205?=
 =?utf-8?B?M05NRDZORjBRK0kzMHB0Mm9kOWYyd0l4bjIvWVdCMlAwWWppSnBVelQyeUhw?=
 =?utf-8?B?VzNqWDdHcXdubHdIREZXTFUyQ1ZjTmg4eUNCaFhqNVZKTUpQc3VkMXh4cUEv?=
 =?utf-8?B?ODUvdUwwM3VxRHVNV2Z0THl5aGdnSGRzTGFRTTIwRlFuZlliUkJneFQrQmgz?=
 =?utf-8?B?Q1VUbGkwSmdqY2l6QXByZFROTUR0ZzlmUkZ1dkl1MWVsOVlSVk9hc3NEZmgv?=
 =?utf-8?B?ckRZYW91UFBqOG12UEw1QThra3hiTzZpTGJQcFY2U2QzYW1NT0lua2FYSm9Y?=
 =?utf-8?B?VnFnQzBuZlgwQ2k1RjZYVGREenY3NGkwNWRPTzBMVHluN1RnRERyZ3JqK291?=
 =?utf-8?B?L0FGcVdLM1pNSjJocnFPZUV5bzBwVzJmdEFKKzQrWkpWQVZ1d3lORDRlTVlr?=
 =?utf-8?B?QzNGVW9qQWQyWmxXQklMcUsxSmJzZ2FHU3U2WTVORmVMS0k4VXZOWUgrUDhw?=
 =?utf-8?B?am9SWHZKT0loQUI4cmJGcFg3ZzRrTkJNVTFhUTVXNCttdjhodGVXMUpRUzZS?=
 =?utf-8?B?MFNINzRISXl3b1hLODlLM28xeFVnVmtpY1psTFkxeW41L0U4SmRpWm1pWEQx?=
 =?utf-8?B?UHljeVNNSkZpVk4rN2dhS09QdHRrWE5GK1VGTmlMc20xQ0M5NlRxVHZlcnhX?=
 =?utf-8?B?VG1JdDBmN1BRNXM2MHJyYVJ6LzIzclUzRGI2U1o3bFdNakxUWXdTRnV1T3dh?=
 =?utf-8?B?TGJndnBPQ2phbFc3YmtuT2hOMVErUjM5Q1ZMajR2ZnhrbURScHB4VlZjazhU?=
 =?utf-8?B?a1RWakROTGtGbzJJam02RkR6aWx1V0hobTNSK1ZEbVdZbDF6VzFQS0VFblNn?=
 =?utf-8?B?L0NwL0tCSUxJcFhrQjlaUWY3bWRHNWR4NkxMYjFLbHk3VGloS1l2Ym1QOVFE?=
 =?utf-8?B?NWc0R2lNZ3YvbWZzQzArclNCekJCYWk4Zk4wQUoway9JT1R0WFVucDJhRzd1?=
 =?utf-8?B?ajVSa3poWGpXRUY1OTEzWjIwTUJseWZDdU1EdHIraTZ3cElZdzMxdGVBcHpD?=
 =?utf-8?B?QTFwaDZXWWRRSkRBRi9RQjZEQUdNbTloTExMN3FYNk5JMlltNVhpR3RnQ0o5?=
 =?utf-8?B?SHdFbTgxZVBiaHB5V2p0WnYyVDhhbnluYkNZL29mdWdZTUVJMWlZa1V1Q2xS?=
 =?utf-8?B?OVd2VkE2dVBzdldhQ0xBY2J5eis2L0MxK0VkM1J0WUNQa2oxUGI5OGNCM0J1?=
 =?utf-8?B?NUJKQlBBektjRmVTTUErWjU2bUVrQXhQaEZheXJ6dFVhWUJNTEIxNlpuT0Z5?=
 =?utf-8?B?MENsQVQraHZaZDQraEUzZ1Z1UWFuZkw3L1pVYi8vUDdtcm9IT1REa1BZalF4?=
 =?utf-8?Q?6671VB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkdWMUt2SlplQzl6UFBKaGlHaVYwamNTK2EySGYyeFFpSW43THBJZjdUMEl4?=
 =?utf-8?B?TW1jRll3YnRrSWVuUnRmdTR5RGVEd3BHWWViRFh0YXBwcW9FcTNTRDVaS0dZ?=
 =?utf-8?B?M04vRElYTWErZ1U2RFF3STUzKzZKQmhoamNxS3RVUFpmcHoxTk91KzZHMTZZ?=
 =?utf-8?B?QVVISDRQbmdxTlErMmRvWHYrNkdmWll5YnJueTJJUE1XaXcxRk1CQ0VXaFJX?=
 =?utf-8?B?OExhVTNqQ1ZwS240NHhCZU01ZUVRbE1lVFh3dFVPOVFLOE1HTmVFZ21xcVc4?=
 =?utf-8?B?R25rZ0c4cUxmb2Z4TVFTSGYxc2N3V09BaTFtTFk0UGhmbzlGWmNxZ2FwM2x5?=
 =?utf-8?B?VmdPd3JUcUdKOE9vaklteHd4RW5vQlc1dkdoREhOdXZzTHhnMTRlVHBLcVJL?=
 =?utf-8?B?RHNuZUNFalZ6WGo3OWo3b0puQzhxL2o2QzZQbGJhMnRiNjlva2RuaFZ0cnJq?=
 =?utf-8?B?V0dPc2RWMHFJM1FrK2MweDdSbnRKd2xOZG1nc1d6cW9VYkhNUXI2VWxrNEtB?=
 =?utf-8?B?UXhLdXh5MkRxbGJKT2pPR094Y3REZ2NyaFdBU1Y0TjRQL0RMSnJrblRYOXlh?=
 =?utf-8?B?VFlNY2xuT0J0ZnZoamlVZWIzN0I2OFZMRC95NHdTV1BhQXNBaGRrUGhlMWNN?=
 =?utf-8?B?Q0N4RUxzL2d5NU9QUDVJM1ZPV0QyWEl6QnJPODltcGtiV0pGenhnV29YRzV3?=
 =?utf-8?B?SStXcW9USEZsSi9taW9VOStIaDl3RFJnNTFXVWJLR1hpbjdvN2NtNGZSV3Vp?=
 =?utf-8?B?QzJhUDFpOWswRzJ6eUowTVFobHU3VU9mSTh1V29vY2NBc2tDQThHWFNtVmp4?=
 =?utf-8?B?VmdSTHNhNnFqclZRY3hRZS9TU2JXT0NDc1EwUHp0NjRpTzZ5aHJsTG5iSmxY?=
 =?utf-8?B?dStMSjU2Zkh4TGE5WEVkeHgvVFZ2S0pSTVQvbjlSWFhKRjFvUE1XNGVQV2ww?=
 =?utf-8?B?Vm13T0JtckN6VEF2OTFacmdoeXc5UXJMbXh6SjRCNFhkdTNGUHlwaGJMZ1ZU?=
 =?utf-8?B?Ui9SZnJPRHZoUWliSmtNemMvUzE2YmEzUXQ2WjJnblV6WGgvR2F3Z3Bsc1pu?=
 =?utf-8?B?akhLYi9xQzJNd0kvTlh6TWszaXhCK1RxTGsrbHBBY3hOK1lJdGVadEVNZGxC?=
 =?utf-8?B?RjZNeGZVMWdYYlZwMWFzSnNVOVhyQ1pJUG9RSEs3cUNSTEtPRzlubWxPYlhV?=
 =?utf-8?B?NjNjcnJqWW8wZ2xlSTlGZmhDMHdrNmRrak03a0VoUktkR2hTeGppZEQyb2pO?=
 =?utf-8?B?Wk5BVVFyNmdROWRvck9Sbzk2MzllUVF6MGxoK1B6a3BveHF3Sm5OZmVGMlc3?=
 =?utf-8?B?S1Z3TDB3NWw1TW9WK05FUkttMTJZOXVYK21zM0xycGVxSVZTM3J3L3Vrdysr?=
 =?utf-8?B?bDRMZVRnN0tkTG01cmJJTVlncjdpN1h5N2tmTlhOd1IzWklna1lPQlZFZjVq?=
 =?utf-8?B?RUkyRWVrazZZN0s4NCtrMHpacG5qU01pUlp4aHBOV1dEbDV0N0NxWVg5RS9r?=
 =?utf-8?B?QlREbUovbWE4bDJRVEV3dmRKeDI1eVQxK2R5R1VNTlFCUG1mYnZHcXFBUW1z?=
 =?utf-8?B?YklxY0gzY1RaUXMrZnR4MWlWUUw2ZGxMUjBWQjY0L2JmR2t4TGQ4WmJNaWs3?=
 =?utf-8?B?Qll4WjBBVWZZdTNuMXE3YVovOW5YRzFDdk1LTkVhZE1ETm9jOGtFSUUwWjFW?=
 =?utf-8?B?RmZtUlRwRnNDcEpiejFzRnJ5aXMyQ3paaHNuWFE0VW44ZDQzZStGZTdJRGNV?=
 =?utf-8?B?dTJzeVd5SFRPMlltek81anRFSW5vaUVDcEYyWHBVeDdIMDlBMW9wem1BT2ZV?=
 =?utf-8?B?ZUZFRmc3QzlaRFVZVmxLbmE5TlRtM1BBYm8yK0U1R0FRTlluaUdTS05rUEdn?=
 =?utf-8?B?Zy82SE9aOWJ6T1BYdmFxbTJ5MHJJOTBEV1lLVk1SRVBtSTdsWjNzQTI0eGtX?=
 =?utf-8?B?WW8zalJwdWZuSUtuRzM0ZkNSMU1hZUtFZWl3VU9WL29lL0thZFJYMjVJRk9N?=
 =?utf-8?B?RGhLWHVkRGFwcEFnZzNZUFBiRVYzYkdyQlZaQm9XTFZlNEdNRzRlSU9pVGhO?=
 =?utf-8?B?b1NSRlg3dkNZVWRhRCt2MFNzWVN3NzFReU4rR1Uwd0FXU09SbFhUakpMRXZS?=
 =?utf-8?Q?aEyD672KtXUrJsYf0CMP9Ax+J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A170EADA3238DD439B47B0C4F2CC7A00@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca05321-c017-4ab8-92af-08de313111ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 23:26:35.2164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Em7lZ5J1d1ht0LtuYZkq160viSmgQhU2WPKc3KdccDjAG4j66CeDC4EabfF+BvIu9VrjoLV+JrNKwORa8iUu6Q==
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDE4OjM0IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToK
PiA+ICvCoMKgwqAgLy8vIFNlZSBudmttX2ZhbGNvbl9waW9fd3IgLSB0YWtlcyBhIGJ5dGUgYXJy
YXkgaW5zdGVhZCBvZiBhIEZhbGNvbkZpcm13YXJlCj4gPiArwqDCoMKgIGZuIHBpb193cl9ieXRl
cygKPiA+ICvCoMKgwqDCoMKgwqDCoCAmc2VsZiwKPiA+ICvCoMKgwqDCoMKgwqDCoCBiYXI6ICZC
YXIwLAo+ID4gK8KgwqDCoMKgwqDCoMKgIHNvdXJjZTogKmNvbnN0IHU4LAo+ID4gK8KgwqDCoMKg
wqDCoMKgIG1lbV9iYXNlOiB1MTYsCj4gPiArwqDCoMKgwqDCoMKgwqAgbGVuZ3RoOiB1c2l6ZSwK
PiA+ICvCoMKgwqDCoMKgwqDCoCB0YXJnZXRfbWVtOiBGYWxjb25NZW0sCj4gPiArwqDCoMKgwqDC
oMKgwqAgcG9ydDogdTgsCj4gPiArwqDCoMKgwqDCoMKgwqAgdGFnOiB1MTYKPiAKPiBQbGVhc2Ug
ZG9uJ3QgdXNlIHBvaW50ZXJzIGZvciBzb3VyY2UsIHVzZSBzbGljZXMgaW5zdGVhZCwgdGhlbiB5
b3UgZG9uJ3QgbmVlZAo+IHRvIGFzc3VtZSBsZW5ndGggaXMgbXVsdGlwbGUgb2YgNCwgeW91IGNh
biBqdXN0IHJldHVybiBlcnJvciBpZiBpdCBpcy4KCkkgY2hhbmdlZCB0aGlzIHRvIHVzZSBhIHNs
aWNlIGluc3RlYWQgb2YgcG9pbnRlci9sZW5ndGgsIGFuZCB0aGUgY29kZSBpcyBtdWNoIGJldHRl
ciwgdGhhbmtzIQoK
