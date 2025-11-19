Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58976C70BCE
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 20:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC7910E257;
	Wed, 19 Nov 2025 19:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OlucbtWH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012011.outbound.protection.outlook.com
 [40.107.200.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232A410E257;
 Wed, 19 Nov 2025 19:10:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFf0zIadZ5GQ3GNBDd8YYEjYZ1X0boegwmnGOvEp6Mgx5Iv43nUFsJ52fb47fy3tJ2HYooWa6swpxSvbmZhS0kbjGmEISGv1eHEm2NUhx0bn5ANbbDOR66oxPCjhKyIJhLqnDeuTM1U0ayKHvG68rQWrixRtAl/+o7pD2mwLq/N1NppbIijv0Ek93dUXhf4eqJi61JFe5PIYqPAOHoW7W7+iyS7CH6QLx7ELI1eu5CPkIkNeydKRpzDiXQ3D8ASM3rDme2y0Q0GSkEwHGF2+lBotGbZ4WyzYNA3AnfqzYyhzNGF3WNgwziuJabNyCBK7CIVTJeEj4Q+UDcLPSNmBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXrOPakZ3DI2sy96PjjYjy0tuExax0eCVK8Ic5pytQc=;
 b=QxshkZvHfNzAoeQxyHt6PbmGgG1/dNPRhB2bPdy8MrQ3P5TNp8hAbixnCy9LibV63t6xZ4Iyf1Wbgx6CvweJTWmXciXvFDRaQb7GXVjEQBJbMjnQa9xmkVeeRxwncpr79fYDqGy4WTuKmUYGIvADbW+q5Zb+DfX5kHnAo5u7KubHJgfzxOVFepv+FXtRsyXPVh0MHfvluVp/EIZ0QYApKxlsEDY0Kv1R1Uj/joE9ZNt1lh6mpfazrc+UFDkLPVkNikY7EuTWsYj1efVxupRxk1SB8OFYEO0hVEr9RHYChGXtRNNPAIJCfazshqkfDRowa3Q/C7S/g2P71C2aZQSuyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXrOPakZ3DI2sy96PjjYjy0tuExax0eCVK8Ic5pytQc=;
 b=OlucbtWHyVuTF/77kOh9gAub09Da0Mnxk5Zp7z5z3AgrwyH8r9yNYlZXJBHdZVLap1Z4vQnkv9QW1906iE677WoWJMqIjiiYet5Q2fhiOhSFafPypRB60ERG+pmqLdQTGXtz/d0dr3XkV9nZj16ST8GdvyLqoBYzNzRXEAW+8+/EvGLcjrpO6zHGJaIkA0Pu916BsoSFUkBe/YSGoVIuBZOJMPEwicMLyp4aS4eiByQoCkh5mq9uaAd99zcVEXP76bcpAwLUohhZmOOeqIgLUkp+YtkPbtNWILDA9WXGX/Hypd+hiiY/PDFgixwNwMGzYD/2/UmMnx/P+qqgOkPTdQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DS7PR12MB8203.namprd12.prod.outlook.com (2603:10b6:8:e1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 19:10:49 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:10:49 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
Thread-Topic: [PATCH 06/11] gpu: nova-core: add Turing boot registers
Thread-Index: AQHcVb7IxeddFi16I0eTwY44/xILDbT5SbMAgABH2ACAAAPLgIAAAPwAgAAGo4CAAAKNgIAAxW0A
Date: Wed, 19 Nov 2025 19:10:49 +0000
Message-ID: <a2bc001ac8b44fba3dc4773169e7cc26cde7a573.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
 <DECB6G2JZJJ4.33UGI1U98JQJA@nvidia.com>
 <76f2ab5b-e2f3-4abc-943e-251afefaac96@nvidia.com>
 <DECGXPKLO95J.Z6NF92ZEXY27@nvidia.com>
 <1dd37cd3-539a-4698-bc9d-a99610fe96f9@nvidia.com>
 <DECHIL6CZUVR.KJPD43LSJFDE@nvidia.com>
 <6634609d-0377-48b2-b8b4-3a7861258305@nvidia.com>
In-Reply-To: <6634609d-0377-48b2-b8b4-3a7861258305@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DS7PR12MB8203:EE_
x-ms-office365-filtering-correlation-id: 03aeaf58-63f1-4ef6-17b7-08de279f59e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?VUVrMVpjUURkaDdjU29EeWk1bVFuUUNmZ0NrWjJIcTZ5SjhJS3Z2ZE5uWk9i?=
 =?utf-8?B?ZElLTEJVTnorVlJqTXB3NUhpbmFLL1ZlZ0FBWEdNM1IwOTczaHFWQzI3em14?=
 =?utf-8?B?VzhTOEtjVUlxYVZoRHZQek1lV21zZlRZTFVwZDhKSmdrNlBxeTRrUmZ1VXFK?=
 =?utf-8?B?NHBkNTV6YldzSzNvbm94bys4QzZjL0ZidVF2ZE1iYlU4TkI4bGUrcnlTZlpi?=
 =?utf-8?B?NnBOdnlqci9KMlQxK1o2UFJqUTcwSDU3blFSWk5vVFdDZkk2ZEZpdGJnRmdE?=
 =?utf-8?B?cmlrRC81UDNuUXcvcFJFeWNad21SL3dCYWErdW9sN2IzZnVOdXpOU1MvbnUy?=
 =?utf-8?B?UEd4SytTVnBIcWEvMC93WXFkK3F0bWdqNDU3aXBSSTZSWVZVT0Q4REFLVWFt?=
 =?utf-8?B?MXpubmhPaHFEeFp6RTZTbFVPNWNuTCtIQ1hSdHp5NWY0R3lBYUo2YXBCS3dM?=
 =?utf-8?B?K2ZudlZkcTZQRjNLckpzL0k4Zkkrb3hHN1NPdGVmUVRIZ29ybWpSRXI1dHZU?=
 =?utf-8?B?eWtWR0lUaStzR2dIQzhBdU5ZUTBEL01IRFk2R2hwR2w3cURCZ2g2YjFKbjdv?=
 =?utf-8?B?c2VmS2lLNHlGa2M3UTRHVGFmUFlHUVVaMlFsS1hvd2d6VWFFbTJPdnJRVGJH?=
 =?utf-8?B?UUtWekZ0aldIaUxEODlCM1pHNmE2b1VhaDFNeEtMMU9qZVBRVHNCREdrcUVo?=
 =?utf-8?B?cVhERmRPSStGMXZ1YXNNRjAwbWxoK2J3YUdLL2xOalIvVTdYb3dDMFdHQlIr?=
 =?utf-8?B?M2Z6eHNOWjBiRkpNamdrNzdhRVltc1NpSlRXWGpMQnlIOWhBOEloUVRDTDhl?=
 =?utf-8?B?elVpdUZJWkl3K0MrVlZoV1dxc1lsOWwzVmxidUpScHRYT2NQc3ZwTHh2YTl5?=
 =?utf-8?B?c2R3cHMyTjRjV3MzY2FBbVlQRytxY3FCbFdjWUtNemp6ZENZREF4Ni9EczJY?=
 =?utf-8?B?RFVmZHQ1T015YlhDWmVlV2ZuNFlUMnFYYmRuM2NGOFRkdEFzOXIzemZ4NjJr?=
 =?utf-8?B?MVNBYVltYnUxYnBleEtOK1FnOTB3blNtaERTb0wwOTllRkFtM0J1bFZ3WUJn?=
 =?utf-8?B?VnM1R2NiQWU2VkxXZWhydzllY3ZOSnZzRUlVOHJWWXRpRlV5Q2x5L2VINjJz?=
 =?utf-8?B?aHpNeUZoTFlKdmo3V1V0eGRjNlI1b29ialpVenhlVmtGMHlxc3JaNUxJdjgy?=
 =?utf-8?B?Z1UwQUp2STFhbGhwNWtueit4SUIxMkMyQ00yZEJrdi81OFM1akUxSVNOK0VJ?=
 =?utf-8?B?eFMxRFpGTjNUZjhaZXF2WFRvam5HeWtmMmIwWjNCb0dnUDdjdFVIclRIKzd3?=
 =?utf-8?B?azJWZTAxdGl2ZjFNODU3WjVpTGgycmlzMnJyUXNiWnBxZzE4N1NUdEdRb0tC?=
 =?utf-8?B?NUVzZjVqSHZGZDFtSERkWVB4NUw0ZURpSTBaS0tEbkk3ZWh3TFQ0VHo1ckxz?=
 =?utf-8?B?QW93Z2lLVWl6clp6Y3dDTkE4M2haTDdLVzdLcjZIV3AxYVFPWjhsb1l3LzJV?=
 =?utf-8?B?UHdKQ0x2aUh0VlNJKzdBTzY5bUEyKzY1aDdTQnI5dzdJeDErL0taWnRJeE9Z?=
 =?utf-8?B?T1duWW80QU00Z015eVkxZDlZVGpZZjgyMVlxL3Z1eVNuNVptVkI1RXZZOXNo?=
 =?utf-8?B?WURmWFRyS09mam0rOS94bVZaUlFnRTRmRmVjK1RnZDhpaGk4L1FFUzBNQzh1?=
 =?utf-8?B?TUg0ZkE1Zmp6UWpEcDJtUjZXVFJzS0tpbC9DWTdZN1dZbFNRcVVPS2VCTStF?=
 =?utf-8?B?Mi9HNU9TblprVGRDa1JHODk0RnlBd1JjNGFjR1dqRVQrUDRReW51R1ZUdXVt?=
 =?utf-8?B?RlJPUi9MaHpBMlBKYWpIbUVhdWhzZlNzdExma2cyVGd3bEdBSVdnVnlzMy9W?=
 =?utf-8?Q?th1hveaA9YNnL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZE1JWWdoMjZBMURUcUpDaHdWNndOV1FBNHVxMXpMbUVCVEpMZFRMVlBvcVU0?=
 =?utf-8?B?d2loK3lOamRibnNRVmVXUzlqeWJIWjlnQnBvREdxMEZNbHJqUG1oSmQ2cHNm?=
 =?utf-8?B?dHZuMWNkTDdHVkpxT0VOOGQ3cTJGRnVrTkZnZHphQy8vUzRXakUzNDIwR09y?=
 =?utf-8?B?Rkp1NjlQeHJqYzlJZGdJQW9CaVRocUVvRUhGdm5NVURUVWhXNkFNT1hlQjdB?=
 =?utf-8?B?enpXb1JaMDJrekJmYzFWT0s0MDFhL0pueElVdStBRVkxS2VrQ01kZHdFcVJ2?=
 =?utf-8?B?WUpmU1cwbXEvcS90V0tUVjdXTlZtY1BteGxJRmR5WXJhcnBBUXdzRkpHYmVO?=
 =?utf-8?B?aURVbEdubWhZbmtHcVpKUlcwWTMwKytpTm94T1FQNlkzNHF2MnBBay9zVlRn?=
 =?utf-8?B?L3lnSmNrdmZPZnUyZkU1Skd0ZjVnSzVsUnpjb3l2di9wYkNMT1pTamZXblNN?=
 =?utf-8?B?eVhnZHh4OTVkMWliRmZmVmhPYXFJSFhvaFBFM2lVVHZ0MFZLcm9LUCs0aHFP?=
 =?utf-8?B?dDRUQkN4MmtjZHlqQWlHMnpjS2IwTnAzR1BJWmM4UEphUC9ZSFRza3lLSzZW?=
 =?utf-8?B?OEpzUjhVZUtmUWNDckRIaUNYakJBNCtmN2tKM0sxb0ZrNEdQaXcvaTgvYXpv?=
 =?utf-8?B?UnBKajBBSnMyYmVPTzJ0T0F6QVBsaGNHcHljdWN2Rnd3Q2FISHFhUkZlSW9X?=
 =?utf-8?B?L1dvSWdvU0p5ZXl0WnFwRDJDUm43cjNvODYvOWhVcmlyendLelNEd3VTK1pN?=
 =?utf-8?B?YkNsUXdLUk9FdFVLTHZJanphYStGV0dyaDBURU5qMC84Zi9tVHM0S2NhdG92?=
 =?utf-8?B?QUt3NnRKYXRPeGhGaHpuRnhUc0VQN3paTnZBSFYzL0lZbDVNTG1TTGFzOG1B?=
 =?utf-8?B?dkp1WldTQk5LV3U5d3pPM1N5N0ZoekFBQ2IwVDB1cjU5UHpWOWhNdW5TRnhr?=
 =?utf-8?B?WUJGMk1uTmN2ck10cWV0Qlh5OFNYVlhpeGRONU5aUlkrZ2UreFB1U1JmZVBV?=
 =?utf-8?B?MUhYY1FnTGkwdUExZTVLamlkbmxRdEk2aFRvUGkwT3VmS0pqV0lCR1hYeUd2?=
 =?utf-8?B?dlJmNWFjc0l3VUtKSDFKV0ZDMjRFWFUwb2hUQWQyL2lFQ1ZyYWEvcGdzUVZB?=
 =?utf-8?B?VkRoTHA2eHlsb0g1L2ZXa0RMc29vL1FsdmZDWnFILy9jellMeHBuV2FWSit4?=
 =?utf-8?B?amkxRGJZTDRMZ1g1a3paaFBVYXZWU2tMNWZJOUJyZDkrZ0xVNFhiZ3RoSDJI?=
 =?utf-8?B?TkRjU29WZTh6RnVDTjlBSmhXTzdPWk0vei9NZlNtQ29TSEJHWG55MXhYRDQ5?=
 =?utf-8?B?alFKZStDNXpIa3BsNDMrclpmd1FYdStxV3ZoaUNhaGtuZkl4SzRDVFc4Q1N6?=
 =?utf-8?B?dFViL05hOFNmancwaW9PT0FtSGk2M3F1akxqMWtnK3YyR2ZKUU9HZTg3Rkdw?=
 =?utf-8?B?VW8xZkRNOUVHejFDUXdsNHV4MDVpQUVIaGZrakdMWUVZRjBHdUl3RFFnczhK?=
 =?utf-8?B?elFHVDI1NVYrbUNFK0VUNlhJNVlXa25WMUZReDJlalpTY2tWQjh3TnN2Skk2?=
 =?utf-8?B?Nks3c3VXMWRoeUJCc3hPVjJUTmxQcDBDV0w1UXk4NEYzbnA4bzlRVEg2Y29K?=
 =?utf-8?B?YWVqWHVYTlRSOVdETlY2VzN4aS9XMnh4bmtyQTA2NFhYMGIyL3NTNHk1WmRU?=
 =?utf-8?B?elpWYUpyVWJvd2hoRys5K2hoTzN0dU9oL1I0elN3NnhUbmgzRWlMb2lIOUtB?=
 =?utf-8?B?U2xrTTRaMHZwOHhmL0UzdkZ3V0ZzYWNaamgzaU1NaS95ZnIwQjBnU1I2OThU?=
 =?utf-8?B?Sm1JR0JuUmwrT2M3RVJVWHp3Y2FoLzN1MHFTZndickdrcExLNEtnaml6d1Fz?=
 =?utf-8?B?NmFzU2ZUbTdrNERlM1JCdkRpQ3ZRWVRPZHNrQlBELzB5dzBtN1Z2RTNvTngw?=
 =?utf-8?B?OGRyQ2Q4SnhyS0pJWnlWYnFuSVNFMmRhUTJRMnNMZ1pIWUZHMzdrdE9pMFBZ?=
 =?utf-8?B?VUFmSzFweVd4UVhBeWVFT2RKTFBZUjQ2eE1leUFjOVJWUVFTVEhhekgxVjUr?=
 =?utf-8?B?VHRBVis5bnlPNm1QSEhFL0puenVlZ1FmZjJpSlkwT3hnaDlJU0dmc1dJNmpG?=
 =?utf-8?Q?4HhEekcpCQG6nL4bY68EEbgn2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4901C00C3BC4345B1795441687A49A5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aeaf58-63f1-4ef6-17b7-08de279f59e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:10:49.4136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Jts5Dk+WnuSi90MXx1irOTB/EA5EZldxmigiWkOd8J70bL/UIXSaeWfAt/E4Hxy8lGD6OCktss/kdi3hmhyOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8203
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

T24gVHVlLCAyMDI1LTExLTE4IGF0IDIzOjI0IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
ID4gSSBpbnRlcnByZXRlZCB0aGUgdGl0bGUgYXMgInRoZXNlIHJlZ2lzdGVycyBleGlzdCBvbiBU
dXJpbmcgb25seSIsIGJ1dA0KPiA+IGl0IGlzIGluZGVlZCBzdWJqZWN0IHRvIGludGVycHJldGF0
aW9uLiBJbiBhbnkgY2FzZSBpdCBpcyBhDQo+ID4gbm9uLWltcG9ydGFudCBuaXQsIHNvIGZlZWwg
ZnJlZSB0byBpZ25vcmUgaWYgaXQgcGFyc2VzIGZpbmUuDQo+IA0KPiBPaCwgSSB0aGluayBJIG1p
c3NlZCB5b3VyIHBvaW50IGVudGlyZWx5LiBJIHRoaW5rIGl0J3MgbGlrZWx5IHRoYXQNCj4gdGhl
c2UgcmVnaXN0ZXJzIHJlYWxseSBvbmx5IGFwcGx5IHRvIFR1cmluZywgYWN0dWFsbHksIGJlY2F1
c2UNCj4gd2Uga25vdyB0aGF0IHN1YnNlcXVlbnQgY2hpcHMgZG9uJ3QgdXNlIHRoZW0uIChTZWU6
IHJlY2VudCBib290DQo+IHN1Y2Nlc3Mgb24gQW1wZXJlL0FkYSwgd2l0aG91dCB0aGVzZSByZWdp
c3RlcnMuKQ0KPiANCj4gVGltdXIgY2FuIGNsYXJpZnkgdGhhdC4NCg0KV2VsbCwgc29tZSBvZiB0
aGVtIGV4aXN0IG9ubHkgaW4gVHVyaW5nLCBhbmQgc29tZSBvZiB0aGVtIGFyZSB1c2VkIG9ubHkg
dG8gYm9vdCBvbiBUdXJpbmcuDQoNCkxhc3QgSSBjaGVja2VkLCB0aGVyZSdzIG5vIEhBTCB3YXkg
dG8gc3BlY2lmeSByZWdpc3RlcnMgdGhhdCBleGlzdCBvbmx5IG9uIHNvbWUgYXJjaGl0ZWN0dXJl
cy4gIElzDQp0aGF0IHN0aWxsIHRoZSBjYXNlPyAgSSd2ZSBhZGRlZCBhIGNvbW1lbnRzIGZvciBz
b21lIHJlZ2lzdGVycyB0byBpbmRpY2F0ZSB0aGF0Lg0K
