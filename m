Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291E5A23C91
	for <lists+nouveau@lfdr.de>; Fri, 31 Jan 2025 12:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 922D810EA59;
	Fri, 31 Jan 2025 11:00:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JDt5y0Bn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7043010EA59
 for <nouveau@lists.freedesktop.org>; Fri, 31 Jan 2025 11:00:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lw4wN/Tky5GDthV9JsfFVlwP5c964y8f8YiIH0ix5p7aqaNqANR6zzDsa9cjW7WWHkME/qu5V+yeGeKPl16CgnmySFX2mG5PlkTVA82lOuek1cLquEjfna41HtzfiUZzhu59VIN7ccTLb816693FzBiqStzAjUtlHs9b+hCS70562oR3p3vOKy3pa8/envBW18lA5L2s/AxUvxwCM5S/NaHIPti+6/8Ci6sLcX8J9DQr9+zoKBai4l0SCMn6KoimG/ZWuWcePi4vCGkrF6I41hoMpHfuYoOf2MRsu1cGA+pvkzSOlgpKpcoW/2lorjAQk3+tl7BWko67d+g1IGGJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0vOsNhBBleoF1qH8AZxDxYzaM8rwqKl99MerrP0hj34=;
 b=OSyZ1tCxrcLhG8Kfu1V+KflPe5RPPqzRdXn8bcYlROaU5ojrvP9uiz++J0vxrYSWmplVSNd1lXolzJDMro0Dj5j5eMZ0elI6m3NTmkc0vNDmG9FxFs0zCcAHVPuSw9x1PjggINneR94hcSBy5neg3peoc1EALCXTO98dqgRk7YyoKjxbMkC7yvQAmM245rKF4jYmvu64AYhXDpvMWiHyvwqemTwISYMlZVRNpNqNGaPQACxL6EHN2BqqkLfrq9hu6aQe4C0EaXnjoZToqJCNkUo5ZZCITkT18eWXgs1xw2N62N+SHAk3J+17flziZL7UZB4CUInL5MdoG5RMEHz1Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0vOsNhBBleoF1qH8AZxDxYzaM8rwqKl99MerrP0hj34=;
 b=JDt5y0BnNyu06rRzCaNXAexiFdGUpUCtof7FMyb7DyghEjlnKWMb9umJr4tYhThFgypeAXves+buc0rEdgGZYhJwrQ+eiqA80y0El4gMQTqIMQ8vkiauhOWfbxthzJ2cGJ8aWLKaEoMOEFBQ7gCjPtdxZ2e+JNM0D6QBlrOMInRfmCk9rltUvIlwXA22yeqb5aQBjOfKfAl1FU+3pJ33Hzq+QSig3v8SwTDJKrOJz0DjcEy8bh+8sIhB79jcDAmxRiOXoSwKUnLNKZUpdtRTUsGyKSTz6sF8O/YnJmqQJvplmJFHIbW56mLbAfVq4Gj6orYyRfq610wmQTfmeTvjEA==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by DM4PR12MB8572.namprd12.prod.outlook.com (2603:10b6:8:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.21; Fri, 31 Jan
 2025 11:00:34 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%6]) with mapi id 15.20.8377.021; Fri, 31 Jan 2025
 11:00:33 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
CC: Jason Gunthorpe <jgg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Surath Mitra <smitra@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Ankit
 Agrawal <ankita@nvidia.com>, Milos Tijanic <mtijanic@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Tarun Gupta (SW-GPU)"
 <targupta@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>, Aniket Agashe
 <aniketa@nvidia.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Neo Jia
 <cjia@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [RFC 2/8] drm/nouveau: introduce tu102_gsp_init_fw_heap()
Thread-Topic: [RFC 2/8] drm/nouveau: introduce tu102_gsp_init_fw_heap()
Thread-Index: AQHbPN4XRU0k4cpkcUOHJhXtKYfLBbLDfMMAgG2oNgA=
Date: Fri, 31 Jan 2025 11:00:33 +0000
Message-ID: <27d0a321-d69b-47b9-a9b7-4cba4edfa4ea@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
 <20241122125712.3653406-3-zhiw@nvidia.com>
 <61f98334c4bda1c5b4c02b0ab553a11585be600f.camel@nvidia.com>
In-Reply-To: <61f98334c4bda1c5b4c02b0ab553a11585be600f.camel@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|DM4PR12MB8572:EE_
x-ms-office365-filtering-correlation-id: f765d8d9-0ab1-4115-b96c-08dd41e67c35
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Kzhpc3pZMkFoV3R3L0MwMVRFYU5Nb0NpWHFMempkT01iYm05SHRFZi84M2hm?=
 =?utf-8?B?VzhoaWZIRTY1akxyRmxoV0psdHlUZjJWeW0rcTJQZFVKUFBaTVcyQlFBRkZV?=
 =?utf-8?B?cEhsU3NzWTV2dmdzVjhxdnlnRE1QYVZES09OZVU1YzBmVjNvRVZIQjZYa0hD?=
 =?utf-8?B?L0VrZTJNMGFQclVUOWI2QWcvSHAxNzlHWVdWOUFkNEE0NVQ1RU5kN1VsQmVJ?=
 =?utf-8?B?V0hFdGplUVgyVzk0NUdrQU9IQlpTdWRKZ3RhYzJEd1p3RHFzdVBxY0JySEtC?=
 =?utf-8?B?QlFsdE9YRFNKRVhVc3Nndk9LcFp2MzFnWThpYkJHVmVCTTl5a0IxcW8zSSs3?=
 =?utf-8?B?M25sMTZtRnFDcWVHRVRiVEdRby8wVDUvWTZlSzkyeGRURUhQVEhvYWlpYWlq?=
 =?utf-8?B?TnM2MTRoZ0xnR011QkpqbktMOXFjRkRPMjRDN0MrOFpxQWlWZy9MamxienIy?=
 =?utf-8?B?cURvYzduTnJjelVmQnlsQXRWa1hoMzVLbEpZWkZyM1N5S2RFZ0VUNXZEdFZG?=
 =?utf-8?B?ektkaCttUW9Odm1QUXE2aVh6d0svLytSbU1wQUU1S0RKT1JEU1g2bVprWjQy?=
 =?utf-8?B?Q0VndUtBdWdlZVVBWmk3bVllK1lSaUpvbmI0dm9weWlkT2d6bHFSTmxYUE1z?=
 =?utf-8?B?T2llRFRVQ0xyell4dit1cjJYcWJsRGdCSnI3NVdrZFl2NDZQcjNuVFYwT2tF?=
 =?utf-8?B?cWVIOE0xYXYxUDdJMDd5Zm96cXFLQ1N4bUl2b1MycG44eE0wS2lHU2ZITHA2?=
 =?utf-8?B?emVTS3A5ekI3RGMwKzZCb3VlM1VnOHBJRmw4cEpUTHhnSmFJNEs1enhoVGdi?=
 =?utf-8?B?OXRpWUphYm1WN1RxQ2NCWklNdkFtelgvS3dSUEdSMkp2UU5xUFZQeFNSQ2wy?=
 =?utf-8?B?TEtiNzM4STcwZWV6eFZyTTViVStpTUNpU2FzVWsvN1VtT1A1Z09RTER0WmlB?=
 =?utf-8?B?MDhINDhMcGNqLy9QQUsxeWpGTDFDN0J3UmpxaDdvRFFTZkx1TWZSRWkzdTQ0?=
 =?utf-8?B?QXVMWU9WNUdVdTY1L2xpRG9sbjIrVUxIaitYNjBaaUp3L3J3QThaUnhWbFp5?=
 =?utf-8?B?V1NtbVIyOHlsYUFmRU40S2NnMzZTeFBqYWF0RTdiWkFTNEU3NUs0akYxWXdi?=
 =?utf-8?B?bUxiNGRCVmtTZGhIWHc5NnBYakVCKzl0MlpCQk8rS3lmRFNLcDRvRlFRK1Jm?=
 =?utf-8?B?TmlNd3JvTCtVTE5tSXlVVmVjaGRTbm1ieWd3WDFPSjd0ZC92dUFNb2VCL3VE?=
 =?utf-8?B?UlR2WUYrbnJnU0xGR0owNk1kR0UxZUJYSHBKZ1R1SVRQVTFldjVNYlhJc1k5?=
 =?utf-8?B?SVIzOTBOSmw4bGFyaWo5V2VLSFNwWlVpMW42UDZHM0tNTVNBVEVzUFBVYnJr?=
 =?utf-8?B?RW1yZEtiNGlRSktPak1sUG5LWE4xM283ZitWK2x5aHlQUDJrK0xtcFA3bjlG?=
 =?utf-8?B?SHVTWndRdEFnRWlLQjBuZjBQdVBlOFEvdWtsZU9OamdqbEl3c0MwUlZUTDd6?=
 =?utf-8?B?YWFZTlNaVTR1TlExeVZiNmdtbUtQcXBHZDJKY2c2NXFMNTdjOVRyVFNjWGp6?=
 =?utf-8?B?NUhYYWlYckRId1RacjRUSlExUCtXNWZ3RWR4Q0hTVGgvckJwUjRidVQzT2ND?=
 =?utf-8?B?MFlkZGxmaUdGUlVrV3FSd1V1TlN4SFpJN0RuaTVvdkR4bkFIcHQ3RzY2clRZ?=
 =?utf-8?B?SithVDBuRThQVHM0WlA1UkVhTUZWaTZSaEJITVBEbnNwM2lNZkZya0NxZEVz?=
 =?utf-8?B?SmYxL3ZhSVZoNjA1dmJiaVhNSElvaGx3YmJZazc2MjhhbWpqeEx3N2hZUjMz?=
 =?utf-8?B?Z0JCR3lxNFVSckg1dFRqWEFxRDF4cTVjazJldnBqSjNIb0tqd2NBWlltb0h6?=
 =?utf-8?B?MDFRVmlENDVFZ000OGJmZnFob0sxUU52MmNBT00rWWwvbllkSjhVWSs5WDhY?=
 =?utf-8?Q?3Wh5xz1fKN21YAA09ib9dqEu4QQ+OWZz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2c1VzRlODNaUHdjRUNkbGFkdElCSjhxcXFSZW5jTmkwSy9aMEdXb3NvZHZs?=
 =?utf-8?B?ak55QkVMUkZzZVROeERTWVlTei9hOW1nblVoSktzS2NoN3U0WlVkZ08xckxv?=
 =?utf-8?B?K0lUdEFhWWJaTHFZVGdMSGNuOVdUMktTNTFhOWY4d0tTdmJ5UGFuN3ppKy84?=
 =?utf-8?B?NHZGNGdJc1QvTGhtdTgvVFNRdzJYOTd4NG5Cb2g3b0xWNjVFeE9wU2w5amQ1?=
 =?utf-8?B?c0VjQnQ0TzdSK2dVRFc3cWFXSFVtOThkWDZBZFFtYXhPdzFiQ1cxakpCNHpU?=
 =?utf-8?B?d3VEc0RaU0lldGdTdHZ5eSt1aHFvTUdHeUJHZUhBbC8vaFg3akx2OTFqSFMx?=
 =?utf-8?B?WlZBUXJwS0VtalEvdXdNVy9ZZHIyTTRMcG80YUkrbnpKWHVYVU5ydmtkaHdz?=
 =?utf-8?B?bmViOS9ZbnhqcXZ5cWVXc0FzSzN3alpYTGhMSWR0Yk9ZNnVkekFjdlJmRE1S?=
 =?utf-8?B?M0h6UjZRZFpzaEt2YXhJNXYzWkZ1SnBZNDdxNkpuNDBtbG4vOUhKVHRIZm5o?=
 =?utf-8?B?MHkzM3NHUGNTbUp5Y0lqT2t3dVRxY0RhYk5uREoxT0xyOXh4M1lZOUVGOXBN?=
 =?utf-8?B?M1RvdTFML1piOWdwc3lUTEtxSWVJQzIyaW0zUnhxTWdiMnFHcG9HSVFya0No?=
 =?utf-8?B?ZHNxRHNDdFczTmhCSFRRUktnQ2kyTG5YeTQwajBFRHE4MlNKbEhuQmNxWnpw?=
 =?utf-8?B?Mk9DRGorT3NkeElpUUtmSEhsS1IvYzAyV1lvbDk0dGpNNXl5aUd5ZU8zWHg1?=
 =?utf-8?B?azd1OURwV1FrZnNUWkJWckUxdWlmbWNYMk5OSHk5ZEdtRG10TlJQTTlINVAv?=
 =?utf-8?B?Y05OOXFUZVhmZFJvWVpHUUd5RnZnYVJycTl4SkUrSmN2cFQ3WEhaWUdCT2Jz?=
 =?utf-8?B?eUlPdTcrdGhpYW1aSHBFMlBYZ254dE9wSGRGUFVRdDRQY090SVNkU3pWUG9t?=
 =?utf-8?B?VldnaTFHdDhTcjhhQllrQyt1S0FORDlDbXlIT1M0S3lIWThVZTByL2Y4WmdX?=
 =?utf-8?B?QUI0OU5GK1YxVzdXMjJxVlVQZTRVRGU5S2xzb3dleXg4SjhHQlp1MWFJdTA1?=
 =?utf-8?B?eGJHckdUTUdoS1FrZHA0dmhzYVM0cjdvdGRlcWczZUZLK2Q1eEdrcXhTWkY4?=
 =?utf-8?B?K2hFZlE3VWw5dWhlbHBaN0xkWFFyZjJYVzh2Y29EOE95SWRXMzUvMVRsb20w?=
 =?utf-8?B?S0RnMlJzZkF0MlpoVWpNdEt2Ym5oYmFuVUlqaGhEWnNYOSthNDh3SkYwWWxP?=
 =?utf-8?B?WE9DQzVUVk9ZV0FlbFBSZTE2UlhmdW1DQk4yZHJkYUNGRFhFVnZkT2s0VVVy?=
 =?utf-8?B?dGVUNWVpNHJ1Nk9lR20zNlJMWlNiU0JSMW1ZU3JEcjQvUGdCamlSS1NCeGlS?=
 =?utf-8?B?YWhuOWZlb2hHZHg5RTZzM05tcHdNaStrZUhzNEk5SzQyeXRuNjZxYmhhVmNw?=
 =?utf-8?B?UHpsZmxkbW5PUndyVUNZVGxWa055QXJMb3NCUG1qUHB1aXdLU3pxVHQ2amxx?=
 =?utf-8?B?RFZ4ZDM1V3Fidk1FUUZ5T3RMS1k5M1hPYVlYQ3d1RUs3TEowWjNQWkNHOXhK?=
 =?utf-8?B?QmVlUzJPMzE1MnR0VVpVQ0ljM1VzYnlkempCa2o1RDlDL2tRdmxGenYxN1Rz?=
 =?utf-8?B?VndFVW1mSllxVXNCdktiUWdpWWd0Y0plaXBWaXEzM2JQbW9sNGFsR3A2bnNL?=
 =?utf-8?B?S0NjUXF5emJDR2pHVTFBM0hCUDV1Smc1MVVpWHVNcjBHa0Z2Z1YxZEdUR0tz?=
 =?utf-8?B?S1ZYN2NGbGV5VW8vay9EVjNnQzJYdG1raWJQZk9aVk10MnhhNTQ3L05ZVXpa?=
 =?utf-8?B?MVRESEFiTEVuK1VFKzk2OEVVRnRCaGdLU3F0NG56dlhLUzV6K2ZIRWl5dXFt?=
 =?utf-8?B?MXF6OWhMeStFS25lQWNreDIyNXlNYys2YmFBN0N6MlNBT3FVMy8xQkpqLzBH?=
 =?utf-8?B?aDZrVjUraGZjN21WTjZ2M21UQmJQT3Z0SFJQNmNsOUl4bFZkbFZ5TExuVXBP?=
 =?utf-8?B?eURXNVdnMUhDeEhMakJaTllZUzdIT3dqd3hwa0hUaE9nMEtLaG9zcGk3TEt3?=
 =?utf-8?B?emo0ajhoK2EwUnU4NWNPQk1yS0Vwall0UGhkb2tJckdSSFczNmwwZ3VvWW5X?=
 =?utf-8?Q?rs7s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA8DBFCFE25C654BAA1809FF7EA3E368@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f765d8d9-0ab1-4115-b96c-08dd41e67c35
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2025 11:00:33.8116 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PkstMSyqZUB4pqbnG4Ab0AnwU2nrs7nMrr5wjAJ/c92IihD4Ey1NMwKtH3LP4Zz+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8572
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

T24gMjIvMTEvMjAyNCAxOC4yNiwgVGltdXIgVGFiaSB3cm90ZToNCj4gT24gRnJpLCAyMDI0LTEx
LTIyIGF0IDA0OjU3IC0wODAwLCBaaGkgV2FuZyB3cm90ZToNCj4+ICtpbnQNCj4+ICt0dTEwMl9n
c3BfaW5pdF9md19oZWFwKHN0cnVjdCBudmttX2dzcCAqZ3NwKQ0KPj4gK3sNCj4+ICsJbnZrbV9n
c3BfaW5pdF9md19oZWFwKGdzcCk7DQo+PiArDQo+PiArCXJldHVybiAwOw0KPj4gK30NCj4+ICsN
Cj4+ICDCoHN0YXRpYyBpbnQNCj4+ICDCoHR1MTAyX2dzcF9md3NlY19sb2FkX2JsZChzdHJ1Y3Qg
bnZrbV9mYWxjb25fZncgKmZ3KQ0KPj4gIMKgew0KPj4gQEAgLTE3MSw2ICsxNzksNyBAQCB0dTEw
Ml9nc3BfcjUzNV8xMTNfMDEgPSB7DQo+PiAgIA0KPj4gIMKgCS53cHJfaGVhcC5iYXNlX3NpemUg
PSA4IDw8IDIwLA0KPj4gIMKgCS53cHJfaGVhcC5taW5fc2l6ZSA9IDY0IDw8IDIwLA0KPj4gKwku
d3ByX2hlYXAuaW5pdF9md19oZWFwID0gdHUxMDJfZ3NwX2luaXRfZndfaGVhcCwNCj4+ICAgDQo+
IA0KPiBXaHkgbm90IGp1c3QNCj4gDQo+IAkud3ByX2hlYXAuaW5pdF9md19oZWFwID0gbnZrbV9n
c3BfaW5pdF9md19oZWFwLA0KPiANCj4gDQpOVktNIHNlZW1zIGZvbGxvd2luZyBhIEMrKyBpbmhl
cmluZyBwcmluY2lwbGVzIGluIGNhbGxiYWNrcy4gSSBhbSANCmxlYW5pbmcgdG93YXJkcyB0byBm
b2xsb3cgaXQgdW50aWwgd2UgZmlndXJlZCBvdXQgYSBzY2hlbWUuIEUuZy4gDQpwcm9ncmFtbWlu
ZyBndWlkZSBkb2NzIHRvIGZvbGxvdy4NCg0KWi4NCg==
