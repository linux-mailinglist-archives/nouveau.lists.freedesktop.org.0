Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF9987C11
	for <lists+nouveau@lfdr.de>; Fri, 27 Sep 2024 02:14:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBE310E32D;
	Fri, 27 Sep 2024 00:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hcMrdthZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81910E32D
 for <nouveau@lists.freedesktop.org>; Fri, 27 Sep 2024 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727396054; x=1758932054;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+RlFcQZ9kgDKBPZUHMxEpnNvPvl9yfsIidU4H16YnxQ=;
 b=hcMrdthZZY9UvA2wyrjVWd5eF71S+BaabY/bPhVoGAAXbc+9SA/rNirj
 nYed7KA9t41rwCcmGh8N/fe7Lmo1ID/g/w4cqoTdITqAnOExXSVy2fcIJ
 pZJSXZc2M6cZnApLQJOkTZMXjNpAGVq0iYHAhNcfU9xv+aPkNog5nPNY5
 hWEKgqRSYvebDM0PKHmYr7xPjzlveGRJ42DA7h8mM5d/m/SdQC0iddRwm
 xO6YujBOA3TRiZDVeD10G8YaOuawdWqJIBJ160pKTqYqqwGfZhBt67ZoN
 StcufE7wrPOLTgj+8M0JT6Ho+XPcySKSq4ire0XphvfR1DLz0SjcJqhiY A==;
X-CSE-ConnectionGUID: xQVKjUwgRImPfuOaGDnxDw==
X-CSE-MsgGUID: px5f+DEORpGvvL1aYw5cCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26334139"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; d="scan'208";a="26334139"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 17:14:02 -0700
X-CSE-ConnectionGUID: Pc8qjHRZTdK6JvX6wjpPUQ==
X-CSE-MsgGUID: H6ASSUkJSsuupeiVmYxftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208";a="72015606"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 17:14:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 17:14:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 17:14:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 17:14:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 17:14:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTPp894J9WWqaBIdeHcURXLdxb4DBLLScD8OEW4r7LJ3NE8HOfyt/VOr820KTFC67Pu5dkOZqDLoTjb7Kw09zIS9DegYPPvi37sTUROxVasY6497c0eku0gMbBnay7MI8BSecbAClsr7O7LzcfkbPQYVfNE/csGjFJ6aopXF0DENnGWvxyVq8w4NzaIiKD2IigBSlMZeLo48RoYFmQ+oSPQWUbB5SDqcut89pG8F6zWDp97QwtuUiOHECUrG1y04l0NzfnflYwqFaJiogtfyGQbbg8/YXi34c0kF4FpKMrvdgYAeWLJ9B0Hi5VjUM+paSUNuFPyCwbCLisz8aGjH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RlFcQZ9kgDKBPZUHMxEpnNvPvl9yfsIidU4H16YnxQ=;
 b=vTireWooLQ7o4jhofk/qcTzvoD9ZGyobxLxepo6cO0Tns8JqCDxhVhVl27VuFdVLv9KUQ0VQPTe4Hv6OHE6lnBr3eR8mdACzeIvnmi4+cnyFU1l7M1NIdIBEGVcqS++Nw8JP1peFVnw/Oin3Tx1ntpAuZOkH7Yg5dJHuC1YULAFYPCMv9GaWa3OXNtAHIorBhDCA5sNbbs8sm6s7bQUhTu2J/UufU5iNwIIF6RcINIUVZSXroJXjAjOOqv5AfAn/cjHjtsUS28JoLY8KtQeOaDDajoEJaOkIImy7oXgZ1nZ6YK0Y9eOwN3klii2DA0YVbN1S26d3wHAjIfacZhk1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH7PR11MB8057.namprd11.prod.outlook.com (2603:10b6:510:24c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.22; Fri, 27 Sep
 2024 00:13:57 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::b576:d3bd:c8e0:4bc1%6]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 00:13:57 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Zhi Wang <zhiw@nvidia.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 "Currid, Andy" <acurrid@nvidia.com>, "cjia@nvidia.com" <cjia@nvidia.com>,
 "smitra@nvidia.com" <smitra@nvidia.com>, "ankita@nvidia.com"
 <ankita@nvidia.com>, "aniketa@nvidia.com" <aniketa@nvidia.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "targupta@nvidia.com"
 <targupta@nvidia.com>, "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: RE: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Thread-Topic: [RFC 00/29] Introduce NVIDIA GPU Virtualization (vGPU) Support
Thread-Index: AQHbDO4JkHnxGOPNCU2lsdYB8MwR7bJk5jyQgACTGoCABCOw4IAAb9YAgACoGQCAABN6cA==
Date: Fri, 27 Sep 2024 00:13:57 +0000
Message-ID: <BN9PR11MB5276621A080C5B133C2575288C6B2@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
 <BN9PR11MB5276CAEC8170719F5BF4EE228C6F2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20240923150225.GC9417@nvidia.com>
 <BN9PR11MB52768D78EE4017A90E7CAE408C6A2@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20240926125528.GY9417@nvidia.com> <20240926225706.GA285230@nvidia.com>
In-Reply-To: <20240926225706.GA285230@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH7PR11MB8057:EE_
x-ms-office365-filtering-correlation-id: 543b000d-1858-4cd6-f105-08dcde8947b5
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?DTLyAf5aV8ZilCUClyLjz6y0UHTJsqCtACMJJ3dqcXz6h6v2GFaIpGpLyFAm?=
 =?us-ascii?Q?U51E6iIUempaSFaolZwaKpTTg9xHxnGyoIA90LsCDHO664JY9IAUD/WogD9u?=
 =?us-ascii?Q?9PoAGuJI9JuaAocmeyxRu6bGRycDkLUibAEPfViaLiSVQfwEm4UWcMN1yCLn?=
 =?us-ascii?Q?F3LsgtA33JuO4OA1hUj0N+RM7R0OXvb6fRMQRpHCHawL3TJhnaeyx3GaHe2L?=
 =?us-ascii?Q?z4Op8pH5oGreCLeG5WxinQH8x8UBvP+xB5GyughGUo2H3qUqErVqGtbvrAYB?=
 =?us-ascii?Q?NVuDJGjRlCYT36v6aQTPBBzXtp8iULhzUOxCkE2WeUeYu85wL/qj0+qznOd2?=
 =?us-ascii?Q?ROnGKb9acQbq/l6WfTmbwi973T+LOI2rsOmiCgBd9OKnZHGTqvXMMV4NuwTp?=
 =?us-ascii?Q?em8iiiU55C9ZM4ZoDUhMJS8nxaI/q28SKP2vFF2qG26WuwuuD2Gss2YaMGtZ?=
 =?us-ascii?Q?Bf8b/2elyJw8V6CTDE0NON9KthDB/2LKgE/LMg6xraDvcKF2bCHVmmz91Lgq?=
 =?us-ascii?Q?oGs9Q1PlhWuta8KSBh863TdSv4g/ADCr7QcDzHW57tTP7dYW0Xt7cr12NeZQ?=
 =?us-ascii?Q?w2SmcgRXjMDqq1CWu+BZUv0GXFlvgQF3UD1cvGBmn4qBRwoih7oGQYM6IWMo?=
 =?us-ascii?Q?t1yu8PTBFZcCVDsGoqbmFfJhqS0yVsRLzVEzuietvwhjTx4Gx60MdtaLczP7?=
 =?us-ascii?Q?xQcDfrYo3F6r4XODdghJ5UUkONh307UdwyT3e8rKqsAytk4Me8SK+04zcyVe?=
 =?us-ascii?Q?2kPIcceUuwArTwU9tCQV+STfGMSy9DQjlQa2otiowQqtrVrgL8ubf+xMJdnu?=
 =?us-ascii?Q?loe2Zp/GILqucYSQDfhHgR0DtO+9MeopqZuidIRO0AFg/lPdE9nxYsweVj6h?=
 =?us-ascii?Q?XNwdF7Pz09jdDubi4WG7mxHk/B2tbwHa90QkGGvHR50Ofq0glD1HqtIGdvM/?=
 =?us-ascii?Q?+MIfsmJeLW/v6Um7VkbOgSWXrRZlYK4OquohAzhWCUAFE+wLzqWeltxuudOk?=
 =?us-ascii?Q?6ganrIoLe4rbvDf/fucWzLFWpvjleyUyfd8k2X+lByH6TpcxTfiHXYj6JRDg?=
 =?us-ascii?Q?MUXJe0fn+yZTZ/bjYlCHSQG7nA2N2FQVAVeOKQBUgnYEdMqZQV/0iVjMWqm3?=
 =?us-ascii?Q?1rLkiOnQ4YXS6auQ+ren+KeEK/6F8ByhZikCrA+5k3I/Ie9eNQ4Q2wqS0cxp?=
 =?us-ascii?Q?/QuZkPQzrrBjmtk78gnWIuZpX5crk40mH5KNavhjez59H04vzWp6s7IVA2Kf?=
 =?us-ascii?Q?6cYJyWzVxDs1EF75PWiQtYDxNdyvZFPbjhDwN8onYHICmRguAcZkweYLeLnX?=
 =?us-ascii?Q?B0ql8d+CUvtzCZDf0TRT2tCcjxg2cNVM7PEQ+uxsgct30g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5kWy7zZUFnCOJ1aG9nTBWkwEGsQTc2Z0ubogK8OtXrjQvPN78OPL60EoivLI?=
 =?us-ascii?Q?rFlhTjL8wAIVI7u3SajVChZflfyN+og44qwn+6EQ+fW1g5ZYBY69n9HakbCt?=
 =?us-ascii?Q?uCY9ieRwGT0+thYVlVeHrzC0qk5XgaOb7ltPNa3vChFi+gHH1/RlZNhUN8Oq?=
 =?us-ascii?Q?3G1e5RkroLJv9z7QS8lzdHDGNzXPVk5r3JeccC7QGlibvpC1dhhNVz4Aftwn?=
 =?us-ascii?Q?LdC/sApsyZbAKm0GqccetJdOl7CsW/+dmRvI8gRDmhXjm6Gwt4+tyfC89ZXm?=
 =?us-ascii?Q?sU2tKLlqZLbXR2PhodemydhloRgFQ6omK8miAVVJ+ddl176tPi3MECQqf5ZQ?=
 =?us-ascii?Q?LGVtSpcshrGmdTmgVkPSEBtfd0rl6LkT2AhUQBsg37JqRQBIs4AHp43WtUbc?=
 =?us-ascii?Q?1xZ5n+ARWnRcRPOTHi8yp/G3C4uLYO+JbZYM7OvAztBzdDQL+qOmQLD5df/d?=
 =?us-ascii?Q?tGMFnqcCpYmH/YBnd2KqWSGOtd3DaPyPWQrBtB00oY0ZHHrLYmeiGRcvh10J?=
 =?us-ascii?Q?HhiJJuHxmGExasfdVnzrjxq1Ezf22L0NgdiOhf6q5htM+aBi+7NSgEcFNZ7L?=
 =?us-ascii?Q?UT2Q9Qn/b4egnzoC+P1QtEDNYfLWgM2dV4dVuk758BkHbS/pM/l2C0tWeke2?=
 =?us-ascii?Q?iIuvH+JepNSUqihl2prbEjssUKX55wY5Y5ZYFEDgdqZGKbRAFkYU9oZEUavY?=
 =?us-ascii?Q?i3t/epw6Sz+7HmtDnhdQ0gfwE4WTzeRNU1zw9co02llOY1nLD8S+0HWcMAgt?=
 =?us-ascii?Q?eIn2gc++XA3Wiz39qR5QeALBTZU0Dc6L71FeoF1DY3Yb3DrFpwyDPLS7yDXi?=
 =?us-ascii?Q?sND/wqv4ZpLtatPcCM5Vt9JkDVlq0MjjDRPFb+4zzTblWXM5rQIMP6C59AkP?=
 =?us-ascii?Q?kul8gYtpfHMVvUCVXEUa93mPWKyWuYVaJBrhL78Wp1xqY2QLfeFcMTAG/zc8?=
 =?us-ascii?Q?DuXKk23VntKuJsD/HL32by3OWTOorMOwYiwlVWi9rjuehMYTyB9OEI67s5Kr?=
 =?us-ascii?Q?DVs8GmNiORzwrv+XrB3hqQHE0uLZgkreyOfjTs1ZCWm5B41hUJNLIfX12ou5?=
 =?us-ascii?Q?bv8Nebk5RNUGhuVggkYPTQkI3SxeINRzbK3R02/aPq6I6e16OY3EPdpXTNWt?=
 =?us-ascii?Q?YV/u58385fz2MLTu7c3RpQc2tfrXYzkRCtxFnHZJAu0K66RzmvafOKmKePJ8?=
 =?us-ascii?Q?bJ8zilIit2Jik+PEw0SI8ZPO/OX55iqLea01cZSLVSGYtXrhySE3cC044i5W?=
 =?us-ascii?Q?yYRZSmHRPSlXrtemHxLWP7KoHPYPuJEws+B3V3Kw7xi9Xfj+vKCUrDrotTiw?=
 =?us-ascii?Q?fTDpJos1RVYvietRmwfuM+L8ZucPCotqxYX3do70/PVHWBUxtg0u5Vp6JNP2?=
 =?us-ascii?Q?ZFnQHT84EGSyEMRPjztS4Zj1Uh/ABYcgLYDP71WamNXC1kzydMUiATvxhoQt?=
 =?us-ascii?Q?tl8Y7AO0iMnygOFaPhI+K7yjV7vPo+n0EADAYG7e7zdUEnnI7EqtWiq4ZbDF?=
 =?us-ascii?Q?sza5WDiHam1wAq0DskknGHr/H8f68p8yw5VlLQ4k1vVlDToGYEneZfnemrY5?=
 =?us-ascii?Q?LFjx0PcXfNY2qBzaPoHGMsh61Yf7ToPzFGceADxr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 543b000d-1858-4cd6-f105-08dcde8947b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 00:13:57.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zQlGqw96kgmx39IfjssLAdbl4Kb5InTOks+qP7OZ1iO7Z8k+Fy2x0IPk7PWnwpQiQzpbNhOH55oY96zIO72cvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8057
X-OriginatorOrg: intel.com
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

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Friday, September 27, 2024 6:57 AM
>=20
> On Thu, Sep 26, 2024 at 09:55:28AM -0300, Jason Gunthorpe wrote:
>=20
> > I'm not entirely sure yet what this whole 'mgr' component is actually
> > doing though.
>=20
> Looking more closely I think some of it is certainly appropriate to be
> in vfio. Like when something opens the VFIO device it should allocate
> the PF device resources from FW, setup kernel structures and so on to
> allow the about to be opened VF to work. That is good VFIO topics. IOW
> if you don't open any VFIO devices there would be a minimal overhead
>=20
> But that stuff shouldn't be shunted into some weird "mgr", it should
> just be inside the struct vfio_device subclass inside the variant
> driver.

yes. That's why I said earlier that the current way looks fine as long as
it won't expand to carry vendor specific provisioning interface. The
majority of the series is to allocate backend resource when the
device is opened. that's perfectly a VFIO topic.

Just the point of hardcoding a vGPU type now while stating the mgr
will supporting selecting a vGPU type later implies something not
clearly designed.

>=20
> How to get the provisioning into the kernel prior to VFIO open, and
> what kind of control object should exist for the hypervisor side of
> the VF, I'm not sure. In mlx5 we used devlink and a netdev/rdma
> "respresentor" for alot of this complex control stuff.
>=20

the mlx5 approach is what I envisioned. or the fwctl option is
also fine after it's merged.
