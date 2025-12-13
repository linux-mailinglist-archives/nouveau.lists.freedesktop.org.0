Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B27CBB295
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 20:19:12 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DBEF310E3DD;
	Sat, 13 Dec 2025 19:19:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ucXnBpCD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9CDD64510D;
	Sat, 13 Dec 2025 19:11:49 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1765653109;
 b=njl3YL9HE9HHZ2hn+/tRVobozjMlMXWmtDQtnLs74gCxWVODgx/o9TVxviKkq3lCMt5jP
 DF0hfsrdfUDKBSNbhwZPU+2fLrNePTwLmdMTRFy3x/AGlrMg/99wVKK18v/S83EDl26h4eL
 gl7nW5M94iXfBvAz0wRv5BbtzpADZamnocLkLPF5BLyax321hfdz3NpjlUZx4fsxa8QX0cd
 Luj+Sr4KPrhGIm5jpt3Ze2NxY0BnDVisx98DEHC6M+CHB8/jpK7MkOhOVRc4SD5kqJkhjeI
 q51cvaFc9Sz35LAX62M0JZVaMtG4F7Dc6ErKuYVWDhD++92h6dnBVfknt/nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1765653109; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gVAmaCkuUVr0IoTpC3689/Rm8hGt0Zyvp+IlkzCjmXQ=;
 b=mkcC3Zrf2bauJSSxdBz8FRct8ZYiJ/QTqhqDEYP2mGgiLPJtO3lNI343lEsuYvGgCKpIS
 MCVJOnVZpoJmu7IY8lXPXCEkdYthl365nPE9Ndvsde+cB3MehYf5xIqCV67W93ZOLwAYQxE
 vZjaWeVP+f0UO0fgSw2lrrpyD/WrvbeGTmcVuD6i9/PJPCyn1lDbwz4tq6h4BB/QyJqeC4r
 ZCQScoVwjk4quCW16uqzK68wtV84KygM8wbzzGSgWphXDM1syXbJcfYgsWWp6P4tVj7/M+A
 fmISsUFM4jH+3g1j6zy/d3Xsdfxj4l8fN/xhcCvPUBsWdqBo3BorzgwQk9sQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A7B704510D
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 19:11:47 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011071.outbound.protection.outlook.com [52.101.52.71])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA7D10E3A1
	for <nouveau@lists.freedesktop.org>; Sat, 13 Dec 2025 19:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOTYe3Gu3JwkeCRVV0k2hckicVB6VzD+2PByhShu66ojB31TC/+FbgMo/9hLUUUnN+0gJXtfp3HiPMpahgUCMz0xzo0lr9y9qE8uu6mVBplk8l5vpipAhmt/mQfHrQPQKdTYpD/eXk+iAo48XommZxesafq4Gs0qMN+ToqyoljczadTCdlSQWvzvMG9BCJekSC8OQdR8tvx0uWW3WNTzS0aSJ33jjzlhtVR6vjLp9rZ3xlv3khmlOaTIBl9JgHDiZ+RoVVLHC6Axk180UEgFs8huntpt3lL2sp1KiANK9nlHFKi2fkRS6VlE3zX52N4FG5TYZ5/rlDbj5SfFJe32gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gVAmaCkuUVr0IoTpC3689/Rm8hGt0Zyvp+IlkzCjmXQ=;
 b=NjOBn5OcYCGrS2gg7iO57sPTGsRDueTklMaOySDrUP/Kiv7CC2X7whFdpGD1kwX2XzG8CRDpQlGnZTSxcnEUlDCJHQKnoYGpLKXpMXqye6UPJPqwgnfSRVel+KhpJWOv5XW7a+XUSFJ9vvm2IVed3wBO76AmeJncSkXgBoQKRWp+tvCtZE9kansFFySqaCRT98sbzX1Z9sCtI4Yw8cWN4FddKtkzXbCkbo/EInkk3T+TjYmLe2RoF+fX373OJ3nGC9est6vEqyPBnYS3fqXfgrpodh5ZY99vgK0AI9ra0YKO1GJMbR9TGxDZpyw9vDBLVXQ11XEb2le8zAkeIgp5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVAmaCkuUVr0IoTpC3689/Rm8hGt0Zyvp+IlkzCjmXQ=;
 b=ucXnBpCDAlN3yey2O6PCTh4ZJYNk8g8xQeu/uuXHrXiB/11JqqeHwHoa+op+7kihZRqPUJcWbqjMqywQ2FLIojMoiw0YH0VUpvlq/A97MypB+0S1oOnBDkEtXV8J/XmoVQUxKsphOXjRkNBZp1YS0AO+gzjDYz52Lm7x8nSrV3TV56qp/uA065Kp5+9B9uNz3wbp50VV5teC0GEbGgKDXPHYZEfnV9fCnQkfSQJhn5yGA3QEw1KoclfhmaZ+PNzR1Vf38Txg7j4sABGxgMRGa0ljHIBN+rLLB/TOp8xJJ05ySYR8kIP7CPAqRoG0pEVgbVh6VuUKgr0o7yFZuCrmJg==
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8176.namprd12.prod.outlook.com (2603:10b6:510:290::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.12; Sat, 13 Dec
 2025 19:19:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9412.011; Sat, 13 Dec 2025
 19:19:03 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Subject: Re: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Topic: [PATCH 0/7] gpu: nova-core: expose the logging buffers via
 debugfs
Thread-Index: AQHca6ju44jH81ceSE6wxcToJM4SIbUf811e
Date: Sat, 13 Dec 2025 19:19:03 +0000
Message-ID: <A398B50B-0D35-4DE4-B6FF-E434608C401A@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
In-Reply-To: <20251212204952.3690244-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8059:EE_|PH0PR12MB8176:EE_
x-ms-office365-filtering-correlation-id: 8f222c8d-1f79-416d-810c-08de3a7c7a3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M2htU1JqUjU0MG1pa1hyR01jNDRQak1IMkw3RlVPVFFmczlEekIvSWd6ZzlT?=
 =?utf-8?B?K0ErU3FRV1orSE9xVGgyQzBQbFh2WEVYYTRaREI4dTVsOTdOZDF3OElMaHFp?=
 =?utf-8?B?MUdrNE5rL29QN2dzd2JrSzlUMGp5N0ZBbFpOMlVSaDNOSDZPNDdLYllEOENB?=
 =?utf-8?B?d2tCLzlvVzZ2V0JoY1VIdHpXNlFORnB5R1NCekp4Q1psWjhWbm1qRkFHazVx?=
 =?utf-8?B?N0dwc2h1ZmFveTZIeE5aVG5KL0NVckhCRnRLbmRZU2tKMEpGZkNvUmgwT3Vr?=
 =?utf-8?B?ZlZhQUdkNHY2eHl2Z3g2ZkN1R2JYc0JuYUh0RWdwWDM2YWk3dHdVRytGYXVZ?=
 =?utf-8?B?WldOYXA1SHM0c1c5aW00dWRDVGFRbHpBMzBsSTBvdVNRdzlDUGpCZG15VXc4?=
 =?utf-8?B?Q29QTE5uOGRrR2l4bjkyUktPOGJONDN3ZFM5d1Y1TUU0OHRoa3o2TjZ3OHFl?=
 =?utf-8?B?eEoyWlZNcW91dlpCT1BuN2xjNkpZckFIaGVTaStRMEdWcEtGcGVUNUtGN016?=
 =?utf-8?B?VFlINTEydXFGMFVrdkFwamNpQ2JqUGNaS0RGSGtrRTFSWHlrVVQwZkhNNnhi?=
 =?utf-8?B?NEU4dE4xUE9vb0lRYjJ4Tzhzd1llUFgybU9sTm1haUNqU0M2d1dURlh4Ukd1?=
 =?utf-8?B?dm9pc0hKSGdBdDVFbWYvaytPcVE2TE5qbjBCZlQ2N0Zxc2pEdjdqTjNEUENh?=
 =?utf-8?B?V1R1Ym9iRHR5bGNUMFRsNkRkVzZ0T2FJOXZyZXZGZWVGdjFmN3c4eTMxbkxu?=
 =?utf-8?B?bktwTlFsY1RFd3c4enZUb2R1TlZIWWdqelZia3A3SjdORmdUVFQxY0tycXNJ?=
 =?utf-8?B?bHFFcnR1eXgzNTA0M3JYM3c2V29SUGZZaVE5UnJSUUdLeG5kM2dKd3hqK0lT?=
 =?utf-8?B?R2hqU29PdXo0VU9aMkhDL29vQXFUbUMwV0tmUjdnUVBHTWVvQlVXZ0lCditm?=
 =?utf-8?B?SUdVRkd1NGkySEpSNldKRUxnbVZrK0xPamlYL0FrNGJXdUUwczRSc3l4V294?=
 =?utf-8?B?NlJLQko0N3hTWDUyL3ROWU9tTEFEdGRGS1AzRllqd1JCVzNUUSsxN3JIOUFt?=
 =?utf-8?B?dUF3L3d4OHNzbHNpZEpveFVlRWMyYjZKR0IzRVcvQlFCSlBjRHlLN1dHWFZa?=
 =?utf-8?B?Ny9IbGNCdGt0bEYrOW1rMVpNbWw2MjIrT00ySm1pWG81aE5TS1hUaEZyU1h0?=
 =?utf-8?B?MnovV1oyV2c1RkpZb2lOd2VzM3lmWWhQdHQxaU8vSlpBR0lESFBLRnBUZWQ5?=
 =?utf-8?B?OWZ2Zkh3bUpwbml0T051VGNIT2J2cGlCZ2s2ZHBsSEY1eWJ0Z2x0RDdJOXBF?=
 =?utf-8?B?dmNEb3Z1OFE3OEtBTzRGblh5ZlpNbWlPbk9kSVk0K01VZ0RabzQzeEJBSWxv?=
 =?utf-8?B?TVJKMWpZempLOStEQTIxMU9ISDdObHZ2YjVtWWNUK2JUcG40WEp0M3RPbDQ0?=
 =?utf-8?B?VlE3SVlPRWdCenM2U25DbEttVVZPOFA5czJjMFcreWRJSmk4VFhPQ3ArbmJX?=
 =?utf-8?B?dHpnaFZROGxTRmlZYWFuYUlDTThFOEVqWUp2aVZ3M2EwUTlVS2xCeWRucDZy?=
 =?utf-8?B?UzgyR1pzTkFaa1A3ZXhQanllYTNOOFVWYVkyYTNMMmJKZ3hOMTEvUDZtZHNB?=
 =?utf-8?B?RlpoR3QwdUlaUzVRY3BtRnlsMllwUUw5dW5VN2drZGJxWmtDZ1Vtcy94MWpP?=
 =?utf-8?B?WWx1ZFY0dVpoSTVLZkVjeVVDWGY4NEhWd3pQWWFmbEJHQXhyeHBHaDFqaHRs?=
 =?utf-8?B?b2MrYzJuRDJleitlV1Bsa3hnYk9Mb3hlTitjSG82RURUemtiNHd2TzcrZ2xw?=
 =?utf-8?B?SGE4QVNvTGpoeVFzdTFvWWNyeWx4VVRWejFDSDNlOTh4L3NOU0NpaXZiNGJl?=
 =?utf-8?B?Ynp0UzFpM0Y0cVRnUHIvc1ZWZWZPcVNLb0FSK25YSXBLOWxQYnFJTCt3ckpK?=
 =?utf-8?B?Z1I0dHllcDcvdHBIUTZCa3AvTHFnM3lDMlRDWk1PQ0VuNDliSWlncnNXTmJ0?=
 =?utf-8?B?d0pCdWZ0dHZwbDhNRXJQTTk0ZzVMclpjb1d1SW5vV1FMMWY2dG5Lc1BVdE8x?=
 =?utf-8?Q?yb2hIz?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB8059.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bldPWlNwNDl6c3ZVcVE3WjVoQVFNRnZqcUsyQ0NJcDQzNk91WUZMYksvVWlu?=
 =?utf-8?B?S3FMUTJCT0xiN080UVppRFpXcWZVMnFaeklNMGVHZG43NnFqajZKZUVvb3Vl?=
 =?utf-8?B?MnExWGlBWWhFRms4TmJ5TC8rTjlRREp0OS9yR09PTEVOaUk3Um82WmNmc0I2?=
 =?utf-8?B?UXpqYXcrM2lSUnlEMytySTZkcFZzVzJEeW4rZ2Q3dFQ2TUlSRWFTQmpZTUF6?=
 =?utf-8?B?N29wL1ZOQ3RNQWlUamxMcENvdnBGb1RUcEFRVHNxVzkydHBianZPTEtTMnBw?=
 =?utf-8?B?d3ptVWUwMVB5RkVicTJla2FGeXJVUFNxdjBYdmdML2tvTVgwcVY4NVRSaEc0?=
 =?utf-8?B?b0wvN3Z4azI4eHUrMEx3RDFLZGN2Tkw3Nm45NUdJMzlDTVpXNzAvZlJTbU1C?=
 =?utf-8?B?RW1WSlVZUUZCVGFNRkRqVDg3T2NLa1B1MFljVklGNEMra1hsRUVBNGZjOWds?=
 =?utf-8?B?TzVqZWE0U09PS3d0MWFNMXN5MzRXdWNxM1dreVhXS250bGVLOVFKYzg1ekJ6?=
 =?utf-8?B?UDY5R2Zsei8vd3dpMlNzeExxM1JNRDY2bnUvc2JwRG54MmJ4K2t6WHgvUWdM?=
 =?utf-8?B?OWFqOGNwNWJyK0gzelVSeXZwZGx2WEZUZEQ0UmRBQ2drTjd4SkdDTGpvVnF4?=
 =?utf-8?B?bUhNN3FKZFlyZWs4c20rVHNCTCtkS0wrMGxmcnFDVkt6RnNsVHJBc0xYcllL?=
 =?utf-8?B?NWJaSzBOVXNFMUd4UTA1OVYvKzBvajFJcXdlcWNja0tSalZNYVZYWis2aTlV?=
 =?utf-8?B?M3VqMmhFakhoTzJWTW4vL0FTZWM4dDlBcEFDaWF4R2o5UWt4TlRMaTQrR1RE?=
 =?utf-8?B?SkR4TVBtSXhJcU93b1lIaExXRDJ0c0dvKzlMQUZlbzUyeVE1Y2crVU8zSmNq?=
 =?utf-8?B?N2lSNG1weVcvYUpZOXlRZStaYXZBN3ZkRGJJTUVZb0V2cU9iZDhIakVQRDAz?=
 =?utf-8?B?MjVETkVRR2dTZFErTStyQTR6SjZ0SnU3TnVzU1lEcXo4T1JITm9SL3c1NGdk?=
 =?utf-8?B?dE16WVRtQVE5TzlYVEZjbjc2UUNFTWhLQkZZUHdVSnBzYXUxc0c5OHplMTJm?=
 =?utf-8?B?aWw3RWpoR2JZN0w5UVVDUUtER3l3a3hmMzFuZ3A1c0treGxKZU5Va0taWEQ4?=
 =?utf-8?B?RjYzWEFiRTZmS041QzVnQUhlb1l3S3hQRGNBSUpKSjkyOEp6T3M2b3FoMVZN?=
 =?utf-8?B?NjZOdlc2L2pTNkRRTWxQeFdIeXVpcDFMVmc1YmduWXVFVWJIQjZxQlRSeGl6?=
 =?utf-8?B?U3M0dkdaTFRqOTAzVi9FUldpazJ0bVR1NWp1ZGNRMk12NmlkZ1RUNXFRa3dt?=
 =?utf-8?B?QUJWWTVBeHdyNFNpbENkOEk3VXhWQ1NYZXlPejRIUnFGK3hWNEVSRTFKQ2VI?=
 =?utf-8?B?RXNiVnk3MDgwWmFKNmhKY0Q3aXpmWVExUDFpZ3Y0MmhYWkUxWWhQWUh5bEQ0?=
 =?utf-8?B?c0ZwWSttZHlUUVVZNkFweUkrQmlDQjBPZlF5NlRzNWkzcWwyV1FodVZaZFpW?=
 =?utf-8?B?WUxNZzdZdzZoSVNpcTM2emRvVWhySnVOS0Z4SnVRemdXYmZVUHV0N3NWalFv?=
 =?utf-8?B?OVJBWEQ5ZjV1TE4wamZoWkluUzBVWnJtU3VwelBVY3gvT3JBbEI1RkoweVNB?=
 =?utf-8?B?blkxN0ExMmVRRGtzUDBpN0x6VUE1RHVJRWhTYmlCK3FZL1hnRWxIU1JOeVJS?=
 =?utf-8?B?b3B6c1pKZUloQmNmOGQ1TTlSUkZ3U2pPS1h6bE5Ca0RxOFdIWS9OU0VHSE5I?=
 =?utf-8?B?Q1JNQjlMUlZIMWphbFp6ZmMxR3phL0lmb09OZnd6MXZqc1Uyb2QwVjR1NmlJ?=
 =?utf-8?B?eGk1OFBWRnYySTZzMVNiWUx1b2ROSXJsNzAyclNmZ2pxVWxXMzZoUjZPd09V?=
 =?utf-8?B?OHdtRHdaRlR1MGR1RDNOajN1SkFsaVJGR2lBM2JXNjFObzZVWkVWKzVhR3dF?=
 =?utf-8?B?b0lLU0dmYlA3TnVyNUx4QUNXc0xybHBkRWNveUlUUU1lUlZCL3hEckNVLzE1?=
 =?utf-8?B?TDkwOVNjTDVNRVhmNzBFbUN0Rjl6QVRGL3hidGJHOGRtOUl2dnRwQURKU3pP?=
 =?utf-8?B?TXJFQmZCamcwTHRsWnhDZmpYVFRuTXJEYWxoemxXR0IxdE5EUWFNVTg5VXp4?=
 =?utf-8?Q?DSbxjBN3BAhvr7eusIc6FmmQv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f222c8d-1f79-416d-810c-08de3a7c7a3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2025 19:19:03.3940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hg1Tq8Hmv1VCN0uF9lAk+/9Hy9VlIQun4REOH2czVCL4yIPLHWwX00zwl40TNvs1YOBhG2Fl3YNqG6p7ynFc4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8176
Message-ID-Hash: KFGEPBP54G4GP6YAADXTN3K5E5ZQPOPL
X-Message-ID-Hash: KFGEPBP54G4GP6YAADXTN3K5E5ZQPOPL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KFGEPBP54G4GP6YAADXTN3K5E5ZQPOPL/>
Archived-At: 
 <https://lore.freedesktop.org/A398B50B-0D35-4DE4-B6FF-E434608C401A@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDEzLCAyMDI1LCBhdCA2OjAw4oCvQU0sIFRpbXVyIFRhYmkgPHR0YWJpQG52
aWRpYS5jb20+IHdyb3RlOg0KPiDvu79HU1AtUk0gd3JpdGVzIGl0cyBwcmludGYgbWVzc2FnZSB0
byAibG9nZ2luZyBidWZmZXJzIiwgd2hpY2ggYXJlIGJsb2Nrcw0KPiBtZW1vcnkgYWxsb2NhdGVk
IGJ5IHRoZSBkcml2ZXIuICBUaGUgbWVzc2FnZXMgYXJlIGVuY29kZWQsIHNvIGV4cG9zaW5nDQo+
IHRoZSBidWZmZXJzIGFzIGRlYnVnZnMgZW50cmllcyBhbGxvd3MgdGhlIGJ1ZmZlcnMgdG8gYmUg
ZXh0cmFjdGVkIGFuZA0KPiBkZWNvZGVkIGJ5IGEgc3BlY2lhbCBhcHBsaWNhdGlvbi4NCj4gDQo+
IFdoZW4gdGhlIGRyaXZlciBsb2FkcywgYSAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3ZhX2NvcmUgcm9v
dCBlbnRyeSBpcw0KPiBjcmVhdGVkLiAgVG8gZG8gdGhpcywgdGhlIG5vcm1hbCBtb2R1bGVfcGNp
X2RyaXZlciEgbWFjcm8gY2FsbCBpcw0KPiByZXBsYWNlZCB3aXRoIGFuIGV4cGxpY2l0IGluaXRp
YWxpemF0aW9uIGZ1bmN0aW9uLCBhcyB0aGlzIGFsbG93cw0KPiB0aGF0IGRlYnVnZnMgZW50cnkg
dG8gYmUgY3JlYXRlZCBvbmNlIGZvciBhbGwgR1BVcy4NCj4gDQo+IFRoZW4gaW4gZWFjaCBHUFUn
cyBpbml0aWFsaXphdGlvbiwgYSBzdWJkaXJlY3RvcnkgYmFzZWQgb24gdGhlIFBDSQ0KPiBCREYg
bmFtZSBpcyBjcmVhdGVkLCBhbmQgdGhlIGxvZ2dpbmcgYnVmZmVyIGVudHJpZXMgYXJlIGNyZWF0
ZWQgdW5kZXINCj4gdGhhdC4NCj4gDQo+IE5vdGU6IHRoZSBkZWJ1Z2ZzIGVudHJ5IGhhcyBhIGZp
bGUgc2l6ZSBvZiAwLCBiZWNhdXNlIGRlYnVnZnMgZGVmYXVsdHMNCj4gYSAwIHNpemUgYW5kIHRo
ZSBSdXN0IGFic3RyYWN0aW9ucyBkbyBub3QgYWRqdXN0IGl0IGZvciB0aGUgc2FtZSBvZg0KPiB0
aGUgb2JqZWN0LiAgTm91dmVhdSBtYWtlcyB0aGlzIGFkanVzdG1lbnQgbWFudWFsbHkgaW4gdGhl
IGRyaXZlci4NCj4gDQo+IFN1bW1hcnkgb2YgY2hhbmdlczoNCj4gDQo+IDEuIFJlcGxhY2UgbW9k
dWxlX3BjaV9kcml2ZXIhIHdpdGggZXhwbGljaXQgaW5pdCBmdW5jdGlvbi4NCj4gMi4gQ3JlYXRl
cyByb290LCBwZXItZ3B1LCBhbmQgaW5kaXZpZHVhbCBidWZmZXIgZGVidWdmcyBlbnRyaWVzLg0K
PiAzLiBBZGRzIGEgcGNpOjpuYW1lKCkgbWV0aG9kIHRvIGdlbmVyYXRlIGEgUENJIGRldmljZSBu
YW1lIHN0cmluZy4NCj4gDQo+IEFsZXhhbmRyZSBDb3VyYm90ICgyKToNCj4gIGdwdTogbm92YS1j
b3JlOiBpbXBsZW1lbnQgQmluYXJ5V3JpdGVyIGZvciBMb2dCdWZmZXINCj4gIGdwdTogbm92YS1j
b3JlOiBjcmVhdGUgbG9naW5pdCBkZWJ1Z2ZzIGVudHJ5DQo+IA0KPiBUaW11ciBUYWJpICg1KToN
Cj4gIHJ1c3Q6IHBjaTogYWRkIFBDSSBkZXZpY2UgbmFtZSBtZXRob2QNCj4gIGdwdTogbm92YS1j
b3JlOiBSZXBsYWNlIG1vZHVsZV9wY2lfZHJpdmVyISB3aXRoIGV4cGxpY2l0IG1vZHVsZSBpbml0
DQo+ICBncHU6IG5vdmEtY29yZTogY3JlYXRlIGRlYnVnZnMgcm9vdCBpbiBQQ0kgaW5pdCBjbG9z
dXJlDQo+ICBncHU6IG5vdmEtY29yZTogdXNlIHBpbiBwcm9qZWN0aW9uIGluIG1ldGhvZCBib290
KCkNCj4gIGdwdTogbm92YS1jb3JlOiBjcmVhdGUgR1NQLVJNIGxvZ2dpbmcgYnVmZmVycyBkZWJ1
Z2ZzIGVudHJpZXMNCj4gDQo+IGRyaXZlcnMvZ3B1L25vdmEtY29yZS9nc3AucnMgICAgICAgfCA1
MCArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4gZHJpdmVycy9ncHUvbm92YS1jb3Jl
L2dzcC9ib290LnJzICB8IDE1ICsrKystLS0tLQ0KPiBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvbm92
YV9jb3JlLnJzIHwgNDEgKysrKysrKysrKysrKysrKysrKysrKy0tDQo+IHJ1c3QvaGVscGVycy9w
Y2kuYyAgICAgICAgICAgICAgICAgfCAgNSArKysNCj4gcnVzdC9rZXJuZWwvcGNpLnJzICAgICAg
ICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysNCj4gNSBmaWxlcyBjaGFuZ2Vk
LCAxMzEgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFzZS1jb21t
aXQ6IDE4N2QwODAxNDA0ZjQxNWYyMmMwYjMxNTMxOTgyYzdlYTk3ZmEzNDENCg0KSSBjb3VsZCBu
b3QgZmluZCB0aGlzIGJhc2UgY29tbWl0IG15c2VsZiBpbiBhbnkgYnJhbmNoLiBXaXRob3V0IGFu
eSBtZW50aW9uIG9mIGEgZ2l0IHRyZWUgaW4gdGhlIGNvdmVyIGxldHRlciwgaG93IGRvIHdlIGtu
b3cgd2hpY2ggdHJlZSBvciBicmFuY2ggdGhpcyBhcHBsaWVzIGFnYWluc3Q/IEkgYW0gbmV3IHRv
IHRoZSBiYXNlLWNvbW1pdCBmbG93IGhlbmNlIGFza2luZy4NCg0KVGhhbmtzLiANCg0KPiAtLQ0K
PiAyLjUyLjANCg==
