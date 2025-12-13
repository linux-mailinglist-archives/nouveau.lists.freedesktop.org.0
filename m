Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01825CBB4FC
	for <lists+nouveau@lfdr.de>; Sun, 14 Dec 2025 00:45:42 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6785010E151;
	Sat, 13 Dec 2025 23:45:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fP9/rPN9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 678EF4520F;
	Sat, 13 Dec 2025 23:38:18 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765669098;
 b=xqGnJTvc3oWVvLACb7Pl6HCr81CrrrATTr2hTK8111miH4cJHHzLpr/MPTNScmRZOG0Pe
 HZBCTUkw2dnRIHNY5sciiXuqnN5tG0QDGvfEEZGl39VW/+a5mPM1LVs3slv1WimBADUBiWN
 X73M0OPedwO5B6dhhheg9RXDU/mEpBdIJU1eoVKBo2y9K/h8SD2kfQ4GOIE4ijQOVaaiZvd
 6PiGgolkpjOqQ5ckPBqVE5x51fY5kORHFEjYHxBvUenFgb6QMshx69pvAMtZBU4V9PrJ7wB
 Muyc6Xe+8AlFdLiN7fXs/t4KYQBZkBRc0rYpNCBCCcqmxvrtv8fPiXZzpiQQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765669098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nYyzanotlViBCQZfCNTz5aJ4ifLtuSA5RCkFczA1qE4=;
 b=cyTnGXfEDbhFgwlfZob2a2c2aEvl2oOEC4zqakBBJ7LaFkrFJKbZ4L6bpfMYGJ82t+5lY
 kr+2q/bo3v+quFpNsgcI88ZWAQY+vngeQfiRF3O0K0V5AxadukPwvffckOxuNNUwHsKbGT8
 3j2oSZSNx9XGbJpVs4vf2Xk7wIZPp34xlYt7ZUXe9t+c/iovLhZel40d9TU1i7EPM/156Pb
 GU82dUytAZmlUcKzzPruinT0wQqP1dKPAEzxxLy7hTi9x+Kzkw2FPM1J6i+/pYb7Z031W+F
 9+c0JhF6OUjXQkKg/4okOPKtB4ggOMK3UpkItKtz6NkMVmIX68r8vMdkhW2Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 370EA4520F
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 23:38:15 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E18510E00C
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 23:45:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mbjanH/cxn5rs3J1LS3poNJ2r2MBCdaNmE7gWBNNXsvH5q5wcVg2jxfYxyeXk60dAGhWZETx6qo/wt+fzxnBLb1Q/nCRjh92xR7W+AfXNzwQXsVtI9rSs9xw+K6Pb3I28x/QXwbNwqxxtBgL3btzLitJNTHIEVu8CuiVLhXyU+Hfxo+XK6Zr/9MKmtsxfk2ZeohkLYGmR9eyjZZx4nGS747X7GdNG5FzJjD6rJTTf1lFGkOaxQAflUELB7hVzVj1lk/Uiumcsg6NQmJ51ZbwZz6oRyBa0320GA3jZzGZdzgsUICjm97Pa1MhXH+57FRQGd0/3GhPwphIDA+TqfR0nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYyzanotlViBCQZfCNTz5aJ4ifLtuSA5RCkFczA1qE4=;
 b=uqHePG2g9QGVqLsdxMIr9iPki06fZFjpAOyfPx5GS/nf3YrSCjDnb9ESBB1JDprPN2QSzFuLjwdwFrfmehM9vZdhKkkIfsoKu9jq6j5MAka/FfqFVlagZJeD43fB42b3TB5AfR8LwkUi+YtU3xCWf68wIhrJ9DE6UcRBYW+ofQdoa6DrlrcI9T6vogAA4xFSIBaKDwEYMXLZSUc8R0ysF4tY7N+U/wXp0r6BCTKjqIiIvhY3mJ7+nHxtPOUqVGXNHk0xVsu9TeAjLnpPPVBm8HuUPEODD7OhsTwutP8a3FDEqCZI1UHw6Qp/swAP88c7dNJ/VXJeunnhiKBfYLsgbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYyzanotlViBCQZfCNTz5aJ4ifLtuSA5RCkFczA1qE4=;
 b=fP9/rPN9L6XKDKpSjfIVBsyzyFjuwql+Pki+k/tik29X/R1xhCyWD+GT2MKCz15tcnGg0o6Q5n9Oackh/wgx0BvEOCnbdBk/kQtJHngI7Iz30UC+NX3uu+ZdDZINqdpAdzB1O+e04oEJAj1ikYabJUiBABEG5+4gp+LbyaIrJMpcFColD1YvKC2N2i6qcYyKBL++xBG+uGeZdXYlhNjgVkgNuBbmj2UTceKuha7Nytyene5Cpd/VC3D9HPqjg6SuxFVHIMgiV6sqsVhkanbcuB+gnP3dfK5IColM62X2Z9WI9+Qf5ko5m/8c3ApXe7YEC6A7P1t9XAF2+bgTiX8t0Q==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB9521.namprd12.prod.outlook.com (2603:10b6:208:593::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Sat, 13 Dec
 2025 23:44:18 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 23:44:18 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Thread-Topic: [PATCH 7/7] gpu: nova-core: create GSP-RM logging buffers
 debugfs entries
Thread-Index: AQHca6j4bkFUFppuSkG0z9IMsGix+rUgPXmj
Date: Sat, 13 Dec 2025 23:44:18 +0000
Message-ID: <095E9039-1771-4206-8A31-5192B474DB1A@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
 <20251212204952.3690244-8-ttabi@nvidia.com>
In-Reply-To: <20251212204952.3690244-8-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|IA1PR12MB9521:EE_
x-ms-office365-filtering-correlation-id: 15027bd9-f03d-4681-b6af-08de3aa1886f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?WloyN3FueGZ3dDI4OW5tVnJZWmN0ZjVWWm9hbkFHalp2VlZIcWFpbFBKU21y?=
 =?utf-8?B?US9oRVZIN01HUWUyZSt4ZDZVMkdBN1dybkloaFJ4VU0zWDl4bytQdVVuMnNj?=
 =?utf-8?B?L1d6VDkzYkpYTVZKNVQwNWZpd2RDeG9XUEhoeWtoQXlCemJNdXJYVWxnU0Rx?=
 =?utf-8?B?NElZQXNsUHpMcy95QVZBSzdaREM2S0N0eGtsUjVqMXVuNXBWUmUzMVlRbER3?=
 =?utf-8?B?by9ndEdydDUyWm5lTEJqZlZCWFR0K2tQYXdha1BITjdFWkFSdGY0NThnNXdi?=
 =?utf-8?B?RVBCQnlQaTVPUW9rRnZXcHFDUDFGNDN0T0szNXQ2ZW1wY054QmJKc0daRzB3?=
 =?utf-8?B?NFNjcVU4MHRxdEdSTGRlcXVHZmpCSEp2RFR2OC81d1NnazN5aFVVdTJtM2pD?=
 =?utf-8?B?ekp0ZytZTkc0amRVZ0ROVnpDVnc5cUNlVzZ2dXhrcVFTcnRNQkp4Ty9nOTRM?=
 =?utf-8?B?YlAyT0NpQUNzMkh0V2EyYUg4YUtqUVNmZVZRUDIvK1lBL0pNaHA0ZXVQZE1W?=
 =?utf-8?B?blMwOTBCblJOYmtVK09McDFXZ3lCK1c1WWJ4U2IrWmlRM0pJbVlCWTVaaVRU?=
 =?utf-8?B?c1hkVWx4UU1reWtBR1dsRjFvUEsrRjNoMDUxU1BIZmlyNG1UaHBNL2dUeDkr?=
 =?utf-8?B?dDYzRVdjWG1lSGZSOHFWeWljczBTWFVId3dQNTdSK3E0OHE1OXR6ejRUaXp6?=
 =?utf-8?B?RGRVSFRVRHBPVVh1UWNKQWlZdS9INDIxUW1BcUxodGQxcGxmQVU0SW9kbGll?=
 =?utf-8?B?dHN5VmJ3ajFYKzhMYjV6ODBaVURRNzBTZXRhekZEVzM5RjQ2R2F5MmFhdFB1?=
 =?utf-8?B?cnYwSEkrazRRclhjdFcwWW9nWDdNUGVMK0FoOW5QM1FraGZTQlpJK3B0SlJL?=
 =?utf-8?B?V0xKMytPNzAwa1lXaUl1VGdqVTJrTllPcUJHN2FGOEhocThwM0VseklmMjBv?=
 =?utf-8?B?eXBiNWxOcnByT1ZwNnJCZlhiVmpnTTl6aUNzMmdvRExEYk1WZFZMaTRZbU02?=
 =?utf-8?B?R3F2TVZZZU91WUEzTnFnYTZaZkVOblJZWG5kYnVmR25aTGVKTVoxSkJsMHpl?=
 =?utf-8?B?YnRHSnZiTm5YaVBiZ0hrTm9iNEVKTVU4bFAxSnNmeHFYRXp0Nlg0MjJkR292?=
 =?utf-8?B?ZWVmalR4cHZJeHBtMzRFU1NFbzNQamhsRkZKdDJZS1NEL0V0d3duc1VBOGZT?=
 =?utf-8?B?ZVNKdTRLeHlScThuNkh5SzNGMkRjTTd6a1IyTDA2R3VUVll5TzNianEvWm8x?=
 =?utf-8?B?ak5sRDBjY2pzSy8zaFlFanNqZjIwb3pRbElJWEZaZm95TkorZGIvaEZ6akkv?=
 =?utf-8?B?QklJWXF3Lzc1Wm1CYUIzMlhOSzZ4M0h1Z1dWWHFVV2NpbDZFTmNRVFhRWWZM?=
 =?utf-8?B?SndWMGhoc2FjVDRQZDdkSmhvSVJ6VWRsMXJXa2dVTTBrY2Z1WW03ZHFwd29a?=
 =?utf-8?B?WUNsNnpYQmY5alNBQmhIRGtxZFRUL203VnhOZGdldFhDUDZZNEhLWitCa3VI?=
 =?utf-8?B?UVF5S0JialNtN1BzTlBIQmFSaHJsZWVvMFI4ZE5pYzNUWEJPbDVQYy9sU3kx?=
 =?utf-8?B?SGRzSXhCdnh2c0ZEaDZDTTlUY2VoaWZrU2NidlQ3VG42a0N4ZUF1cmd5YjVR?=
 =?utf-8?B?R1pZUElpVmNlNld2K05xZE9nM3ZvdEdEZ1lOSDdmQ2MwYmFFdGtEaHJ4Vi9k?=
 =?utf-8?B?Z3ZZbVRnWDhZR2hDZWQ1NGdYdkF5dmZuVGlLYU5GeVd1VEVTYnNORTBRZEg1?=
 =?utf-8?B?OEprdThVZC9NOVk4N1BudHUwaE5JTktmaUVvdGcrd1FZSjFFZjA3UlVyWTIx?=
 =?utf-8?B?RU9kUVQ3aWo5V1NPQ01NS3hZM2pKWHRkL1VYUEdINDY0bUkxVlRjajBVbitq?=
 =?utf-8?B?aFZJL3N4NUJtaG5YSC8vUU1xdG9sMnp4VkJuUGhJWkJESWVKSjhjYmhoOHBI?=
 =?utf-8?B?empmQ3dnQTdTTWg4TC9lSC9XdDQ5ZXIvUHFqaDlTei9leksxWWt0RVI5ZnZM?=
 =?utf-8?B?dlZDaW1XODBWcWpaVVdMUUhvTXd3bWV2dVRyRHZwSmQ3RjFPU1hoV3ZnRGdO?=
 =?utf-8?Q?/1KLUt?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFRkTktXY2wzZE9kMjVWb01nOXNIVzRhazUzZUU1VE9VMTdwanlvVnFzUGJB?=
 =?utf-8?B?Yyt1dmREaitXSGxrdGJ0cjhjY2RuaDFjKzhVdEI0Q0JoZUt5djJhY0ZmdWg0?=
 =?utf-8?B?SkVSUmtTK0lEWFArN3MzQXY3SDZUeWpmK29oZlJPWXNMdFRCTGpJbk9tQzFa?=
 =?utf-8?B?eTlJODFwL0xHWjRYNHVoNm9OZjF0K3loQmZvTWZrUTYra0QvbDFYQjJuNkk4?=
 =?utf-8?B?c3lYL0VIOGU1bUVKd3kvU2o5cGNLYldBWHJXY2JiOCtnaHJWNFh5V0RickZa?=
 =?utf-8?B?OThaVVVjNy83OGVhWGdGa2hvMnJZbkVMTGEwME8vcVhsdjgzcGlqSWRxYmow?=
 =?utf-8?B?TjZXYTlpUS9kR3pINmtKeEc3bHZoNEsrb3JsZ00veklsQ1dnVnNpSG5uMUQw?=
 =?utf-8?B?YmhtNUltSklhOTJoTG5ZRmtHM2VZSWRsREhnQmFPMGEzOGlWUkFVb2c1Q1BT?=
 =?utf-8?B?T3YweFNhYlhrQ0ZTOE1GY2VTYUUyeE9CaGhjK0dYampNRFkvUDVhWDVla0VM?=
 =?utf-8?B?ZzNueFVmcmdpUEEyVFlEVUpacmNvUUlrTEtzcnhIY1RkK05IMW9GK1NpbXhG?=
 =?utf-8?B?M0pBdi9YQ0JrRG52ODBvdWRyd3paNFVxOHB5eHJXSFVkUS9VZTY5NUc5Q3lO?=
 =?utf-8?B?Q0hJSHc3WUJJYkZDNXhrOW9Cb0pueGFpc2NmWmc4ck5jTUtjR25ObmR2RFI2?=
 =?utf-8?B?Zi9zaHhDL0RLNm9QOXN3akRZelkva3o1OFUvb0FESGR6WlNTMzMxYTU2R1pS?=
 =?utf-8?B?NC9JdkVNdkx1dlhtSUoxbzJDZWVJUWZUZnU1a2JsVEkweGhQQWNrZFFOYmlR?=
 =?utf-8?B?UnBXdVNuUjl6N0pGdTU5c0tjS1M5VXl1NFJEL1Y1WlJCY2gwNnFMa0haeSts?=
 =?utf-8?B?TTRkdTdmMFJGaDBwWUYwQ05FdjZhYVcycVlTZSt3T2xxeWZTRkdEcWUyQ0hW?=
 =?utf-8?B?Nnd3ejZ2U1NIRGFWR1FNQm5JQlFuT0tKZVZ4ZUNFQjg2RXpsMHFGbzc5cFZ1?=
 =?utf-8?B?QU9Bb0t4ektTNktjUlhQeXNQeTZzZ0JrV0x4aDJkN3dBSFo3eWxTVVVLeFR6?=
 =?utf-8?B?djFpMWMveElleXdZczBxUjFrVGdqZDZsTmIycEcwTlhkY2RBUXlHYi9Jb202?=
 =?utf-8?B?RHJKZ2t5OVNpeG5mdWp5dnRmVGZQS0pKL1VMZTYrczcvNGlXbzNVSzJOYUJT?=
 =?utf-8?B?RVN3TTBGLzFnM1krSGM2bGJyVWJMSGYyR3l4THFlUm1UUmFqOVZuTHZpUjcx?=
 =?utf-8?B?bWNYSEREckozanZHd0ltbjJsWUlYNENKS1VoK1NCaFQzdy9qSllxMXdFRFht?=
 =?utf-8?B?Zk9qWndldzFJR0JHYkZvOXo3L1ErTHFYS1o2Q1JWTlVGcVlTSjdCZW1iMkF0?=
 =?utf-8?B?MHhhQmpJTjVtZnM2Z09GZUVNZENpeWRqNnFhU2FkZDBxT3lNNGRwRGc4ZzZG?=
 =?utf-8?B?a2tYdVJ0NFZSTEk4QWpXcmU4NUthQkFTTFNTc0k1emFENUlFREdTZmVIeWh6?=
 =?utf-8?B?NWtoNmlUV3ZGY2s5U0VCMWJOYyt3SjlkbW1qYUxROEJHVDQrZk5qV05sWVR2?=
 =?utf-8?B?TzFjbkcrNDZ1UHlmSGI3N3NjU1NKTHNkUjNYODREN0lKQkZMdDBMa0h0Wnk0?=
 =?utf-8?B?aEpPYm5USHRNeVErZXRlZE81czdtOEtMZmppU0lkY3BDM3FJMW5NQ0o5ajNq?=
 =?utf-8?B?ZUJwekUrQmtvZlZsbjYydGFCejMrY2Z5TC84QmQzRVVaM2I4ZDNUbWhRRkNw?=
 =?utf-8?B?MnUwV2VRTHJ2amo4RUllYUJVeWE1Qjh4L2x2aU9Cc1FtOW45UjdzOTJyOGFK?=
 =?utf-8?B?aUVXSmY5R0MwU2xSN3QyUGM5ZnpibGRJNGpSOE4zekpHd3FRUTdsUXVYR1A0?=
 =?utf-8?B?TXNZZXBSbU5WZDFzMTF2ZVdCeWpwa2hBQ1luaUdFc2xBK1VPVmJTNEMxLzlm?=
 =?utf-8?B?WWV4dUxSc3lHYWZoZnN4UDFFNXFQRDc2a04zemxSNXY3OWVvZHcwWm42UVls?=
 =?utf-8?B?Z1Q4Y256M0pnbWRBT296MGl0eisyemxINEpteU1BenA5cDAvVktRaGhrVEp4?=
 =?utf-8?B?V2NVcjkyVVN3N1V1RWsyN2lGdHp4NkRFUEpwZkhWYStpMUxYcVBkbTlIOVZz?=
 =?utf-8?Q?rOfnPAByJWGSYuF5qaSrx09R4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 15027bd9-f03d-4681-b6af-08de3aa1886f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2025 23:44:18.5929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 oXDfOvArbKxLxGjzHfYu4PSWwpZrNEbEEN3WbPzmMf3yis4j3oAbIl3HGMJALNnSF1mWmyr7SWScz4ABhZWwpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9521
Message-ID-Hash: MM3XUZ7NH4EEB5UFRQBLDB2DI5YPFEIM
X-Message-ID-Hash: MM3XUZ7NH4EEB5UFRQBLDB2DI5YPFEIM
X-MailFrom: joelagnelf@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MM3XUZ7NH4EEB5UFRQBLDB2DI5YPFEIM/>
Archived-At: 
 <https://lore.freedesktop.org/095E9039-1771-4206-8A31-5192B474DB1A@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDEzLCAyMDI1LCBhdCA2OjAw4oCvQU0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiANCj4g77u/Q3JlYXRlIHJlYWQtb25seSBkZWJ1Z2ZzIGVudHJp
ZXMgZm9yIExPR0lOSVQsIExPR1JNLCBhbmQgTE9HSU5UUiwgd2hpY2gNCj4gYXJlIHRoZSB0aHJl
ZSBwcmltYXJ5IHByaW50ZiBsb2dnaW5nIGJ1ZmZlcnMgZnJvbSBHU1AtUk0uICBMT0dQTVUgd2ls
bA0KPiBiZSBhZGRlZCBhdCBhIGxhdGVyIGRhdGUsIGFzIGl0IHJlcXVpcmVzIGl0IHN1cHBvcnQg
Zm9yIGl0cyBSUEMgbWVzc2FnZQ0KPiBmaXJzdC4NCj4gDQo+IFRoaXMgcGF0Y2ggdXNlcyB0aGUg
YHBpbl9pbml0X3Njb3BlYCBmZWF0dXJlIHRvIGNyZWF0ZSB0aGUgZW50cmllcy4NCj4gYHBpbl9p
bml0X3Njb3BlYCBzb2x2ZXMgdGhlIGxpZmV0aW1lIGlzc3VlIG92ZXIgdGhlIGBERUJVR0ZTX1JP
T1RgDQo+IHJlZmVyZW5jZSBieSBkZWxheWluZyBpdHMgYWNxdWlzaXRpb24gdW50aWwgdGhlIHRp
bWUgdGhlIGVudHJ5IGlzDQo+IGFjdHVhbGx5IGluaXRpYWxpemVkLg0KPiANCj4gQ28tZGV2ZWxv
cGVkLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJib3RAbnZpZGlhLmNvbT4NCg0KQ28tZGV2
ZWxvcGVkIHRhZyBuZWVkcyBhIHNpZ24gb2ZmIHRhZyB3aXRoIGl0IGZyb20gdGhlIGRldmVsb3Bl
ci4NCg0KLSBKb2VsDQoNCg0KPiBTaWduZWQtb2ZmLWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlk
aWEuY29tPg0KPiAtLS0NCj4gZHJpdmVycy9ncHUvbm92YS1jb3JlL2dzcC5ycyB8IDI1ICsrKysr
KysrKysrKystLS0tLS0tLS0tLS0NCj4gMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyks
IDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L25vdmEtY29y
ZS9nc3AucnMgYi9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZ3NwLnJzDQo+IGluZGV4IGJhNGY3ODlk
OGFjMS4uMjI2N2VjMzM5MWRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9ub3ZhLWNvcmUv
Z3NwLnJzDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AucnMNCj4gQEAgLTEwOCwx
MSArMTA4LDEzIEBAIHB1YihjcmF0ZSkgc3RydWN0IEdzcCB7DQo+ICAgICBwdWIoY3JhdGUpIGxp
Ym9zOiBDb2hlcmVudEFsbG9jYXRpb248TGlib3NNZW1vcnlSZWdpb25Jbml0QXJndW1lbnQ+LA0K
PiAgICAgLy8vIEluaXQgbG9nIGJ1ZmZlci4NCj4gICAgICNbcGluXQ0KPiAtICAgIHB1YiBsb2dp
bml0OiBkZWJ1Z2ZzOjpGaWxlPExvZ0J1ZmZlcj4sDQo+ICsgICAgbG9naW5pdDogZGVidWdmczo6
RmlsZTxMb2dCdWZmZXI+LA0KPiAgICAgLy8vIEludGVycnVwdHMgbG9nIGJ1ZmZlci4NCj4gLSAg
ICBsb2dpbnRyOiBMb2dCdWZmZXIsDQo+ICsgICAgI1twaW5dDQo+ICsgICAgbG9naW50cjogZGVi
dWdmczo6RmlsZTxMb2dCdWZmZXI+LA0KPiAgICAgLy8vIFJNIGxvZyBidWZmZXIuDQo+IC0gICAg
bG9ncm06IExvZ0J1ZmZlciwNCj4gKyAgICAjW3Bpbl0NCj4gKyAgICBsb2dybTogZGVidWdmczo6
RmlsZTxMb2dCdWZmZXI+LA0KPiAgICAgLy8vIENvbW1hbmQgcXVldWUuDQo+ICAgICBwdWIoY3Jh
dGUpIGNtZHE6IENtZHEsDQo+ICAgICAvLy8gUk0gYXJndW1lbnRzLg0KPiBAQCAtMTc3LDE4ICsx
NzksMTcgQEAgcHViKGNyYXRlKSBmbiBuZXc8J2E+KA0KPiAgICAgICAgIGRtYV93cml0ZSEobGli
b3NbM10gPSBMaWJvc01lbW9yeVJlZ2lvbkluaXRBcmd1bWVudDo6bmV3KCJSTUFSR1MiLCAmcm1h
cmdzKSk/Ow0KPiANCj4gICAgICAgICAjW2FsbG93KHN0YXRpY19tdXRfcmVmcyldDQo+IC0gICAg
ICAgIGxldCBkZWJ1Z2ZzX2RpciA9DQo+IC0gICAgICAgICAgICAvLyBTQUZFVFk6IGBERUJVR0ZT
X1JPT1RgIGlzIG5ldmVyIG1vZGlmaWVkIGFmdGVyIGluaXRpYWxpemF0aW9uLCBzbyBpdCBpcyBz
YWZlIHRvDQo+IC0gICAgICAgICAgICAvLyBjcmVhdGUgYSBzaGFyZWQgcmVmZXJlbmNlIHRvIGl0
Lg0KPiAtICAgICAgICAgICAgdW5zYWZlIHsgY3JhdGU6OkRFQlVHRlNfUk9PVC5hc19yZWYoKSB9
DQo+IC0gICAgICAgICAgICAubWFwKHxyb290fCByb290LnN1YmRpcihwZGV2Lm5hbWUoKSkpDQo+
IC0gICAgICAgICAgICAub2tfb3IoRU5PRU5UKT87DQo+ICsgICAgICAgIC8vIFNBRkVUWTogYERF
QlVHRlNfUk9PVGAgaXMgbmV2ZXIgbW9kaWZpZWQgYWZ0ZXIgaW5pdGlhbGl6YXRpb24sIHNvIGl0
IGlzIHNhZmUgdG8NCj4gKyAgICAgICAgLy8gY3JlYXRlIGEgc2hhcmVkIHJlZmVyZW5jZSB0byBp
dC4NCj4gKyAgICAgICAgbGV0IG5vdmFjb3JlX2RpciA9IHVuc2FmZSB7IGNyYXRlOjpERUJVR0ZT
X1JPT1QuYXNfcmVmKCkgfS5va19vcihFTk9FTlQpPzsNCj4gKw0KPiArICAgICAgICBsZXQgcm9v
dCA9IG5vdmFjb3JlX2Rpci5zdWJkaXIocGRldi5uYW1lKCkpOw0KPiANCj4gICAgICAgICBPayh0
cnlfcGluX2luaXQhKFNlbGYgew0KPiAgICAgICAgICAgICBsaWJvcywNCj4gLSAgICAgICAgICAg
IGxvZ2luaXQgPC0gZGVidWdmc19kaXIucmVhZF9iaW5hcnlfZmlsZShrZXJuZWw6OmNfc3RyISgi
bG9naW5pdCIpLCBsb2dpbml0KSwNCj4gLSAgICAgICAgICAgIGxvZ2ludHIsDQo+IC0gICAgICAg
ICAgICBsb2dybSwNCj4gKyAgICAgICAgICAgIGxvZ2luaXQgPC0gcm9vdC5yZWFkX2JpbmFyeV9m
aWxlKGtlcm5lbDo6Y19zdHIhKCJsb2dpbml0IiksIGxvZ2luaXQpLA0KPiArICAgICAgICAgICAg
bG9naW50ciA8LSByb290LnJlYWRfYmluYXJ5X2ZpbGUoa2VybmVsOjpjX3N0ciEoImxvZ2ludHIi
KSwgbG9naW50ciksDQo+ICsgICAgICAgICAgICBsb2dybSA8LSByb290LnJlYWRfYmluYXJ5X2Zp
bGUoa2VybmVsOjpjX3N0ciEoImxvZ3JtIiksIGxvZ3JtKSwNCj4gICAgICAgICAgICAgcm1hcmdz
LA0KPiAgICAgICAgICAgICBjbWRxLA0KPiAgICAgICAgIH0pKQ0KPiAtLQ0KPiAyLjUyLjANCj4g
DQo=
