Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA49FCC517F
	for <lists+nouveau@lfdr.de>; Tue, 16 Dec 2025 21:28:38 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3CE610E876;
	Tue, 16 Dec 2025 20:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="saGpOdBx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7C121455F2;
	Tue, 16 Dec 2025 20:21:09 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765916469;
 b=gK0r6SKPGjSQOqGI5oDFYhulyIktvU2NoPsarZC2lnH0ZNcySojZM2UzwCf8edH87UZIV
 T8CBN97bPhlBQJXOak9mzdq0q3YAgtgSKgZJZvM+gG6CSgoNOcY/GTqxmPslHB/+DY2FMmQ
 1ggUsRNuJ+egYnwad0+j/4z4aOeJEWJU6UitZ8yJc4EgfAN2R+aW0AC/dpzZv/V7cMOAZfS
 MwjKxGqteHzlg7i1itSCCPd28U6JMiqNIn6Pvy4ifHXCn4Apg18S8PnN1bl+tiPNIxRj/Z0
 9p0m4pBN3H+VwT2DB6SOuxf4SnpNk+B4hlYxlnMxI0/OlJtkotA4KuAF9VsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765916469; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/F8qmqB5M5A3mUpeVF45f4giBCVjdyhgdY4JGSrsIT0=;
 b=pDyP/jeVgxv8ijjkOualWkYCPL83mNsG7hgihSZhQ8oC3ewr4e5pcvgDg1FdYC8bXC9rr
 OeqbfelmZOeYf4YrS7zo4HpQKKnWwEGPCfZK0SVUm5ngtHHlSw967HpPX/AX13gm8KZh4d/
 YIb3B/nMbRWVL/FoR8CDc1ETB9IrruElHKVQUZkBudkDJ36p49ynTXcf1DL/cqAPub905yA
 Hub0ekFSu2vidd62mpmAs1714kE1JUqRoQWCt2CzsGFVpgXrqc9oLjN5nLE1sJRboTne9Zt
 ym/ImaC7Z/j8bH/YzuJpkCaGwkm364DWsX7In7JFRVdqU+WzcV8r/x8uGB2A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 05BE1455F2
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 20:21:06 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012064.outbound.protection.outlook.com
 [40.93.195.64])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D1B910E18F
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 20:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X4bDOOX7vakv0w4S3d8Yq6ffBLYU6Lz7rbc6wu1mv+3pFZ+GzywbD67kt6nvM0DBng46wDCnWBjjC/lfEFPhpNU5Cbw8Y5Ep9ueMfTK76pG35kg51eqgd0580tE+3mW9AmYVtdFwYaiTZLiN6Pv4DiCgDRwxmoYQL6IwbZKGoBsKnv2tndUO43rD9mJsWzeWOvM2FRGG/RZMf79+2xfj880U7udkDpEJoPJkxdFPUxvj+iioOTNLojSql4XS0TN/xdEY+7wNCXMnQSWMvsb4DODU8Aj3uNRQIj6Tt773o8+iSpa5cUkgKoDZdWY+LH8uZuvq0AkD3OPiaIaDWTWUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/F8qmqB5M5A3mUpeVF45f4giBCVjdyhgdY4JGSrsIT0=;
 b=AAt1pZXuTBo/5uWg4DQm8C92RC6lt2pKbsqP9uE+1QZPvv66FPkZ7bzO6D4g71YrhSBUA9+5Jrzn27k3GXBdcMCUei/ZaPSIN73a0GswjNHiKNW+RqL2Ol3EjRBiD0zNcwnoogMPm4h0sj1YPaFs+pzvUYuuCR6SDstH0dEVUMtz1dIM3/pKjgCa3uGly3bdAj0DvruvKYv6Ri3K18ocx5s7fwbK6VkuK2KzrS2ayNuWa5nFqxVZoL1xztb69uVQ1dU2lbJ9HFMp7NPj9m6C2ee7tMbdRp8lUHv3GVQl1icLce1QMmZ5N8pGSSOD2/ED02kdDub6zgxML/TD4IyeDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/F8qmqB5M5A3mUpeVF45f4giBCVjdyhgdY4JGSrsIT0=;
 b=saGpOdBxlPgrzOfButVNNmJQxpProOIVJVczbEtgVK9nA868jCL56dEi9cEhUgwPYgG1AD6SzPl8Rw5UbdhvAdfA6A7BFoTQnPak/+rcjnWo34O0BdbX68e7EidbplyluPNLyMgVSVsFP4471Sw7SDdvGEj5oeHPOC9dxYSZzv6rPSXzEAsVYLgkiwqYQp7PcStz73TpIMnwNz0L1hPv6FanbPTHQrco5p8LBsXUkRwgdiK4E5NsV/qKel8an5nHmOuCw1EiIaxqGYjVLY7QszdNUpWJE6crdXgxJbXPfo0ZPjSb4EiJs/cGooH8StG/iGCFgJD9h1SpXAd1fvO9HQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MW4PR12MB6976.namprd12.prod.outlook.com (2603:10b6:303:20a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Tue, 16 Dec
 2025 20:28:28 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 20:28:27 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Topic: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Index: AQHca6j1wQX/qkHUuUaaDA2+kgrCnLUil+8AgABVRACAASItgIAArl4A
Date: Tue, 16 Dec 2025 20:28:27 +0000
Message-ID: <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-4-ttabi@nvidia.com>
	 <20251215114036.302303e0.gary@garyguo.net>
	 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
	 <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
In-Reply-To: <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MW4PR12MB6976:EE_
x-ms-office365-filtering-correlation-id: 2708f61d-9dbc-41d8-9a98-08de3ce1ab66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NEE2MHpiZ05oVkhBeEpZZ0diVTM2RGszWlAyRkRBTVJDMzBmd0diTVlZWVVZ?=
 =?utf-8?B?ZlpnV3VYSEZGcm9pZko4ZDF4UlZldWNEUVJmRHliem9ONWhkYXJvRWRkS1NJ?=
 =?utf-8?B?R2tYUHFIa2RiSnpuN3ZFNWIrcUtlOXVUYnJwUklqOWJHUUdHbDRaZkpTdS8y?=
 =?utf-8?B?TXhaV0F5eFhuNzEyQ21qWmR6MDNSMjY4N0RKSFhJV1FPWGc0V0pmRCtsVERm?=
 =?utf-8?B?Sy81bmNTTE9tWGIyRVR3SjdnNFEvU3ZodVZtYTZQcysyUkJ0YnZmbWMzLzF3?=
 =?utf-8?B?U1JUYzdONmR1eld5dkJRbEtKYXBVTDk0SEVHd2I2NE8zTkRwRnB3NG1ONEEw?=
 =?utf-8?B?czhjN3ZLUWdpQjY3ZXlCZ0F0eVAzSlJmVjNEbTdJZE8raDUzRlZaTVdsM2dI?=
 =?utf-8?B?QjE3ajN6b24zc0pPenJ2dHlIZHhyOUZidDIzTDZJYUY5K1htUTkyeStScWFu?=
 =?utf-8?B?YmlhSnE1YWV2TEFCV3lSVmpUK2tUK3RXaVBYRjR1djFKR01kV2hxWDlrTExY?=
 =?utf-8?B?cElSVk1vRUc4SGhFc3pHWmlkTld4OWJ5VGFDZEdXUy9kbGZkR2oxRkZDVytF?=
 =?utf-8?B?RzlzWUNLM3F6ZU8yNzdGdDZydzUxL1NhbGdhSjVkYyt3WDFERE0zNGRkYXlm?=
 =?utf-8?B?NEg3RVJHNFh2MlpCYzcwcGpoRWZoaUN1MjUyNUtjdlRmbXUvUEFQdHI5MFFR?=
 =?utf-8?B?OXgwaFZmYnlKbWdSbW9SZ2IwWUN5SzROTE9TdlhZRWY5MGRlSk9HVEVSeVdh?=
 =?utf-8?B?ZEFQNDlacDZhRnUzekVFUCtKYXhiekY4RGN0UElEdE9CWFBCL2NYajRMVC9r?=
 =?utf-8?B?UlZiQnBNRUlOOFJvWEE2RVZuWnhlNG5qajR2dkdHaWY2dTBUMWVvb2RWYStW?=
 =?utf-8?B?dFA4RmlabVV2K0l0b2o3N2lXZTNsZ1lBVG1FUzBnZnJpZkZMWmtPSEkzMVlo?=
 =?utf-8?B?WGF4WlZLSnJaNFlpVTRNRDEwUjVKVXlXemhIQ3VtWHhoNEEwUk92akJVTlhU?=
 =?utf-8?B?bjkrMnhVMWxGUEhHV3l2K1NoRlFhOVE3d2hBNHBoU3hZbnpRbHNTUERSZmxO?=
 =?utf-8?B?UnpmczVZVmJHNGMxNWdMVlJONnJXVERuRVBIQ09UbEYzUlJEZjg4YVBCaTcy?=
 =?utf-8?B?TUxkTG1GbzRna3VkN0pRYVNHNVd6Z1B5SXo2YjBaSlpqVm04eUxRbi9oSGti?=
 =?utf-8?B?dVMxUHA4dldqVG10OVJIdjlkamIxSE5YVlNRMUl5b0QyWnhVbTBMRlU4Qzhp?=
 =?utf-8?B?QmMxeUp6QUgwZStxWk9EQ3Rac3NMT2hkYThoeGhwdjR4YkxqSUJGS2g3NnRn?=
 =?utf-8?B?VmxidGVSY3NVRk5qRFhrRS8vdDhYTFpiVHN4YUFCQkhrcVArMTNrUlNQSE5Q?=
 =?utf-8?B?cFlraUx5TGtMVEtxR2d5bzZEQWZpL2pXT1lhOEFHaHFwZ2VGOW9FZk1BcS9S?=
 =?utf-8?B?cUxrVWtHRko2U3dJNVVrZEFsY20vaUE1d2VEUW9ibTN1TE01eElvcFphclpP?=
 =?utf-8?B?dVkxTkpud0pFUzRSdzl5VFEyWHJqVU5IS0NWY0d4bExnQUpmeTNpTUdYNkNq?=
 =?utf-8?B?ZEZzbk5EVFQ5NHlzWUdzWkUxdnJ1aVF3OUljRFhoQ0RxWExQeE9ydFd4ZTZ4?=
 =?utf-8?B?ZCt1SEhkM09SRXhOVFF4V3pXWFQ1Ni9rK1dmc2F2RFR6bkpCckZQNW1wV20x?=
 =?utf-8?B?SllHLzYrQ2RzWERMQ2ZPbWRrN1JGMWlwTzlCWlFqMmt6bFdGUnJyR0NSUUVE?=
 =?utf-8?B?RDJEUHM2cXVQek1xZmJEMU1acGlUYlZ3amVEZ2F2RXpoY1pQUHRUK2EzNzI3?=
 =?utf-8?B?bXpaRE44UEQ1OFpTQjJuaCsyZFJOV29xZzhIVjcwenh2Z0I5UU5EY2UyYWZC?=
 =?utf-8?B?K1hvZjFRRXUxQmxKWmJjQkt0aEpBUmNET0FNTGxlK1ZlQXZaWVl1WURySDQy?=
 =?utf-8?B?OUFJTUgyWmpWRGFVWU1hOVdmb0VlWVpWa0EvQzRPWnFuaFdYK3oyd2tEU0dm?=
 =?utf-8?B?YXFXVW8xTy9tR002dTBzYmdsRXBSNTlqUG9GUVRIdHdBNXhPdzhYeXpqWm9x?=
 =?utf-8?Q?lmF/Ul?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cFFJYjM2TGhZZE1ZSDgwOXZPbHQyeHJ5c01mRzRidHVDczFPUG1Hc3dTS0Q3?=
 =?utf-8?B?NmRZSGdMV3NodzVkNE9oN01uQ2xNeFIyVXVNaU5OM29wdTFaYVJhWjE1cXdj?=
 =?utf-8?B?OGFPL1R3VHM4V2xmZ00rQUVKMFAxVUlzL1BzM2FEdkgrV0UrVVlHR256MjN4?=
 =?utf-8?B?TExxTUtXYzliVWpvVldmQkJrKzJUU3VJY0xZK0FMZ0tOUHFnWnlBdHZIcjEr?=
 =?utf-8?B?K0xPcC84KzBBRGI0V25sc0hyNjRKeFdqZkQ3dnhHNFd3dkNqNG5hMnJHMURK?=
 =?utf-8?B?SG5QM3NveGZDNmt4V0VGTDZYdEl4WnZndytVKzZuVkhWdXJUNUlINGlNTFFL?=
 =?utf-8?B?SUhDWmYzMHdRd2Fnd1UyL3RYNFRiZWxXRzQxcENLQ2lKMkNIUGcrYyt6M21h?=
 =?utf-8?B?VzAyTGQvS1NzZGwxS2tNN2ROYXY5aXZidmIyMTQ3SzlndnVIYktDcWFBWHRL?=
 =?utf-8?B?bUZ2SG5NclJyVkFNOVN0TXJVcGlreWxWbjZZL3dkSmZURTFxYUtTVWFQaGE0?=
 =?utf-8?B?TFpjNGlia1dtT3R0cCt6Snk4OWdQRHplbmlneVAyRWdYd1FiaDVwL0NDL2pX?=
 =?utf-8?B?MnVzWGF5ZFJ5MHEwNTdMbGVaWU5ZYTB0MUZSbHp3cWhoSm8yaFJ0Rkx1NFpt?=
 =?utf-8?B?Z3IraW9tbENtbURBQjRqa01tVWxWMEJ5bTRVMlhrdFpEZTRjcXJsU1NLRHJw?=
 =?utf-8?B?bEhZbnhCTHZaQTF1ejFENUY0RFA3ektCMEN6ZS9rMjZEelpwVVhvR3ZEYXlv?=
 =?utf-8?B?Sm80anM4SVQ2R1BsNVlBbkdHSjM1S2h1Mnc0VEdIdHkyTWVTa3pyVmJyclNx?=
 =?utf-8?B?T0hrMFpSTjlGZkRpZmFMZE40WnZLUWFaWlV1c2s1NFdmTm9nQ2FDMmJ3aG1v?=
 =?utf-8?B?SmRVUkRLZjZDYzQvbE4yaXkydFFGWGVDckYxR25wTzQvM3VNZU1RU1BUR2JL?=
 =?utf-8?B?SUxLTUR0Rm9jUjRlelkxd2o3cHBOZDNsalRDb1N5Y1lDWTgrUEN1REh1M01Q?=
 =?utf-8?B?eGZIRDVDdEtkcmdUTFBUaStHeXNxYkZUSWJhRHFOUHRrK0pTTFhESlMzbURp?=
 =?utf-8?B?Z0VCMEZweU9lb2MvUE9Kc2N1dGxlcnAzTEorVHpTbFdSRGI2VjdaOGx2TjJL?=
 =?utf-8?B?SEVmb2VoSjlXZmNYSDdrQ014c2ZMREwxakhmT2pUU0g1L1hkRnRHZ2NDUzZJ?=
 =?utf-8?B?QzVCNmpxMWRqYTdrNmRSdzdRSWZUczlmeTRGMDVYR1R2aDRXRlZXM0VLK2R2?=
 =?utf-8?B?bno0R25ra3laSmFqclVBWmhsR0dKckt3cmlHc2c4MkJoeWY4ZTBVUlo5R0VO?=
 =?utf-8?B?Q3Y2WGdBWUJmNnJMZXhvbFVGcHlZRzVkdTBybzRDdkV0eGJ1aGtnZmpoWGFu?=
 =?utf-8?B?TUM3Ulk2QnJBOUxoMkZTTHdlb3VaOUJoR3JXTHJ2WERRZXR5L3d0TVdkbTNM?=
 =?utf-8?B?czFCQ2ZQS1JYdFJWMDF4dGVXSm4vT1Z3TmRVUUZFTkdUdlhmdVBqOUFIR2M4?=
 =?utf-8?B?NEZTSk4vMkxaa1dsTDhUYVJ6dzdINmhWcWhrL1I0U1d2cTN1L3AzbkU5K3Bh?=
 =?utf-8?B?UWJDakpIODc3VnZkd0NyaWJrRTJxMzd2cG11d1NiMmlPUTVnZHVaKzE4UEc3?=
 =?utf-8?B?R0kyVEZWN21wSjRpbVFBMGF4UEs5R2VUQVhycXhGWDFtdWdIcThZQ3VBYmZn?=
 =?utf-8?B?b1N2QkQ3NURnclpselR1bzBxeERTLytTUUVjQytBY3QySDNiNUxibkJJOWxK?=
 =?utf-8?B?QjB6Y0dwVDlNS3lrM2kxcXlldCsvSGorbnFYTFJKRE5MZW80Y096MktwMWkz?=
 =?utf-8?B?UVJ6bGVITURCTys5NDREcFNJdGt4OUdsQkk2OERPZldPejMzN2F6UWRXZDJu?=
 =?utf-8?B?MzNiMUx5dXhZRmV3R2VFWXpTNTJYTGlUMmtUYURQcVN6SVJncm9VUG5wRTZO?=
 =?utf-8?B?WDZ5N2tNb1lmWEw0SkFBMlIrQ29WMi9KSHAwczlYeCt5V2FRSDRmc3p5YVVy?=
 =?utf-8?B?cll1NU1ua2lBdXhWMmFPZXNXWitKaDhBMUd0T1RuNVZIaTRzR09laHEvUzJw?=
 =?utf-8?B?eG9JQ2NualMzbytEZDV2OVVxZVVxTVRTc0xEb1YydHI5YzArUDJzWUl3bGIy?=
 =?utf-8?Q?Jz0xcqS3C0Bp0dhvHRQOB58Fw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A50E764BF0FD24C928F8F6C8A01E01A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2708f61d-9dbc-41d8-9a98-08de3ce1ab66
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 20:28:27.3910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 5WTP+ost5KlJk16dOTH//EMjcUtvo0GRZdSsori6MEXcTv4JnR88WZ1B0z/84bGnlnknUhcOuXedF4I+sKCCKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6976
Message-ID-Hash: JMOWVBSWEVQYUW4OAGFUO6YZELZVWEZ6
X-Message-ID-Hash: JMOWVBSWEVQYUW4OAGFUO6YZELZVWEZ6
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JMOWVBSWEVQYUW4OAGFUO6YZELZVWEZ6/>
Archived-At: 
 <https://lore.freedesktop.org/bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE5OjA0ICswOTAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gSWYgSSBkbyB0aGF0LCB0aGVuIGhvdyBkbyBJIGFjY2VzcyBpdCBmcm9tIGdzcC5ycyAodGhl
IGxhc3QgcGF0Y2ggaW4gdGhpcyBzZXJpZXMpPw0KPiANCj4gR2l2ZW4gdGhhdCB0aGUgY3VycmVu
dCBQQ0kgLnByb2JlKCkgZG9lc24ndCBwYXNzIGluIG1vZHVsZSBkYXRhLA0KPiBJIGxvb2tlZCBh
cm91bmQgYW5kIHNhdyB0aGF0IEJpbmRlciBpcyB1c2luZyBnbG9iYWxfbG9jayEoKQ0KPiBpbnN0
ZWFkIG9mIHBhc3NpbmcgYXJvdW5kIG1vZHVsZSBkYXRhLiBJdCBzZWVtcyBsaWtlIHRoaXMgYXJl
YQ0KPiBpcyBzdGlsbCBuZXcgaW4gUnVzdCBmb3IgTGludXguDQo+IA0KPiBJIHdvbmRlciBpZiBn
bG9iYWxfbG9jayEoKSBpcyB3aGF0IEdhcnkgaGFkIGluIG1pbmQ/IFRoYXQgaXMgc3RpbGwNCj4g
ZWZmZWN0aXZlbHkgZ2xvYmFsIGFjY2VzcywgYnV0IGF0IGxlYXN0IGl0J3Mgc3luY2hyb25pemVk
LA0KPiB1bmxpa2Ugc3RhdGljIG11dC4NCg0KSXQncyBvbmx5ICdtdXQnIGluIHRoYXQgaXQgbmVl
ZHMgdG8gYmUgaW5pdGlhbGl6ZWQgd2hlbiB0aGUgZHJpdmVyIGxvYWRzLiAgQWZ0ZXIgdGhhdCwg
aXQncyBvbmx5DQpyZWZlcmVuY2VkIGFzIG5vbi1tdXQ6DQoNCiAgICAgICAgI1thbGxvdyhzdGF0
aWNfbXV0X3JlZnMpXQ0KICAgICAgICAvLyBTQUZFVFk6IGBERUJVR0ZTX1JPT1RgIGlzIG5ldmVy
IG1vZGlmaWVkIGFmdGVyIGluaXRpYWxpemF0aW9uLCBzbyBpdCBpcyBzYWZlIHRvDQogICAgICAg
IC8vIGNyZWF0ZSBhIHNoYXJlZCByZWZlcmVuY2UgdG8gaXQuDQogICAgICAgIGxldCBub3ZhY29y
ZV9kaXIgPSB1bnNhZmUgeyBjcmF0ZTo6REVCVUdGU19ST09ULmFzX3JlZigpIH0ub2tfb3IoRU5P
RU5UKT87DQoNClRoZSBmaXJzdCBpbnRlcm5hbCB2ZXJzaW9uIG9mIHRoaXMgY29kZSBkaWQgaGF2
ZSBnbG9iYWxfbG9jayEsIGJ1dCBpdCBjYXVzZWQgcHJvYmxlbXMuICBUaGF0J3Mgd2h5DQpBbGV4
IHJlY29tbWVuZGVkIHRvIGRyb3AgdGhlIGxvY2sgYW5kIGp1c3QgaGF2ZSBhbiB1bnNhZmUgaW5p
dGlhbGl6YXRpb246DQoNCmh0dHBzOi8vZ2l0aHViLmNvbS9HbnVyb3UvbGludXgvY29tbWl0L2Q1
NDM1ZjY2MmI4Njc3NTQ1YTkzMzczYjRjNGM4MGQ4YjRiZTQwYzkNCg0KSXQgd291bGQgYmUgbmlj
ZSBpZiBSdXN0IGhhZCBhIGNvbmNlcHQgb2YgYSB2YXJpYWJsZSB0aGF0IHdhcyBpbml0aWFsaXpl
ZCBhdCBydW50aW1lIG9uY2UgKGJlZm9yZQ0KYW55IGNvbmN1cnJlbnQgYWNjZXNzIGNvdWxkIG9j
Y3VyKSwgYW5kIHdhcyB0aGVuIHJlYWQtb25seSBldmVyeXdoZXJlIGVsc2UuDQoNCg==
