Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D83B2D0BCCC
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 19:11:22 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2212910E91D;
	Fri,  9 Jan 2026 18:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hprNEgPv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BBAA844C96;
	Fri,  9 Jan 2026 18:03:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767981780;
 b=c8cMHaj1+5eLsOfrm+EdymM4I5LEAtjVz7+zTE1jvRLYqaeHoA0VcvoraaY2DSuMETEJU
 cjTxBx8QIDDKWWGuJj9YTzzlGeZGtGhu9ZW+xhfjJWnDltyahekfShs7/lG/Elv54VgbMoT
 Xo34dzPKNtgkuM8HljiYdC1lvafjN8HfLX33vPhsbgZ2b13w3fXrjhs9diboH4Iiuz58Jfv
 hCbUe9g4vyg+jKHX4x0jrKPBKFlyhiHEbHlFtwxQeQzHEYq80e4gDd2dSG6vfgnd8YGhOD8
 P5dl1djqMujKbEmc6k87LgxBU8TbWLhx5uv7/F/atSRTHR3g5sEBjDcD2ATQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767981780; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Sx650GKDztsr94Kt0Fqmp2EMCULILxW+hiT2Ty6LLC0=;
 b=FX/N1W55fOj6TQWXT4M3fUU4rmS15wfd87KOftG7IpuE9VW5EE3SKkig6gqC0ddnVdOlh
 5TrnWSxe79EmKfcxq2w1chISLm1mZ2giXpBenQZrV+vt7CgdzpXmiEx6AtFfJcxE6d+83xp
 zRFeK1U9+1MU2WuWwH5hQnua0gkcdggaqffjHarrZ8BpMjxKNtYLwG5mGSemQTLwQ2KGAzV
 GnolK6xD/HD5u+YgKgEKh7ernC9h/AgGOLPiqfiDQw5M+mStI3oBDWAsEC6c8gXpH0NUo8X
 2A0O3UoUEwJowc+HClfZo5VLB9o3r0jXelGOb3f5ZWmaA9UIpxAcX6kEetgw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3823B44C4A
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 18:02:58 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012048.outbound.protection.outlook.com
 [40.107.200.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3BA10E91B
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 18:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMNFEFeom8FU6zyr18+U3vzuLFH0GUhhGJjyFe8gCaec+o7zGK9437jpvRO5tzRqL+u2JdJC102bZWID8Mel0NybDs0392/b0/uJWcruy16BDa4doHl3Pgt4Wpo7qiijx1kPphceQK7vrkte9SmqIsV0G3Zoad4GaqUtQ3QerMT4ahtpmf+bs9xbrkyhblJoGxDlaR9rr/Kz+QGvFeldIZ/4L/EL27RVc+BR22wi0+inK8eWCfKdp86+/sq7srucAVn+60buFWX7MHpUOp7w5gLzNvvMMOqbuS4XC/qUfOAEj9yVn7Q5U72h7RpUoSQE1sSZNYfqlXT5mf0MYKuU+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sx650GKDztsr94Kt0Fqmp2EMCULILxW+hiT2Ty6LLC0=;
 b=L6wiIdeg33vLuDx+T+2w5qwJ6C3lTJpjNTj94Tm1CAD72YBftvb3bouj+EBLakdSHTeU8GQRH8MwVEGia/GLig50H8Qd5L1umP08qXVUwnJv4NZfDfIg3hgeDOZufeivrpjovCRmocYUcJycFIPKCNOtutFmcysavwkw9jHqpq9HZX/CLyVqnc9apP2pippFLLdzLQe3AFzXdKxn3PsGbWSPqDI9lqW78UD/H4z5lJwSkbC/xhfJ2Xe8wFl8JwTeGpghBWaWHbtbFmViUopNStpdi2AM9iRPv/U/mnldlPENKnMxRwOdg9tp8pWgsJ2sBX3RBTvI0LQbPfAmzQx8ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sx650GKDztsr94Kt0Fqmp2EMCULILxW+hiT2Ty6LLC0=;
 b=hprNEgPvXKwxsV+ZyLBLYADO4QL5/6qxtR+jp5L1fFBBWGB8ahD2fVr2SsK93S2KvOHEAcICO8PGIKEJcqqqmp0cGLEECwxYxwTymL+fxO0KUZgD6peC208nZKDvWelRTLofRRLtgnS6/nf1gP3G/iCxg7tZ05rMVuQB3G30/Lcq4cxI7e4utljeVkNLuY1GYmI6aiZZ6brPekhRV7WKkC7AxZo4FZ1nLlPPR6AHdbMEQGlPsjL79UJOxBLS8oRMBPRYoobX+nNToQv86FtSpmmGH0XjmLo1qLly1PxDLrX5N5/s752uZaBwdlKaYo2BzjlPhPgtFAuYk7eQhR51vA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DM4PR12MB5986.namprd12.prod.outlook.com (2603:10b6:8:69::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 18:11:13 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 18:11:13 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Topic: [PATCH v5 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Index: AQHcfG3W3T8ws8JHdEqtIJBUDe1W2LVJLVqAgAEAd4A=
Date: Fri, 9 Jan 2026 18:11:13 +0000
Message-ID: <d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
	 <20260103045934.64521-10-ttabi@nvidia.com>
	 <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
In-Reply-To: <bf3bd88f-ba73-422f-b2e6-24512dd19ff3@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DM4PR12MB5986:EE_
x-ms-office365-filtering-correlation-id: 3930566b-595f-4dc3-c496-08de4faa798c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M001T2crcXY3bEdRWTBzMGxNc3pmSmxOWncvaWJvY1B5dDVXdTBWakF5UUQr?=
 =?utf-8?B?TC9wNnU3dVQzZDZnMG5LMm1na3BBc29peWlOVWUwbjlwSXp0eWFaekhoVk9N?=
 =?utf-8?B?WHJRbTJkMUVmQlcxQ2dpKzl3VjFiUnFTdUhxditNTHVGOWFjbGxRWjNNNHd0?=
 =?utf-8?B?cTJjc2pFeFB6V0wwS2VaWkdjajFpeEFOSE9ZT2p0bXQxOUhUUTQrY0lua05l?=
 =?utf-8?B?bDdHdTlhd0hLVWVkT3VNRGFmUnZyZkVsaDJKc1d1OE5OekRBSGkxSi93dXRO?=
 =?utf-8?B?OG5oaEpkNC9YMTdNU0lTREJFU3JCMjBOaXpMQ3RieWJHd3lwOVpOM1RyRlpX?=
 =?utf-8?B?NTl5ald2U0VFR3MyOVUyYWIrWFVZckNHcEU0aGFxUGlIMGkzVXVqd0NCeXMx?=
 =?utf-8?B?dG03VzJ3RFdHQWZiSmk1WE1rV21PZ2pRR0VnUGpxUjY2OWtSOWZhWFcyQ3Ro?=
 =?utf-8?B?MHVNL2ZQMndGdnErZnlaeTFUeGdsWm1SRmFjcExXWERJN3ZNd3BWSW5iNS9T?=
 =?utf-8?B?TjZ4S0FLMkEzNjE0bElYRHh6WlJpYWRqUU1iUHhmN0hBMmJLK3EvSVdWRnpX?=
 =?utf-8?B?eUZkcit6ZEQwMmlMdUNvcVk1TzIrYitlYzNpVzhSQkthejB3ZjZ5eFBacUt3?=
 =?utf-8?B?b21HNnJySFIyTy8raCtGeXBrZG4xNGhHeXh5Z3ZKSUI0UEFuOFFxSG1nTUlK?=
 =?utf-8?B?SU45YlhycTNxOXZIeWFVaHE3cmVweEg0YWpoT2M1WmdtTzdSUVZOWStMK0U0?=
 =?utf-8?B?bkllMDlNa25mMXJNaVYwemZreTNxWVNrczJtVE1DUW1DVHh1USt3QkIybEpW?=
 =?utf-8?B?VWNvNjJQVkYrcmlta0dWbmhpdXRkaXlpMmQzWWJESXJHMjBQK2xxMFdUVlIw?=
 =?utf-8?B?STFGVTkxM2VENUh4Zk9oQTh4MzRXTjcxVUNIVUtFdy9lUTZaZ2tLd24wcU5R?=
 =?utf-8?B?TDF1TU9pRWFNbEo1YVh5dVpSanhsTjhKLzFRNWl0MjRORFNBWndHQ2xuWVJL?=
 =?utf-8?B?Nk45L0l4dlBkL3NyWW56bE1STXA0MmZGOHQ0RU1vWk5oYXB4ZmxvZjc3RWMw?=
 =?utf-8?B?MW1TN3FIeHduQlBnVE1SSFY4bFdINjkxdnppSDdHZUZLbEp2UWs0SXVsM1Mr?=
 =?utf-8?B?bGYraSttb2dCN3dIeVdaZjNySnQzanV0RUNqZEJ5c3pYeW4wK0hpN0Q4ZUhJ?=
 =?utf-8?B?TXhwWlo1MzlSMFBhVU8yTGxqcGNlSGpndWI2OXVzNnFNV0oxVE5oNkNmblVZ?=
 =?utf-8?B?THdWWmFEZUI0R1RGM2dneUNPcmhtenl4QTl1N1NrMXd3V05DdTNEYndZM2ZM?=
 =?utf-8?B?bVBFRnVWWFgrOGtVK1JiaGV3a0U3ZFRPQXZ2K1RWSjRCS3ZxQ3lrRUM0aE1y?=
 =?utf-8?B?dkNtamxKdVNIWEV4NjVDVGdodmNwWVJaUUR2V05Da1AycjZrQXBqQUgxOGxP?=
 =?utf-8?B?OWQ3dzJQUFozdmhoTWMyYXR5cTFQbi8wM1UvcmsyenlpdG43NlpUcFB2NEsw?=
 =?utf-8?B?NFI1NWNzK2k2eTBUQ0c5QzdiM3Rxa3d5V0tOZkNJaVdiZVJNcmo4OTZUOWxJ?=
 =?utf-8?B?VDhjR2RZbFVYY2Y2bjNMR3JNUWpEeERUSWNjdlRyQ3YyMWJ0aXFwZlVVZktI?=
 =?utf-8?B?TURFajFKTjBKYkd5dEVJU1lLQm83ajU0WWxQNFZQODF0UUE5MzUxWkZibHhD?=
 =?utf-8?B?RHVYbWJXcHFIRWpySGU4WVFCejZ5N2k1dUE3S1V1NCs2TXdjTDFJbWJmOGQ1?=
 =?utf-8?B?QnF4aCt1eWxzMXNpTmRDMVBlUE1aWkJ1NE1LMmZOUmJUWGVWUDlvRVVNa2Jl?=
 =?utf-8?B?Z0VqcE4ra2tOemN0YVpnbnJFQVRtcUNkQnRVenllN0RSR3BIWHJGbkxBQXg1?=
 =?utf-8?B?M0dvRDU4QTJSY3A5R3h6TG5HTkJrNVdMQTROT3ZzOW93VjhvbTZFdXkzTFRp?=
 =?utf-8?B?dTFOWjJtT1JKM2JMU0FaOC9nUkM3VlYzdU9jZkZFNGdQTmpnUXBMVlExUG91?=
 =?utf-8?B?Zmp0RTJQRm91dGE4Uks5eHdZUEZOYXYrTksydGg2eWd6MytzUi9wNDRQZGpI?=
 =?utf-8?Q?8bsZ8Y?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB7943.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cnJwMTk5MUhuZUtGQ1hueTVxVHhSM2ZPejMyV1QzZDlXZk9YbGRQcDYvek0y?=
 =?utf-8?B?Q1JRTStPaHB4RG52RGYzTTZpOWNWNTcraWFWOVpOak9jOHEwMllSeXJLWnJS?=
 =?utf-8?B?dHBERGNnWW1zVUlmbEVORnMzOXZacURrSWtSVnNlM3FGdkhENWN6MkJHOFZL?=
 =?utf-8?B?eDRjRWlta2xEemErMVphSFdCOUgwV0tHeHRCQlgvUFdUZWhPdWh6K2RqTlZE?=
 =?utf-8?B?QTdhSVdVS0FWSlNERWlXeHIycnRoV3FFd3FIWEhHeVhmZ1B6ejI1R1NqNlRZ?=
 =?utf-8?B?QnRLeXNnaWI4U3I1Q25yL1AzWjFoREVHR0dSZU5hU1RKalppS2oyS05ON3Fv?=
 =?utf-8?B?NlZYNmlCUG1uMEFCY1p2U2x3cXBNa1FpNlBCZWREOFNIdmtEeE5SNWtKTWcr?=
 =?utf-8?B?TDU0dkJYSmQydm9ubklFQUx0RlpkOWoxYWI0KzRyS0VhUEJ2Z0szeGdQdTUr?=
 =?utf-8?B?a1RiZlluM3BaNkxIL2NkbEVhSWZvZ2dpMlhJMmRaME5zUkJRMDI2dTNjaVZB?=
 =?utf-8?B?ZDEydkZzZGNkblZENGduU3B5WEl0YTlqd2RnNnNLY1FwYXB3cVZMNmN0Tlh6?=
 =?utf-8?B?d0NDbW1GL3pGTWJGU1V2cC9XbENydFN1ZlpDcWxQdHRUeU52N1l5Q0p6bE01?=
 =?utf-8?B?VUVwcHZEbFVRNnh5OGRibUdwRjZlYURzWEtmU2lMWnRVbGlLbzFuanh6MC82?=
 =?utf-8?B?d3h0Uit0ODlWdWpLTyt6bVFEdVd0MFhQdzlqbTdsM2UrOFNzckpqSE54c3Ir?=
 =?utf-8?B?UmU2VFo4dkJJeUI5SzRDL3JvdkRaVEVaYVVZRVVkVXRLTWkzS0dFOU9yUVB0?=
 =?utf-8?B?blQrS2puaENYTnlxR0JxRmZNS2RuaHdwb0xCd3Uxa3I3V2EwU3lxOFJ0SnpV?=
 =?utf-8?B?RFlJTGhHalhuTUd4OGxBUWVhVWo3ZHpXSktyd1NBRDI0VEE2cS94eWdFWSsw?=
 =?utf-8?B?MkcvVGw5OHpJVCtlWDYzU2lZNHMzMlpLN3FDVkpWamJJSGVaUGVXM1BhQ0xm?=
 =?utf-8?B?Tkd3Z3N0aFBDWHBlRFpVclpqYURqaVZCbUhpZ3k4MVB6Z2ROSmJhUlVRczdG?=
 =?utf-8?B?U1FCZFdRS2xSeXE1dXRpQnVZQUd3YmJKR0FyRHpWay92OUtrZDRZM0JOcXBW?=
 =?utf-8?B?VTVicm4xNHUvYWJzcHpUcDExVEI2QVNKTzlBL0FNUWthODlkMXZMSlM5elRE?=
 =?utf-8?B?Tko5MVRnMGZNV3FvRnRucW5waTJRQ1QzSERxV2kvYVR0ZVNjaW1oaVpzWjFU?=
 =?utf-8?B?N2RDSk5aTkpTcHZkRXRINlVwTEJZL0FyMkJFSEt0ODl5YW5TNnlBbVJKR3NS?=
 =?utf-8?B?NUhwaklqNUgvSDI2eHlBbndqbjJlVlZQOXZlM29vYXBEeURSK3p2M0FaT1R5?=
 =?utf-8?B?QlMxNFJqUmlXellPTDc0cG5FV3dVMmJpY1ZjcldMYjJSV1FLUWJpN3g1MkxW?=
 =?utf-8?B?aHRrNTB5Y0loWmRDT29tTUF2a1N3T1hjQlhmODZkZGo2RUtZTWpsNjh4eEFG?=
 =?utf-8?B?VUlZS2doY1Z1aUljQTBLNzRidDR4OW4rejdmUzNBWkVsVEk3Tm45RVBRb1Fp?=
 =?utf-8?B?Z2dNSnNiUm0wOFNhSi9KditLMnpMWEhTSlhwTkhZckVIbFFzUDJaMU5pbWRr?=
 =?utf-8?B?cTVvdDhCZXcrdkJMK3Q3SStYcVpwUDE4WGYvUWp4ZUpDNzZYQ0kxVVJXTm5W?=
 =?utf-8?B?b2xhempmdnFqWFlSV0xudnVwMTd3NUtuNG5RWkFvbUxPRlNMUkJkZDFraWdV?=
 =?utf-8?B?bGszZ3ZORVBEMDkrMUtyVlVHTVZWV20xa0s0SFRKTTVLbGZMVWtnczNDMjND?=
 =?utf-8?B?UUhkbmdISHVRNWJxZkpaZm95R1NBWmVycDNJdDFZOHVXZUh1WGRaQ2lzRkxn?=
 =?utf-8?B?OGZtek9oRERmaG4rd25OL0YxVzZJUGRUNUhlMmw4T2VxbTRzMW5pbXJQTWZm?=
 =?utf-8?B?WmoyM0pBMDFTUW8zY0lYbzhkcDJueW9ZNnJOM3dDcSt5eXhkN0YvSGpxOGxO?=
 =?utf-8?B?OGJFNVc2dUlnU2poTU5CcFNuUVEweFNESVpvRkMrK3czSW0xc0JaL2k1ampH?=
 =?utf-8?B?VGMydkYyR24ySnVKWVJsQzZucEtvSndHV05DL3UwZ0RMQmtKeHYzdlFZemlW?=
 =?utf-8?B?eDhtYW5QeTNoa0ZGR2Q4UkpvOFQ4YUYxaUEyb1JPVDg0NHczT2h5cWgydUd5?=
 =?utf-8?B?UlcrTlpvaDRrR0N6SEMxd0VyZk5scDhuSmV3UW03ODdiOHdUTThlRVZXdGtP?=
 =?utf-8?B?OXJ6Z2JBVHFRb3hSYVU1R0tUMis2WGRDMHdFUUFseFd3WlFFWlN1VVZ0dU5K?=
 =?utf-8?B?LzcvdFAyR0l1d0lRNDdYMGY5RGt5WkdMVGhZckhISFNaYWpJSnlNZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1209676BD61AB4398AEC6408DDDD21B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3930566b-595f-4dc3-c496-08de4faa798c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2026 18:11:13.5335
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 G2VPUj9Y4QyNAJppxYkJYTOQkwAbnm7efgzN6p3//aybbvZTaEyDL1rJVxwuLwj44nqOgXqfgGOXzD+WBrLFtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5986
Message-ID-Hash: EPFCPV7XYCWDMHWMBT3366GPGPM3WGD5
X-Message-ID-Hash: EPFCPV7XYCWDMHWMBT3366GPGPM3WGD5
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EPFCPV7XYCWDMHWMBT3366GPGPM3WGD5/>
Archived-At: 
 <https://lore.freedesktop.org/d20159524cc52ceb266dc78faaae0d2e9ce15c2e.camel@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

T24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjUzIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEl0IG1heSBoYXZlIGl0cyBvd24gaW1wZXJmZWN0aW9ucywgYnV0IHRoaXMgaXMgKmFwcHJveGlt
YXRlbHkqIHdoYXQgSSdkDQo+IHByZWZlciAoYmVsb3cpLiBJIGJlbGlldmUgdGhhdCBpdCBzdHJp
a2VzIHRoZSByaWdodCBiYWxhbmNlIGJldHdlZW4NCj4gc2ltcGxpY2l0eSBhbmQgUnVzdCBpZGlv
bWF0aWMgY29kZS0tYW5kIGl0J3Mgbm90IGFueSBsYXJnZXIgdGhhbiB3aGF0DQo+IHlvdSBzdGFy
dGVkIHdpdGguDQo+IA0KPiBBbmQgaXQgd29uJ3QgY29zdCB5b3UgYW55IHRpbWUgdG8gaW1wbGVt
ZW50LCBzaW5jZSB0aGlzIGFscmVhZHkgd29ya3M6DQoNCkRvIHlvdSByZWFsaXplIHRoYXQgdGhp
cyBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIG15IFYxIG9mIHRoaXMgcGF0Y2hzZXQ/ICBXZSd2ZSBj
b21lIGZ1bGwgY2lyY2xlLg0KDQo=
