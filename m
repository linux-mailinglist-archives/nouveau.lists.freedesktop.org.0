Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98766CAADF3
	for <lists+nouveau@lfdr.de>; Sat, 06 Dec 2025 22:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD4D210E306;
	Sat,  6 Dec 2025 21:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="onEHySvc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013028.outbound.protection.outlook.com
 [40.107.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E0010E2C2
 for <nouveau@lists.freedesktop.org>; Sat,  6 Dec 2025 21:36:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzUOu+p1MEHP7EISdkzgf0mCTctMeGPKIZJMTEKHfbTJwgVFHMukjnVhI4VTG7ejSrcYvOXmJCSMJRpnKfH3qwRVyDr/KsGfQtTJ9fGHDTg1sr4Z39n0BKwFQgmvTY5t3BGGIv+eU3L1bQxzAhFHXCo6egSdvH8jeaKM/kkDHs8Voit/8PAzr2a7CVLt5BPz1PeHF65em/6ENe9Ihxba+6/nxVcr6lEvxZmGGbKTJyh9Dyi0zCYCG0jpOwg2ifUeEBmBC9ChnUaqP0+Amarg6eKdn4Ho7ooBJ7yag6qEuy1JYeB5DqvyzKQbhsra01cll89BP18qWxomD5fcNZPd6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpUn3YCpzxaEe5WTDI5bdNs3wpplPJDEJZFSwJHCS6M=;
 b=ibwd2JpLkRxSRxl7q6sRJ80HxTk2HPnv1BsLRCCWrqniJDXvgpuchvzBCgB+USBl+O7kXvYchNjL09FACiAEIvgHHZN+hN554noT1AAkJN4NDbBv1WloXKHy3lgJ7mGErmGalUcho88TQpdG8pOgnoBKG6yZDqcUq1G1h/gKuPG15Mf4sZ4UGcxCaBLmjwjeeli+Su3mR58REwmyILFJbS5CYBhRqTxBypMgiAP/LGdJGUuk6GVX/ciePXc/KaKP7wP9pesteqlB34VfydUc8NHLCsT2XZ7WWX0xnLPGdUfFM6QVDsnDK6fnVV+ExA3qQNlDx2woj0u3wBOfiC8wAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpUn3YCpzxaEe5WTDI5bdNs3wpplPJDEJZFSwJHCS6M=;
 b=onEHySvcRdX3MktmlMe1hbUCBF1ELmueSHe99zRWpKbBJKyYkWkNc+w8+k27h090YeBchMkSJirfIlsO4zg32Q753qyw+yZX7R3gIqWi8wMGI2bqK84BNMz89t3UmqB4Ful/IzSREZ0S476Zo8QnS4iBylx86+QZuO4QJUnr5F4rRApjXQAFxSMquH1JiIgSKdgphEj+rQNAssFBhfRMdvT5b0z4dwy/84J1ofjLatlCHjRaeBc8tCIhyv5BFUdgWm3jHdHltYCHzWSIy3WX1whg7aGkOjLdij1YBjt1P6/KjNggpBXK4wyOYTN0U9WVFCO1eiKhrRZV0WkuFi8l0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by DM4PR12MB8451.namprd12.prod.outlook.com (2603:10b6:8:182::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.13; Sat, 6 Dec
 2025 21:36:16 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 21:36:16 +0000
Date: Sat, 6 Dec 2025 16:36:14 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 23/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
Message-ID: <20251206213614.GA177930@joelbox2>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-24-jhubbard@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203055923.1247681-24-jhubbard@nvidia.com>
X-ClientProxiedBy: BL0PR1501CA0005.namprd15.prod.outlook.com
 (2603:10b6:207:17::18) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|DM4PR12MB8451:EE_
X-MS-Office365-Filtering-Correlation-Id: 660f77e5-f7c5-4f52-0047-08de350f7c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eMlKOFKl+9SAq1KzBZ15PS/sCGXibT/5/BS0dS/E63Cu4gyVX2rO4TehcMwU?=
 =?us-ascii?Q?iZ1XolOt3HWsc7pdQymEBkc3VcB0sLEtC6/vPlnZVaTXrj3L92UDiUYoxtTH?=
 =?us-ascii?Q?BKJ6RsEtGi/9lgxWaBTSPEmSeRWv2aHWd+1c5slpbLWcO//pB08//4Q9AL7i?=
 =?us-ascii?Q?MKAsNjG9GBtaz381t4yzoQNEKs1xCEkYDO8cE5MiSORYVsQ5WFr/o0ScnsF4?=
 =?us-ascii?Q?YkLBcLmbDgBq/NvdEtzH+zZjeUN1n2m9kI6C5nsRQOgjzAlzD2wrkjf1uOyO?=
 =?us-ascii?Q?vMCGP91t3gk1lDHa0RBynwaNmeibHJxhD3snOgg9+zkix0RAjVwFldVM1Fu4?=
 =?us-ascii?Q?b3POz8RONACZci1l6bhKntLpkGAJWYprtEXv162z5xDx7zp6if8WzJhxGmbI?=
 =?us-ascii?Q?k7jwpflV00YpknYEYcwf76KCXHsIvNqNK4iLcw9TXcOwAsNEofIdDDHDNvEH?=
 =?us-ascii?Q?bJ1pVDSeBIxW5YJ87peIBrEq1b90/GhXeYAiAw5qdsNHfZ5Pg3Iyi5dPydk/?=
 =?us-ascii?Q?664BKLFsfYrPNGPSdESCh9x/Hj4xCCArkBIAYi7xEWHQNzP8N4kf6SK0S6eH?=
 =?us-ascii?Q?GxYUIz2mTxVX8+qDKbqv8cgFcifCLCWSFsQsX2jnh6cp+MB3Nxh5EyGMPzeJ?=
 =?us-ascii?Q?srDdT0u4hmiD1xucgLaS0pg4FvLjvV4ockBjmxhzzs8YsylHxqlFLfxTPr2C?=
 =?us-ascii?Q?+V43Jd/AErxLw52hjGSHLR0+zouZG3dTEKg5X/YulI9gTn/3JMBKTJkjlVmT?=
 =?us-ascii?Q?A7oHWeU1/2Ks1tVYBHMAh7mVouVPG9WC7OKVvUSFFSh2inPWNrmM69SN0c5D?=
 =?us-ascii?Q?k+ry5Wcp6RhVYGiuXdzrDuplgg30OJGDEkZj/F4Tkzt9ELLqXHMln5ls0Ms8?=
 =?us-ascii?Q?6PcAFaArgOeUCOTijmgiyrbXvLwD8omu9xtRLQIo3Xrp3+Z/NLre0Cbrbczl?=
 =?us-ascii?Q?P29f1o1GflNsUa8ASyiCUnMuMp+batqHNywElwa4rqeThJ81aqLgc0MeIiH3?=
 =?us-ascii?Q?QTvPcZ40NYE46q9m849r/riDP8//rmlR3c7TzpTQkIg83i8pKm4kNCu4E52C?=
 =?us-ascii?Q?tV2FOK0S6OkyMEh4U/O6EebwTC6LMaKraJJuy8m7uOl0195rcaKvHMYIBf5G?=
 =?us-ascii?Q?jSe4kSUwqBW5VHNwTPnvQHPrMHUDkBrXoN+loO4fPgIv5Kh3T+KdFNVZufx0?=
 =?us-ascii?Q?hpOGwGKlebswRqr/2BV29W8jWgxtbBvgxXssDQ5VvnCwWqEEXgoqvuEzTgKa?=
 =?us-ascii?Q?3/wlTtmYwGX8hTCz7HV1s+EncQ+08vWboW1jdW7r/mCMTJOC+y5yrPrj5Jp3?=
 =?us-ascii?Q?aIp6G0k6T3buAUfd2Ch69w7VVpD+Ge9FPWvwGjTCVAuDqJW4jrLZbL9FGd+d?=
 =?us-ascii?Q?yVWqgWFthiNcOHoTT6LVPDFPt4YdEXhQvpT90zqLJ9ORUVKR7oeWK4nWoglX?=
 =?us-ascii?Q?1lbNJ1LiiqNIUzB2dVkEyU/fXniFkahg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGXxLIGPjtIkucAxOm82MmRHl8yhxGqGfLw6JNRn3+e4S4J24cUz/DIlSR2k?=
 =?us-ascii?Q?09szjsorXT5v8xgeEgMJa9V1FW0MNJm0eeujmzBHJpBH6CZShu1mGrAlO22s?=
 =?us-ascii?Q?s5tgPBivYOjuZ5yz8MEQ7OlUr8sNosHkq1Vv3uFOTvKw0BaLmDGQAkk04OMq?=
 =?us-ascii?Q?qCxBGSqszo3P//VoD4ai+CZ87v4xGkF0i4MmlqjIfsY7YdBDmFVINYZEcnfD?=
 =?us-ascii?Q?sqYh8r25qNQkq+w9uNVUSRL5RdPRdfdhsMQaciIkqpPf5HoJBbsP0oEumud4?=
 =?us-ascii?Q?A3mXTDGDrTVlt9RMMQYHqWZTJuP8J+fTR4LSgPaECUDgOJLvfAjEpusMmvQB?=
 =?us-ascii?Q?/LbnPNowSyB6x+Ca3gR4beefDpF1hCJL/9Tigj2G3SPh12rggiojy1e1FIhA?=
 =?us-ascii?Q?xFwO92KxaIGK5jn68Loo7bNvnTcbBQiAduQy90dcNCUQwH0xpB68rBNVVCCK?=
 =?us-ascii?Q?EBvT95B9tqUo2o1QKTCUZ9L61yN9OZs/S2eREwYD8xIQBiSZqBLAk6Bd3K/f?=
 =?us-ascii?Q?ohz+Knn6WzFM+syCgkDp5KQQ7qo4xMmAiB4U2ZPf1u3C/J8Q4Lxnu7B06nPr?=
 =?us-ascii?Q?fwySM1jXDiCmEcJcsMCk4T7faF1fa2RuOqci3JPQjBCslBN6glA4ItgyJkJm?=
 =?us-ascii?Q?+kgswlLlAjAzcjryI3iE/K3Vr7MV/P4KrChvsz+4f2KdUchSj++9aMe5GEgv?=
 =?us-ascii?Q?MBSOYRdhJR76m0cKa0ebI0hrxnxetHjWr0He5b+6/uUQ0F8DZKec9dUc4EPG?=
 =?us-ascii?Q?k0yav5KiDWvCT6nLMlQjwkCH4AHtkzJSZp5ti4W7tbBzHQ5+c3JieAugACEt?=
 =?us-ascii?Q?d6MipHNAlQB5l2VhKM41htSZ/bWKaZg+zBf8NetxjmuEyIQ7yuSvTmHt7KJJ?=
 =?us-ascii?Q?lZm398AhEQtsMq7T0KkyY1X1lND43Fe6vZxxria64s6M5Fq73fKeJrFv7Ts3?=
 =?us-ascii?Q?rdo1bBrn+ZEqTVIXO+vqkCC1YdstvLiCZr71AM3204bTkIth4or9NW7WA4Up?=
 =?us-ascii?Q?+ruhO7lnzkY83jj2OVSeYFDrr1vfgw26jiXHS+r3uLI0gx6IfnWSx3ooTFXQ?=
 =?us-ascii?Q?HtNbtqOmT5oKqKBfIttr5pru2HC/R4PJqRjqiiw/5poNJbi90zO+h1kL5BGr?=
 =?us-ascii?Q?eKPbJBDqRoSlUVV6b6kFOP5IdmJxOhjjs7UFSvGRqui/GB0enp4YviTAvmy8?=
 =?us-ascii?Q?qMx0WwBK8ara4UyFqKOXLup3BHMBySYtWhDlxhUJS0G2XPHmfND9UIDi3Tah?=
 =?us-ascii?Q?lFS8ymkTQTIhsUIe9BzeqCzLlHTGSFQegG6qrlGCTRQLr7zzNs1vXPnfd7Ki?=
 =?us-ascii?Q?SJVQLK4DOYpNvYVe+qCa1NNzxTgULnrvGR5kwdFfB8bqrtdiqXOnXl2MlELh?=
 =?us-ascii?Q?ckbcMxgNyBVDRIXNaEQiKvEMg+iQfest1pOe3bFniqtsJJbFa6yY/ODEZS5O?=
 =?us-ascii?Q?xybyHX41HrMFpjuB0Sw5KJaX5xa7XIDjnWbW2IH6LP1mqVxd8dFNUbY/oWka?=
 =?us-ascii?Q?txzIxL5aEF4lEXkp6abLcsGMHV8Kon9geePyokjMX3IpsDNWxxpumyksmMbF?=
 =?us-ascii?Q?1MG22VmYAq/UadIokMLpC7wa7Swa265dxOLB/paO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660f77e5-f7c5-4f52-0047-08de350f7c81
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 21:36:16.4252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHZKmtswCAACevEPnpwjXNkQesVj/97PRlVphWvdex2aBC/eGAwUQ3XRWpHyvPAU/p3ahOTA+hzc+4f/PKFMvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8451
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

On Tue, Dec 02, 2025 at 09:59:15PM -0800, John Hubbard wrote:
> Add the boot functions that construct FMC boot parameters and send the
> Chain of Trust message to FSP. This completes the FSP communication
> infrastructure needed to boot GSP firmware on Hopper/Blackwell GPUs.
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/fsp.rs | 156 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/gpu.rs |   1 -
>  2 files changed, 156 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index bb1e19c03c30..5840ab78e79f 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs
> @@ -13,6 +13,10 @@
>      device,
>      io::poll::read_poll_timeout,
>      prelude::*,
> +    ptr::{
> +        Alignable,
> +        Alignment, //
> +    },
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -22,6 +26,10 @@
>  
>  use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
>  
> +/// FSP Chain of Trust (COT) version for Blackwell.
> +/// GB202 uses version 2 (not 1 like GH100)
> +const FSP_COT_VERSION: u16 = 2;

the comment says that Hopper needs this to be version 1 so how does this
series boot on Hopper? maybe we need to add a new function to return a
different version number for Hopper versus Blackwell?

edit: I just noticed in the cover letter that you mentioned this is tested
only on Blackwell. I think perhaps we should drop the claim that the series
works on hopper in the patches / cover letter.

thanks,

 - Joel




> +
>  /// FSP message timeout in milliseconds.
>  const FSP_MSG_TIMEOUT_MS: i64 = 2000;
>  
> @@ -364,6 +372,154 @@ pub(crate) fn extract_fmc_signatures_static(
>          Ok(signatures)
>      }
>  
> +    /// Creates FMC boot parameters structure for FSP.
> +    ///
> +    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
> +    pub(crate) fn create_fmc_boot_params(
> +        dev: &device::Device<device::Bound>,
> +        wpr_meta_addr: u64,
> +        wpr_meta_size: u32,
> +        libos_addr: u64,
> +    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
> +        use kernel::dma::CoherentAllocation;
> +
> +        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
> +        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
> +
> +        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
> +            dev,
> +            1,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;
> +
> +        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
> +
> +        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
> +        // it obtains WPR info from other sources.
> +
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
> +
> +        // Configure RM parameters (libos location) using dma_write! macro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
> +
> +        dev_dbg!(
> +            dev,
> +            "FMC Boot Params (addr={:#x}):\n  target={}\n  desc_size={:#x}\n  \
> +             desc_offset={:#x}\n  rm_target={}\n  boot_args_offset={:#x} \
> +             (libos_addr passed in: {:#x})\n",
> +            fmc_boot_params.dma_handle(),
> +            GSP_DMA_TARGET_COHERENT_SYSTEM,
> +            wpr_meta_size,
> +            wpr_meta_addr,
> +            GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
> +            libos_addr,
> +            libos_addr
> +        );
> +
> +        Ok(fmc_boot_params)
> +    }
> +
> +    /// Boot GSP FMC with pre-extracted signatures.
> +    ///
> +    /// This version takes pre-extracted signatures and FMC image data.
> +    /// Used when signatures are extracted separately from the full ELF file.
> +    #[allow(clippy::too_many_arguments)]
> +    pub(crate) fn boot_gsp_fmc_with_signatures(
> +        dev: &device::Device<device::Bound>,
> +        bar: &crate::driver::Bar0,
> +        chipset: crate::gpu::Chipset,
> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
> +        total_reserved_size: u64,
> +        resume: bool,
> +        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
> +        signatures: &FmcSignatures,
> +    ) -> Result<()> {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
> +
> +        // Build FSP Chain of Trust message
> +        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
> +        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
> +        let frts_offset = if !resume {
> +            let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
> +                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
> +            } else {
> +                total_reserved_size
> +            };
> +
> +            // Add PMU reserved size
> +            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<0x200000>())
> +                .unwrap_or(frts_reserved_size)
> +        } else {
> +            0
> +        };
> +        let frts_size = if !resume { 0x100000 } else { 0 }; // 1MB FRTS size
> +
> +        // Build the FSP message
> +        let msg = KBox::new(
> +            FspMessage {
> +                mctp_header: (mctp::HEADER_SOM << 31)
> +                    | (mctp::HEADER_EOM << 30)
> +                    | (mctp::HEADER_SEID << 16)
> +                    | (mctp::HEADER_SEQ << 28),
> +
> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
> +                    | (mctp::VENDOR_ID_NV << 8)
> +                    | (mctp::NVDM_TYPE_COT << 24),
> +
> +                cot: NvdmPayloadCot {
> +                    version: FSP_COT_VERSION,
> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
> +                    gsp_fmc_sysmem_offset: fmc_addr,
> +                    frts_sysmem_offset: 0,
> +                    frts_sysmem_size: 0,
> +                    frts_vidmem_offset: frts_offset,
> +                    frts_vidmem_size: frts_size,
> +                    hash384: signatures.hash384,
> +                    public_key: signatures.public_key,
> +                    signature: signatures.signature,
> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        // Convert message to bytes for sending
> +        let msg_bytes = msg.as_bytes();
> +
> +        dev_dbg!(
> +            dev,
> +            "FSP COT Message:\n  size={} bytes\n  fmc_addr={:#x}\n  boot_params={:#x}\n  \
> +             frts_offset={:#x}\n  frts_size={:#x}\n",
> +            msg_bytes.len(),
> +            fmc_addr,
> +            fmc_boot_params_addr,
> +            frts_offset,
> +            frts_size
> +        );
> +
> +        // Send COT message to FSP and wait for response
> +        Self::send_sync_fsp(dev, bar, fsp_falcon, mctp::NVDM_TYPE_COT, msg_bytes)?;
> +
> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
> +        Ok(())
> +    }
> +
>      /// Send message to FSP and wait for response.
>      fn send_sync_fsp(
>          dev: &device::Device<device::Bound>,
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index c0473ef8ac47..8fdce488612a 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -124,7 +124,6 @@ pub(crate) const fn arch(&self) -> Architecture {
>          }
>      }
>  
> -    #[expect(dead_code)]
>      pub(crate) fn needs_large_reserved_mem(&self) -> bool {
>          matches!(self.arch(), Architecture::Hopper | Architecture::Blackwell)
>      }
> -- 
> 2.52.0
> 
