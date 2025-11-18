Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5240C66B47
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 01:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BD4F10E405;
	Tue, 18 Nov 2025 00:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KyXCQT+Z";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010055.outbound.protection.outlook.com [52.101.61.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0DBC10E405
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 00:50:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KswDjSbux4XHtlYuTQ99OjMpJFFN351I9/2kISZ54KiQOzIeti1a4UQs7EfIsH6orDmblYOYMuH8X4lcx2AOBHpG/Lc4q3FWIMSS6wbe3Whu8t5HbTrOUEP2i05u7TIylYrQdCS7ZQQL5P4gT97rpEUlaypsJVThwL2dijl5ubNKVa2O29SIJ+ju3BhPHTNnZQDdviOkgmxuXzBjWSaMjSLJxMv+mMFFUVEwQQ0+PfnyAhwuh9se0kH0NsYC56rpXJHthkd3oFygTm1JQaVFSOeOJXDWPRqV+TY5eHuBDNepCZ/m+9HKbunqoflRvPbYPZ0k+2LgupWoai6LRP6oRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrZm/fmgnhfUTsuB0EcIbUBa6qDdH5toZ/sDOsrsPSI=;
 b=n9oY+x7VEmo3suktBHa+TYt6HVWSr3jIG1XDGz+qu3YvvzQlKBAyg+3SVrVVw4VEWe34OvwPG6Wwi5hPew1oEDlR8QYiwbo7hY6SoD0jjPtvEPO9Wn16RYb64tivyFRha34w8Zt39ttmV2McDOvDhSxWJbpZWZrTF4NXfue9ABAH/DfPAzc7mS25avgza+zuMAhmKUL8Exsx6uOPzKlwXk4thiGuDmf85qzY+diYfqFAfhLd2hH7wU3eKjNyrnOfOPAffcxtyzieMRi2s0RvrvCjAP3r1UrtnVkKJrrJTTIMeG67NHq736OagxffUgZg9kKIt+xSdZH5p7VL9Z8HfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrZm/fmgnhfUTsuB0EcIbUBa6qDdH5toZ/sDOsrsPSI=;
 b=KyXCQT+ZrDX+rrRf/TFhnbdhFFgnoSWtcu6IHm5wd30ug5G9g2gvhIgNsBZ5JWkNVx5fqdDAg7qhnB9sZpBSS6e0J1iy5R5HEslHXjzUlwQH0XGXYCy/TJyGiuRIIx0Ok+UP3sJ8ehCFeWSD2pFId00ZKBAbkQ+1E1e6onDqlQYYVuQwqGXCM1D09QprUOz3x3pR7uluDr7qUsxI2Ctn3gLFYkocLa4Z4GL2+ilaoE9b3aJlfxUBy3cjAWIY7YSDB1sxf6kudM2I1nAoEqaDLQcxxG9YdA9OTI+cMmoxFvh6y5gVpL5cQItwuFiUJu2J6a3hEIsStoDpa+VRkF7YkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8066.namprd12.prod.outlook.com (2603:10b6:930:70::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 00:50:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 00:50:37 +0000
Date: Mon, 17 Nov 2025 19:50:35 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 08/11] gpu: nova-core: Add basic Turing HAL
Message-ID: <20251118005035.GA1118706@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-9-ttabi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114233045.2512853-9-ttabi@nvidia.com>
X-ClientProxiedBy: MN2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:208:23b::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 391e6c6b-07fb-486f-b9ce-08de263c7d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yH2flIu3WqUVYzFzxRZ4gbcGPw9RSJ1Ixvphn9j3883duitR/kvbRkU5Ei2f?=
 =?us-ascii?Q?IPHeOmXrgVC0cTQy/qH7f4i0I1TZPS/liwUzYvhnHC9rNY4zePwM0+8A03IV?=
 =?us-ascii?Q?X9mGVYPLdcm2+bHFwfhFcMDLbqqtDxUICcViAmVsU7hH0zpxaVFX8yJxuFoX?=
 =?us-ascii?Q?fUgyzBPvr56BpziOKwpWmkNNfmKu9BH0+YaR4eR/GxN/brhZhieFY/Q6ojZ/?=
 =?us-ascii?Q?GstUB48WWw6lp0pZMFv/W7sjYZLmqfxtQ8lJZgDRTb/h8UGTmkKRKOX3a3r1?=
 =?us-ascii?Q?vzI5WpZFZAl07G66V+/oyDvFpzalIm2uoERw7WKQaZURgj3ADKGCOMo2o7Sk?=
 =?us-ascii?Q?D9N6H4/jQuXjvKX8x84yRj5R+2/SyZMrU+g/zJcQlqO6ENV7vB6jyREUgbNJ?=
 =?us-ascii?Q?7M+LA59Py5Kt2GTZWUjPPzn6LYXP3qbXyKh78dEQ6iB0SKVvbjQfMgnAv1bs?=
 =?us-ascii?Q?DLyZLa+3rwVHVPpmDSsIKhtG27lZHGmMG7n+sgl0SvIZW0tfBYeVQWtmb21a?=
 =?us-ascii?Q?L6fklv4cKOaToJpR46W+g4dgwLRwFx2OO9qG3IWgI1GUZE4Nurkk6gVPrPVq?=
 =?us-ascii?Q?DRor5j0zrSPUX6125nNnZXlwy2pKSZfYhNGu3NVHPjhPQ9rAApHNG4UvYvsN?=
 =?us-ascii?Q?alQoZFCDbKUoeBJMc0Z3FtMq72J5K877gGnmqVW/nH3/YitvJi57a5QCwDW/?=
 =?us-ascii?Q?BuYifHkHo3KVWH3xsHkmxepfdFlpCT1KN2du9A+55E2DOJTb20gtFhD4KKRu?=
 =?us-ascii?Q?9n2vU7VaJ/tLJxtB6L5Rl4IjaehALjhSfOdhbLLL19rxNhuibs4Np/EmNNKU?=
 =?us-ascii?Q?+iLcSS+7Cv3neYx+ZbBWzFC9SHFFC5EtcCt4Waj75yOfEvssGodcmdjKIRa4?=
 =?us-ascii?Q?yR83eQwhbMqMPxVBsS34FsYMFy+7Ah388BrTYnCyz3oYq7Fjad1EiQFgr+YN?=
 =?us-ascii?Q?TFJwMSLVMhdtR8j/VyySrB0sEum1rHtO2podra8P2b0BUBdYy0sRpzd9hiJV?=
 =?us-ascii?Q?ZNkLEVpYb7wrUlyHRx+/bYNdST1HmbDAvqZOmdPCZ5Jna4Bj324kTOCkw3g6?=
 =?us-ascii?Q?mDxBso+6A2nsuRhiUt1OlRWJCqbYOdy8Qnr4x4lDq0JQFyvLn7lESL1Oe9M0?=
 =?us-ascii?Q?0WU2qMT13HpAs3SQdD650jRgCSNO+4zF+DOUx+iDTe2jTkajwm3ywA91MqVa?=
 =?us-ascii?Q?0+snm2Tult+YLt2kBWroSaMVocllkUHPURFqfoFf+Ob83V8Jhif3RPVqlfyQ?=
 =?us-ascii?Q?D47o2UWo9bDtfQcg3NE3npLms0UHQALpH0qvRV8WlPXy11nfTtyxCUZlMiB3?=
 =?us-ascii?Q?EPT0b4oGjpGAKvSmWRowt9sWk6oPxhYBfRgmYWV+S/g3m9kJV4OebTVdkTOg?=
 =?us-ascii?Q?0gD41z6kyXtEhXj6iLPHbdWxSxRyBMrOWN5pe8rpZiY1wAsEuOGTE4PcJhZC?=
 =?us-ascii?Q?k1gN73LFvku6tEBkj/9tmrDbUtFTaOhgEulebQuuWrO3ae/2xT0Fug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L4gYWsUkadjRe+D+5d7W0xvAuImZ86mgZ2RhgRkqPUk1uMe8JBdZ47f8jbuK?=
 =?us-ascii?Q?X+j5K+ejYC9WxrUXmTN7oH8F7fRyQu5mmscl5Xc3p6j1pzcjR107ZZ3FoLEb?=
 =?us-ascii?Q?mxDnGL3yrKhTpKFtq2hwikLI4nHFBum5lRrXfmJal6qOvFVuMm+9jhg/Strx?=
 =?us-ascii?Q?jPzHWZtG+/QN29WJjmVH8wYiAP9XZtRraRlhy9jivRv5EPH7vvh+rXlCVT0U?=
 =?us-ascii?Q?qeJkgipoN02lO0C/xPugLgOuKMGA+cw/Va65hkzz0viT4FX0gsrRka4ZdzU3?=
 =?us-ascii?Q?TRg4BfuiqWLWRr1ucRX6XdUERlk8iLL2qhk5tQfxfoydubENxBibqDqi+XNW?=
 =?us-ascii?Q?+fnj9Fi6xNGLaxzNW3X2u1xdx/yfPvFdJXZ4B2vKeXNg5fyf3YEocJMYfRKj?=
 =?us-ascii?Q?6i/h6khSOyJm9cZVtTj8aRPkdRG/ULHrydLAuw2/OWJIUEYYXLb57Zxi1Owa?=
 =?us-ascii?Q?rGIxdz+ScGyVjNzBCdnAWrScgVSuB5UJdshqkEC3aO44++RzIFniKle2/mgQ?=
 =?us-ascii?Q?vmmTgL/WMTnZhY/jSbEoI3aFpmTPKa0VEadwy2FH41GfUvCTV1nJyETbgm8k?=
 =?us-ascii?Q?6ZByNAQ8hYA/GysGpoQhlc5Z/DvwBSJEoiGQxjPrThQwIVc8CvWrY4cg1CV+?=
 =?us-ascii?Q?GetHzA18fO/dMgcny3Qm3m1VEW4pd4u4WWy/XxsicTNWhh6s0ITWLsou+gvG?=
 =?us-ascii?Q?+wLSAvBaRhj7jnhZL19h/Db/xIUCgG2Yhm0OJ4w7hCEWNqlAtEO7VFSSX70t?=
 =?us-ascii?Q?qkF/nUky9dyvzc/Q/9jD6x/GspLI0dfW1XVuIfuXpElBsO5oltehC3CHVwmO?=
 =?us-ascii?Q?B0sHHIT+T++Uyb8Q9KL8aSONFxtIgTvQ/1h0uSwXAQS0+Yz26NU+C4L19qRP?=
 =?us-ascii?Q?PpG1JqMX25xb4VFONCObfelbIcP8jCu/+AipInCI1hswpRSmQtNLG7kVumPx?=
 =?us-ascii?Q?P5X5roUXu9pVEEDh35CHOi/queDviguRd8PAEtd95QaBAk28bU8sgUluGQ1w?=
 =?us-ascii?Q?d8VJZO7cnE/PkrTTrPN8SSyipsn1CO1tWcY812HhOliYEQ/0q9dlrtEJmtrW?=
 =?us-ascii?Q?ToZXgXIc5qFhmJUAAhEzudww9ECDI+7Towx5lAuwjCtUnxc79fD+6+8JPkmU?=
 =?us-ascii?Q?5zkIDWCpQRtaNhhOSuEBI/MLmEiLHbiNwRWfEMQEKGxL0oJuv6pUVYHQ6mTs?=
 =?us-ascii?Q?x7gQOO1xDS6fAV8wV6YJTNj4jGhktvTi1/pRfmVzeIPh3AgJdOBMfwEirGEW?=
 =?us-ascii?Q?rwQWrP+a/j2Mzrtnb6nE6tpEyDxxJljU/U08rU3hnjlpFL915g2Dp0dxdhZt?=
 =?us-ascii?Q?EQQ5Yhe6ig94yaVkh4u2b23BBNq/ZrxY5N6y7BMmq3pah0CKRZZZmHOnDafL?=
 =?us-ascii?Q?usbnVcunLmjOBfHxMEO5B9yDeKLGv/tPWXVBM0p0Sg2mFlFpzHbCCrq2LTMl?=
 =?us-ascii?Q?x6Sfvb2CdO24QW0XZqaL3/qdiW7Az40bflHYf3nXa1Zcq3NcuHFH0hcuD4OJ?=
 =?us-ascii?Q?uKW1F07oEklOA50KHtufrAZCKYu/SGK5E/8ovj1gGpN6SHc+pYzWe5F56Z0q?=
 =?us-ascii?Q?I1lSGpJLYkdjiANwORpXtkkZLN+agPOUWfAPrccp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391e6c6b-07fb-486f-b9ce-08de263c7d2d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 00:50:37.4300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3yJoNV/e+z3mpIhGD4o1FPrhIVG7PvGKtPiwPVBEopYaWFFYxm/wabZ/C75SRbDQQRikd13FKcZ1Eg8PDeIAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8066
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

On Fri, Nov 14, 2025 at 05:30:41PM -0600, Timur Tabi wrote:
> Add the basic HAL for recognizing Turing GPUs.  This isn't enough
> to support booting GSP-RM on Turing, but it's a start.
> 
> Note that GA100, which boots using the same method as Turing, is not
> supported yet.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/hal.rs       |  6 +-
>  drivers/gpu/nova-core/falcon/hal/tu102.rs | 73 +++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs
> 
> diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
> index c77a1568ea96..7a6610e9d0a8 100644
> --- a/drivers/gpu/nova-core/falcon/hal.rs
> +++ b/drivers/gpu/nova-core/falcon/hal.rs
> @@ -13,6 +13,7 @@
>  };
>  
>  mod ga102;
> +mod tu102;
>  
>  /// Hardware Abstraction Layer for Falcon cores.
>  ///
> @@ -60,9 +61,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
>      use Chipset::*;
>  
>      let hal = match chipset {
> +        TU102 | TU104 | TU106 | TU116 | TU117 => {
> +            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
> +        },
>          GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
>              KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
> -        }
> +        },
>          _ => return Err(ENOTSUPP),
>      };
>  
> diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> new file mode 100644
> index 000000000000..edb8447d7263
> --- /dev/null
> +++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::marker::PhantomData;
> +
> +use kernel::io::poll::read_poll_timeout;
> +use kernel::prelude::*;
> +use kernel::time::Delta;
> +
> +use crate::driver::Bar0;
> +use crate::falcon::{
> +    Falcon, FalconBromParams, FalconEngine
> +};
> +use crate::regs;
> +
> +use super::FalconHal;
> +
> +pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
> +
> +impl<E: FalconEngine> Tu102<E> {
> +    pub(super) fn new() -> Self {
> +        Self(PhantomData)
> +    }
> +}
> +
> +impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
> +    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
> +        Ok(())
> +    }
> +
> +    fn signature_reg_fuse_version(
> +        &self,
> +        _falcon: &Falcon<E>,
> +        _bar: &Bar0,
> +        _engine_id_mask: u16,
> +        _ucode_id: u8,
> +    ) -> Result<u32> {
> +        Ok(0)
> +    }
> +
> +    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
> +        Ok(())
> +    }
> +
> +    fn is_riscv_active(&self, bar: &Bar0) -> bool {
> +        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
> +        cpuctl.active_stat()
> +    }
> +
> +    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
> +        read_poll_timeout(
> +            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
> +            |r| r.mem_scrubbing_done(),
> +            Delta::ZERO,
> +            Delta::from_millis(10),
> +        )
> +        .map(|_| ())
> +    }
> +
> +    fn reset_eng(&self, bar: &Bar0) -> Result {
> +        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
> +
> +        // TODO[DLAY]: replace with udelay() or equivalent once available.
> +        // TIMEOUT: falcon engine should not take more than 10us to reset.
> +        let _: Result =
> +            read_poll_timeout(|| Ok(()), |_| false, Delta::ZERO, Delta::from_micros(10));

You need to run with CLIPPY=1. I am getting several clippy errors with the patchset:

error: matching over `()` is more explicit
  --> drivers/gpu/nova-core/falcon/hal/tu102.rs:63:43
   |
63 |             read_poll_timeout(|| Ok(()), |_| false, Delta::ZERO, Delta::from_micros(10));
   |                                           ^ help: use `()` instead of `_`: `()`
   |
   = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#ignored_unit_patterns
   = note: `-D clippy::ignored-unit-patterns` implied by `-D warnings`
   = help: to override `-D warnings` add `#[allow(clippy::ignored_unit_patterns)]`

thanks,

 - Joel

