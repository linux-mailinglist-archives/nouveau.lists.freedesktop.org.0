Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0ECA56FC
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 22:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D6D10E1D0;
	Thu,  4 Dec 2025 21:18:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eNaPVSPc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011054.outbound.protection.outlook.com [52.101.62.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76C710E1D0;
 Thu,  4 Dec 2025 21:18:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KMLAKc5cAJgmAHtoV65YEtStBA5GeB4tPdlbHusYTcD30lcS1jK3dLnl3JsZrTt+wT3UzPmywtqqckikabUbT8nsSZ710z8F16uSokBvXRPLetZDaSdfyqciklK3uQXt3l5oFTs+AxsYnV9jLwnLHT6ZDMXF3ks1SW3vPAz6nQCgCJZHdvL5BLA9MRRnGSj1r3li/aSwLP4rtciuAkNXH617pepS8O1KkKUd+Ex55b3zp+9urpD3MbMOWasB6XMvZYPNT/mrtXlkiC4w7iLJ31IVyWxGLne1UDln7Pe1v21fif2yJ57gobvUuQKy6Cgn6nrpkJbloyvei5yhTiN8Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYM4rsg86NVYjNT3zWcCCIWaUnvFFBB90/EQgHNpdHU=;
 b=j0n6N1yryOv0Qsb7+OwGJ+YQ1vR1JKgbuMJFpyReaWOWbSH93TOwa+FAeDHKCDHxKhlAHcNhM2LRIdMUFMNBg4zEa5VbUp4G5tNmXKIUgeS2v9pMvcNGXT4DyXaW77M5mmXRFuGRudRpVyovrMiSbUfVjYe0QWXktn9pr6oSLFRXOLEAkXwKotT4K5p8mjlUCPyiYNO4qzkXaYJUyRNLm5V6IYmmLlV4HgKcrVVnVfvWfWs1duCaBVV39tAR2ieXvHfCEGc4pPhZe3yj6cBYknb57laVYA3oorJSfvCfuvMSCIXbNtly8gSxv3xYvavgHkPYLZHMzZKnc0aDmnt9qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYM4rsg86NVYjNT3zWcCCIWaUnvFFBB90/EQgHNpdHU=;
 b=eNaPVSPcSgtSR2jpYZ+S06s22YAxJO7j9ruAWZuawhawwjx7zN45le5Q3Dfx0kLD/boVum1WYxavr2tidIxThaWlTs54ZTJEAqffi8Hy73GFwLPVemgqBXv/IcpF898sb/lVdsOZKU52tebIjF2BEBfmGpqx2Y59Nt7nLlTSWf58ILDByhuUXzJgiBgwTEDjkrW/X220KMrqhHKUX8cM9hiMRpngr24gELct1TRNZkTUPtfJrbRiFeq3WPh4B/+KGoJ+qR1Gr7y8deir+qRPzD6FUxdHUTOqm4J9GBPVub5Uz+UBQeFjXoLMSt9NrLRFOb37BLW7uBSe5bxkfuZaYg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CY5PR12MB6347.namprd12.prod.outlook.com (2603:10b6:930:20::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 21:18:43 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 21:18:43 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Topic: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAbumAgAFSlYCAAG55AA==
Date: Thu, 4 Dec 2025 21:18:43 +0000
Message-ID: <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
In-Reply-To: <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CY5PR12MB6347:EE_
x-ms-office365-filtering-correlation-id: 0a58eef8-00d6-4fb7-502e-08de337ab427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZDBEaUZHZlRNTFBuOS92YVdCdG5YSVE1NzN0T2VLNGxrYnV1d2wvS3hYaWRN?=
 =?utf-8?B?T2lDRFliS3pwMmt3SkxtRjNxTDEybEgwVzZFLzlaUW5NVUhtRWpxSzdCRU5w?=
 =?utf-8?B?c2VMR0hvdVRsKzgyai9MeWNUaHFTeUNEMFV0SnVrcUx3TmgzVFNIZHdTSmxi?=
 =?utf-8?B?MHN2Z3ZZR0ZrRVc3OVYrUUdMWWlubmtPbCs0aWRWSE9ldHk3c1FqRi9zR2ZP?=
 =?utf-8?B?U0t5VmFPcTBoR0ljSDFobXRkY3pWYmVNZVNzUVhoS0hld2UvdkdkeCtiT0NQ?=
 =?utf-8?B?b1UwMld5TVE4NlovZG4xREd5Q3dDdkZ2VHl4cFRWMzNOYUVDQ3pYNHp0R3dO?=
 =?utf-8?B?R0VudFdHeTdESFJpTGdmNGFTbVVhK1NFSGE0M01CcG5tb1h3U0dMV1hZTVYv?=
 =?utf-8?B?a29DVU5OdHI3SDR0SHFwTVJtU1dDbU1MazRFM3I4dzAxcERYcHcyeXQvM25o?=
 =?utf-8?B?TWdJbFV2MlJjOVRCMFBTNEx0MlQ5SVI3M01YYkEzT05Wc2kzWkhGejM4UzE5?=
 =?utf-8?B?Ni9RSXNzVURLZ1Z4SG5TZE45bU5WZk1FSEtISS93Z0d4NUZ5aEVRRVZORUxG?=
 =?utf-8?B?aGIrUVh0MjlMdXFsUDltQjM4TVdqamNOOWNMZGROUVlQblA4MUJhSFRaVkZu?=
 =?utf-8?B?a2NHRzczQVdCYWdMRDd0S0JvNkluM0JhMDNqd3lkUjYwOWZWQUQrdVhiN2lQ?=
 =?utf-8?B?UzhkaDdMaVNCZ002ZzBFWHZRZHgzUEl0ZmRCN0FiMjhxYVpzMTQwYWtWSEFM?=
 =?utf-8?B?U2hYWVFjWEFBL3g4MHJxYVppZEdzTFRlQjB5QnIydHhOeUFZWWJTWEsyUG1n?=
 =?utf-8?B?UXJ5WmRPU3RBcjMzcGorWmxmL0dweFJIUm1XWHdCcng0MW5ralJXYWQvMWtJ?=
 =?utf-8?B?SXhTZEtLWFA4aFczVlJoZ0ZkdXZTc1pPeWdvQldXQmpWNENicGhsU0tnZHZa?=
 =?utf-8?B?SjhmQUxmblB1c2l4ZVpnT1J6dXZVdjNteG50WDRQWFM3d09nYlRUbzJzTUJU?=
 =?utf-8?B?Y1JEZ1hYamhrVWtORTcvbmI0NFFDWWordFQ1SStMK3liWVB5aEZkaDB2WEht?=
 =?utf-8?B?OXJES1M1VE1tTFpuL2hseTV0aUZsWEkvVEFYL0ZGY3cyK3BCcUNHa0ZnOHBH?=
 =?utf-8?B?M0M2d3AwYWlRbzlTanFmSnRDTnk1aTNmcHcxbFJxZGV6MWgzYnYrcEYreHA4?=
 =?utf-8?B?NkNDV005SGE2Z1NlditoY2JKVWp5SDVHWmN2VWZCd1dVVDBZRFdPQ0FtY09u?=
 =?utf-8?B?UzBSRjdhbkhkRi94aTc5YUFqaG02RDV5cW10Y0YwdlBJSFo3K0QycGp2SVF3?=
 =?utf-8?B?MSsyYnJYZVZXaERrY1U0OGpMeTZndVF1QUYrM0JtRmNSaXFVaktnaElRRTF6?=
 =?utf-8?B?QW55U2NuVHpKU0ZxY3h0MUMydGRCRU5KUXJSdHRNRk5nYkxMNnUzVXpIQjA0?=
 =?utf-8?B?MjNVMkpQY2laRWNialpkNDlnTzNpL1YxNzVPOTAycHBSaEdOVjJRM2JwT1Iz?=
 =?utf-8?B?dUEwNEpENjUrUnpLVzAvVWw0Y201djc2bU9ndHVKaHdZemFKWXF3V1hyMUtl?=
 =?utf-8?B?RWxONmdiUXB6cmVIK0p3R2tzWHNPNmpmZlFKYU1rblJ5cDB6eVJVRFgzcFpU?=
 =?utf-8?B?NTBaMjZvUG1hWmU4cTBaTGFkblZtZWxNME9iWE1rN0dTU3U4bThucXMybEwy?=
 =?utf-8?B?d0RBTzcvUDJLT1VjdlJkSDRQYlZGODkyNHEvU2xnOWNmdHg3QmRWNHYxNGVy?=
 =?utf-8?B?dXgrRkErOE5NUzZ5aDBTQndYeFl2TzNCNFR5QjBxcWZIekMxR3NLUUg3Y0pY?=
 =?utf-8?B?Q25zYUhPU294Y3d0NTNUKzJYcHAyMlEvdXRiVFZhZkNuY2pMckI5d0lkZ2p4?=
 =?utf-8?B?NmpxQWIzTzk0U3dTOXBOUTRtSlpzOGMxcVJQN1IvN3VlVjRhYlNsd2NScG1N?=
 =?utf-8?B?QWREQk5VR2NyaTI2Y3Y5a280bXNLb1hDRmIxaG9Mc0puQTRVdU15VEhPczIr?=
 =?utf-8?B?OHNhZU56N29iQVlhNFBVVmRCck5YaU1pVy9tb2gvNk8wZ0VnNExLa1VSSUZo?=
 =?utf-8?Q?v/rirF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZExnNFJyZHRJVXRCd1V5VFEvek9oVHZ4WXJhVG41VEMvM1FZMUJoWEJ6R0cr?=
 =?utf-8?B?QUREYzRobFhPUkxrWisxbTJ6OERUVTBsbXpjdHhMVWlHMjNZWlBsblRjcWhl?=
 =?utf-8?B?U0pIV2hFbTVXSVp4dHlxeVAzL01iRXRuQ2JFbjIzRlMwWkx2eXRUN2h5OE1Z?=
 =?utf-8?B?bW1UTzhOajcvdGdZU29jVE4wdkdMNmxQT3B3Z0dONFZHOWxHbjhSa2FWNFNF?=
 =?utf-8?B?V1pUNW5QaE4xVTlQRG0yMzBBQ3IxT0JEcEVRS2o4bU9nSW50dUR4MWxickUw?=
 =?utf-8?B?cG0yZzNKelMxQUhXZ3EzRGgvK29PUzZTOU5hVEVTTXIvVHg2UW81MWlXUEox?=
 =?utf-8?B?R21LQkFLTU56aG02V1RsUU5ZWjhwMHUwRkFzclNMc2RzZkVubmdPSnhCRXYv?=
 =?utf-8?B?aEJqOXBaQnM0eitpTCtkQklwMWlnd294eWJic1AvSkM3cXAxTVdyVFhTZ29H?=
 =?utf-8?B?RHY1bDBMQzNUdU1RZTEwWTAxT3pLYjhwanZHeUpGUVcrQlVOYzl1MmNXYkd6?=
 =?utf-8?B?eEg4SURObEYrZjRlYWdEbk9vSzRNMW1sMENENWVtejN5cjU0WUpRWEtwbEZw?=
 =?utf-8?B?SitCUGlZZTFucGNTRGtGV3Y3ZlNwUEdLZmhQbG5sYUlZeEpRVTFXeDVleDlt?=
 =?utf-8?B?Q3BMK05uKzd0SmVIYXBUQnI0SkZDMURBUWJ6aVhGcjE0QjVzMWtjTmZoK2hj?=
 =?utf-8?B?TGhLTG4rZXNxT2NSUHB4N1dyWTNwRFhIU00zcGl4VmhHNDl0R0YrTmlPWFdh?=
 =?utf-8?B?c0pwajRvQTcvUW5NZGhvNkR3US80Sm9sekFOdGtUOHIrRzM0SjJVdEpNeHFs?=
 =?utf-8?B?SXZKbmpyMWQxY0xMZFZtZDV2YUtBR2JPSmhqQ0VpUzF6MW5iQ05MS0YyR0ps?=
 =?utf-8?B?TlBEOG5ZekRFbTRhcy9BR1hCdGpWRU1YM1ViN25jTW1kVm5BajRERVRMbmM5?=
 =?utf-8?B?M3dlZjhNTzNOVktldEtjQ042clovRjhKdkYvK0t2UnRKeFBlM1VOUms1cVZP?=
 =?utf-8?B?Ym9rcC95R2RoOWhIMlBPa1RSZURENlRzNmFQd0x1NU9kVE04WFRnK3VMbkN1?=
 =?utf-8?B?cmdaM2w1TXl5R0loNkR5TC9Ud29kdm5VYWtSVGVqZk1NVUNrUURpZ0dSRmNn?=
 =?utf-8?B?TUpkbzM1aW1ZMXhzRHZDTlhkWUZwUHFKa2hWeVFFbStSdmp5VmNFNjdBNUJJ?=
 =?utf-8?B?ZE1KL0tZM0Rrb2hSTlgyTVQvZnY2K0tkQzRQM0JJVmRzLzBUeWxTZGhuUlZx?=
 =?utf-8?B?QUdwbmZaNGFMRVJST2oyNEtIaThoVzVBdktoTVVtOEl6MGtYUC9Ec1FpQ3Fi?=
 =?utf-8?B?RzNnbnlCTkYxRXlVUDkvL0hnbnNibWhTZEFiQ1NCVjVtakFXQ1pVWjErTXNY?=
 =?utf-8?B?MTlRRGRCRE1BeDN5ZXlNT080c0swSWExSXcrdVByUGZwM29oUDN1STVYU3BM?=
 =?utf-8?B?dHloWUlwK0tIODBlVTJkRTJwVllCcFY2dW1jeVVCbGpVeXhVK2h5UXdMOUUv?=
 =?utf-8?B?UHAzOW1LTloraHBkUS8rdklWTVlQV2todHdWT2tSeEUxZCtXc2ZYWldDd2Jv?=
 =?utf-8?B?dW96NFBYZEczQkl5QVoxazNQRHNPYklLZU1pRGprYkNGR05OMWc1QVdkRFYx?=
 =?utf-8?B?WUtza0U0bENsWkFFb2V2QmVmUjBCT0d1MkcrdWFSdnc5aVI1OGdqU2RXY1U5?=
 =?utf-8?B?cUltZTBwK3FZL2pTendOMUp2MG5sTG5HWTJLelBIMWpmUXFRTzNBbDljeDEv?=
 =?utf-8?B?aExFQjZqeFZZQmN6QlFUOHFSbTlCbWE2RUdJMkxvM0VzY3ZTOWFZTlpHMHd0?=
 =?utf-8?B?REhQbXJEU1RPQUdXakp0bkRxWE1oMEl0ZDJncnBLZ21QSDlFeGovbnhaN296?=
 =?utf-8?B?Rmp1VW9vMithUXNIdzlmTGtXbnFDVDl1b3QreWlhRGZ5eVhyZCs4ZDJwV1dE?=
 =?utf-8?B?MGs4dVVBZnBpV3gxRkc0b3RzNnZMTElZVDduU2d4VXRMcUZXcUFDU3hnOXl4?=
 =?utf-8?B?UUg1N0VnRkI5eUNEdHJ6UlJ5aVExZVFBSzlNbk8vOWVaNEtCbksyTTlOUmI3?=
 =?utf-8?B?MHFqZExJeUloRS9KdkRaZ1FlNXpvNEZ1L1NPa2lZSmFqRHF6QXhCdjZhTWRW?=
 =?utf-8?Q?kr7XDZjMlUKRnGV1QsWrB6u0q?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <737D76200B3DE84EB11E315E1403808A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a58eef8-00d6-4fb7-502e-08de337ab427
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:18:43.4389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /IA7Rg+NqCjEsmXWExiJnzxPOwtVwGIhcZdbjrOvl/Lj8wPf4ihKx3EpTOA17uvzPPbX/Y0u0o4eLiMCKkdIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6347
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDIzOjQzICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gQW5kIHllYWgsIHlvdSBhcmUgYWJvbHV0ZWx5IHJpZ2h0LCBidXQgbXkgcG9pbnQgd2Fz
IG1vcmUgYWJvdXQgbm90DQo+IGhhdmluZyB0aGUgY29kZSB0byBoYW5kbGUgcGFuaWMgY29uZGl0
aW9ucyBnZW5lcmF0ZWQuIE1heWJlIEkgYW0NCj4gdGhpbmtpbmcgdG9vIG11Y2ggYWhlYWQsIGJ1
dCBJIGRyZWFtIG9mIGEgZnV0dXJlIHdoZXJlIHdlIGNvdWxkIG1ha2UNCj4gZ3VhcmFudGVlcyBs
aWtlICJ0aGlzIGZ1bmN0aW9uIG5ldmVyIHBhbmljcyIgYW5kIGhhdmUgdGhlIGNvbXBpbGVyDQo+
IGNvbXBsYWluIGlmIGl0IGRvZXMuIFNvIGFzIGEgbWF0dGVyIG9mIHByaW5jaXBsZSBJIGxpa2Ug
dG8gYXZvaWQgaGF2aW5nDQo+IHRoZXNlLCBlc3BlY2lhbGx5IHdoZW4gdGhleSBjYW5ub3QgaGFw
cGVuIGluIHByYWN0aWNlLg0KDQpJIGNhbiB0b3RhbGx5IGFncmVlIHdpdGggdGhhdCwgYnV0IEkg
ZG9uJ3Qga25vdyBob3cgdG8gdGVsbCB0aGUgY29tcGlsZXIgdGhhdCBvYmouc2l6ZSgpIHdpbGwg
bmV2ZXINCmJlIGNsb3NlIHRvIDJeNjQuDQoNClRoZSBpc3N1ZSBvbmx5IG9jY3VycyB3aXRoIFJN
QVJHUywgdGhlIGxhc3QgZW50cnkgaW4gdGhlIExpYm9zQXJncyBhcnJheS4gIFRoYXQgaXMgYSA3
Mi1ieXRlIHN0cnVjdCwNCklJUkMuICBBbGwgb2YgdGhlIG90aGVyIGVudHJpZXMgaW4gdGhlIGFy
cmF5IGFyZSBsb2dnaW5nIGJ1ZmZlcnMgdGhhdCBhcmUgYWxyZWFkeSA0SyBhbGlnbmVkLg0KDQo+
IFNvIHNvbWV0aGluZyBsaWtlIHVzaW5nIGBwcl93YXJuYCBsb29rcyByZWFzb25hYmxlIHRvIG1l
IGFzIGEgbGFzdA0KPiByZXNvcnQuDQo+IA0KPiAuLi4gb3IgbWF5YmUgd2UgY2FuIGFkZHJlc3Mg
dGhlIHByb2JsZW0gZGlmZmVyZW50bHkuIFJlYWRpbmcgeW91ciBjb21taXQNCj4gbG9nIGFnYWlu
Og0KPiANCj4gwqAgR1NQLVJNIGluc2lzdHMgdGhhdCB0aGUgJ3NpemUnIHBhcmFtZXRlciBvZiB0
aGUNCj4gwqAgTGlib3NNZW1vcnlSZWdpb25Jbml0QXJndW1lbnQgc3RydWN0IGJlIGFsaWduZWQg
dG8gNEtCLsKgwqDCoMKgwqAgDQo+IA0KPiBzb3VuZHMgdG8gbWUgbGlrZSAiaXQgaXMgYSBidWcg
aWYgYHNpemVgIGlzIG5vdCBhbGlnbmVkIHRvIDRLQiB0byBiZWdpbg0KPiB3aXRoIi4gQ291bGQg
dGhhdCBiZSBhIGNvcnJlY3QgaW50ZXJwcmV0YXRpb24/DQoNClNob3J0IGFuc3dlcjogeWVzLiAg
SSBoYWQgdG8gZGlnIHJlYWwgZGVlcCBpbnRvIHRoZSBmaXJtd2FyZSB0byBmaW5kIHRoaXMgcmVz
dHJpY3Rpb24uICBHU1AtUk0gaGFzDQp0aGlzIGNoZWNrOg0KDQogICAgI2RlZmluZSBMSUJPU19Q
QUdFVEFCTEVfU0VBUkNIX0dSQU5VTEFSSVRZX1NNQUxMICAgICAgMHgxMDAwVUxMDQoNCiAgICBJ
TklUX1BBTklDX0lGKChpbml0X2FyZ3MtPnNpemUgJiAoTElCT1NfUEFHRVRBQkxFX1NFQVJDSF9H
UkFOVUxBUklUWV9TTUFMTCAtIDEpKSAhPSAwLA0KICAgICAgICAgICAgICAgICAgTGlib3NQYW5p
Y1JlYXNvbkludmFsaWRDb25maWd1cmF0aW9uLCBpbml0X2FyZ3MtPnNpemUsDQogICAgICAgICAg
ICAgICAgICAiVW5hbGlnbmVkIHNpemUgc3BlY2lmaWVkIik7DQoNCkZvciBzb21lIHJlYXNvbiwg
dGhpcyBjb2RlIGV4aXN0cyBvbmx5IGluIHRoZSBUdXJpbmcvR0ExMDAgdmVyc2lvbiBvZiBHU1At
Uk0gKGFrYSBMaWJvcyBWMikuICBUaGUNCkdBMTAyKyB2ZXJzaW9uIG9mIEdTUC1STSAoTGlib3Mg
VjMpIGhhcyBjb21wbGV0ZWx5IGRpZmZlcmVudCBjb2RlIGZvciBwYXJzaW5nIHRoZSBMaWJvc0Fy
Z3MgdGFibGUNCnRoYXQgZG9lc24ndCBjaGVjayB0aGUgc2l6ZSBmb3IgYWxpZ25tZW50Lg0KDQo+
IEJlY2F1c2UgaWYgd2UgYWxpZ24gdXAgcGFzdCB0aGUgdmFsaWQgZGF0YSBvZiB0aGUgb2JqZWN0
LCB0aGVuIHdoYXQgYXJlDQo+IHdlIGNvcHlpbmc/IEdyYW50ZWQsIGBDb2hlcmVudEFsbG9jYXRp
b25gIHdpbGwgbGlrZWx5IGhhdmUgYW4gYWxpZ25lZA0KPiBzaXplLCBidXQgdGhhdCdzIGEgbHVj
a3kgaW1wbGVtZW50YXRpb24gZGV0YWlsLiBTbyBtYXliZSB3ZSBjYW4ganVzdA0KPiBkb3ducmln
aHQgcmV0dXJuIGFuIGVycm9yIGlmIHRoZSBzaXplIGlzIG5vdCBhbGlnbmVkLCB3aGljaCB3b3Vs
ZCBzb2x2ZQ0KPiB0aGUgcGFuaWMgcHJvYmxlbS4NCj4gDQo+IE9yIHdlIGZpeCB0aGUgcHJvYmxl
bSB3aGVuIGFsbG9jYXRpbmcgdGhlIGBDb2hlcmVudEFsbG9jYXRpb25gLCBtYWtpbmcNCj4gc3Vy
ZSB0aGUgZmlsbGVyIGRhdGEgZXhpc3RzIGFuZCBpcyB6ZXJvZXMsIGFuZCBwcm92aWRpbmcgYSB2
YWxpZCBgc2l6ZWANCj4gZnJvbSB0aGUgYmVnaW5uaW5nLg0KDQpZZXMsIHRoYXQgaXMgYmV0dGVy
LiAgSW4gZmFjdCwgbm93IHRoYXQgSSB0aGluayBhYm91dCBpdCwgcm91bmRpbmcgdXAgdGhlIHNp
emUgd2FzIGEgd29yay1hcm91bmQNCnRoYXQgSSBpbXBsZW1lbnRlZCBhbmQgdGhlbiBmb3Jnb3Qg
YWJvdXQuICBUaGUgY29ycmVjdCBhcHByb2FjaCBpcyB0byBkbyB3aGF0IE5vdXZlYXUgZG9lcyBh
bmQNCmFsbG9jYXRlIDRLIGZvciBSTUFSR1M6DQoNCgkJcmV0ID0gbnZrbV9nc3BfbWVtX2N0b3Io
Z3NwLCAweDEwMDAsICZnc3AtPnJtYXJncyk7DQoNClVuZm9ydHVuYXRlbHksIEkgZG9uJ3Qga25v
dyBob3cgdG8gZ2V0IE5vdmEgdG8gYWxsb2NhdGUgYSBsYXJnZXIgYmxvY2sgb2YgbWVtb3J5IGZv
ciBhbiBvYmplY3QgdGhhbg0KaXRzIHNpemUuICBUaGUgUk1BUkdTIHN0cnVjdCBpcyBkZWZpbmVk
IGluIGJpbmRpbmdzLnJzOg0KDQpwdWIgc3RydWN0IEdTUF9BUkdVTUVOVFNfQ0FDSEVEIHsNCiAg
ICBwdWIgbWVzc2FnZVF1ZXVlSW5pdEFyZ3VtZW50czogTUVTU0FHRV9RVUVVRV9JTklUX0FSR1VN
RU5UUywNCiAgICBwdWIgc3JJbml0QXJndW1lbnRzOiBHU1BfU1JfSU5JVF9BUkdVTUVOVFMsDQog
ICAgcHViIGdwdUluc3RhbmNlOiB1MzJfLA0KICAgIHB1YiBiRG1lbVN0YWNrOiB1OF8sDQogICAg
cHViIF9fYmluZGdlbl9wYWRkaW5nXzA6IFt1ODsgN3VzaXplXSwNCiAgICBwdWIgcHJvZmlsZXJB
cmdzOiBHU1BfQVJHVU1FTlRTX0NBQ0hFRF9fYmluZGdlbl90eV8xLA0KfQ0KDQp3aGljaCBJIGJl
bGlldmUgaXMgNzIgYnl0ZXMuDQoNCkl0IGlzIGFsbG9jYXRlZCBoZXJlOg0KDQogICAgICAgIGxl
dCBybWFyZ3MgPSBDb2hlcmVudEFsbG9jYXRpb246OjxHc3BBcmd1bWVudHNDYWNoZWQ+OjphbGxv
Y19jb2hlcmVudCgNCiAgICAgICAgICAgIGRldiwNCiAgICAgICAgICAgIDEsDQogICAgICAgICAg
ICBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTywNCiAgICAgICAgKT87DQoNCg0KVGhlICIxIiBpcyBh
IGNvdW50IGZpZWxkLiAgVW5mb3J0dW5hdGVseSwgNDA5Ni83MiBpcyBub3QgYW4gZXZlbiBudW1i
ZXIsIHNvIEkgY2FuJ3QganVzdCBjaGFuZ2UNCmBjb3VudGAgdG8gYW5vdGhlciBudW1iZXIuDQoN
CklmIHlvdSBjYW4gdGVsbCBtZSBob3cgdG8gZml4IHRoZSBDb2hlcmVudEFsbG9jYXRpb24gYWxs
b2NhdGlvbiBjYWxsIHNvIHRoYXQgaXQgYWxsb2NhdGVzIDRLLCB0aGF0DQp3b3VsZCBiZSBhIGJl
dHRlciBmaXggZm9yIHRoaXMgcHJvYmxlbS4gIEl0J3Mgb25seSBuZWNlc3NhcnkgZm9yIFR1cmlu
Zy9HQTEwMCwgaG93ZXZlci4NCg0K
