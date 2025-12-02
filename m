Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D39F0C9D5E0
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 00:48:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC7C10E5C8;
	Tue,  2 Dec 2025 23:48:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HHC/uiCN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780BE10E5C8
 for <nouveau@lists.freedesktop.org>; Tue,  2 Dec 2025 23:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okOyZyproHYP9PEZ8sbqXKohpSzxKCX/N30XS+ePL1apsfAvgHF/1Oy40Ig3QOo560K6lLuKQAnNNgS9Rd067RJlDdjJfXrSmqk4Z0+TyL9TcSt7MyuyMfiUKTlfFljmFr4WyCJoSI+WQCf7pZpe2YZR5Q3MCyxX1kuRblDGuO4JlsWdo1y78WjCjTio42Sllek/7CZKJ/6j6D+O4O7REynYk/7DpMqOv6tDj/Aimbhamfktrhigv0dlGTo5Hc2qitsLTfHxH4+juKmIM4URZmPHPlQAMV3Ubg3wOSF+aZjaYKPGHkoqJb1MtBkcNxxHOvL5r3pjcn00fXTokKwSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ukBiAVRTqzK83N81cIWzIMR8hrEKatOwCyBo2sGb2iI=;
 b=kM0YgCIfBVVF4TtRmjn71ne/QhUKoD7q75VTdNPCEI6csh2rubjNpCik/YFHURgt/wi2vVt0Gy2ja0KpUPUtDITGpC3GNpMN6CwnYtnTI3Hwj8HQHxgi2I3Vxq96i1dFTPQe2pp5VpAixzZKa3HVZ1FahwplQGAwkwZjvpf1DLXGhN7SRZRhlvcQAzNXP2tjLMkV8SE94g7HMrz2dQKW9Cc8yyREmrJyq4xYjLTmn2cWejKoFZczq92cee0rUSZ7sRFmGcuT+oTzUP7zaOKrVefMT2+q6XHd48whYLfu8zXnG9s4U+5PkKuBBc7VJwuIYSh5cUR2zqV7+FpteiFlnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ukBiAVRTqzK83N81cIWzIMR8hrEKatOwCyBo2sGb2iI=;
 b=HHC/uiCNJsx2Z+DEbULX8i2Bl8nEFjZSGcH5Q1jmWJWcExx7J/ELHPUaaROtEk9QWhiurN6VyORWJ3QUdosx96YE6oYuvtWqzbP4hyoPYCag6p7ZNnq7R5HfYuhNwUnbfaH0v4gCdVJ34KH6oEFJVRQ9Fcr5rzwfec9tKfYeBnsIIUr83a+q4GisgxZTly5Stroh+f3Hb9zgJQ+wu5EqzISbwflw5ClLRjVbnChrE3xp9QlGawSQ1YHeXEv2byYi1cDFmeolFMLwkURZ1NIzErK5Pujsoumgkei+ltxNthYycxsaUlR+8tRLv1VCBm2tKR/CAG8S/qpwkqTgkgTmLA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by LV8PR12MB9334.namprd12.prod.outlook.com (2603:10b6:408:20b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 23:48:08 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 23:48:08 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Topic: [PATCH v2 12/13] gpu: nova-core: add PIO support for loading
 firmware images
Thread-Index: AQHcYxwHBSave/ae9k2hA2nYTiWDUbUO3YEAgAAYngCAAAgoAIAABaoAgAACDwA=
Date: Tue, 2 Dec 2025 23:48:08 +0000
Message-ID: <44986645d9ecb62887f8d3506533d4ef369af69a.camel@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
 <20251201233922.27218-13-ttabi@nvidia.com>
 <581a1e44-e6a7-4ce1-8254-a92392d80cbd@nvidia.com>
 <aba0e260e8a2909c3c66a1aca07574c9192b0dbd.camel@nvidia.com>
 <cec4c58a-cdfa-4bf9-8d0e-7c47d8232697@nvidia.com>
 <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
In-Reply-To: <df1e24cf-6983-4d17-8652-15adca8281ea@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|LV8PR12MB9334:EE_
x-ms-office365-filtering-correlation-id: ebca825f-c869-4cf8-1322-08de31fd3eff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SkI0SFl2MTNhNTJSVFFBdTdURFpxamQ1aUt2RWtsRzRhYUlSZ2NqV0xsMnoz?=
 =?utf-8?B?MzBUYmNrNHhKWW9odUxFOFBJbjFDVkpPNXJQWXluOGZEbU1NNGIvelAwMEVI?=
 =?utf-8?B?eVNNMjFnTURGcTVIL1J4bmdZZjJGUGtXUVFJUVFJQTBjOFB4SzlIRVFYcmI2?=
 =?utf-8?B?cUY4SmpTNUcwenRKemFRVUVWU3A5MXQrVitWbi9jR0VXODFwRTk5SGVETGdI?=
 =?utf-8?B?eURZS3o2OWRCV01UcnM0TFplbWhEMXp0aS9vekE4REticHQzaTJkQlJZUTRM?=
 =?utf-8?B?aXVqakh5VE80RFJLRTVVT255RUtkc2g3SU9HTFR4NDRqcFBsM1BrZkUveDA0?=
 =?utf-8?B?WTBJWXFrdUlNZjJKQ1hseWdPWDBwNVFSdXdyRTFncUhTU2Y4WDhQNWZKRVIy?=
 =?utf-8?B?aGxHem1DOTdoUUpIcGhRSjlPUStrYkh6WGliZys0Q3BQRXNYaUc3WUdSQlNi?=
 =?utf-8?B?ektQOEtXakRCeFhoajZ4dzVzMHRVSVM3OEo4TXhLTm5BMHNoOUNZTnFNdEpP?=
 =?utf-8?B?bUQ1S2N3b0R5dFR1cVdFV0pHOUdCUEhwYnR5d1BGczBCZGp0dFhEZE5CRjJr?=
 =?utf-8?B?MWR2bXNuZjVON3RGa2o5YktpZmFEZVNXN3JkSTRYNDEwQUtob1VBL2VZQjF1?=
 =?utf-8?B?QUR0ZHVEOERxb2RBRGxhaVNUVmVXdzF4M0FFOXBLS3ZvSU4zbEVud1hkWDNN?=
 =?utf-8?B?N2o3NlpPb296Rnp0MnZqNXhRd1ZSeWdXSHA4TWlROFduSmNHUmsvQ0lyWlJU?=
 =?utf-8?B?SDRUVzdwd1dPS0g5dHptN2pWdXBCS0l0RUE0WEZjejdIV3lZT0Y3SWlkc1JR?=
 =?utf-8?B?NGpzMi8rdVcxb2ZuUjIvZGhWbTdqNEZSYUdqQkJuV2pLakNLSDZzOUgwamly?=
 =?utf-8?B?VHoxRFo5R2h6Um8yTVdUYUVuQ2ljeXg1K056dFgzNWVlNGFYSEFkWFhNRFhY?=
 =?utf-8?B?SXh3K0JvK1hyUDZrT2Y3OVdreVBCZHl4REgrd0Y2QVlZNi9PWmpldys2eUdV?=
 =?utf-8?B?UnVoc1FqUFJrbHVEZ3pPcDlxMzVFcElNZVc1Ukc3RFdmTnY0QVdseWNZYlI5?=
 =?utf-8?B?SmYrRTBSR1ZNYVMyd0JHOTBEek53ODZEVnczWkw0WENSQm1EZ2NjR0w2RmFK?=
 =?utf-8?B?eHZNMTN6a1hNbWQyODZzWDVtOXpMUHNoUG5zRkk4a1l0MHpJT1daNXYzdWZx?=
 =?utf-8?B?SU1yNmlCSkdWQ1IzTWJGUmFERUlDUWVjMUtkRXNFV0V4VDRmb0tHOUJyWWE5?=
 =?utf-8?B?dzZxRlZqZ3JVMGExWnNRWCtULzJXd2Z5VGNtU05ETnhhemFuTUlZalpiZG1u?=
 =?utf-8?B?WjVLUkdyTVhjZzRBalBMbzNiME5JVFhoaURsaXcyTXVQMU9MU1U4SE5vcWhG?=
 =?utf-8?B?cTJ2TXI5N0VveDBQUjB3ZG40QkppNXB5WW43UUpUOHBTVDBTUVBuL1FjN1d3?=
 =?utf-8?B?SzBCa3Q5VmFzTzZ5ZFp5SHVkWGtleThCZEE3Z2hGcVlldTMwVVJCMTRYd2dP?=
 =?utf-8?B?UHl6TFZiZUI3OThRWFQveDVnRzNRWGdyVmN3K0hnZHprZnNKNy9QVGVVNkk2?=
 =?utf-8?B?RmxEa2R1WG8zTGZqWnc2cEdUQmdtMzU4OHBtRWFoUkVML2hGb2NNMVpxOGR3?=
 =?utf-8?B?ZU5XZ20xVnovdFBoVTFkdTd3ZGFsKzF0SnZ6OWhkd21CNGZVTWxlSFZkYUNn?=
 =?utf-8?B?WmZ6bzRBQ2ZCVVlFTkxhT2JYbTdUdFM4ZTFhak4wS1pLWE4xUHV0U3pSMWpv?=
 =?utf-8?B?d091Vmkra0htTFFsUHo4TE04WE9JYUJUcE9tVGZoYWxhMk9sZGdSVFc3RUpC?=
 =?utf-8?B?Q3NFbmJGMlRiTTdGMVZUNlJZbTFuUXIrSW9vU29melMyWlFkZFcreGFQYjVJ?=
 =?utf-8?B?Y3hkTFZ2bFU3bzRkam9ldWhVbTdzN1RHK21ibjBtd25CQ3kza05RZWxEWVRr?=
 =?utf-8?B?cEVqWklGTXFTbjBrOVQ2S1kxazhCTjVPU0o3Nk0yV01hc0ZicU81dVl5VitZ?=
 =?utf-8?B?enBnV3lUQk5GWm5NRnRSSm1IYmJyQ04vTmhhMmIrQ2xpMVo5NlkrUFJpdVRP?=
 =?utf-8?Q?zmY//R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NCs5dWJ6Y2lvVFhlQXJoWGw3em9CZ3FmYnBROVlVUjV1Vm9HS1V5UUxsRXhQ?=
 =?utf-8?B?Y1lDNVhScG53Y1hYU3hjOUtGTndFUkUvTkVsMUMzMGpkOE52RjBIRTl5TlNV?=
 =?utf-8?B?bnUrbkdXM09WQWZqd0dCWkcweWZ2N1krNGFuVGljeG1KbkRiM3pvam8vVTZB?=
 =?utf-8?B?RVRsT2RTT3diSGswRDBHUDI3M3YydEZLY3BRUlE5aVBZTkdsTko3bFphbkhW?=
 =?utf-8?B?NFR3Rmx3b1VjZ0FZbWxoQmF5YjZGQjEwVHZCV2ZQY2VxSGREUU04MjZQZTZu?=
 =?utf-8?B?VHF0YmEvaTBCS2QzNHhOcktQelpEWXF4d0xvMEhwTG83YXd3aDE3Wnpyd0V4?=
 =?utf-8?B?STNtd1hyN25VcHRrTWhneVJFeW9SM09ROEpCdFVveVp6Kys1WjkwQWJkemFo?=
 =?utf-8?B?bUdoN1ZUV0ZXZzhEOFlIRTBQU1lxdEhmRDRpRFMrNmNTclB0RU5Wa2FBSWhO?=
 =?utf-8?B?Ly9iOW1TN3EzbktwZ3I5c3ZiZE4zKzQ2dmY2ZnEzQjV5OUVzcXhKK2JDL3lP?=
 =?utf-8?B?TktyRkJoL3c3Z2M1cjZkcnFOVGROSGtDZE1SKzZ5ak1xTWxNRzZ1SnhNeTRl?=
 =?utf-8?B?cWZIYWpRUmVmdEd5YW5uWEFYdWxOdW9rNVl6RkozL2JOM1lJRjdpM2wvOTgw?=
 =?utf-8?B?N01td0pNRWMxOXhsQ2cwbGtKaGxvTTlmd3Q2UTlCVFl6QlREV2dRckFhYk8x?=
 =?utf-8?B?eUVMbkVCcTRsQzhhaGl3TURaMk5yTnlqcEZMekZxM1hUcUxEWndDY01pYXN6?=
 =?utf-8?B?QjhRaG1kajFDc2JKOFU3WjEyNzAvMFhicVVER3ZEWCtFaURJbnhZMy8vSnlk?=
 =?utf-8?B?aWhCR0RpK3N6cnVZRTl0TDB1aTNETUs0YVpmRGV2N1ZNZUhCTEF6Y01ZdG1W?=
 =?utf-8?B?U2pONmZrTTZGOTJlSUVwUWxNWjYyMWhQbno5RjN1U2s1a3M5UU0vWjlhSnQx?=
 =?utf-8?B?QW5URVFiZmFQcjJERlVDU0NaSmxIQW8xUnZmWjZ4WHlreEM4enNONWxMbFJZ?=
 =?utf-8?B?b3VhR0szY1c0dFBSL000WjFCN0JEYkZMK2Q1S2ZaanVZQmtmZm9FWEVJNFp3?=
 =?utf-8?B?cHg1cStLWlUyNVZlaEJsSkxoalIraFpINFMvbUgrWmdxd3N3M0ozQWltVEs5?=
 =?utf-8?B?TWZLem52ejZWMnBZaUFSaDdNbzQxMTFDQUFSRnlPRzZMc1lJbjNoYjhVTlNr?=
 =?utf-8?B?T1pTRUltK0hkZlZ5L0RNdUxtT1RTMkIxUjRpZWpGd0ZHZlZ2Z2ljMVFNYjdR?=
 =?utf-8?B?YVJrQmFjS2hZb1JYZGt3ZmxoaHpjYWZGbXZvTWpQRWxQS0Q4cVdVendzWDV4?=
 =?utf-8?B?YTU0N1QxM29HMkd1ZG1KK1ErL1VkRU9YRldiOXo2Z3dBQWUxa09KcGJ5bGcw?=
 =?utf-8?B?NER1b3BIbjRuWGJJdXBVVWlpU0xMbWcyYmJtWFJJY2N2VWxmREZueUJUMFRa?=
 =?utf-8?B?ZTVTSjlkZFJLOTdveTdpMk85SitiVWpwSTJlVTMxdktiZHRJeUtITVkvbjAr?=
 =?utf-8?B?OEdFVDNyOGNVUzFSQ08rVEIyUXJzdjBBYllLQjZmZ3hjZTlrYm4zemxsSDFp?=
 =?utf-8?B?TTNyc2NZaDVzZk1RL2pPemJ6R0hMR2E4c2t0MUluTk9CS0FYb3FmT3V4K055?=
 =?utf-8?B?Tng2SzRROHBITzhRRWxLUmxRM1Bja1ZJQ0J0VTJ6L3V6azdVS09XTmw3WVBI?=
 =?utf-8?B?YjU4VjduSnl3SjRiQVc4R0MwaElVRHBpd3hlaGlDbjVZZi9oSlRidURwRzl1?=
 =?utf-8?B?NEhuSzhyZTBMQ3AzdGg0bFNycmJncFIvWEF3dmE4S1Z1OElMc1RSWTBUVjNw?=
 =?utf-8?B?b1c2UzgwSnd2RFJyU0JIajkySzNRMk42c3pFKzhLMWxzOGNZZ1lZQjM5YmV0?=
 =?utf-8?B?bFlSU2M0TG5qWnhmcWhSZDhGd1FzUnZvNGZ4cUZjalRES1BjSlpwNWkxbVlV?=
 =?utf-8?B?ZmJnRWI3NThOVjR0VUlVeTBZNmhJc2EyYmsyek5BaFQrZk8rM1FFeHlDWitN?=
 =?utf-8?B?RVVuME14cnhGV0ZvK09McHdZdmRqWTc1bHFlUVdpWE1HU25jajhIUG1yRUN2?=
 =?utf-8?B?ZFRDaGVhYkdtRDc2VzkzM1NnMFF1QTZNcysyTGVxNE9uUlFHbU5OWHRZVTRj?=
 =?utf-8?Q?Un8vEZ2T8WgnW6eiK3RnlxIZH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AABE84BF4FE4114C8D93F31F2C85137E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebca825f-c869-4cf8-1322-08de31fd3eff
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 23:48:08.6232 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxDBshCwjMyfXojaq9YtlgSDEb0C2gmc6OVCdN2xNpgX80Dljfn/wCWZtaRzTYdkXPpu2EHTbtysUpwte8e3xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9334
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

T24gVHVlLCAyMDI1LTEyLTAyIGF0IDE1OjQwIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEluIGZhY3QsIEkganVzdCBmaW5pc2hlZCBsb29raW5nIHRocm91Z2ggbXkgSG9wcGVyL0JsYWNr
d2VsbCBQSU8gY29kZSwgd2hpY2gNCj4gYWxzbyBuZWVkcyA0LWJ5dGUgYWxpZ25tZW50LCBhbmQg
Y29uY2x1ZGVkIHRoYXQgcmV0dXJuaW5nIC1FSU5WQUwgZm9yIG1pc2FsaWduZWQNCj4gZGF0YSBz
ZWVtcyB0byBiZSB0aGUgYXBwcm9wcmlhdGUgd2F5IHRvIGhhbmRsZSB0aGluZ3MuDQoNCkkndmUg
YWRkZWQgdGhpcyBmb3IgdjM6DQoNCiAgICAgICAgLy8gUmVqZWN0aW5nIG1pc2FsaWduZWQgaW1h
Z2VzIGhlcmUgYWxsb3dzIHVzIHRvIGF2b2lkIGNoZWNraW5nDQogICAgICAgIC8vIGluc2lkZSB0
aGUgbG9vcHMuDQogICAgICAgIGlmIGltZy5sZW4oKSAlIDQgIT0gMCB7DQogICAgICAgICAgICBy
ZXR1cm4gRXJyKEVJTlZBTCk7DQogICAgICAgIH0NCg0KQW5kIEkgbWFudWFsbHkgY3JlYXRlIHRo
ZSAmW3U4OyA0XSBub3c6DQoNCiAgICAgICAgICAgIGZvciB3b3JkIGluIGJsb2NrLmNodW5rc19l
eGFjdCg0KSB7DQogICAgICAgICAgICAgICAgbGV0IHcgPSBbd29yZFswXSwgd29yZFsxXSwgd29y
ZFsyXSwgd29yZFszXV07DQogICAgICAgICAgICAgICAgcmVnczo6TlZfUEZBTENPTl9GQUxDT05f
SU1FTUQ6OmRlZmF1bHQoKQ0KICAgICAgICAgICAgICAgICAgICAuc2V0X2RhdGEodTMyOjpmcm9t
X2xlX2J5dGVzKHcpKQ0KICAgICAgICAgICAgICAgICAgICAud3JpdGUoYmFyLCAmRTo6SUQsIHBv
cnQpOw0KDQp3b3JkWzNdIHdpbGwgYWx3YXlzIGV4aXN0IGJlY2F1c2Ugb2YgY2h1bmtzX2V4YWN0
KDQpLg0KDQo=
