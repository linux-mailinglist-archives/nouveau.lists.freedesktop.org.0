Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D5ECA5898
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 22:45:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA9F10E220;
	Thu,  4 Dec 2025 21:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PX9S/Gtq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010062.outbound.protection.outlook.com [52.101.46.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE08410E220;
 Thu,  4 Dec 2025 21:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tki7DBsDyEgX8/ry0b8WR3DZAIENqt1DInWpAexzxB5u6I0UbTabiMAFroQ8DfCxjH/lH9820EWmaNKDG1mPxiOfe7U93fgtbxgTC3/plbKhFKVJ72JTROsHoq6y5PMqQ0CjF8ks8gG5Oo283uWl1ZFohSSukFNYI5O7AGMJVJutqZVvJrfHvSC1Jm3sN/cQBEPkbsJei2mg5RhflsDeV5ncjrxhzOZ+MNPlPwL7iZzN0UTVO82YId5AjsY/4R8fovLUHEJ29aLVOJ4obb7qP7SdrUc7lxo6vNWO2PPFvXPymEO/GJTTCRAJNDvnEE6H9rxhfvfhTdOYw37IVX086g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtnjcLQkxqs5vsSfdG3FS0117l40gVOI8SnWiO9y2Zo=;
 b=XbuNYb3TDohgubwkA6UX94RTPvlm4+/HvTnJvYXbgUlZfSiqsv+d2MvPRRJU+hvqT5m/Sh7UbHGlYKD56Nm2DYfwgVqhs5Atxt0IDpYjOTp3ek//JuhSbZHNIC3qjQPx7RpGPavzMfYsmKKfsPYu3NS6Wjq+He1rqkKCcIVHQFqMyzi4dsnaxG9Bsy8xOrJnGdVMGnRiLhPrctCnbxFYqqgJPx5BnfbMxkF/V5r27XnQr8bEjJ6ySdpJHrbpU9eOk20kMbZWl0QisyOJ3cyIvqny8Knwm0H0EmGJlL8bPndXoLBIHWFB/wAH0gBpLQy/DtiLu08iuCrF4mLwo/x6Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DtnjcLQkxqs5vsSfdG3FS0117l40gVOI8SnWiO9y2Zo=;
 b=PX9S/GtqJG9+AMa2NsbIXUPUKO+AVJHBKneNNhSU2JvCMW7t8RdPenzx5ZwMnClCMjgLp2r4F6Ul4FU+7bFNepBOX3FkilpSmy0sHEdAiqOq9p88TIBGAluXS5ZnrRHxu81qxz5dGWVXX/JJxzy8aONPhTin4T97EQIooBSNOULhnip/XlPP24kOqGG0AAq6EzKXcucGQriqGBLnx6f820fOJEQpTJOH3inpj/6E1jjcw8/JCwz50xqd5pPMGYt1s7WaBb8Kbxy49mkw/tnSBkt82ag8AqbvycLveEtZyak0yRdjKTmLHdD7wrzCIj1oYE3PA3oHBqkQkwR3BbpWoQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 21:45:20 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 21:45:20 +0000
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
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAbumAgAFSlYCAAG55AIAAB2+A
Date: Thu, 4 Dec 2025 21:45:20 +0000
Message-ID: <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
In-Reply-To: <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DM3PR12MB9433:EE_
x-ms-office365-filtering-correlation-id: 5400c56f-0b9a-43b2-1573-08de337e6bf4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?amNTSHNCMmZqV3QwakNEME0ydktJWkxSMXBHVzFLVmxacjRRYW9pQk1tVmJh?=
 =?utf-8?B?L2E5emZxanhDRmFQL2I3Z1QwZ0drNUphamVGVWtaR08rSUw5Q2pXd1pLNkFm?=
 =?utf-8?B?SDhpOTREN1N2dnRCWU4xNFdxOFdqdko4TjRta01yYnkySWcxM0ZqYUFvNkYy?=
 =?utf-8?B?U1pnbmtKMXdNOVFhWGdsMFRMOWg0a2h6SVhQQ0p0RzJNdTE2MjBnNXYxeU52?=
 =?utf-8?B?NFJzdGNBV0l5MUkyZ2gxVXlWVE1xNFBGWnE3bHBlUUhKbk4yVGdJMDBMWEx3?=
 =?utf-8?B?Vjhpb1pZckh0YXlyQUV0aDBwbVdlRTVXQmRMRWZMK2FOd3U1b2U0RGsvcHJF?=
 =?utf-8?B?K3BmUmZ5WW83SWUxSis2ZC8wd1pPZ3pBUSs0bWhjUkcvdnZkOFVPZitLUzJZ?=
 =?utf-8?B?L2NZQWhrMUJMQVExb0ZWdDd6Qlo5bThoZ2xjd0M5ZEV1Ti80ZEpuU1pWZlUy?=
 =?utf-8?B?U2RRRGFnbnM3ZE5iMzZRZzFiYmlmb3pBT2lNSGpuRVZVeFdiKzJIWGpveGJJ?=
 =?utf-8?B?ZGlLY1hHOGJENU10dEVrczd2ejIvWGNwdUp1SEdJVG44L0NSNUtRUDV0dVk1?=
 =?utf-8?B?dWhSV3VEc3RRNWRMM0tYRlU5V0pkM2lNSWVmY0l0akR2Y2VLL0pYWDMrQlla?=
 =?utf-8?B?Q29pRysxZHFWZWp6eDVITHFwT3QyUi96MkFHc0xGT0FKZXZ6OFBxOGVHNlZI?=
 =?utf-8?B?aUdyWVVOWXNqMk1GWlc5QkJ1eGt1S0NRSDFybXE4dHpiTmdLc0d1eDVDcVBq?=
 =?utf-8?B?RnpyT2QvdGZOZlRqc0VsaU5aRFdDaE8vNk0yZDJ2TTZzTmc4WTVQUXdFQ2Zp?=
 =?utf-8?B?bHVPVHVnejNERXZzY3FDck1mTTZaTHh2MTZTd1FPYmc3VTROdWFhRG44QkpF?=
 =?utf-8?B?dXBrNitHQXZCcWJwaUE1Q3gxQzJicjVKdlRKZlZHakZTRm9QNWNIY2ZjRkVz?=
 =?utf-8?B?RXlXQ2R2WnV5Yk93ZzJ3WFNGODQ2NlkxZ29KdmxlTGZjMGxhRVNRbmxTM2V2?=
 =?utf-8?B?Zm9KeWdsanNYbW1SNmNreVVzdXNDOXhZVWh6aXdxbWpPM00xNWdWdDZ2c1VU?=
 =?utf-8?B?b2hndU52QVZicUg4NnZ5S0dweVVBdVJ1VXlPLzZIZGN1ZlB0WlZBeVE4RFY2?=
 =?utf-8?B?WnpHOWlob3o1ek9YQy9sSTRSM0h3b0tSSHgrd1lubGwwYzJDKzVlTko0MHAy?=
 =?utf-8?B?cGhNaU1YeG53TGFRcjZtdGw3K2IyVks2Y0QrcEdLRkg0Ty9LRXczZE5sTkJi?=
 =?utf-8?B?RitibXdZOHhIOTBLT1hsR2lTVmRMbE1VSVpPTnBxVGRqdVRIdWc4ZDdLaHdM?=
 =?utf-8?B?YVlTc1o5ZlBYZDJyTDM3TVUwcVdSSmFMb1RUVmo3RWFsS0hXZ3NIMDRBSDBK?=
 =?utf-8?B?RldNeUs4WXFEcWM0VzJSczlwL05FZWg2NTdHL0EwMit5RDJmT0JQdll6bnYx?=
 =?utf-8?B?N0IwOGoyMlVFeGlqSkxaUWl0d1BZQUNuN1JVMFJlS3NWQWZCd1RHbXhCR2o3?=
 =?utf-8?B?WW51dVR2eWF5dEllVnhMNnBvWWllZzdyZ08yQWlrbFVJRXFJcy9sQmV5b0Iv?=
 =?utf-8?B?QVBCL2kxUUtWRTRPMFRzMko3QUliSkIyVXdVb3orQVMzZVBwRlFkQ29BSGxa?=
 =?utf-8?B?RjgrQy9yVzlFU2s1NWxmUXh4a25xbnJYY2hPSkZkTGZVM1MxakNzaFFrdXBG?=
 =?utf-8?B?L0QydjZjek1FdlRxQUJqcGlYa1ZHNXNNWkh1S0ZZSkJkTEx3UEovTC9qSThX?=
 =?utf-8?B?Vkh4UW9UQ3luRXlsMXJ2T0d6dGpkejlNRlY1bG9aOVFZK0FYbm5vdGtXdVk3?=
 =?utf-8?B?L2szVE5tektoYW1wMlRWMmMvczNzZkRMMnFuelM3VTUrU1dIT3RnUTUvYXdx?=
 =?utf-8?B?K3Q5WEgyeHhQdnBUUUhzR0FDYWpxTkpGYXd2ZzRjM1EvWFJxejJWK2pKNHFU?=
 =?utf-8?B?TG1kM1AvYXZpc1BzZkJONGFOdVMvUisxZXNKaUlpdWNlYjdISFlZYmw4MjhE?=
 =?utf-8?B?TXU4S25ndlFDMDlVdmNnTjJQQlg3K0Y3NEg1MUVWWm1ZdzdPRHpqQmI2anlQ?=
 =?utf-8?Q?8TO/aN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzRKQkdYNVRZbDFycWxxWUl2WWFRSmh0RlNsUFZEaVljSEdQTFNMdVpwcFN0?=
 =?utf-8?B?aUlOLzVLbUFkdURyd0MxTE1wenJPbWNWMDNUUzZycDNPTG1ET0NCZjJMYUY2?=
 =?utf-8?B?Y3h3dXBXcERtdXZwZ1BYeUxidEpTeWdhQ3I1aWNCZjFOemdrdDRaT3h6SEFi?=
 =?utf-8?B?NGRXeVd3QzhsaVVMd3VDazFubUsrNThEajJjaFVHaGo1RFV0Z2FMZ0dZNDBQ?=
 =?utf-8?B?NUJRMkJsWU1IQ1YrKy9HNXc0MUhpbVpFZFB1RWczbHMyNlM4SkNrbG55c0Jv?=
 =?utf-8?B?NjhXS3luU3FERDlMNCt2cW8yL0lIYU1ZLzBsWjYvQjMrRGVMWGVXckYvc3hC?=
 =?utf-8?B?WkFTUTlXS1VGOHlqYUZrYnFzSk54Ky9aYXNNQ3gyRFR6ODlmcms0dlVkTlVK?=
 =?utf-8?B?YlNRYWphZ0dLeHkzV0pmTDA4WkpHT1FGVmVsS2tNSGFYRmRrK1FaZkRVVnk2?=
 =?utf-8?B?MkN6eFpCa2RjV1lNU2wzUGdERXgrMWxOVWRaaitycUpVQ1ZVU0FJT2JJQ29i?=
 =?utf-8?B?ZzlPZjRvTWxsVHZ5RHhZUHR5U1dKbmp4OE9mMndLTGJFSFNOMmQzYzZuUUlk?=
 =?utf-8?B?Ukwyc1RXTndwc2F1MWF6K3FEMjNKbmpOVHJXY09XZkh1L2VWV3ZqWXB5OGZx?=
 =?utf-8?B?UVZTbW41Ymk2V0VpNXp0VkxEZ2xvcVBwTTl5Sm5OZGRpMGhFd1FEcUVZUEho?=
 =?utf-8?B?dkJJeUtDSXN2RjB1NWxXbWlHSEpOU2s1Qk9XVS9oMFBsVVQxdU9BRWNnMC95?=
 =?utf-8?B?WS9CL0xaYzVTVkMxR0gxUll5anNLcW81VVdtZGNTUTN0dlpybkNzN21iRnd5?=
 =?utf-8?B?dXBkeWhnRXRlREtoamh2THhsbGRpQTkzSVhUU1NnTGE4ZU9TQWdUci8zZVhs?=
 =?utf-8?B?aTFrc1RqcXAycm5hZDV2VUJxeDNyNzloUlBIaS92MkZuLzNjWGlLYitwanpJ?=
 =?utf-8?B?ZFNGMHZxYVVQK25FOTJtYitYRS9HR1VBRGdtZ0ZHQWJkcFg0V3EveGgyOEFF?=
 =?utf-8?B?MmxuWUxLMEk4K3B4VUs2QWY2MEVCVVBzbDJMY1ViWkJ6T2RER2FleHFYNlRo?=
 =?utf-8?B?VWRuWDJWMnRtMnpydTNVdzBIcjQyeGVjSkNSNDlmd1Y0N2Nnb0plbVoxNVJL?=
 =?utf-8?B?REs0azUxaDNJcFBULzVQRDJER3MzTFZnUno1SWgvMm8wYTZ6WUFISzBYZStJ?=
 =?utf-8?B?OTdxcWJnMHh2Smd0T1Q1ZU1XZVZsNVFza1Ixd1VCR1Z4ZHcxdG1sUldJTXox?=
 =?utf-8?B?bW1RWUxvY0JGZzVGWlRuNjU3eCtxK1pYc2M2dFhKUUNlNlRIaTRqenhWOUFn?=
 =?utf-8?B?VVFzaFVrNUFLWmloRTdQZ1VqSitUaDF1RTNnaGJJNzJVczc0ME1HT0FWTTBh?=
 =?utf-8?B?emdURUNLRnlJK21rbXNSaWZWbGF1WmNPR3lLWHRRV2NBSXFSWnQ4TGJLTDRa?=
 =?utf-8?B?L2UyR0pyQ3dNQXRjWmVXdWpwZkxtM1J6NWFiMmYwOGs5cEhCSklWQlpSTnk3?=
 =?utf-8?B?NUJyUnVrQUtLazIwbjBjVEZtMC92K3dmaWkxMmwxODBFT3N3cmcyVnFlbFN5?=
 =?utf-8?B?VXo5djZpM200ZXlEcVVWMG5Bc0ZuQUQzWEFzQlVmQUxyeUd0NXoyK1FRRk8r?=
 =?utf-8?B?ZnlJQzcxS083OUZpbWZXTzdFemdEMnBiaGxmN1RWY0MzbGNxS2ZMeWw4NFI4?=
 =?utf-8?B?U1R4ZmNnaStidnNMTlhBcHpmeFJRVmpXdGJuY0xUYXFuRHZ0YlVuMUpDWUhj?=
 =?utf-8?B?YXltaTVwZ3FENk5INGx0akZPR2RNdU1BVGoyd2xhemZ6d2c4K3NINERWa3JO?=
 =?utf-8?B?WDZtWElxRVN6TkN3QzRwWjlPcVRSZlVjYWJzb0dQMmgxNEE2M2YyR0tGWFBu?=
 =?utf-8?B?NjMxNDVxOXVNV1ZxcytCc0x2eDVkdFZSRSttbHB4RkNhY0hxdEVwaTIyemVi?=
 =?utf-8?B?Z1RDODZBQTlmM2YzVjNWbGRqc2FadzRvKzU0WXpHdTUyOEsxWmtkQStDdFc5?=
 =?utf-8?B?NzNySG5JanEzN1NIdGNvYnlXUzZBc1lMZitvaWJyQVFHS2ZYT0JGRGNUZEdt?=
 =?utf-8?B?Q3ZGMnZoYVVTRUFQeUJwYVFoWms4VjA0emI0c0l5RnhyZHI1WE9ETXJNckFE?=
 =?utf-8?Q?DSwDKoTdKHvCUV67hrRh11N4v?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C0C6CDFF301D54DB09392B1FA8CADC9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5400c56f-0b9a-43b2-1573-08de337e6bf4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 21:45:20.2935 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ot7Rt+9XWDafMO6EV1/tNPNok41j7bjasxf3AJHlFsIzKzCGwKvOaEDPAWeV7snBOD6p5EHsCag7vdbCqoIJNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDIxOjE4ICswMDAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBJ
ZiB5b3UgY2FuIHRlbGwgbWUgaG93IHRvIGZpeCB0aGUgQ29oZXJlbnRBbGxvY2F0aW9uIGFsbG9j
YXRpb24gY2FsbCBzbyB0aGF0IGl0IGFsbG9jYXRlcyA0SywgdGhhdA0KPiB3b3VsZCBiZSBhIGJl
dHRlciBmaXggZm9yIHRoaXMgcHJvYmxlbS7CoCBJdCdzIG9ubHkgbmVjZXNzYXJ5IGZvciBUdXJp
bmcvR0ExMDAsIGhvd2V2ZXIuDQoNCkFjdHVhbGx5LCBJIHRoaW5rIEkgZmlndXJlZCBpdCBvdXQu
ICANCg0KLy8vIEFyZ3VtZW50cyBmb3IgR1NQIHN0YXJ0dXAuDQojW3JlcHIoQyldDQpwdWIoY3Jh
dGUpIHN0cnVjdCBHc3BBcmd1bWVudHNDYWNoZWQoDQogICAgYmluZGluZ3M6OkdTUF9BUkdVTUVO
VFNfQ0FDSEVELA0KICAgIFt1ODsgR1NQX1BBR0VfU0laRSAtIGNvcmU6Om1lbTo6c2l6ZV9vZjo6
PGJpbmRpbmdzOjpHU1BfQVJHVU1FTlRTX0NBQ0hFRD4oKV0sIC8vIFBhZGRpbmcgdG8gbWFrZQ0K
aXQgNEsNCik7DQoNCmltcGwgR3NwQXJndW1lbnRzQ2FjaGVkIHsNCiAgICAvLy8gQ3JlYXRlcyB0
aGUgYXJndW1lbnRzIGZvciBzdGFydGluZyB0aGUgR1NQIHVwIHVzaW5nIGBjbWRxYCBhcyBpdHMg
Y29tbWFuZCBxdWV1ZS4NCiAgICBwdWIoY3JhdGUpIGZuIG5ldyhjbWRxOiAmQ21kcSkgLT4gU2Vs
ZiB7DQogICAgICAgIFNlbGYoDQogICAgICAgICAgICBiaW5kaW5nczo6R1NQX0FSR1VNRU5UU19D
QUNIRUQgew0KICAgICAgICAgICAgICAgIG1lc3NhZ2VRdWV1ZUluaXRBcmd1bWVudHM6IE1lc3Nh
Z2VRdWV1ZUluaXRBcmd1bWVudHM6Om5ldyhjbWRxKS4wLA0KICAgICAgICAgICAgICAgIGJEbWVt
U3RhY2s6IDEsDQogICAgICAgICAgICAgICAgLi5EZWZhdWx0OjpkZWZhdWx0KCkNCiAgICAgICAg
ICAgIH0sDQogICAgICAgICAgICBbMHU4OyBHU1BfUEFHRV9TSVpFIC0gY29yZTo6bWVtOjpzaXpl
X29mOjo8YmluZGluZ3M6OkdTUF9BUkdVTUVOVFNfQ0FDSEVEPigpXSwNCiAgICAgICAgKQ0KICAg
IH0NCn0NCg0KSWYgeW91IHRoaW5rIHRoaXMgaXMgb2theSwgSSdsbCBwdXQgaXQgaW4gdjMuICBJ
IGhhZCB0byByZW1vdmUgdGhlICNbcmVwcih0cmFuc3BhcmVudCldLiAgSXMgdGhhdA0Kb2theT8g
IFRoZSBjb2RlIGNvbXBpbGVzIGFuZCBzZWVtcyB0byB3b3JrLg0K
