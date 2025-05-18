Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6EABB19B
	for <lists+nouveau@lfdr.de>; Sun, 18 May 2025 22:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FA210E09F;
	Sun, 18 May 2025 20:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bwUUOppd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10D610E09F
 for <nouveau@lists.freedesktop.org>; Sun, 18 May 2025 20:55:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGwqayRiikynuLNVQKSTtEsa14d8KEGSUcxyqXNTv6ujIMeZpwQvQb8Zkx6/fU6mNqmyU5bUbVsdndeVPZDd/D/+KYxL2SRuB7E2M/e/u7i71uKyOIWQPOOYclWlslam80qpTZ6Hi2+CVDzx4wBT2J+PSsYFNwPynnMcMxd4PiX/v6r88r8CoGtkRFMlo+SSOdiKtRWFKDUwMfmpl6cuCvnkfqGCCVZC1wawixKhO4bYoqPb8TrDOHvj+qN2+IQyMWPL7hFmpgVXh2UnmFZtAixrSShnLLfvcaCOrc1r6FBd/UiujuLBxfqsXWTQr1wFXyeIobfsW6EUa3AhHvmIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8vY8ZpDlzW6ZVrzZ1Y48jJJic1CQnD5Itffvt+FBaE=;
 b=RNJvndBRSxgaPiptR1Y+YmuGzvVnjuccLGKfAPMFQX4dS4m8nvnbTbVLGYQuC9+y/Tkrox0lG2Rqng/BB2fnNNK2Ks7zyxTHxO/mq43Qb2vG93Se3lp64z1DzhrRwn6z+NZTgM3z+GEkghFKRJjWos0P/x1FcOxu1HFl75MkbKrYl7rQ1tbvhArZwnXIOM5e2ymZ9u7IVREn23hVQa48Ixk5EK4Z/WBmSp196Jl5dfu9DhVIh3gg0ErGsaUssIfBSsxOOqHlZcbR9X3+EKD57FIhJ6sShmy2Dwa6cJQo2n1XGOK8VO30oCCF6zKCElU0T/p7hBhcRj3k/LJ+8q8glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B8vY8ZpDlzW6ZVrzZ1Y48jJJic1CQnD5Itffvt+FBaE=;
 b=bwUUOppdIbjTfaVQPXSx75Hhk9rPmfvVhknPs63hFyedy3nJVaXKuEwWCwwUNA8jmaYrMwxUJy//Y+FgqYks4T/OdPyfKBYYZaUM3sIbUYji/DjZTWQZXpj4WaAM8Xc5+3T88UaYp0w/dBzilLQs3W8H37rX4A9y47cSON5KbQR/LIZmWmL7T+WSmwHykd41oK7nOX7hxcdYDX6VyikN2B8dVsmSQag9TqV7CcjfwmtswMThwgDsbDgVBiHNHSGDJWJVhqDK/CuSCVTZSU9ZBwdpQxQkZIVGizlihBxDs/wN4vOVf5DFcLCCiZn8pq/hNW/jQXfxguiIpg278B6qOw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SJ2PR12MB8782.namprd12.prod.outlook.com (2603:10b6:a03:4d0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sun, 18 May
 2025 20:55:30 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 20:55:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>
CC: "airlied@redhat.com" <airlied@redhat.com>
Subject: Re: [PATCH v3 00/62] add support for Hopper and Blackwell GPUs
Thread-Topic: [PATCH v3 00/62] add support for Hopper and Blackwell GPUs
Thread-Index: AQHbxsAZmDn2HujstU+NL6rQqvHa8bPY4N4A
Date: Sun, 18 May 2025 20:55:29 +0000
Message-ID: <b54b4f26bfe4318a9475a58a0cf132c33341c58f.camel@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SJ2PR12MB8782:EE_
x-ms-office365-filtering-correlation-id: 34060638-2d4f-4ef4-f19b-08dd964e52a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OTBsVzRTUUxiNDdma2xHYnNRNFc0NjZCUUFPNndGN0VheDZrWVNKNVVwalBT?=
 =?utf-8?B?MzBlOEZkWHhiRjhmUDBsYjFsYk90ZmdPc1dEUnNLbkhpMytqa254K21CWTQr?=
 =?utf-8?B?cEtOMlNLNSs5UCt3Q01qNHBKUVlGQkZUZVBxaVZPNXdEdEZibmhxWkI2QU9l?=
 =?utf-8?B?Vk9tdm9lbUtzTmlaY1U0ZGt3TzV1VW4yMUw2Y0VuN0FXOE1EV0VXKy9wQzRW?=
 =?utf-8?B?SjdXUXNOa3RGdWpKOWlzdG1RMllSTHEvVHhabkRwcEVRdS9VRks5OUxtNHds?=
 =?utf-8?B?KzhNeUNnTis1bW5RZFJaSUlncjlBZTVkSHlnczlXYStkTUFNWGUxTXRjTmU2?=
 =?utf-8?B?ZGV5TFZNQzFGNjd2UCt1ZWEzLzFSbEhDbEdPUDdnRVVpRHBCVVVvdEdUUi80?=
 =?utf-8?B?MkV1cWJ3K3lVL2JTS3pHQUxWUVh4RTBIUmNKMWVBN3B5clBpOEZRYmdnVTA2?=
 =?utf-8?B?U1hPRHpnd1B0eXZhSmg0ZmJzSGxVbkhMMTlZMUV3RWsvYUNyTlVRWDlzWTNk?=
 =?utf-8?B?K0taU2FZcUN6WnBJV0hrcVNFMjExSWhYT2YxVzgrWTEzM3lnWkh0Z0crVmJz?=
 =?utf-8?B?UGZJQXRuNFFkbHdBQ3BJWTNoR2pRamQ1NTZUdWE3VkM5anNod1ZRWWtKSjVK?=
 =?utf-8?B?QW9OWlBqblJmRHFuRUZFWXh0MWl4RnZtR2w5RGlGdUN1Q2FGNnJHaVRHcGNn?=
 =?utf-8?B?a0d6RXdEaFJmSzBwVjYvbTZoQU8wY1p6UVZwd2toYnFSQXM0d0c4UDRqNFlu?=
 =?utf-8?B?OXJ2Wk41YVp0WXB5c2tMUDhibnFMaTVlUmtvY3VuNFFvMkVXNTBxMnpTOTQy?=
 =?utf-8?B?bGpFYmFhWXlUenRJcENoRWllbkN4VmRJYithbE9qSGJEYkRPM0RQZC9jeEpy?=
 =?utf-8?B?STJRemZmTWtzdHpYamJIQ0Jxck8wTGJRczRuSGlRRWJIKythSUFaSXZiZ3pE?=
 =?utf-8?B?R3pBbC92YThybDV5Q01DOXk2azlYNTJ2SVJpM3dtL1A5Qk1sWVdqQjdmOXJL?=
 =?utf-8?B?cmVqTnJJQUJWUlZMZnI0ZHNNQUtuejRiSHE1dFgrVFdWSnlrVlU0NTN1YmlJ?=
 =?utf-8?B?SDRRRjlWT2V5aEJKeFhJWnRiTEhBUkpncG03Ymhtd2c5NHRlSjk0eEJ6bStD?=
 =?utf-8?B?WVpUb0JvWUhuTDVJQmppNmNRZTVIOCs3cnl1b2xGZi8yZTNvR2d5REVERXd6?=
 =?utf-8?B?ckc5TXgyRmozMm1SUjk4TnlodzFCTWdHM2tNVWozOERnNkNHYU1IeGpLWVhG?=
 =?utf-8?B?eWFNdWZ6VUVTTFBkaEU3SEl5dVdFZUp2UFZVUk0vVkdHeWRSSWhFN2Qwb0p5?=
 =?utf-8?B?SXdOMlgzTXN3TFhTbklTaVpHZ2hJWXlMRkZXYUdjZ3ZkMTFmRGlzajVabHk0?=
 =?utf-8?B?OElCNWFmOFN6dVEyUmdCS2JQRTRYcUZTd2RqaHVMR1JqTm5kTGt5d0NDbEpX?=
 =?utf-8?B?TnloSU5XRWNxejZjTzVOZGd1dWhnMHVhQ1lBc0pUbHNqZTdsODgreDhub1pn?=
 =?utf-8?B?amRuSTFzS3NKak5MT21udmJEV0IxWFBTcDVrZ1JoeEhUSmpIQlFHV3FqZnU1?=
 =?utf-8?B?TTZ5YTArRG4rUTJMblRpUUJqL1M0ckNUNkxKN0NjVStvcFhqNThuOTNYa1Ft?=
 =?utf-8?B?QTBJV21DUFFHelhVZVRMc3N3blFWeGI4OHdUTTgrVm51cml4ZWdoRm5MWnJU?=
 =?utf-8?B?ZWNwOE12dDRzN1hYWElsRUN4S3VjcDdETWo2OUEya0ZOVDZ5eWFuaStLQjlx?=
 =?utf-8?B?MHhKeCtpYk5mM3YrNnpwWHpFUnVyVzl5ZlF1blpXVWY1cmRMYTBKVWp5S2J0?=
 =?utf-8?B?UHl0NkRKUzJJU2RiNzRYQ3hFT2M5VUNBLzgraCtSY3BIRitQMDBqRDlrNmx6?=
 =?utf-8?B?UWdjOHh5cmpnT2gzc21mOVZHWW1QbldmM01VNWtzU3FCTVVpN3pSQ255QzE5?=
 =?utf-8?B?RDBwU3JZeXM5aERlajI0a2lKZHZvdHlud2N3a1NGbXR5WDJxLzhFT0g3eFhV?=
 =?utf-8?B?QW16bzQ2dFpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SGZyYzl0SVBROG05ZUIvN3NNS05WTGM1ZlFtS29sWFpDNDZFYjFqNk9zeWVI?=
 =?utf-8?B?bndVRGhISUpLYzJUNlNnMW1BZjJXUmljYnJwQTlieXAwSVV0MUhHTC95QXNo?=
 =?utf-8?B?U2VEb1R3ZyticCtBbFZyYUZiWjNOVzl0c250cHd1UjZIcXBOemlqenc5QW9H?=
 =?utf-8?B?SkJPeHNkcmg3SFBQOE9JTGlaWEUxSFBocDAwZ3pxWE02VWFzMGJweVJZTXB3?=
 =?utf-8?B?SXF5ZDhmRnE3cC9zRWJ1YXh5ZmRVZ2doMHcxVm1Ld1BRc1NBNGQzblZkbnlv?=
 =?utf-8?B?THU3eENrdFlQOG03WFdONXk5VlRTRXBkeGI3a2c1ZXk2MDdkUmFkdExyV2RV?=
 =?utf-8?B?Ymt5WTdJeHp4QlYvczNYRTArRTBFR3h1dGw3aUloRXlVRTR3NjQ2NDlkMGFk?=
 =?utf-8?B?V291UXJIR05abFpaL3UvMEtxYS96OWtpODNTeVFoRnVrUFYyNlZhbURkT0Uy?=
 =?utf-8?B?UzVXdDRKRjlPZmt2NHFaOTF4SGpIVlVuUnNVVWZwRDJRY3loNUsxbTlXMGNG?=
 =?utf-8?B?TTdkVG1LQW1ZczN1bVk0SmNoUTRBZ0MzYmxhckVHTENUL1hGN1FIbmVGMlp3?=
 =?utf-8?B?NllFS2JJZTRJOThVcVd2dXBPWHU3dCtwYjNXWk5zSERNdUhycWpXcG1uc3pV?=
 =?utf-8?B?YlNxeUM3a1loM1NMZUJKSkNnWitLU3hKYkhVeEdYeU9lSlJWR2hKSC9qUnE0?=
 =?utf-8?B?dmowSEw0WWtrdHBZQ0RGVURrcUhmQW9FVDJHSi90b2ZGb1BkanBjb1VpaGxW?=
 =?utf-8?B?NDgzUmRZMzdFM0V1cjQ5T01rTmJnY1BZQjJ2a3hkN1dSZHcvTmhkR0o4djQ5?=
 =?utf-8?B?SkZTSlR6NG5vUWVvRkNMcmdJViszWWRiakZyL0YvbFdjbGF0UVlONE1SUEdV?=
 =?utf-8?B?THRnNk5sQ21qS25Zby9IWEhKRlhObGJWZ1BZRnlHYWJXQzZ0QllvN3l2djZz?=
 =?utf-8?B?WnY4elp2aFo5aW9qbUxJc2hyUDhWcWN3TkxaWmtIcG9KakFjUVZDdU11b2Rw?=
 =?utf-8?B?RXdieUFEQ0wwZWxsMDJMdVpSYmRUeHNNMDRHTnVrSE12QnJod3huWGhOVkMz?=
 =?utf-8?B?SVhMU2RmT2lXT0Fyb0Q1TnFLZllQSFZyYWpidmlIeTBEZTRQWFZPQm9jM3dz?=
 =?utf-8?B?UVQ5dDNDMGVjQkRsZjNnc1QzaWN5WVJ3WjNXS09qWkxLQk9vaWhxbGs5L2tF?=
 =?utf-8?B?L1lPaDhsM0ZDekZQTzlNMEFyM2MrQm5zTVkvMHl6eXB4TndjdTJaUVBqSnY4?=
 =?utf-8?B?SWVmajFZdlhwcmE5LzBaVE9xNklFTTIxajBndkt2TURjT2N2U3UwbCt3bUwx?=
 =?utf-8?B?bVlVYUpVZHNud0FBTzRzcVBzZDVMVUFGRlVtQ2RjYXA0TkFhMzBqUHNudWZz?=
 =?utf-8?B?N0RZb1VqaDdxQ3R4QnV5M2h5VGVEU0FtNURqMnBLZDhuaWgxKzFMTE8xQzdn?=
 =?utf-8?B?S1k4cE9FUlozZFVQdE9JMUlxeHN1cDBtVHN1Sko2QStnSldjN3h2NHNkeDYy?=
 =?utf-8?B?WnVGSERFTU8xSWFCQzRwUWh2aWkzbkk3dTNaQkhvU1N0aktPd1YwdVN0NE1x?=
 =?utf-8?B?VEV1TzdUM2tqVTI4Qk51YlJuUjdISEQyLzlqN0pxSDZDemFCWVhkRXNZVEIy?=
 =?utf-8?B?cTNSbmVXTUlDL1IraDBnblRiaGdFV0dFK3RqamRQNGYwQzdrWmNvOW4zNmto?=
 =?utf-8?B?RXd5OERUTmFzNi9sN3l4VTgrV2p0OHpoWHZtK2NleEd2S003MWJtM3MwK3Z6?=
 =?utf-8?B?MjJMSzE3SkhJaS9laXNLU0I1TktOdWpQRmxBcENYMnJNbm9MUlFQUWNmbUVm?=
 =?utf-8?B?WGd3N25kMzRUMXdoNDBjMmdpYzFsdE9kdG1NZ29FamFMQVFiWkIrSm1uVnFQ?=
 =?utf-8?B?Qm9VMEFWVDNKc3BrVWxEK2VFV2o0T092TjB1MURCSXlTdGZKald6UC9ETDdN?=
 =?utf-8?B?dHhHWG1GYytEZnBJVjlkejBXZno0M0QvdmgvYmxZY01YSytuV2JrWXg5UGZa?=
 =?utf-8?B?SGIzbmQ3UWlZVjZkQ21qU1ZHdmI3cktDcnlmWFg0YnJWbHBCdXVlTDI2OHgv?=
 =?utf-8?B?Qm1pZnRieXc3ay9vVm51eUhYZC8rUFlzNEIwUldiSUVFZGttL2pqcFIvQ1hH?=
 =?utf-8?B?OVZjeFEwV0owbmFsOHdzSkI4aktnVm8ycDg1eVJUUnc0WW5ueGh1bVpTRFM1?=
 =?utf-8?Q?nbYEez3bJsT7o2Jqj8YkS4xSOhKtk+5gzaaBEjMs4DSR?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A4AE0614439794F91F72447B4F9DD33@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34060638-2d4f-4ef4-f19b-08dd964e52a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2025 20:55:29.4813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xQFn3LDPl6a5yv+8FjhzwKEPXQegjvgsKOYje9M8NuHP9SFUHe7k86gGnPEfMbSN4ImZV1HuLJRCPkrpndJX+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8782
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

T24gU2F0LCAyMDI1LTA1LTE3IGF0IDEwOjA4ICsxMDAwLCBCZW4gU2tlZ2dzIHdyb3RlOg0KPiBB
IHRyZWUgY29udGFpbmluZyB0aGlzIHNlcmllcyBpcyBhdmFpbGFibGUgaGVyZVsxXSwgYW5kIGEg
dGVtcG9yYXJ5DQo+IGxpbnV4LWZpcm13YXJlIHRyZWUgaGVyZVsyXS7CoCBUaW11ciB3aWxsIHNl
bmQgYW4gb2ZmaWNpYWwgcGF0Y2ggdG8NCj4gdGhlIGxpbnV4LWZpcm13YXJlIHRyZWUgb25jZSB0
aGlzIHNlcmllcyBpcyBjbG9zZXIgdG8gYmVpbmcgbWVyZ2VkLg0KDQpHb29kIG5ld3M6IHRoZSBm
aXJtd2FyZSBpbWFnZXMgYXJlIGluIHRoZSBsaW51eC1maXJtd2FyZSBvZmZpY2lhbCByZXBvIGFs
cmVhZHkuDQoNCmh0dHBzOi8vZ2l0bGFiLmNvbS9rZXJuZWwtZmlybXdhcmUvbGludXgtZmlybXdh
cmUNCg0KYW5kDQoNCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwv
Z2l0L2Zpcm13YXJlL2xpbnV4LWZpcm13YXJlLmdpdA0KDQoNCg==
