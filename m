Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBD3B1C5FE
	for <lists+nouveau@lfdr.de>; Wed,  6 Aug 2025 14:38:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E363D10E783;
	Wed,  6 Aug 2025 12:38:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwDx5tUx";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA1E10E76F;
 Wed,  6 Aug 2025 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754483905; x=1786019905;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3DxfDQdwVaReuW1mycxs0Iaee9GNtnJhqQ1hEWfwoOU=;
 b=nwDx5tUxVzOK2ysPYffhmWDOcsqOIqD7yEPPmflBOi3R94txHntR4nqa
 6JMuayXYRpe0yQRoYupUXOsd1W70KqTtXD/ATeJLjjQT9tClG/P/8aLpZ
 KhCy7CvwKaYa/bpobv0AdiC+P22sLnVJWDmEy2AHsiy5xnqi48Lm/NddI
 O/Ky+XSufN1yy8OmBkn3Hs6OBF1zM1dO5RQG1YqncuUpMA9xo6zQR4pi5
 UYaSd8co1cMzT7LfqOmYWikPiC0n4sA38iQp1LJFvavLTVVDgLXIFoHjJ
 DxVolWPWmKuaclje4JDd0vJis2uhJiPUx8IEpN64iN2Y9OmZf4+SiU0I3 w==;
X-CSE-ConnectionGUID: GZzB8Ma3Rr6G7kJBkfFaqA==
X-CSE-MsgGUID: pL/i+Fq8SOOZ1UE4yC/0fA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="59412780"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="59412780"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 05:38:24 -0700
X-CSE-ConnectionGUID: xAT0Sxo5Qve+B5MDXwfJjQ==
X-CSE-MsgGUID: lvOn3swaRSmoDIsVQJF3KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; d="scan'208";a="169212285"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2025 05:38:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 05:38:24 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 6 Aug 2025 05:38:24 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 6 Aug 2025 05:38:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZTPRbIPi3iNnpWHoIqOalfGQeekMuNHpcboQ+Cpw2TCcUhOuhMJfJr/yWN4lnHP1nOHFB7cd55q1X7GoBx4ckbsvlycL5gVWLV4NiJvojSP5viPx0Q6ZiXzKt7F5nfXxuSfFElHYttG3dH42PLsYDSz1nVvg8xS+0fNtFBrV2Cy4H2k5xUQAxq3393WwNSJ+YwqFTi+5ruDCW/4FVHJEv2KVfowoKK13v+4listfwnOVTGd6AiPfiTuIK+0uGF5OArSd55Wx+upoAp+DHjzltkM1fpbMeK3C3ShnLwLnvtIeCMimwsH0CDzQD41YNlDim60H8ik1q08B/x3e0NGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Lv/klqdPYe8fU2O+e4HFuHG1aNWZaiyH5VNAOAyPvU=;
 b=Q+Rjf0grVgXzfYIRnMpxisBtZNQ0yvsql4K9vgr1z5wXSVbvvjCK0KmxJ6RqeOpjIoCDtu4qP4EXK6tQWAY2GhpkfDzTXT5KoBxcgDpD9PJ1DxR5ejKilixMzh2P1iS6/HEfzPjyzA2v0xzgkMUMwCzmnlSrpU+MCD4bxmTO1G/RUqeLqPICPVNQF2a02Ey0kcaoqx5PEF4DmxdQNXqsZ92P5S1Vqzg224dbvyQid6Hdn+K4ztkBBUZklujeBTxbLjveq1Spm1Ik9e4yRU4NtojJJ4T7HnBggIU4orcAN9fnE6m4/xjgVWpGVRYBBtsGJm0J5QUEMPVRD4imOGGF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MN0PR11MB5987.namprd11.prod.outlook.com (2603:10b6:208:372::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Wed, 6 Aug
 2025 12:38:20 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 12:38:20 +0000
Date: Wed, 6 Aug 2025 15:38:13 +0300
From: Imre Deak <imre.deak@intel.com>
To: Mark Brown <broonie@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, 
 James Jones <jajones@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>, Tomi Valkeinen
 <tomi.valkeinen@ideasonboard.com>
CC: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "Lyude
 Paul" <lyude@redhat.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 0/3] drm: Fix initializing format info in
 drm_framebuffer
Message-ID: <aJNMtTlbaYywUY0B@ideak-desk>
References: <20250805175752.690504-1-imre.deak@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250805175752.690504-1-imre.deak@intel.com>
X-ClientProxiedBy: DB8PR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::29) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MN0PR11MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: efaa1829-a503-494d-19c4-08ddd4e61fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6luoKOxBiNjA4Tg7Rp+ghD7iwlR4q8SomFIeFP7OvdoQOS/HI8kge9lbbT?=
 =?iso-8859-1?Q?8UOFLno7ayLSmNKrY6BFyOKR0OAU4roc7P2pPM7ybA9VzdEWABn6aEhdZU?=
 =?iso-8859-1?Q?V+HJe79P6Nux8EEc9zjKHhPvoAOvGQ3kE595emHlbK/qLnPFL0o094Vq5P?=
 =?iso-8859-1?Q?BNG0RH/6901ouk8gmIFff/zdT6ha0a29+egdFLw4NoE35BYlYjyoXvyNID?=
 =?iso-8859-1?Q?6vUMvYFCNtUF/sVGgineTXzYaL1rpyGJsJ+8J7gN7Nm6bydR1k0cq7Wte0?=
 =?iso-8859-1?Q?lB7GO9Ly06l5CvSPrH3Op16klDIJOi1lYL+Faa5JPTZQFwTJkwuH7Dkq40?=
 =?iso-8859-1?Q?dpxVHUCCYlt0w7nObdDYzl2WQQfjyOnt8G1cCeQC0H7JEdQ8AjPirGgF+U?=
 =?iso-8859-1?Q?UmC11oua+krFKzXi1LCEVxfnOqlKziTeQ0vYw6CdeMLjDLeCXLkDsdaIw3?=
 =?iso-8859-1?Q?Sfzv+nKqRhEJzAjduUu2FXh32hwVaVRUzLX2s2sCcX819w4OxQBes1vINl?=
 =?iso-8859-1?Q?JWYgcpnLTPXqPXOL2UdPOpFp7WL8OECeqp8izQRqm5s6W7iR6CJxVnhOuS?=
 =?iso-8859-1?Q?uxn6h7NBwKgHzbSBEkpLgMKT1GmQehkAG3N6zuvXyEihI6ECz18u6NMl0e?=
 =?iso-8859-1?Q?ObjbsKEMnceWJ8k/HZUZJ9y94Qjts7QDXSAK86u2ZTJBLyIB8QVgiw9nw3?=
 =?iso-8859-1?Q?SD7uaDiTBXl3rjCnyREfAk/N469Lg6+7evw3Op9E9890Mkd/wF39IxYnUT?=
 =?iso-8859-1?Q?9ktiWQtrsQemwMKnoG9PsO3CBa6Cod+HWS2onMc7LmUZsg7ILnNlRqwlr4?=
 =?iso-8859-1?Q?X8MiDqNlYzscBo/aVr+MZjvact26e9k1xdujM00TGMESAqsVeKRaUmNXjx?=
 =?iso-8859-1?Q?qFNdkQNpF07e8zH7pHIkmHR8l1Y/qt081lopotDA2yvAPGQbgDOfs372Sr?=
 =?iso-8859-1?Q?mmF5YreIwa2ahBDsmLS0wBKwpOMlKEGgjWrWmEc1yYPyP4hw/rJBWstLwT?=
 =?iso-8859-1?Q?TVTccXToTejJ5896e2M+0gCJ+djASsDjRb7/73pJtcMLFaKY2tHJTfJSOj?=
 =?iso-8859-1?Q?fWgtpmNUdZ+Dz/wZNbFp5qrx+/2o3hQzYY3ACjBr6dGP18LcUUEPpZaSRP?=
 =?iso-8859-1?Q?COxqRadUSFstabz3DPdxz4ak+ysPG0ZxkMrZV0TXbnU2JxTeTtDkuzV2T8?=
 =?iso-8859-1?Q?vpQv7SNAZbOJhXLObDvWaR3DM4kGskaRSVQ7TQt/eJZGz144VcYSZcfe7M?=
 =?iso-8859-1?Q?Mb2sEsQUMOCxxHk5zVKWnrhFYqU8Ax+pFzrilc6j+SxHh4a3p+kuiLRLVt?=
 =?iso-8859-1?Q?d1DbGqwBVjQGylgR6e2plOpO0ZCbMPhsrc1ePXjhf0ThEoYoLOkI1beJNX?=
 =?iso-8859-1?Q?6yxUC7JmleAclNdeFc9EaLP/8ekLBuvVzSTOlCwsMi+75gqFhaUqKITSIm?=
 =?iso-8859-1?Q?HaQLsB06HuXrKOWFxrHk3psiW86hmSiQHsVl8ExR1G/czt98QknYe+2SV3?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5rfVBEpc1Y4tmbc7xc21kAseRz19zKXa4GfKB8lRP9Tn4tmqy8pIItqgRj?=
 =?iso-8859-1?Q?monHofu8g4oXcitzBz6H00dHfXrj/MuScnsYux+E2TcwMK/zNbjHnggMfO?=
 =?iso-8859-1?Q?TMniZO+uY/AoU7KU/6QaHn30LFopC6YXFR8IhK1i4LfsMsoY85FCuwn4tc?=
 =?iso-8859-1?Q?eA3B0ncC+G4GLTHYYgAROYk6fwaVBWgsIKdRlkCmTJWeU9ynMmshSU6z+G?=
 =?iso-8859-1?Q?RxeCNtmyuNzx5/GTYUD2SRgBTfyY/XzOKvwRyr8sHYMePPRd80jouG0HXf?=
 =?iso-8859-1?Q?W8nNhpXm/PXda3xvCaCN3jrszXaNmGxfHodFUe7GdEMN28yZIjimQwiIaJ?=
 =?iso-8859-1?Q?qP6MXg+Ovm4tVNZ2wwn9jAWEAjuW+e+dVsSFeEG7GW4ldRiw3zISOuH4ug?=
 =?iso-8859-1?Q?bTB66c6a8f2bKWpCjtN3+tS1zb+uzb0/G0hV9o2JxjJgrvfSoz7+UZIks/?=
 =?iso-8859-1?Q?rCZjQf9BXvdn+UAotjeLAlrEHoVs6n+Zfq01y9jO6/No1O4Z1UBDil5MYa?=
 =?iso-8859-1?Q?kAJOmMnLAQUNq/DDkLwOJ7rZuxBxREMA7Umne2jvz6Fwaa3sni2AR7aADw?=
 =?iso-8859-1?Q?wlQ9vsfm75ITrq8wRJeIblywBoDGPb0rV8ezZgiFg4416kcugaauuapCzq?=
 =?iso-8859-1?Q?uea9h1qnIqtTtkPJ+I4abp1eqzYSoqmcL7SaUfxWzzizblEiTibvcrH6ow?=
 =?iso-8859-1?Q?h5ri5ZFhtUY3cMFwp7wDR8MV+gK0PRCI4ZxGRgzqPYLfW+A4XWFKtnD2RG?=
 =?iso-8859-1?Q?dxRZr8mGSUKzwo+aQNPEd1bjYC3WxUUGdGhuBQeJruKby+kQVBo6ClrSLE?=
 =?iso-8859-1?Q?hfyBRzHEQlKl42EmNyZIEj2DLRaqbW7NrjaHjkdBGrctbHi6nrAKAUmsAK?=
 =?iso-8859-1?Q?QA0vu9ci4kxs8z1mxgcaU+DXKibDAyO3emPqiUgQ4ymk2Jhv1OFZmngU2n?=
 =?iso-8859-1?Q?eAf3kCnuIJf8uVm22L/cp4HJAmAUnnmw9rkUAehD9aqKJvX03Ocl0XmbEC?=
 =?iso-8859-1?Q?rVEBImY0Xo9rT7wHLQEXuQyXLW5OR6mfVZ+xSZ+0z0EDd7YuQJxf+mK2CS?=
 =?iso-8859-1?Q?+0OPxOkR9abmqY3+JkZkyNdnWkVCTdo2EcMu0bZlCyfwV/AHd9fOKR65Q1?=
 =?iso-8859-1?Q?JmJPX3EYJ4nzh83MASEORQ8gGHZup6YoPJW6zP9H6WJpuufd3IR4mcS7QG?=
 =?iso-8859-1?Q?x8k92Z7z+5qNdL0Eg1juwlAVs16vzX9yJfq//ATwJbCZHPPRxqcPi4tVy2?=
 =?iso-8859-1?Q?I9f5DCtyF4Ica8Nzy+jIGPg6u1Bl2Tc348UKPkxm33r5FupBcF67Dt06GD?=
 =?iso-8859-1?Q?j4FHRZXcoJlGFKw7DkZ093DxJ7DPL4acNd1bIaPvi5PaTyYEUmqBet4gnu?=
 =?iso-8859-1?Q?nW4zqtui1t6avNwWSD1bTHEcG1Qg2DMHhjYNOlpAevoxiXPUo8HS6zNvKm?=
 =?iso-8859-1?Q?Q9FAzX2EpSJSq5AhO5h5jZjeBGpRKS1x1Vo98H6XU2I722yvNElc6qqHGz?=
 =?iso-8859-1?Q?y+bEhZoAs386tILnYevvZ+vtKIJsKuiZUPsh9bEfRgENopfkQRaLNzCfDm?=
 =?iso-8859-1?Q?gDd60Sie2J53sXkXGjAOSZI2DfGtdSXFjDCWzArhhOdAlu55Bzf7a0TElr?=
 =?iso-8859-1?Q?7d3THtQuG58CDUOGSKu9gouqQnO5GEtsn28GSkec+CaEYuXRgpyv9wDglw?=
 =?iso-8859-1?Q?CJYm3Dh0oexQH/fkJjpZd2lmWeVzeavpiAywDgNb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: efaa1829-a503-494d-19c4-08ddd4e61fc2
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:38:20.5111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxV+hLS63zwNT4TSSMbLi3SMCGTQnqoxfj/+bg279kZikPdB99NS4g26s3Sf0HXBlPxAwSa/eSXuH0dl5/mxhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5987
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
Reply-To: imre.deak@intel.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 05, 2025 at 08:57:49PM +0300, Imre Deak wrote:
> This is v2 of [1], describing in the patch logs the functional issue the
> patchset fixes based on Tomi's feedback and adding the T-b/A-b/R-b
> tags.
> 
> I would like this patchset to be included in the v6.17-rc1 release, if
> this is still possible. One way is to merge it to drm-misc-next-fixes,
> if there won't be pull request from that branch any more, could the
> maintainers suggest a better way?

Ok, not sure if there will be a v6.17-rc1 PR from drm-misc-next-fixes,
but merging the patchset there makes sense to me in any case, so did
that now.

Thanks for the report, testing, acks and reviews.

> Thanks,
> Imre
> 
> [1] https://lore.kernel.org/all/20250728101603.243788-1-imre.deak@intel.com
> 
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: James Jones <jajones@nvidia.com>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> 
> Imre Deak (3):
>   drm/omap: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/nouveau: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
>   drm/radeon: Pass along the format info from .fb_create() to
>     drm_helper_mode_fill_fb_struct()
> 
>  drivers/gpu/drm/nouveau/nouveau_display.c |  9 +++------
>  drivers/gpu/drm/nouveau/nouveau_display.h |  3 +++
>  drivers/gpu/drm/omapdrm/omap_fb.c         | 23 ++++++++++-------------
>  drivers/gpu/drm/omapdrm/omap_fb.h         |  2 ++
>  drivers/gpu/drm/omapdrm/omap_fbdev.c      |  5 ++++-
>  drivers/gpu/drm/radeon/radeon_display.c   |  5 +++--
>  drivers/gpu/drm/radeon/radeon_fbdev.c     | 11 ++++++-----
>  drivers/gpu/drm/radeon/radeon_mode.h      |  2 ++
>  8 files changed, 33 insertions(+), 27 deletions(-)
> 
> -- 
> 2.49.1
> 
