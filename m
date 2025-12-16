Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E34FCC57AE
	for <lists+nouveau@lfdr.de>; Wed, 17 Dec 2025 00:29:25 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6D410E86C;
	Tue, 16 Dec 2025 23:29:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lo8xb+AV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C6AE45617;
	Tue, 16 Dec 2025 23:21:56 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765927315;
 b=gMtOWpFsxsAZ6cjE+j7bzW0qXOZgnxTuzLSXkcl/t5HgpwCErM/VkfLeAXw0WXln1OSGd
 hUAKIyZlqlw1Bbddp0qTju8H6NFij7F82zcm224IHw9dhLldJwUYNz5tVSbwL9MzDxzDuX5
 zTEtFhGbxfOucvBt5ucbrCy/KZi0R6SiYCGs7HBUQWz7mBxHJ2o243kHH+74HPlbDObLDDU
 VS5Z+yVlmlHZXhaxJnsMqmsHmW7bV/PYT6JEVjcK+PhVQWot4YUj7NT1VlNTrwq7qNrUmx0
 /MXpCyxm1ny2nQQEYzto7hA+Cyu1BdkoW7FEx228JRkgDQXzZihXwJoiOonA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765927315; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Vv9Im5HNbhhNWNkUgymC46Vq6YyQfSk616JPHW0s6cg=;
 b=dQCA83PT7oYOyoxp8KZuguH+51oyyOMnu7rpUMVbKngFtzM2en65k0Z9hgA2MOKbKzb+y
 TaGr6zGjE4XcB/rRTTjxWCSkQS65ebNwdAbxWbetU/32DBldAh6QKcsp3kFDx4kkqQATI68
 Twu9B871vK2RpiOPchAIYHuMkysmUyye0Wg+v+4lmmC1sohRSsTtSUIygpXqvnxUyaSB7oi
 sAeq2LlS26kljRHkQQ/7GHpnHDpO63rYcc3q5AXgv74DrMmAYQ4EF4lUPK3CbPx4CXIu4VQ
 vqyn6Z1ZMkdTvYtshqTsMVbMZL+c7MOOAVJkuBaqtELuAsJD6i4/Weo8YFgQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C88045613
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 23:21:54 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012040.outbound.protection.outlook.com
 [40.93.195.40])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E40710E20D
	for <nouveau@lists.freedesktop.org>; Tue, 16 Dec 2025 23:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdB6y/InNj0TeDvv7MvGjY5hyAUdxBYrErD+2zwfgz13AoH0m+H55CpB70c/FOb6ucqrlIACPIomiA0fM5TmEWa61gcWwn+fLetL3OqfCu/iLSdzYoVGKtxPzWqIi0T1cR0NuilIisOw9StBKyeNGtx1MiVcAwJqNTWZTSgiICra70IMI3WkjmPuG3X5J7Cx86vlzEsJrXO4pJRGS4ZaWPv5yxZQ/OtiEzv5QIpNl5adD207jDARQXT7quhjwx8AEHdy+NsuldHm/ufYQ2BrxLgKbsJNqCe9JJBVBBkQlfd/YvY9Zq1LJZsOF3ReYnP7IoyScGkbJra+YPxNk549iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vv9Im5HNbhhNWNkUgymC46Vq6YyQfSk616JPHW0s6cg=;
 b=NKFfJM0kGcNkiZC2VM+A4y6B6sYe6JOrthIUeqqO5Dwki4WOfe5/nauXPn+Z8efvrgOLL27D7y3krukdMEucv+5PVp7kb3vRsfeCj3C02UqCxBAWDdepLVJ+K/byTIpSQijIhf/RSjGhfgCmxxa+rNcQXwLBQKKd6c/Rvxirbt5izwuzui8tKEPcfv/jocqSguJqxyD0Ec5ZTHsanoRFuQ5HqRtq4ZppI07jOdhhpE7BVHVWZgrb/ECHaZg3rjAdPg2W3YLMkVXWe7dxkQX2V7vRevV/9HYnmTtUdDFdg3xl0PkcsUmoXEBjlPz/Kxol0gq8wVprxERKrZmri8kvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vv9Im5HNbhhNWNkUgymC46Vq6YyQfSk616JPHW0s6cg=;
 b=lo8xb+AVpiGTdPXSaDjn4+znDqZ2UNq41v/Z+GWX8VM3chhZmodyOt6gAbteYL1yQfzWAESQ4zE0XL2aU2jWda64esbPX4elQwIoS5enH0MlRJWCtTfkeTxgNlf9mKZB+4du+TLgIbWfnzyCDDRjVR49k/cAriU2+onsgUEBAwLbv2mc5u6Wab3/KQG6qSR+fTlFxdzropFa4qCUsKbc4mTCL0LEX8zISbRv8SvUc0HCZS4muE6u8iwUFjYVJsykYdLnBUMdIVK9YR/HnuiwoAz4p+8MNRzU86HRYOLlhkTAtQtqN8fXXzmHzStIWWqFZ8B5BsemEEzG6EFGid7K6g==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by BL1PR12MB5825.namprd12.prod.outlook.com (2603:10b6:208:394::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 23:29:13 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9434.001; Tue, 16 Dec 2025
 23:29:12 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "gary@garyguo.net" <gary@garyguo.net>, Joel Fernandes
	<joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Topic: [PATCH 3/7] gpu: nova-core: create debugfs root in PCI init
 closure
Thread-Index: 
 AQHca6j1wQX/qkHUuUaaDA2+kgrCnLUil+8AgABVRACAASItgIAArl4AgAAaI4CAAAenAIAADVWAgAADYYA=
Date: Tue, 16 Dec 2025 23:29:12 +0000
Message-ID: <246c1ad4bb1ca7ef34f331fba33989bbae8618f8.camel@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
	 <20251212204952.3690244-4-ttabi@nvidia.com>
	 <20251215114036.302303e0.gary@garyguo.net>
	 <5b457694fe94757959fe251cc3e3ddf31b6b1fcf.camel@nvidia.com>
	 <a7220609-63e3-4288-84e0-4e3257f2c3ad@nvidia.com>
	 <bc1ff6c7c86487143de7afaaef78d8361f590c13.camel@nvidia.com>
	 <378b8542-86a4-4c8c-b1ec-070d1b2372d6@nvidia.com>
	 <1dcf714d18d63e18afc13830e030209214bb2e7c.camel@nvidia.com>
	 <b2d3a56b-0bcf-458c-a17b-ac3aa25f2543@nvidia.com>
In-Reply-To: <b2d3a56b-0bcf-458c-a17b-ac3aa25f2543@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|BL1PR12MB5825:EE_
x-ms-office365-filtering-correlation-id: 5f21a30d-0087-412f-d964-08de3cfaebb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SjZQb1kyN0RaVkVNY3hVcllOaGVwVlk3eCttejR2dnVkS3krNEF0dlBFdmpq?=
 =?utf-8?B?aW01b3NPd1lvelpHakJmenZmTzUyZWYvTTVXa3cvenlodmVwemVqd2lYSmpX?=
 =?utf-8?B?d05VS0VuMGZEWmZpYUxqM0VnWGxvaXQxbEJhZkNjZDA2TWZYcmdoQjV0Ulhr?=
 =?utf-8?B?K1NucFV0djZ6Skl6TS9CK0tQOVZXU0NwQjZ3MldhQmcrMGh2Wk10V0NKQlRy?=
 =?utf-8?B?cFF5bVREZE1ZVzF5UG9JK2Z0b3hvNTRJdmUwWnM0UERoNFNoTG5sVkcvTDdT?=
 =?utf-8?B?VHZhRzgrOVBNMmtIZ3gyUWVveHhJR2NEMVRTa1c5YXJ5a0JSM0NmRGw4UEcz?=
 =?utf-8?B?U2tsVVNnaXJPVEhXcndTN0tabVFJWTZTcEZkVTAxSHlzaVcrWXQ0SjZFK3g4?=
 =?utf-8?B?cjdOeWV0R2tISmlFYTZlYUh1c2lGVGRpby9vZnpGVUVjZmxuVVljNHB4bWdB?=
 =?utf-8?B?c2czNWEvY1o3ZXQxVWZ4eHF6Vmx1NjZjNGpwcG94WlFBRk1VSDBueTFUeUha?=
 =?utf-8?B?VTZSZzhMQkt1aXRuRmdsdWRiTVFPN0tBRld6SU4yWHlqR0pFcFR6ZVFPblZJ?=
 =?utf-8?B?V24raDZ5SnVjNWxpSEpmZUlML255VlBQajlCVUpCMUZ0T3Y0YzltZURqUDAy?=
 =?utf-8?B?c0dtOHZWdjhSY0Z5NHpBa2JQSFpOU2lYWXlYZjNQeDRRdVg1dmJYNkl6b1hu?=
 =?utf-8?B?U0dIdThWU0g3dnV3WVYyVVJlaGgxTFY2RzE5c0VZTzlnWGwxY0VpU3pTRTF2?=
 =?utf-8?B?ZEIwcUNvMGZoRktaeGU0aEptM3NsSEQxSkxmbmlvRFBWdnZleEJOTGtkZUsw?=
 =?utf-8?B?OTRTb0g1bWphTUZkYlVEYlM3c0JVYXJyS1U3ai9kb0M4c0NKY1M0elhhSHI4?=
 =?utf-8?B?Rzh6N2pMcTRTL2dBZ25wcDUwMDZncVBTb3VpQ3RXT1M1T2t2OFM5azFqMWp0?=
 =?utf-8?B?QlltYTcwLytXY2ZwangwVWREaTJMdlI0TVBmMVpGZmk4UEFzL2FPT3J2cml1?=
 =?utf-8?B?Y2gySEpLUURIT05xbTRMSEE2ZDJkbzZ6Mkk2aEtjd0p0ZjArajVENENtMVBC?=
 =?utf-8?B?MmZJRVVnZkF4cStjeVQ1U1lDbDNIVVMrVU1GalNUZUtMZDMxc1VBdWFUNFNZ?=
 =?utf-8?B?amNKWFZsQno1ejdTQTU0NS9NaEVQRVJzb2tDQXMxRXd1RlZQUC9Ja3J6WHdC?=
 =?utf-8?B?by80OGxUMUVhWnBiK3M5TlY0R2IvVVFoRmdienNRM05LNlNpRVlDaDgxaGVl?=
 =?utf-8?B?WU5IcnU0WTYyb1FscndyOGRIU2k5N1I1R1orOHA2eGh5MGp4dUtmMU9lOEw5?=
 =?utf-8?B?L1VOQXhFOFNYSUtIWmxoOExSRld2ZlA2QWFjQWthTngvMnNaRFFTMnc2a1Ri?=
 =?utf-8?B?UkFsL1lwcG1ma1hmOElRekVwTjNvUW9QaU1uN25DbW1mS043cExFTWVqSkZo?=
 =?utf-8?B?cE1CcGZrNllyU0gyK1BtSkt3SjNUcEIvVHluMU1yeUszdWJkZkIzbWVueFEz?=
 =?utf-8?B?RzI2VHRxOGMxV0hzc3lIdFR0bkZFcGl3eVZrTE93YW9YQVN6WjRKTEV3Wnlt?=
 =?utf-8?B?TENZQ0xrU3NONCt1dENmT29MNXdhL01tWkJQSXllUC9ZTTJUNnB4Z2JIVTJv?=
 =?utf-8?B?YU9VL09qUWFFako4amZXL1FxRTlXMXVmMWhZdFYvSVpSUUFVQ1djeG4wQUxt?=
 =?utf-8?B?SHF4amNsRThkTUxMOGg5eHd3d2VEUDBVdFh6TEgzWTNvdjY1bWZhQ2FFNHFM?=
 =?utf-8?B?aVlDOFFCbmlOOW1ZUmVTeXlBRmxSeWtNNnEwSUhqbVNWcXQwaThXQUltTHlL?=
 =?utf-8?B?cWxYaTdROWZpdjVRWmppeVpReVVqY1d1QXdaZS81UzFDNzRIUXZwVjJ0ZnlP?=
 =?utf-8?B?dlhpVmlHR2FtWEdUZGl0WVRaaGpYQmtxVWdPcFdiSGFZeUtoSXN1RjJvWGhY?=
 =?utf-8?B?MzM0TTdadmRkeExHQUd3dDBVN2trdkF1dm5FTEtWb2lERFc4ZytoeXdQTmdF?=
 =?utf-8?B?dWUyR0FlTDFpU05EaUNJcVhzYllXdkQ5U3pLeW5KeHVPQTd6NnhPRUY4SWRp?=
 =?utf-8?Q?bRzxpF?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB7937.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZXFzYVVySDhkdDZjcUdkdmdySThVYTE1VWdGSmN6Z1FRU3dRakx0VGhWZlRT?=
 =?utf-8?B?OXEzOTBtZWNWc015TWxER2NldFR2dTJ5cnQ3WGtNRTFuRXA3Ky81Y2Yyb3lL?=
 =?utf-8?B?NnF2QWNRWkhqSjhaV3h5SzFoOFVqdEZ4UzlCK3dWdlVHNkxCT2NPZWxZT2VP?=
 =?utf-8?B?UTcrVG81ZEpGZHpPLzN2TlU3ZWpSdzlueHlLa1A3NW5SOWhXdEVHSHpxMm9V?=
 =?utf-8?B?Z2s0N0RhZWtmdHdaYkYvdzh4MTYzb0dVVDJZemcrM0hralR2Slo1UUJ4V2Q3?=
 =?utf-8?B?VjdHaHFLaFVYRXFsNXBnSjR5MTJwRmFtbFBnVS9CU0hlWlgxcW5Ea1RmR0Q0?=
 =?utf-8?B?TlhHYUIrQ1FVZEtFR1JoTDRwMmtUalYzd1h1QTdTOVgwcnZXa2NTbzA3QldH?=
 =?utf-8?B?MTlZR3FBYjNHcVF4bXg0OFppU2NsQjZPMHFiRzVsaVVxL01NVERCcENmc2o0?=
 =?utf-8?B?Y2xUR3QvUEFpRWhaVm9EbkFndUpIN0NCVkgyRlhFb3BONHQzd01YU0lGSkFP?=
 =?utf-8?B?TkkrbiszUzV6YzNqK3hUaUh5WXNkWFdmNlB2RFljd2htZUd6SXRBK1lLNnoy?=
 =?utf-8?B?QmxZaGZqdGRxMDlKMVBFam1mV252MTBOdGVCazlyclZZSitpQWJmQURaOElL?=
 =?utf-8?B?bCtHVlE5SjAzaG1nRkRtVkVLdEhHZXNhUm5VdUNKS0hKa2JxYmZWSVM1ZHl6?=
 =?utf-8?B?ZnJ1R2NIWUxDMFV3a0ZkeVA3THBQVTlqUDFxL3I3eC8zSi84RWpBOGhHTGQ1?=
 =?utf-8?B?TG1PQmtpVUVkLzNVUmZQcmo4Rm1qQSt4cUZTTTEvUmZnSVk2SGVVRHMzeUpi?=
 =?utf-8?B?c25sa1J6Mzk3WXFDaERnQW1xSE9IZjF6SG9lTXBld2RsRG0wUTVialZxVmxM?=
 =?utf-8?B?aGp0NGl0OTFFODU3WnY4SHhYUXlMWTZyZHB4NDR0d1BZdDdCbEhObWlBOXZY?=
 =?utf-8?B?RSsxeEtBeCtsOHEwWk9ydFh0bmI1V1lUNFRnTVM4RVNLUitUV2l3MXZlSUpx?=
 =?utf-8?B?VXB2L0d3ejlGSVVrYTJVcE01b0FPaEJDQ2E4ZXBrMVFFZHVBSkZtN2txcE1X?=
 =?utf-8?B?Sno3c2RCQytHK0d4YnlGUTZoY2pySE5MTDRJcXJxbEFTOEhLNU9wWk4yOFVn?=
 =?utf-8?B?WjNnRGVtMFkxWlo3cWxzdkVkNkZ6aXBQdi9PSTlmeGZXWFUyQVFGQXlUOFZ0?=
 =?utf-8?B?alhYTGNrSHExTG9TRytFb0I2OE1zYnNQa2Z2TDY1NFRJSHhCUVdrQVE1ZWd4?=
 =?utf-8?B?dllqbmdwZEJteW1TUllkQXR4VjdTbmh6TWdudnA4cCtIRklyRGZlMmtyZWNE?=
 =?utf-8?B?Z0Q5NldJNkI0bDVwSU1MNFRWWkV2eDRaVkpWWVhUaHlKUWREK0JraEpoYkRv?=
 =?utf-8?B?VmdPeTVPYStKd2dKdnlBZDBYQytjZkhRWVRlWjltNFcxK2VHUXB4dzk5Y05j?=
 =?utf-8?B?djJWWnYzamI2NzQxcGkxTjBWSGJqL3hiRVM3WjduVXFTMHVKU3BQV2U4bENp?=
 =?utf-8?B?TVBmbEtDWlJuSkFEeGdLNDJRTko4Tk9YR3hoVzF0bndjeUk3TW9jOEJlOHBE?=
 =?utf-8?B?TVlROEVuWS94VStnLzlOQ0JsNTRYNGRGVlMzeUdmVm5ONW1DR2NTMVdKRDI3?=
 =?utf-8?B?Z29hS2QybUxZM3IvQU1ld1RMVnRqdFRSRlg5YWV4UmpjTnhCN2tOblVYdHF1?=
 =?utf-8?B?THoxcit3bHUrTHBQdjB3NEhxU0syWkNHclltV1ZDU3ZrdHZrRmx0Z1RZRHV3?=
 =?utf-8?B?SVZGR0pyZitpQ1NlVSsvcEw1VnVLMnJibjJsYUI4SWhJTFJPTXl2RlVkbmFv?=
 =?utf-8?B?TFF0NU96YldEaGlTb3gvYithcXZNdVNLVVJ2a1V4YzNwU2xVU09GV1ZFYmly?=
 =?utf-8?B?dzBXazNCZEhFa0VTQWJSRTFRSXdEbkhPZkpLWHV3aFpRRFB3aXUxV3dHeFJz?=
 =?utf-8?B?Z0xkK2xXYldwM2xVcXhUNEwvbE4rODdLQ0oyY3ltYVZsdHFuRXB1aGJ0QXVN?=
 =?utf-8?B?Q09vMjJ3QmdUOUxTd1BTVVAvd0JwclVJd2pDcUxNb3BlaFl4NFM2ZTY5dHVC?=
 =?utf-8?B?VkRudWEzWUYwWFJKVmFTa3FvT1d3Vy82OUxrWUpiVllPalRnaTVDWHhEL1Bn?=
 =?utf-8?Q?nUQEernitFtzhQ8pTewV8/LiV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D7417A33E762443923D1F14778835F5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5f21a30d-0087-412f-d964-08de3cfaebb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2025 23:29:12.7202
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 RDjbQ86DDzXHEwG0wLJcg88drB1rbj5VHHD/nRqas3SzkgBrr7gE7aMnDSGeoh3Qt42dQCvnsiAJQzyyuGqQ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5825
Message-ID-Hash: 5J7Z7KT2NM6KSXLISWOIIF74RS7NKMT5
X-Message-ID-Hash: 5J7Z7KT2NM6KSXLISWOIIF74RS7NKMT5
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5J7Z7KT2NM6KSXLISWOIIF74RS7NKMT5/>
Archived-At: 
 <https://lore.freedesktop.org/246c1ad4bb1ca7ef34f331fba33989bbae8618f8.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVHVlLCAyMDI1LTEyLTE2IGF0IDE4OjE3IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gPiBIb3cgd291bGQgdGhlIHNlY29uZCBwcm9iZSBrbm93IHRoYXQgaXQncyBub3QgdGhlIGZp
cnN0LCBhbmQgd2hlcmUgd291bGQgaXQgbG9vayB1cCB0aGUgcm9vdA0KPiA+IERpcj8NCj4gDQo+
IFNpbmNlIGRyaXZlcl9hdHRhY2goKSBhdHRhY2hlcyBkZXZpY2VzIHRvIGRyaXZlcnMgc2VyaWFs
bHkgQUZBSUssIHNpbXBseSBsb29rIHVwDQo+IHRoZSBkZWJ1Z2ZzIG5vdmEgcm9vdCBwYXRoIGlu
IHByb2JlKCksIGlmIGl0IGRvZXMgbm90IGV4aXN0IGNyZWF0ZSBpdC4gSWYgaXQNCj4gZG9lcyBl
eGlzdCwgdGhlbiB5b3Uga25vdyB5b3UncmUgbm90IHRoZSBmaXJzdCBvbmUuDQoNCk9oLCB5b3Ug
bWVhbnQgdG8gdXNlIGxvb2t1cCgpIGluIGJvdGggY2FzZXMuDQoNCj4gSW4gQywgZGVidWdmc19s
b29rdXAoKSBjYW4gbG9va3VwIGEgbmFtZSBmcm9tIHRoZSByb290IGlmIHBhcmVudCBwYXNzZWQg
aXMgTlVMTC4NCj4gDQo+IE9yIHdlIGNhbiBoYXZlIGEgRGlyOjpmaW5kX29yX2NyZWF0ZSgpIGlu
IHRoZSBkZWJ1Z2ZzIFJ1c3QgYWJzdHJhY3Rpb24gd2hpY2gNCj4gYWJzdHJhY3RzIHRoaXMgd2hp
Y2ggZG9lcyBib3RoLg0KPiANCj4gQWx0ZXJuYXRpdmVseSwgY3JlYXRlIG5vdmFfY29yZSByb290
IGRpcmVjdG9yeSBhdCBtb2R1bGUgaW5pdCwgYW5kIHRoZW4gcHJvYmUoKQ0KPiBjYW4gYXNzdW1l
IGl0IGV4aXN0cy4gVGhhdCdzIGFsc28gcm9idXN0IGFnYWluc3QgYW55IHBvc3NpYmxlIGNvbmN1
cnJlbnQNCj4gbXVsdGlwbGUgZGV2aWNlIHByb2JlcyBJIHRoaW5rIChiYXNpY2FsbHkgdGhlIGNh
c2Ugd2hlcmUgMiBsb29rIHVwcyBoYXBwZW4NCj4gc2ltdWx0YW5lb3VzbHkgYW5kIHRoZW4gMiBj
cmVhdGVzIGhhcHBlbiBzaW11bHRhbmVvdXNseSAtIG9uZSBvZiB0aGVtIGVycm9yJ2luZw0KPiBv
dXQgYW5kIHByaW50aW5nIGEgbmFzdHlncmFtIGluIGRtZXNnKS4NCg0KSSBsaWtlIHRoaXMgYXBw
cm9hY2ggYmV0dGVyLiAgDQoNCg0K
