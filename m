Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E3946705
	for <lists+nouveau@lfdr.de>; Sat,  3 Aug 2024 05:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E8D10E03E;
	Sat,  3 Aug 2024 03:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gY7iYhBd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5195110E03E
 for <nouveau@lists.freedesktop.org>; Sat,  3 Aug 2024 03:23:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tE5fVymNYMzyG+z/jmF69yT9e003CoyB0E0tnxourxd5ZAouwcfq1R/RlWkr8bMGYctWa2jeD/zmQMLzHBTPuCOA55GPDw+iqtIY4ksOZxoUS2PljAaVQIzn/ZVpjhk+UVuu8Xhq9bPhvvmFxtqYE3mKj3j5hTbfybM83+ddT1z7QhkyZdl1m5kwSAAauMQHaLUKvOwV7kpo0XgdO0jG3kQDKn1g6zwxqEMMm+5ONeT8nOJADMke6IvJOVTQLKtcD6JUwcXoTtRDGclqR599+Rk5Fcrlu9oWiGpCSm7u3iIwCxBrbJJJdWB/mm9tfLTnX45JJikqMTDCXbaYLNLcrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pW9MMrpZ0Hht2MSL6Ld1QrgSsU0YGtDIZ9tlpi6ZS0=;
 b=ZKVRCofaBMmU2o60zGq79Fe7Tn5UpjIu9vFv7Uk5kGMSCYg59h8cQeHTcLua8Vmc4na6mFget4O73boPcLItlOZkvVUEYelDRJKWfGG4JHtta9QbM6vENwr/KM81YZtxhdS/lre8YmDGhd8P/U/I50lmmQzg2MdXEv6i+BRiNkY/XQLHWSCHEFjdn/SD/JY8ZqZJycYyHx7FF2ZKGYaIpYzEmTFeDt+qMapK8khsEMuNgKPTfUx47FhAfMxVb1qtiQu4/Usb1eSjKXJ5W3LwE+gqhzRNOzDvJ0aMw7D4Pk6uKJMPLZtIuZlrUGL8LdVCTSOK94ZgX2tCAgodd++nlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pW9MMrpZ0Hht2MSL6Ld1QrgSsU0YGtDIZ9tlpi6ZS0=;
 b=gY7iYhBdz/xvpdM+4/7v2IUprCUIh4pfML7oVkUgK3KzsVYBCITRBVhAGAYvP5T5L95iVOlckQ3FXI8c1BbshhyQTq0dFgYpHgrfQ+QEqtG4R7tLPkE6vI5H/pHqSlj4sXPScKlzABtbFU4Zksv8buXBEEC5sABw2YE3bqunx/N6975JRG0BNwcA4RTNZdnilrVz5vBHSblcB0rJFl92FkPCGO+JHKB4GqQJhNugS2t2VKyGlew6UBHHLaF6SaVxlJm09wA6f36feBRD2wAaOnpi7j8H/liP6vL6ch2m2PrIEpCM706qgkLH6WzFGLlt8RkaAxZlBzF86KtnWinCdA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by PH7PR12MB7187.namprd12.prod.outlook.com (2603:10b6:510:203::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Sat, 3 Aug
 2024 03:23:49 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.7828.023; Sat, 3 Aug 2024
 03:23:48 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>
Subject: Re: [PATCH 2/2] [v7] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH 2/2] [v7] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHa5Q8Ayo2kAh47Y0yi4cTuaHAuHLIUphyAgAA44IA=
Date: Sat, 3 Aug 2024 03:23:48 +0000
Message-ID: <d7a748a9c32c2dcb5bbc8d86a62d987d3b6ef7c4.camel@nvidia.com>
References: <20240802190517.2548654-1-ttabi@nvidia.com>
 <20240802190517.2548654-2-ttabi@nvidia.com> <Zq1zDcN2JYTro7VW@cassiopeiae>
In-Reply-To: <Zq1zDcN2JYTro7VW@cassiopeiae>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|PH7PR12MB7187:EE_
x-ms-office365-filtering-correlation-id: c5687004-c05d-4106-e3cd-08dcb36bb0d6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V3ZMY2syZENlTmRaL3kvZVUrZXFhYkhxemxVc2FoeVN1aWlVcE12UVZIUERo?=
 =?utf-8?B?Vm9oYTBodUhCMXhoUHNTWDdQZVhJR3hndjM0dkx6YTlTdFY2QmQ3c2p4MFh3?=
 =?utf-8?B?YmovZ0p6aU85NWF5bU1VVVhsZU5IY21Fc0JmNVkreVdjSiszUWp5TTV2b3hF?=
 =?utf-8?B?ckFYZXZkb0Q0N0RVbXhDelpHdzZzNDUrUDF2alBQL0pxYzJYZ1BJdUdMSm9a?=
 =?utf-8?B?WURDdjdyN201Yi9QeVVra3BNUWxZYUdzUmtVakhlSGxkREZyQm0wSFUrakFh?=
 =?utf-8?B?UmRmbXhNMnhmYVZMbEpRVTR5QktDNmdmRmI1cFJpcUorVE5Ma1N6NWdIWW0w?=
 =?utf-8?B?VURESEE4cmhnZlFhQkJablc3a2MrRGJUdTBiVnBjS0lvVEhpMzFwS1A4T2Fw?=
 =?utf-8?B?VWEzdUdmTXdiYzZkdjQrT0FWc1V5UjhwTi9LNjF2SlRDdjV2djFPL0VxYTMw?=
 =?utf-8?B?Tlg4V3Jmb3FlcU1oTUlJZFlhOExqSW9WeFgwallrSkYyUFFwTVI1TWRaL1Yv?=
 =?utf-8?B?NllNNDBPLzRuTnc3V0FqV2hOdkNTbG9lazNVdVJmZWtQQkliWXpvczRDTFVQ?=
 =?utf-8?B?MzAyNkdVcWdqaWhGKzQ3YThlNGYvRitMdmV3UFkyRFJoVWFCWWpUZS9WbWxY?=
 =?utf-8?B?eGJGZUhQN3dRQkZGaGQycHZVTloySGtJZWJVbXh1UWZWYmVpdjVEcFRDZFZx?=
 =?utf-8?B?YzNLd0FjeHNRQWc4VUEzNU5ob2FJd0k5cU5jMXhOdTU5U1Q3WmNXeDdhaWxO?=
 =?utf-8?B?bCsyK28zSUxtL3NuL0ErMnNGajFBQ2ppdWhkcVhubzVDUlltejg2SEZtSElz?=
 =?utf-8?B?SlBkbHp1bVNCNnR5UmlUMXY1NjRSSE5mREpkbThmemFrRCtBT0M4MlR3Rng1?=
 =?utf-8?B?Y0R0NCtiZzVPNjU3WjlzWXVZRFNFTXRKSERuU1dsbVUwNmRUdWZzcU85QktX?=
 =?utf-8?B?VUxSalZnOWFPaFQ4VFBidUR4YVhPMDhXZVNiL0psemJSd2pEV2RhbFg3R3R4?=
 =?utf-8?B?aFgvOFphM1E1eDhreEh1bnA2ZTdWZzFZaW5iMFI1WHdyRURMWHpST04rMHJs?=
 =?utf-8?B?Q0FqNFRHODdreGs1SCs3ODY1aUdYTzlhdWJUNW9XQ2pCOU9OQ2w0aWkwQndV?=
 =?utf-8?B?Wks3NnRERkN0MmdIZWZYT3lETmxybWkrS0gyUXdqd05abXJyL1duaWZqTDNU?=
 =?utf-8?B?S0dnZEZESjFacFJYR0crQkVlcjk3STVLZTlETHRlV0NSRlN1ck9GM2pqdFd5?=
 =?utf-8?B?TW9NeEMxWkdOU3Z2MmIxMThoREhxbFBqMCthYkVjcGxDTXN5bjNOU1NML0lk?=
 =?utf-8?B?ZUdHSGNqVWxNWHVLc3RZSzRmbDlyakd6V3owSXFTZ1Jldjk2UnRWZ295UFZR?=
 =?utf-8?B?T096SVdMVUFyTEVRWkhWRXJLbjNFMlhwMmh0Wkh4U3laZGhQVFhHSG1RZlFn?=
 =?utf-8?B?NHREMzdKNzlENUZpNlpNbTNObnNYdWxQZFhnNWttRGc1WXQvZnd0TFdLSzFC?=
 =?utf-8?B?a2oyY09vWE8vRS9MLzFkb0w4djlWZzlBSm4ya0Y1WTFSN3JaUEVURlZjSGU1?=
 =?utf-8?B?OHpVTFA4SVVjZTBKMVJHZzcxM0lzekE0VmlNVWoxdGxTYjV5UnlMQk1yT2F3?=
 =?utf-8?B?WllIRFRvbWpQbmd6TFNTVnVSSk5SUCtxRm1FMVNjaUpuR0Rlcmoxam5oN2tm?=
 =?utf-8?B?Q05MNzNZSzVTMzVoK3dSalFmUjJveXdkWlJMaVVsbGY2S3VhL1AxT3F5bDRS?=
 =?utf-8?B?VUNaK2h5ZXdQTUllWk4xQnY3c3dOZjI1ZzRPM3hnMWtQT01KejIwYW03clQx?=
 =?utf-8?B?MUduNW1hRG9lNVpUVzJXT2N6eVVBdWw1SGhLQS92b1JXUTl6YndOU2hqbExl?=
 =?utf-8?B?TTFuaEcxdWpVK1ZtY1NaU0YxcnlQNzBra3R1VjNYQWFwVkE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkZkMkpTVnlRMVQ2VDREb0o2Zkh4ZVI5L1FKU1c2ODdPZzNaLzJJT3lpcVBG?=
 =?utf-8?B?UXRQVkxUYXRLRHZnTGdteVY1TkRCN2R5VDNFN2gyZG1KdU5YbEZwanFvMlFq?=
 =?utf-8?B?VFNnSUNTSi9PY1UraWVFWnJNaXZrUzJlVEFJZ1dWOXQ5SVBhNXJ6N292azlx?=
 =?utf-8?B?eG9XR2k0a29kT0JjQkRKU1h0Yk5KQkhwZXFISzNYbDNndkNTNWY2MVRkMUFV?=
 =?utf-8?B?R1pjbTZQNGVZQ1RVL1VYVUk4b0F2Z3NDY1FDRDlFdUkzRlhFTE5saDBBWG9D?=
 =?utf-8?B?WUtnY0FQYkxXVDIrSFhGelJDd2VVRkZsUnJoQzNNN05vK3JSR3dTeEZIdEpG?=
 =?utf-8?B?dDdqS3VuSzg2VHZwTzk0akVnM3kvd1VsSUlvSzB2bTg0b045d25lQy9YMS9X?=
 =?utf-8?B?eTdHNndKaTdCeDRWeGx6UGpCaW1QNUJIT3VSbERhanczVGVNRDBpeTljcFVv?=
 =?utf-8?B?NmpGWkYzTjgzUVk4Z1pjc056azlsVVFWakxQYkdibVBVczY4TWw3Z29ZMUkx?=
 =?utf-8?B?MXc4UnE4Zjc1aFF1UGpEMlplTFByWFlCdURISzk0L1pGdGsyVi9CQlZ3bkc1?=
 =?utf-8?B?OFRUOWx2aWJEYmdwbkxndTcrUC9Oai9ZbWJvc0FraHNHUjF3S2hKUHV4WEU2?=
 =?utf-8?B?RXF2S2Y1TzJqN0RPcmtHUEV0dTk1SEJtZHNXNnBWUWNwdzhHbi93QnRwWnBP?=
 =?utf-8?B?S2hldHd5M2liSHJza3hxZ2E2Ti9qZnVsNWJYdkVwdWluamJSR3FIUGdoOUxM?=
 =?utf-8?B?RUEzOHozQmY0L1ltMjFhMmtRa2o3dUlmNk1DYkVKTWFjSUR1SmFSeE51NUNP?=
 =?utf-8?B?R1hmdjV3YnBvVXNVRFBMdXJ4NktQbkNyY0JLakV6MFVRTk10SW5qcnZUUWJX?=
 =?utf-8?B?QTVid242MEloQXJHNE9iQjJwaWk4SFgxNXM0T2p5azBaVFlnOHU1U0hyTUpN?=
 =?utf-8?B?TEFxRkk0VTUwR0xHOTNJdnFVYnplUHd6L3pGVkozYkFhb1oxT0hPeXdjdXI2?=
 =?utf-8?B?dUw2bXhaVk1FM0RoRHV5TVd5ZFV0MENGTHpJZEJpY2w2b083S2RPT004NnhL?=
 =?utf-8?B?ZGtCVkxOSCtGd2Frc0xUbWc0a1lOWmY3clVUVGFzSU44eVRBQnMzRGd3aksx?=
 =?utf-8?B?aGxTb0VMYUl3UHJQbzcrUU1PZXJvMUduTnZicGI0WjRBYk01eEI1WWtabUk0?=
 =?utf-8?B?WDRPMFh5T0t6NnhRZi9aMFRkSXFjNG9pRlViamhxMmdyaGhJbG9NQklZMTJD?=
 =?utf-8?B?emdCNkI2azZMUUdhbC8zWlI3R29nV3hZRFdMdXhhS1VqdGZtYXR4Uk5DNW85?=
 =?utf-8?B?VDlRcDhIc0M2U1ZzcUVjbGFQSVd5VDhZL3d6ck5VWWo4RUx3eEQvRU5vUDJD?=
 =?utf-8?B?SHlSdzNlcWpmQ1JyMlV3Y2pONFJmR0NoOUpVK1hDc0VlV2NZdlFVL0J4KzNH?=
 =?utf-8?B?UmgwQ0NFT0JmaGF1VW85dVJ0cTFNRjlXMFJpN0ltK1duNEJlejZQRVJMZHVI?=
 =?utf-8?B?ZG1jYk0xYUxPQW04Uk1yNHdLMVAzYWlIQlQyT0JsOEJlSTE3aUR1OWtQcTU0?=
 =?utf-8?B?MnF5NWsrVHE0aVcxaHRmaGZDcnZkeDZnYTBGRjAvc0lYZmhvcHloNng0NXdD?=
 =?utf-8?B?eDFNYStSVm5NMTNFdWtTOURYcG1KZWtlT3lNbEtxdHpjUXRqZUdnR2ZkSWdL?=
 =?utf-8?B?R3dwK3d0QWxURU8wRGtCQ21MNnE5MXFocmdXVkRKN0xHU0xObEVaM1NqVDFH?=
 =?utf-8?B?dnA5bnpsdHE4VnZsRmdOUnljYVlaTnZLanhXMVQybzc1OEYvOVBaVW94QnJz?=
 =?utf-8?B?VE5nTWNYVGxDV1dEd0JSclRpVGJxb3FlSDlzTms2SDF1b0k3SExmVU1TTyty?=
 =?utf-8?B?QzFFWnc5K2dPZHYydXJTRVA4RlRydGhGUGZmbFNZTHJqakJlUHFRNExTUmZJ?=
 =?utf-8?B?NXBBdWxRV1dpc3plSVAxNk10b0VvdFZZcHA5MjI0VVhJckRlV0dxOTArSWd2?=
 =?utf-8?B?c1R6RHZxU1pnd1RxelZ0U2hVQTZFMEQrSXJ2Q2NFQVVnUVdwSXhjMnVWVWh5?=
 =?utf-8?B?alhEamhQVWtXamFTcGtCdys2QXNFV3AvYy9ydzQ4T1IrYm9HRHkya1NpNnMy?=
 =?utf-8?Q?c/KgsY8Ttk0Tq4P7e8IVSLOI0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <19773625A270234C9D726E5E0D0DAC02@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5687004-c05d-4106-e3cd-08dcb36bb0d6
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2024 03:23:48.9326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9UGu2FE1PfQLdSLkxk1ffxdRemGyxjbsmUcxbrVhxx58v/wd31Wc6Lydkc83pEMH4rXgBgTNTayBs2AEfVeIrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7187
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

T24gU2F0LCAyMDI0LTA4LTAzIGF0IDAyOjAwICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoC8qIEVhY2ggR1BVIGhhcyBhIHN1YmRpciBiYXNlZCBvbiBp
dHMgZGV2aWNlIG5hbWUsIHNvIGZpbmQgaXQgKi8NCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOw0KPiANCj4gSW4gZHJt
LW1pc2MtbmV4dCBkZXZfZ2V0X2RydmRhdGEoKSByZXR1cm5zIGEgc3RydWN0IG5vdXZlYXVfZHJt
Lg0KPiBJbnRlcmVzdGluZ2x5LA0KPiB0aGluZ3MgZG8gbm90IGJsb3cgdXAgaG93ZXZlci4NCj4g
DQo+IEluc3RlYWQsIEkgbm90aWNlZCB0aGF0IHlvdXIgZGVidWdmcyBlbnRyaWVzIGFyZSBjcmVh
dGVkIGluIHRoZSBkZWJ1Z2ZzDQo+IHJvb3QsDQo+IGluc3RlYWQgb2YgImRyaS88UENJX0lEPi8i
Lg0KDQpXb2FoLg0KDQo+IEkgdGhpbmsgd2Ugc2hvdWxkbid0IHRyeSB0byB1c2UgdGhlIERSSSBk
ZWJ1Z2ZzIGRpcmVjdG9yeSBhbnl3YXkgdG8gYXZvaWQNCj4gRFJNDQo+IGxheWVyIGRlcGVuZGVu
Y2llcyBpbiBudmttLiBMZXQncyBjcmVhdGUgb3VyIG93biBub3V2ZWF1IG9uZSwgbGlrZSB5b3Ug
ZGlkDQo+IGluDQo+IGVhcmxpZXIgdmVyc2lvbnMgb2YgdGhpcyBwYXRjaC4NCg0KU28gd2hhdCBw
YXRoIHNob3VsZCBJIHVzZT8NCg0KU28gd2hhdCBpdCdzIHN1cHBvc2VkIHRvIGRvIGlzIGNyZWF0
ZSBhIHNvcnQgb2YgInNoYWRvdyIgZHJpLzxQQ0lfSUQ+LyBwYXRoDQp0aGF0IG92ZXJsYXlzIHRo
ZSBleGlzdGluZyBvbmUuICBTbyB3aGVuIHRoZSBtb2R1bGUgZGVsZXRlcyB0aGUgb3JpZ2luYWwN
CmRyaS88UENJX0lEPi8sIHRoZSBvbmUgSSBjcmVhdGUgcmVwbGFjZXMgaXQgYXV0b21hdGljYWxs
eS4gIEkgdGhpbmsgaXQncyBhDQpuZWF0IGZlYXR1cmUuICBUaGUgcGF0aCB0byB0aGUgZGVidWdm
cyBlbnRyaWVzIHN0YXlzIHRoZSBzYW1lIHdoZXRoZXIgb3Igbm90DQp0aGV5J3JlIG1pZ3JhdGVk
LiAgDQoNCj4gUGxlYXNlIGFsc28gbWFrZSBzdXJlIHRvIHRlc3QgeW91ciBwYXRjaGVzIG9uIGEg
cmVjZW50IGRybS1taXNjLW5leHQgYnJhbmNoLg0KDQpXaWxsIGRvLg0K
