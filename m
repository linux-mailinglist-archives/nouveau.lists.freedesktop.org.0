Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B727F5141
	for <lists+nouveau@lfdr.de>; Wed, 22 Nov 2023 21:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CF8610E14B;
	Wed, 22 Nov 2023 20:09:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A500210E14B
 for <nouveau@lists.freedesktop.org>; Wed, 22 Nov 2023 20:09:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWX+3r27ehva+wTZzuIAOewa7bd/kAOAM1f2JBDpxQoySTtj47XitvcKPYMzf5ugoJvM0FthKoF9iPFkAz/TDmzG7s5QGakF4ijbvlsemswg5To3LzXWN4AKa9XRl9Vqf9kToXh11Zm9brjd/DlIMvooQpac2Wbc8It8TGBZ0XvDMljSVb/lHu99KqtUShRa8k/Te0E3NA+LnzPCGsp6DdjDjs1kFLG3dgNAMShFpPl7j2wj290M5e5eC+hI0vmJMMUoQrEw9ih+ETjoe0UhtHIUdddeo3mGF5NJ/qJFMPgI8at2T9kOHm/M6kA8KA58cYe1fhipPjr1Q8eOKnBqIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+uWi7jtIGFyIeS0LG77y2MQZiL2CIRrjFMbFWhKFIs=;
 b=KjGlrCSRgWXExdjH0dLuUtKf/XYNbnRaGhi/DwMmMwkdoTjGIjXG57SKoJU/JH/OH51zoBh2lDv7eMw4Zor/l9OQruxHyCSrVn+g7a4m8QemJSfZLjTxdjF+2MkO1kHQ2zBUPihV9RnRmxJBVOlqRXWpwtT9goFxznUPZ7q4qaYrQHSeuOxWrt7Ze06EGipas55kDt4Z1kA8A+JukDkGR6afF7SyuECBhnLIbCX5sIytgYyXE11v4yIHLIjkFmbGCnwZVlkJIxlkCAbzmVp4Db/ChEu6cxG887yEb/V7/HtMWCJUIEiabhiW4i+WNk0E5NAqUM6MMri4hQAklvBOFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+uWi7jtIGFyIeS0LG77y2MQZiL2CIRrjFMbFWhKFIs=;
 b=HR624ei7tNHDNOPLMKNnmWzH9tRwvzMAMkmt9iGMjPftuz8nb0DGrr7fooHfN17FbEvZtNuEaqGcWhG32C1P9M5KEsXYm+vtggsSDlR+u5yLTzl38+KwwIad2Aj3x8LiShe8KTY+PFHgKKmG9bX+5GzNzGiGR1LBKQaA4u8OWhBXlSRwNy2wZsZdL6Cnck86LFFa3S237Yoj42Zfhhm/YriK5nN+RUuoBKICMNH/njYwOppIPiMeNFsGwnzUA6HPzSWvabRzfodPUM9D/iqFBrYZttHB8sBoLRBWJBVQskhfRqGcDP5bqvWSufsSra5UpGi6XNfer9x1oYaiM2vBEw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 20:09:48 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 20:09:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>
Thread-Topic: [PATCH] nouveau/gsp: document some aspects of GSP-RM
Thread-Index: AQHaHNXmRrixmDFLZU+K94JKZiPt7bCFgpEAgAFDcYA=
Date: Wed, 22 Nov 2023 20:09:47 +0000
Message-ID: <250b090dd7bd61c882283f51b5889053a668003c.camel@nvidia.com>
References: <20231121235300.2406522-1-ttabi@nvidia.com>
 <CAMwc25oK9xXoNW0z8A7=O+tRqUvcxAKy4rfUAzAOjOgESVhj2Q@mail.gmail.com>
In-Reply-To: <CAMwc25oK9xXoNW0z8A7=O+tRqUvcxAKy4rfUAzAOjOgESVhj2Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH7PR12MB8796:EE_
x-ms-office365-filtering-correlation-id: c615919b-4659-4374-4e74-08dbeb96fa39
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQHBB4mdiTYSbSF7PtRTZQ10agZ2G5TGjerNvdgGEUqQe+NPFnE60fqUb/1c5t3RCZ0t9W0yNmX9qg7BcfsipQRGcQtBhyLTk0E4ELrO21dR3VwLdoRq8kjWnQCTEp9EL2gTzEndTMcH+pn2yG352eAk6hx8dHAgQ3luQknO1w74vs0uj2IBjO29VixF14GrSaXP4GwkKHLlWbiM3zP8wYzZXINdh+qCxXJr1ZpX5x/QDf7hSRRMW7iTupmrJieowIrr2rDKAHnaAXyQxADbS/bLJ8WHBhXh+HgFtUQ0KBmQ1bZSekKAXwvPTL5PehqfJ/jaVDYXJ4J/x2dQXj3uIP766MiKxTFjoCzSgCkvkWQzVKjFzaD7yfpeXO2e6AWyIobo3P04Hz3oXqgkNRlzKa9WhaCkDxEBTrCl1vkAxSdoK1FYlJpcUs3ETZY044ewUoSrBb6RD3ZtHJt8eF2JY2ml7myYK1WFcZcfDWsHPOdn/gneYRIMBAdgc4YUeMJAbyAsTQLnKXxxWqCE490Phzi9t0V3lGHlAqxF89hLk6Bya6EZc9/PI4B8PmgioZZv7lNP4iveeWhVJFOUJRphWFRA7/DfBENXjdZDFfLlPYXRXMywy8RE9wQyef5QGJF7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(39860400002)(136003)(346002)(366004)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(4001150100001)(4744005)(5660300002)(2906002)(4326008)(66556008)(64756008)(76116006)(8676002)(66446008)(316002)(8936002)(66476007)(6486002)(71200400001)(6506007)(478600001)(66946007)(54906003)(2616005)(26005)(6512007)(83380400001)(38100700002)(41300700001)(6916009)(38070700009)(122000001)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amtvSThUVVhMLzRxMkY5ZkdER0FsOGkzWjBZSVFZNnBSNlZ6RjBEZGJVSVVT?=
 =?utf-8?B?L2RmL09YcEFxVXp6ZndvMTB1WTE4VldHUDNBVEIyV3pIUUovZW1haGJucEhE?=
 =?utf-8?B?NXg1aTJKcXhsRmxBKzRPd3p3QStPaWZ0UEc5Y29iVzgzaVBtU1lWT2ZQQ3Q1?=
 =?utf-8?B?dXhKSGRaMVVUdXdYcTBRbkxVeUJXYmJ0MlRhaDZFckZ5WHhTS29XSThzQ2oz?=
 =?utf-8?B?OGUzRjFPNHE2QkoyV2U4QVpTOFFMdjA5SXp2c2VhMnB5SHg4VGYvWXEyVDJp?=
 =?utf-8?B?WVlVODFKWkdqWjJtelc4UHN6UUI2cFpYZ1V3bStoUVh0ZDVMVEkvKzdNT1N3?=
 =?utf-8?B?WVY0eWo2anRHU0tBUVpBMkxFVXp3QnZtc3AzNytSOHdSb0cxdE94UzlVbjV2?=
 =?utf-8?B?b3FtQ1MvelhUM0xEU1U4dXNGTHRiZVhJbVc0ZTZLOU94L0FWT2ZqWFcyNzIv?=
 =?utf-8?B?OHBpTlNiRlNZOXR3OTY4eTYraHhWWmdqUDg5SHhvdXcvcHFMdG5wU2RyTWsw?=
 =?utf-8?B?dGNpRk1PV0lvRGJmWnRGY2tnVjAvcEdlemtaSGZ3MkxSMlppZHBGbWpWZWpk?=
 =?utf-8?B?cUdad2VkdmY3Q3greFpUZi84dWlRK3diSkl3K040bkdLSGlObERxcnRyazdB?=
 =?utf-8?B?ZVFObGdpTDhXSlQxNDVxT0FZYWJ6V0xsYi9zOFRwUGJFakZzVGNHa1BWZndU?=
 =?utf-8?B?Mno4UGx6dkFtN2F1aVM1bnMwY2xRU1BoV2taSUE0R3hDMFFZdHMxenYxVzlD?=
 =?utf-8?B?RTRUQlRZVnVMRUR3T2l0cFVNSENaTDlhOFIxU2o5ZEVURTZtMlNHUTF4aGNa?=
 =?utf-8?B?V3E3eTlMR2M4UFJzTHo2UXpwTFB6ejVmV0VlUEpNTzZkUE5pN1liTXk3bXFD?=
 =?utf-8?B?M21nKzNHelVmem9iUkphZjJHcUNzZUxoVlZHS1pDTUN6SFl3RlcwUGNTMHNo?=
 =?utf-8?B?dG14b0F2SE5qSFQ1NVdqcG9vams1R2tvT3hSRnQ3TEo3eDRKVEdkUzQvUjNW?=
 =?utf-8?B?Q1ltVWtUN2tuM0NvUHg3Y1pzUmhzcFdHVytyb1lORk9CelovZTNGUGxQUHlx?=
 =?utf-8?B?M045RVVReXpXaVdxWUxrRWZnbC9pQWoyS1M1Z1RKeC9DbDZDeDFFNUkwemdO?=
 =?utf-8?B?RERNUCtTQTU3RStFN0dZUm1TeDdraDl5NEhkTVh6MmRLWUF5b0xhNC9ad0hI?=
 =?utf-8?B?OEJUakVkSm1RU3I1ZXpEV1dXVTFGOEZKaCsvOU5Ka1k2VE9STmFJeDlXUFd6?=
 =?utf-8?B?b2xVbWdFa3Bva2tRczR3YnpkMStJYlY4Nmk1Ukg0WXNuMC9mZ1hxc0VicVRo?=
 =?utf-8?B?eFREN2NCb1hxZm9ycU9vL2lzQlIzZjRuY2tsMVVoMTZaOXU2WmNtaWhkMjlH?=
 =?utf-8?B?ck9oU201UGlyWkFWbkZOQVllcTY2Tmt2b2RPQkcwQnNZd0FleDhBVkJlbStr?=
 =?utf-8?B?VzRpNXNNR2FHUGMreXplYnpUcnRWYVlGenBab1F4KzIxcXYyZTZtdVdLN1Fy?=
 =?utf-8?B?YVF1ZmYzZGl3R0h5Zm5BWi9Dbml6WjlKcTF5V2VDdlQzZDZVNCtFbFZvR25u?=
 =?utf-8?B?WjhtamxvUXd4Y2ltY2xXcGxONGZHZFlHSXZGZ3JtdkFnRktMOXpscDlISEw5?=
 =?utf-8?B?emNjTDUyRGpMdENlVEdPaUZkL3dBRUs4L25KRllxNWJTMGFSUy9sbHlkZVdr?=
 =?utf-8?B?L1hnVzlobUh2YjFETVBtZS9Gc25JcWF4cDI5UnMyWnM1ZlF1dWNZTlZpMk9D?=
 =?utf-8?B?NzhmZVpXL0duVHBsZy80aWptZGN0eCtzQ3pTSVdrRFYyTkxpNXVRZit3YnBk?=
 =?utf-8?B?d3ZDN2owMUFLNGswSHpoQmExSnY4V3pMU2MvM3Q2WFBTditRVHNzcjA1aGZD?=
 =?utf-8?B?ZzEzT3ZITWExemc3Z3pSenI4UVZjWXd0dnhhNFNhNGp4THlnS0V4OUp6QWhV?=
 =?utf-8?B?ZlBEZ0dIakcrMmROaE5mRnVMWmg1bTBLbzJXTjl3Y1RvSUtaYkUrM01KS3Iy?=
 =?utf-8?B?RWFSRHIvUUltTnlqcWV3UTVzRnBjZ0JIbERHZDREcVNRZ1doUk15Vy85UVBl?=
 =?utf-8?B?Q2VuY0E5eEIwTnU4NTlSK2poTW1pRXNqbWdPS1d4ck1RVDB0M0F0ajJWVlZx?=
 =?utf-8?Q?1c/lZ88zluD73IfAoj82CpGib?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E54C9219DE54DF4B8B48E9F35559C959@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c615919b-4659-4374-4e74-08dbeb96fa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 20:09:47.8728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ulYmovzmPrESuCWv2UWUymYQ8cTZEqoX0XwWkoscxfCHsN9IxhgY7bUuqGD0mXoYhURkowoBrAVUE6cHdHJwLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796
Subject: Re: [Nouveau] [PATCH] nouveau/gsp: document some aspects of GSP-RM
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIzLTExLTIyIGF0IDEwOjUyICsxMDAwLCBEYXZpZCBBaXJsaWUgd3JvdGU6DQo+
ID4gKyAqIFVuZm9ydHVuYXRlbHksIGRlcHNpdGUgdGhlIGZhY3QgdGhhdCB0aGUgcXVldWUgc2l6
ZSBpcyBhIGZpZWxkIGluDQo+ID4gdGhpcw0KPiANCj4gXiB0eXBvDQo+IA0KPiA+ICsgKiBzdHJ1
Y3R1cmUsIHRoZSBHU1AgaGFzIGEgaGFyZC1jb2RlZCBleHBlY3RhdGlvbiBvZiB0aGUgc2l6ZXMu
wqAgU28NCj4gPiB0aGUNCj4gPiArICogY29tbWFuZCBxdWV1ZSBzaXplIG11c3QgYmUgR1NQX01F
U1NBR0VfQ09NTUFORF9RVUVVRV9TSVpFIGFuZCB0aGUNCj4gPiBzdGF0dXMNCj4gPiArICogcXVl
dWUgc2l6ZSBtdXN0IGJlIEdTUF9NRVNTQUdFX1NUQVRVU19RVUVVRV9TSVpFLg0KDQpTbyBpdCB0
dXJucyBvdXQgdGhhdCB0aGlzIHNpemUgcmVxdWlyZW1lbnQgaXMgbm8gbG9uZ2VyIHRydWUgZWl0
aGVyLg0KDQo=
