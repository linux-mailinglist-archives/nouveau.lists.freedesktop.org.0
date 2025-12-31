Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D810CEC7E0
	for <lists+nouveau@lfdr.de>; Wed, 31 Dec 2025 20:23:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E22CA10E6B0;
	Wed, 31 Dec 2025 19:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uF3VOEI7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7900444C66;
	Wed, 31 Dec 2025 19:15:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767208553;
 b=XMsDkpCOqowMsa4T/0+RYwnfmQ/suTXXUTm66CVj7pwWZ/Z0LezYYWXmLcy39e87n75PH
 nigiMqm9nPxt4u8fHLDeIfFX6lXxriE6xuep/jrWB2lYzipTIGpPFUclAy6qEmcWODnWeaf
 szFIOW5z810CD9MXcdQCbbZbTw99xe+r73zr9bjyiX88iEasj6d6cqAOw4hNtaxymE31W/7
 IEOM+I/iUMJbSb9SUQQekUoK41LAkUWLflReFCgG22fBd1FGpckghnsGMcHm4wbKdZRgC7J
 qz5zrnH5j5EMtJOXF0HWM/zNdFOYwUKlPbXyTQwtbYOnjOKeMiGxg6aBS9ZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767208553; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WhkPNJjakHi6a0jLBPIrxCJM52C/DGd0XGoOmFnSlxU=;
 b=e7seTGmW9vNF2Qv2I09TpPAMjJgKYKpPsQ/bWCp7WsQBbgc21o0isZMp4jXRTF2hDHH94
 Id7g/BY9elJXYIfM2TJ3ctIFSXwMQEPcRHzr+i8aw5vGKTL4PitOsdmCbzRYloOJIJBHGz9
 Bbjiq6pHQhvGGsKuvcyOQREuTDBaVoYobV81BeMo++x/a/w9CR6rqiDqsnoa7RUVSLg/e1E
 CS9CwTT+05oIXCVy3LW7uyfUzVI6/vEzNyRZTHzqElPCEA3TpJxbfrJSSRNmcAcY+NGKLd5
 b2AwKESwdWc1LJZvWKOHpnVxiuCSM1BDbS9KclsIz3DOmJNE3f2+M4xNkwAg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 397C1400F9
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:15:51 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012024.outbound.protection.outlook.com [40.107.209.24])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5111910E5CD
	for <nouveau@lists.freedesktop.org>; Wed, 31 Dec 2025 19:23:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4QmaQAd0rbeFXL0hAacwkqBLGHsuprHnuj6V/2v+R65gHyuH/1r7/XhvwJljhRsR1N8UOuJ60rSXBQjXprboLWNxtpghPnzprlLE7DeIhoUjftGMjvMNotVWX10FZwfuf3mfD1vnOvTw43VOtAGcQjvKjtaXPevG26FXsYIHH6e8pd8qB/p0e1zC/bOY4/Dq/2+f4qphqs84nFzudRG2DTyuhgI9xH6dvVgtN6If/kPLP0LawCL2j1ilT80FZ1k9MkuCGrnildD5QhqmiwsrpwCdor/2zEI5HbtZVmwJZEOEB5vkUomgR+Ce8m9SBVfx9kIdwc//ijCAz5pp2khmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhkPNJjakHi6a0jLBPIrxCJM52C/DGd0XGoOmFnSlxU=;
 b=Xk5Hziqdm3KZ05muldcnFN41ZoJcGN+aDkoTEBTQSRy9+F08l1Hf03oPsd03aRzSLP9v8yH6kOlBZd6NHmBNDFNH4UUggP2TYa5E5FDtm8SmujzawAqOeYD3FYkvvPU2wJh7lqXDZ3vv9D34R57/PUGTGP/fZs+6mKZdi3sw78OiVQCS2kjjyShozK9YIgcJHMpQclzo9E6iNBu11i1r09Q9A4mj8nXPfhHadjzWnAeCfgb6z+LGb0mb6g+jKEv0DKprvTP6nEd9HA0fzWRuOksq9Y9mTRXFCAqKRoAE2Kf9kW1KUzda/0da9o2G3hlm/zf1Ls2zXIaLTUyEpSWg0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhkPNJjakHi6a0jLBPIrxCJM52C/DGd0XGoOmFnSlxU=;
 b=uF3VOEI7wLhFFIpqGB5QVXtSHe4GoTpDJVV3AxTiCKSldpWLe+J+dAly5vfQwMXbW0NIIGiZlS7PKB1Ju6e1J1MBlgjrWSoE2D90zM8w/W86//vROHkTH71hBv2TriMdeLVuY7SVuLY9+OAMTtqup4p+w0vHCki+U6/5313GnleXygmINEFqa33G1SNcZhegpPDstXBLfTclAn5pi9C0Si6h2DbgOK9eEVEdcX2dTd5LWfBhvoX1oZREO/CIw4w4mypmfEbWLetucNg/hSeVxP8O2HPWED9pBzGls2yrS/KC7VtwtoV9luQaoarN9TRFqf3x0wkjAjrHIlUVgAiTLQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 19:23:47 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 19:23:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v4 00/11] gpu: nova-core: add Turing support
Thread-Index: 
 AQHcb86jUh4zxo0ySUOi4HmApuhn2LU7IyUAgAAYf4CAAB8DAIAArCGAgAAPn4CAAB2oAIAAAkoA
Date: Wed, 31 Dec 2025 19:23:47 +0000
Message-ID: <6e48dd3dd117f7fad743cdd59117231b627c87b4.camel@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
	 <858af758-e5a8-4c9e-99ed-65ddffef4c31@nvidia.com>
	 <4f83e5e3a7e32ccccb94651ea4cf2a6e0eab8ca9.camel@nvidia.com>
	 <91be3c66-6296-4c37-9fb4-a45cf9865973@nvidia.com>
	 <b8386ea25078f9cd9012645732ba3ef943677003.camel@nvidia.com>
	 <e1cecbe1-9171-42f2-9563-2946bc0b7daa@nvidia.com>
	 <4beba5c3-a117-4cb7-8fed-2f1c133dfec2@nvidia.com>
In-Reply-To: <4beba5c3-a117-4cb7-8fed-2f1c133dfec2@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MN6PR12MB8544:EE_
x-ms-office365-filtering-correlation-id: 0ac346a1-0655-4bfa-2ad5-08de48a21ee9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OGpoL0tROFltdTBudTRwT1pIZU0wZG0vVHM3OGJCVGFyNjRBc0ZrMyswbVBl?=
 =?utf-8?B?clkwSlpmQ2Z1Zm5hek1RMTBHZTJ2WCtYdmp4em9ic25yaXlFM1U5eGRtQzRY?=
 =?utf-8?B?Tys2Zm9WZlp6dllYNUs5TUNlQ3pCU2V1NTJBZXRIekpsRzNqWVU1MTFuclJk?=
 =?utf-8?B?MzM0R0tlSHd2aVo0eVdtUXdLQldKU2FRZWdQNEpuZlJRQ0xCQVAvT2ZUOU0v?=
 =?utf-8?B?RkVrUWRwWUFoQkJNMk1XaEt2Tjg4NUNBbVU2NW1WQmlRUWVTdkZPUjl4dGRD?=
 =?utf-8?B?RUhIL0R0SVhMUCt2Wmo4RGQ0N0JXOW15SzlQYTRKTElTSWdxU0FHaUtDekhj?=
 =?utf-8?B?c1RuY3liRFQwb0xmYjJZbFI2Y2Q5UmZhOC81eDZ5SE9LQmJMVWpQR1BoUVhw?=
 =?utf-8?B?Nzk3ZGFISnlobmVUSy9UYlpwVVlpZW5WTTErNytpRmRQS29Qa2FNaU1KZzZW?=
 =?utf-8?B?blg2SkNkaFprYXNFZ1lZWHhZWHFaUnJmWEJnaFlxcGlWWnU5Q0xKWnlEc29v?=
 =?utf-8?B?ekh3TFV3NWUrOFJhWDJneDhPZWg2ek1SQjc1ZUwrejBEaVNKT0N0dXI4c3Zl?=
 =?utf-8?B?SEMvOFRDdi94YkJoOFpQb0RvUmxUd0gvYk1EeGI4M0RCaVZKS0krQnBVNFd0?=
 =?utf-8?B?K2VqZ1hCWGNXd3QraThRZXg5UVZpSDhYdkQ3LzRoa2l1d0RpN2pwdHgzanZD?=
 =?utf-8?B?UnNPQ01aTHdVVG5rTzZtZ1ZNUXQrbENYdG5aQU5IOUNYb3AyM1dkTmVoZW5T?=
 =?utf-8?B?bHplUzNnbDBlTDVGYU1Ga2s2Tkx1MEd5b242RXBOMnVKY3owalFkTFM5c2R2?=
 =?utf-8?B?dVVzZ0p1WjVPbWxTajFvOE5NM0xCbmFwZUtXQTVtY1cvN1ZlNWJXNnpyczV4?=
 =?utf-8?B?OFczb2prSzlLUzUzd1V5OE5TL0tLcUNLa09mVm85U1JuL2N3bUwzZlZkTHNW?=
 =?utf-8?B?c2ZvOHhPSnBkZ1VUSzNISk96VnMzNklzcmVISHdnVFBtZzFhMmZmV2JuL1VC?=
 =?utf-8?B?WS9BVDBTNjNlVlR3K081UDh5SmJtK3Z0K0hGVHMxZFVOcjVMT1hoK1g4ay9u?=
 =?utf-8?B?U08rTG1WTTcrcnUvU0xHWGZDbXhkejU0aVVYSFR1M0xJcEUvMjhUODd0UjI4?=
 =?utf-8?B?YVlIenhUd3BRd0NVYXF0QytGUHh1QmNVdFZCbnliVi9XT3o0NmVER0o5TEgr?=
 =?utf-8?B?RzZTWWxRQ2JCUTQyLy9CWnI3UTNPcEwwbDVDY09JcHE1R2h6Nzd6UTRpZFhN?=
 =?utf-8?B?YS9xSmI5cEVOa3ZNQzN4SHQ4Mjd5QkRoZzVrOW5ueHY5TC9lQWxHSWJOYkp2?=
 =?utf-8?B?T3dXM1cxQzNOTjQ4cEJVaXVCbzZTS29oUUZmeWlYdGZ4bFhmaWpmTHNUSG04?=
 =?utf-8?B?WkNwc0ZTWVZibDRpRFJBU05nZ3BmT3VuRFMwZ1RmZ0hLVlI0eW5nZGY5U1pS?=
 =?utf-8?B?VnJQNFdOQlpQdEUrc0c2NW96QjVGbG44V2R3TkFHeHgrTk94M2FYRC95ckZz?=
 =?utf-8?B?b3ZSQ2RscnlRaFMxbjF1aUc5a210MkRxeHovUmVWb2RxcnNLUzRpZ2JmM2k2?=
 =?utf-8?B?SXVheHV5TmY1N3J0SGh1TTZWS0EzS1kra0RiUkx1NXBxVWUzWTVOVUxGc1JG?=
 =?utf-8?B?RGNzZU1XeUQzZVBiTmRndDM0Q284Slh6ZkhlSFNqelkvOFRxT0cyRzFTM0hT?=
 =?utf-8?B?b0lPNFJEMnpkVDhmNUE3ZG9jSm5YdWxCYnQ3bGJmOFpOUFRpb2Y2SFBTRWR6?=
 =?utf-8?B?MUxKc2N4RlZ1bHJMU3JQMk5kUVpQZ2g0VU50WUpjZHVLWlBRZjg4M3NmK1M0?=
 =?utf-8?B?NnB5aEdlUzA4R28zb0s1c0FMZzlWelpOYk5KeCtLSS9FNWRHWWs5eFpWb0l0?=
 =?utf-8?B?eVU1OTA4OWs1aDJPV3lOVUFPVTRpWEZaRDBpb0xxUm05S0ZaNFpHKyt0SVdz?=
 =?utf-8?B?cGFGbGlVRWJTYnB1OXBIV1BSaXNGc0VadjhTUzVvcEhYWFlEQTRhTG05K2Y5?=
 =?utf-8?B?ei9SMmgxNFJoTWtXbVp4VkRyR29iT1gvVmhMOTNUU0dnT1Z4U3BjNDFYZ1Fu?=
 =?utf-8?Q?64/9Fu?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UnZyTktzcjY2ZEMxT1BtRlAybVJFZjVzMDczQTJBeEh0OHFUd2RjQ2RocnJY?=
 =?utf-8?B?dUFiN1dvTXBPaThsQnlsbFdwWkRMRTFzY2Q1bGY4RzlNYzRjcitBSFlIVENM?=
 =?utf-8?B?T1ZnRWUybHQwS0EzSGRQUUxuSGdrRURqSS9KVnZyZExDQnAzWXlDUC9JUzhu?=
 =?utf-8?B?WWltR2RmdmptcGs5alJyVDJ6YytVWDdWemZ2ZmRiWWdhTjBKT0JKK0lHUWFE?=
 =?utf-8?B?WjVTeWNlbGo1M0JBU20yQ2E4eWJxa3N5dnhSazhlZkYwYnVick5sdmI0eHVL?=
 =?utf-8?B?SlRic1E2eGd4eHdZVGE4bGJpTlIxcmdzUURLQTdhSVBLRUZvM1ZBT050VWxu?=
 =?utf-8?B?R2lUMzFuYmxDM1k4c3ZlNUg4VXkya0RkcTd3MEsrZ2diTGNRUk1qU2thdFJQ?=
 =?utf-8?B?UUNPR2prMXQ0bWROdHNHekp3Tk9pRDZWVTBldEJQVWZ4NTlHaFFNbjFiclNK?=
 =?utf-8?B?QTFyM0U1dmlGUEhSaXozbGU4SWMzRW9jMDllQmZXUTUzdlNEbjVGNGZpK1Q0?=
 =?utf-8?B?RFFtNzZVckFkcHZ3dWc1cHN2WmJCT3dDUCtCSnFhUm9jYnlNMzN4Wlk4SXNB?=
 =?utf-8?B?VUd0YkxWdm1YeVRYTjlrWWNDVmZsNElGVWVpL2dDUDRtT0JEK0dtcXVWVHFx?=
 =?utf-8?B?c1ZRVmJreXM1U25YNHl5aUhVY20rVjUyVThKMzhpSWpjOEE5MjhGc0dyem0y?=
 =?utf-8?B?U2Rzb0E0YkdwZmtVQnhrMzMrTWVjcS9ZT2kxMEVvdUJYZkdaL1pzd3JyRDBC?=
 =?utf-8?B?MVNEMEtIYWtueXBMM0hucHVQM2VJSk5TYmxwekV5Y2V0dlg3ZmluSnY5b2J0?=
 =?utf-8?B?SzFUMm1rWm93eDRmeDhuaDMwZGRIRW42SFd4eEJHT21aUkNSYWVTSFRCWlFS?=
 =?utf-8?B?bkxGWWZxZmp4WTlzdXBvNXFSYmp6ZGFFcXFqV2YrdVFxRW1tQ0ZucW9lLzVy?=
 =?utf-8?B?azZGcUpocTJVN05zS0pXbEdPOFBvdTd4cll6TmROM2U3REhkTWtYeFZZaGpK?=
 =?utf-8?B?R0FkWVlBYWlKTVJPUEhJMXpmRVdoemRYVEd0ckdzVTZzRTlCelNjNUwrcExT?=
 =?utf-8?B?VzNaVGp3UXVmVVNtV1JOWjFqbjluN0J5M0c2bEwzMDIzbnhPVjNVbG9TTXZo?=
 =?utf-8?B?NEFsak9ONkMwSTV5NmgzSlo3Y2J4bEpUMkRCRHpDUmZzYi9PTmlkekhKcFlX?=
 =?utf-8?B?RDVNSmJxUXQrZjd6VGlzeGx5dzRFNkNpQUsvMEJ5SjFHNWRJY0NqNjlHUnc2?=
 =?utf-8?B?VDlMa3puUzFGQ3hHeWEzOUEvRUVwTE9wNC9CbjhoUWs5M2gxVkNNdnFaTkF5?=
 =?utf-8?B?VzVpYlc5QzZLTUlEeXJLQUFMelNtbG9xY3RJRzM5SzNsM1YyY043WFVCTng2?=
 =?utf-8?B?b3ArSURmS2M1cFBrVE5uSGhSclBia3VHZUgydDUvVThvbVJsKzVRT29QOS9B?=
 =?utf-8?B?N05hemVnTktSN1FNVG9lYkFzUFlXelhkdk1HbVZJekp0em5HUURzaXpuM01I?=
 =?utf-8?B?Q2RQOXRZWHZXaDE0dnJBcWpxd0FsdWFWOXJ0R25Odzg4REZ3ZExDZEw1Q3hN?=
 =?utf-8?B?L2JWMlozUmw3MFB0UHpkWkxoR3NaamJKN0Fub2FUbmR2ODBIdFU1Y0xzZXE4?=
 =?utf-8?B?c2gwb3lhZC90K3ZqQ1A0cDhnLzA0dzZxUnYrQ1FtcHdvT0tqdExxUTEzeU4z?=
 =?utf-8?B?M3k5aytsQzJhRy8vem1vTmt4Vyt5SlBEOW1zenpHUW9kdDFva2pUS0c3ZHQ3?=
 =?utf-8?B?ckkzdG1XcGFJMDcwYkJ5K3F1Q2RCUXFzQ1BxWnR2VlY1Z1lmdW52VkV5dnNL?=
 =?utf-8?B?Kzk0V2VkNXBRd0MvQ0JBNHV4akVQRFJadmZ3TU9GMmtVMEYwQTY3bHhoeGRn?=
 =?utf-8?B?bkNXN2NZbENFR1VBU1hpcElJTTAzWTJzc2VmRkZrOEc3L3JFN0Y1bUYrKzcr?=
 =?utf-8?B?ZzJXL1UwNDkyM3FuVURVdFhxSkZCdDlaeWRRRkdobHUyUENGdFUwTVllTXJ6?=
 =?utf-8?B?RHpxNjNjQXl1cE1ZWkNSZmM2Y3ZVOWp3eDRFVU56eEZGZmkwdmNqKzV5RVVK?=
 =?utf-8?B?aEFGYjVhKysyelpsZ01jeEovTjVyZ2g4M2RHaS9BQzZTVnlXdFRBTE1Za3cw?=
 =?utf-8?B?dW5XUGtVb0FhZCsvTjc3ZlVnSk5rcEllcTd5cTJoM0RGTGVOeUdXVURPY3hs?=
 =?utf-8?B?d1hKQWdvbU80enQ2N3NPRDFjN0Nobk0yOFMyL0daTnBOajVZcTJHZ3dvejhj?=
 =?utf-8?B?ZXc0UnJ0SzkwWUVrUEhkc08vMk5sN3VJTU92dURJeVkrdjVwTDhrcFlkT2JJ?=
 =?utf-8?B?bm5vdTZyRnRuNFNqTW5BMy9KY3RkYyt0NXFLSVU5YUdJa3A2VWVLUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B63290997C0B94AA68423A073E93965@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0ac346a1-0655-4bfa-2ad5-08de48a21ee9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2025 19:23:47.3222
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 NOwxFN6a626jP+97rgB0GcWQQSDK/JQu1Gogazgk0EnhBz0w+GQGzQwg9OJ8foF4ITmHdRXnsK9qZbJB+GFHSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544
Message-ID-Hash: AXW5RLUE3N2FW6E4DOLMMVKODRUPG76Z
X-Message-ID-Hash: AXW5RLUE3N2FW6E4DOLMMVKODRUPG76Z
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AXW5RLUE3N2FW6E4DOLMMVKODRUPG76Z/>
Archived-At: 
 <https://lore.freedesktop.org/6e48dd3dd117f7fad743cdd59117231b627c87b4.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTEyLTMxIGF0IDExOjE1IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
LS0tIGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2Zpcm13YXJlL2dzcC5ycwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L25vdmEtY29yZS9maXJtd2FyZS9nc3AucnMKPiBAQCAtMTYzLDYgKzE2Myw5IEBAIHB1
YihjcmF0ZSkgZm4gbmV3PCdhLCAnYj4oCj4gwqDCoMKgwqDCoMKgwqDCoCBsZXQgZndfc2VjdGlv
biA9IGVsZjo6ZWxmNjRfc2VjdGlvbihmdy5kYXRhKCksICIuZndpbWFnZSIpLm9rX29yKEVJTlZB
TCk/Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBsZXQgc2lnc19zZWN0aW9uID0gbWF0Y2ggY2hp
cHNldC5hcmNoKCkgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFyY2hpdGVjdHVyZTo6VHVy
aW5nIGlmIGNoaXBzZXQgPT0gQ2hpcHNldDo6VFUxMTYgfHwgY2hpcHNldCA9PSBDaGlwc2V0OjpU
VTExNyA9PiB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiLmZ3c2lnbmF0dXJl
X3R1MTF4Igo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgQXJjaGl0ZWN0dXJlOjpUdXJpbmcgPT4gIi5md3NpZ25hdHVyZV90dTEweCIsCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8vIEdBMTAwIHVzZXMgdGhlIHNhbWUgZmlybXdhcmUgYXMg
VHVyaW5nCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEFyY2hpdGVjdHVyZTo6QW1wZXJlIGlm
IGNoaXBzZXQgPT0gQ2hpcHNldDo6R0ExMDAgPT4gIi5md3NpZ25hdHVyZV90dTEweCIsCj4gCj4g
WW91IGNhbiBtZXJnZSB0aGF0IGluIHNvbWV3aGVyZSwgb3IgbGV0IG1lIGtub3cgaWYgeW91IHBy
ZWZlciBhIGZvcm1hbAo+IHBhdGNoIGZyb20gbWUsIHdoYXRldmVyIGlzIGVhc2llc3QgZm9yIHlv
dS4KCkludGVyZXN0aW5nLCB0aGFua3MuICBJIHdpbGwgbWVyZ2UgaXQgaW50byBteSBwYXRjaHNl
dC4K
