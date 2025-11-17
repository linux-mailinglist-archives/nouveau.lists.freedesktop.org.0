Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454A5C668EE
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 00:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141BB10E3FF;
	Mon, 17 Nov 2025 23:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="thveqDxo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5778310E3FF
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 23:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2OSCRCM2Agy1eSFw7gkvYCY5lrSQZ4k9JZ9ABVSpOx4k6esDZ6olBWYgJrRtOKfWcvmTg0e84/XdDeY4Zx1i7v6RXJWCJnfOcBLTdmqzY01Hk7jeThRVUVJLxWxazENKV/Ifeu/bhlw0mEOi/4unAp1rm6rX2+Rj0f3vVZaiB1GQn8nXKn6Jn6OqRdglQ8gsK4GRANYvBtPx2j8AnJ6IgVJ5jKEit2j38YWPX75v0MedjV7SDViG5hTymftK5Mp+cw52qEZ0iU4gdpl5HJSbMkyAAm7oSxxMWRh7anMT18q2AxkQ7TKY8o39U6oYqgGjdjjtyuz123dbP08p3oYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkdicT+pjANfwN0AwI6wswoQdnH3DqBXHv9Bj1W5Nkk=;
 b=bww7NVUn2Y5bWYuzZWtRaftzwuQrtV5OpyjaETP07ATGdC4q0unSnEU+Pt1JDLFRjUWFw+cpDPUuczQBDXksQdOyy4wvFKPkkwwkhvkZ8NEzhWfwMyL6COthIjDjvJsPFsloTqRJm/fJz38DJCjxUC/4xL5uaVlTwNEUiQsjal8oaHMD8O4V3hk6A2O8Gr4vnMtvIt/Ao/QQ62kLiNmCebzP6uvNmqFTYHVrhJhBX/66YOLzcIXUqX2JMelVvPtCfGUqZzSEKeEoUXjrbdcZ8p+ydCWoTcFIqVD+3T3MYVcfTE+3Rh53/rFe/UvRMDcVaJF1iGguhAdMz1SU/Pp3ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkdicT+pjANfwN0AwI6wswoQdnH3DqBXHv9Bj1W5Nkk=;
 b=thveqDxowr2fwmegQmaFv4tsGHu0OJSWHLq5foiVKBklL2Dzj9roUPY3l0M7UIEgMZVD1UiitGB+8qMf0+7wtjDlrbkBz+xcV4Y+kqdakMpxqK2BdD6v7LGRAzSqJdRpCCWz+lPOO5aKYkDYnEs6uwRDVSPF+HwOqCNTYEujhGCWvdlyUowzrZwRKRk6ptKGkQXjYSK04xelR7TpceNTFsia1vB/zfgxCOqPZcSGJILYqx+k1k+bPEfDfcq59t4rST+L8ExSo+Kt+L0d/htkJTzBr6b7OHSQKzAc6Z2Msl8mo7NV+yvFbP+JHN0SQFza649tA6rq53cK7cYa1iyX4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA3PR12MB8761.namprd12.prod.outlook.com (2603:10b6:806:312::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 23:34:36 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 23:34:36 +0000
Date: Mon, 17 Nov 2025 18:34:34 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 11/11] gpu: nova-core: add PIO support for loading
 firmware images
Message-ID: <20251117233434.GA1095868@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-12-ttabi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114233045.2512853-12-ttabi@nvidia.com>
X-ClientProxiedBy: BLAP220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::8) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA3PR12MB8761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2070f1-0529-415f-f7e1-08de2631de97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YaSnS/VtK4EeqO2Z1JriCIQmmGmx4Pl/IoQLUSMx6LuAj4b6VUVX6Aii3XJw?=
 =?us-ascii?Q?Zi6l93SJVZF3ytjxPQLa4j8UTAfSPpnXKTHXbsf2/psTSD2V9i4nEykVkcgP?=
 =?us-ascii?Q?v6JC1NDPXOTgoozyYDP7x1++OzhZYCRN8gRI89glPn5jzpBq4edzMyRLErqe?=
 =?us-ascii?Q?XaKFBg+UZJ6IOSE3IFKFV4XOcoCa5l1OL1A46150lSrki81qkMUETM4aH0Yd?=
 =?us-ascii?Q?UVH6LnoCzMeY/B2u7TrKLS4MEYvv5AlcphD0ciJk8aN/v5+oem6SGiZMh0Kh?=
 =?us-ascii?Q?Th9UEg3Qq07cWG27FAvkiiE1+en+u9PPjQ/X/N4icqeo7Ky+mDRHQGGAz/ez?=
 =?us-ascii?Q?hZkVM8TQqDSewQCkjwQ62V80i4dsVe6Ti2XYf+rWxxLCsSGBu2TWwiQwEW6+?=
 =?us-ascii?Q?OzI4OrxAjcryixAx95zpBLTxHTwMgye2B+5JfWoORhYQ2LxSVQbn1CMitzgc?=
 =?us-ascii?Q?I9o1wHMLT9EmhmtZB31QinYAwUyAA1a9cAnND/UIeybfgLDJbYKwXtLpIz+7?=
 =?us-ascii?Q?vTJYBlLZiSoVtOMRdkF3qwaZyGw4wrbnquO1egGqkVB6UqdxReMdPmZRSDv2?=
 =?us-ascii?Q?DUJaK6yowOA2OZYXJfDT9bOhxyCKSxGAEpHlLe1J8tQe025WrprasFxqu07L?=
 =?us-ascii?Q?2LRqRzOR6chrYmJW50Xc2BI3rfpvMzH+vadibPopeyg7glEsJRbSv7tyL2Xz?=
 =?us-ascii?Q?h7zYIOK2lHHnYHEdKrGFNDc9o5GoscZN6PKH20eNw5fefmaVVfiTwHs2CnVV?=
 =?us-ascii?Q?spSCXJOYesspCX5yqYrYuiU3BpDIfEMx8paBmBytG/Kugmv9NPHuXIGyPtzJ?=
 =?us-ascii?Q?il7LSrmPn2HZWWtwQWN+N83+G/XR9h6kKS+3K9NUpay9dnxUU7wzG3bfPhIY?=
 =?us-ascii?Q?gI1Wfxv5rPTEERFkzRBJtYoSdDIPJGhaMrzObOMhBP/KfnUWvywoBsJoigPZ?=
 =?us-ascii?Q?3ZAOcgN1X62CMTEQ7E5V3ipkXi/nSh8OZhcwAJxKKKMz/LQsf9rIxa5tKJu2?=
 =?us-ascii?Q?ovJyNxk3c9/gR25qCE8SFvsLI3GulMiP5UPM2RsgO4unIP68ZPuRiI0LV09S?=
 =?us-ascii?Q?catEELhN0en30aC8xOpCJ7iKunYu74kn8Cwf7Amgl1jgKAtvZIg9lSAd82H5?=
 =?us-ascii?Q?tnwkdHiiMm6Pz7Re8MkFu9ZcaaMqQpDyU+JdRGsP54QgKGli1XTw0rPdxeot?=
 =?us-ascii?Q?+q1eKre3FV3p6qh/b3p2/ERmhLtlP8dQukaBpv/L2c/JknL4sFQonP84uVpM?=
 =?us-ascii?Q?fISThNDRfhuTcaG8coxXtlbGJ4ZE/0f9Sx8G1dqPKHirjTheN6gckE9WX0TI?=
 =?us-ascii?Q?4VIER9fsvgC0aEJ55l3wIyq67GAXoBj2cc5N9+oV3vPVVaAgwg5r5PS3IkA8?=
 =?us-ascii?Q?a6ioGs5UJhSEG4tADAaIfIdK4GZru+Ln1D3xhZm/BbuR63gbq1ePGiYE7sIC?=
 =?us-ascii?Q?Q6QWGsP3fGLApsKny1r1KL8r/ba+/ci0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RX2he9NpUflILuyolRr3VfCq/fRX2cYi/mfui1KuxvE9BohrUIZjSdeiL1CV?=
 =?us-ascii?Q?Y4F5wM/XBZxR9RUkS4QYQOmY7c71WtP9kAoiSkXUuOA6cE5qFHHRSr085T8E?=
 =?us-ascii?Q?OLnMuZ2aMpQtewjCkQSGRe7pkFo3BAewclysGvbLqYNzWcHFeQnKEauEMNP2?=
 =?us-ascii?Q?8xUeqbscOb5s+vL4D4NUTQ+pLKenqVbyiv7PVRV0qAJaGkeQEY2PmBI7n6UX?=
 =?us-ascii?Q?QFtmzni3V3U4lD5JJhahwbABFkhgleQx2UX61xqwYdAcyxnKThtWzP5xyoOr?=
 =?us-ascii?Q?DMfMwaDiGvzTSFE3j5Y34yLyMEBElRKP0Sv0Co5IAbtXUqiyA2B40AxRZFC2?=
 =?us-ascii?Q?bNCpkGfbNuT8W5L9ua2/yp1Ka00sD4EeVU/w7Hwbds0nwOfmSLr2vWV8b976?=
 =?us-ascii?Q?S3FllmYfFKKz6vxuSga/Zg8UZF0dgRejVRTTFXmm0hpMupjDjv7MhVWigRCp?=
 =?us-ascii?Q?JucAYSS/9HiVW1yMUZKKHitY6XEJVYD5zN1+9C++FvnY0CQESi1d8dXR8WXa?=
 =?us-ascii?Q?inrS2t1Wb5mSbLkRj1ZQqHyEcmymdhRMwUc7SIXdki+axzoSWX54pr/vG8aS?=
 =?us-ascii?Q?++e8FU6m4pBTbkX1NHjIILc9R/e0ejpVmbyFF9HM53oRB9aQ09rS+6mkIr2q?=
 =?us-ascii?Q?g5Xyi7t0bA11VZdYgw1NJUcHqZWJcqHzRqDY9GMPqhV4FdNNHG2/PrJswAX0?=
 =?us-ascii?Q?MtBiyfubTxrjidB2JpdyrzC7clBv85hIMpFs5VaadXk99OQPcLB/IsXJEW/5?=
 =?us-ascii?Q?iQ/rjZLl9rRdGKVfUoaebGdYfgWnYRzc2amxF4r/VlMiokeljt0PqglrVQXM?=
 =?us-ascii?Q?zbueH+BLoiCxZFSN/7H5/ipHMNlY81A2QEq1UncPO4sW/lH7AQg0kwa8KW1N?=
 =?us-ascii?Q?x6SAcLcrJxJJlUQYxgQl1ubmLXP90PNU54aLMJGht1siW/J3XsrqGxvEkU1e?=
 =?us-ascii?Q?GtDvdsEOyOH7n/SJM5ezsYODlU2xVxhRTdzp1qiAn8IymmxHG2uR/aNucbZJ?=
 =?us-ascii?Q?ZSVUrXZL/ZsEL/tJXT5rXoAuQtC4XJGyBT2jlMq6INvvzPhbrp4kDtRcP1bf?=
 =?us-ascii?Q?BCCDxtfaP7BZrMso4GqNB1PfMJiBY01bfEC39D9deocQyeL32h9yEi/3/ViR?=
 =?us-ascii?Q?Yt/ikNWAZ9KI003svcCzXTwN++6P4176nVaY2CbbSpot7+j/xq2XBkrrxR7m?=
 =?us-ascii?Q?Ka3QtiNOMKk4pwCkm+yQzcFPiuWOXHCrbFLYrgYMLBa1bk625UwvuFh/pgk/?=
 =?us-ascii?Q?DJ3rVchl8JHGXcg9n7hAzMtK2o3Mqpt+NZtXl2Pf0hwW3YPttN5s1pz29m6T?=
 =?us-ascii?Q?EtIqg45r7vvO9UED87aL4hQYijwkub1XDNpWJjGd+WXRtkzWlGpxcQRs+BHx?=
 =?us-ascii?Q?FlbwEVXAZUDZkCITW0wo7Wl/JjLS+xtXnnVhhOuBiPYCvmfIWwj9he86kehN?=
 =?us-ascii?Q?bXUBOJjuc3pVJ78bBPzRsSQfv9zm5ETTIcxXzQbaX6SBHJAFbZRnUd8Ax7TU?=
 =?us-ascii?Q?qkNxW/wKwApxY1Gv3foMn/Qq5/coTDLjHzVIntgWZZkaOihBC0xrO3NJLDkU?=
 =?us-ascii?Q?HlWW5JS6vANZfxGTppznrpPwkMPMiUSIa4ij46oi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2070f1-0529-415f-f7e1-08de2631de97
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 23:34:36.4450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y4Aj/TGlpR/GHnK5twT2Qt6/LaSKcoIvWv46yzQD0YL0bknZvlfhL4h+0RCodyplSqJ2539afI1VDb8I28DGxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8761
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

On Fri, Nov 14, 2025 at 05:30:44PM -0600, Timur Tabi wrote:
> Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
> firmware images into Falcon memory.
> 
> A new firmware called the Generic Bootloader (as opposed to the
> GSP Bootloader) is used to upload FWSEC.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs         | 181 ++++++++++++++++++++++++
>  drivers/gpu/nova-core/firmware.rs       |   4 +-
>  drivers/gpu/nova-core/firmware/fwsec.rs | 112 ++++++++++++++-
>  drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
>  4 files changed, 299 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
> index 7af32f65ba5f..f9a4a35b7569 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -20,6 +20,10 @@
>  use crate::{
>      dma::DmaObject,
>      driver::Bar0,
> +    firmware::fwsec::{
> +        BootloaderDmemDescV2,
> +        GenericBootloader, //
> +    },
>      gpu::Chipset,
>      num::{
>          FromSafeCast,
> @@ -400,6 +404,183 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
>          Ok(())
>      }
>  
> +
> +    /// See nvkm_falcon_pio_wr - takes a byte array instead of a FalconFirmware
> +    fn pio_wr_bytes(
> +        &self,
> +        bar: &Bar0,
> +        source: *const u8,
> +        mem_base: u16,
> +        length: usize,
> +        target_mem: FalconMem,
> +        port: u8,
> +        tag: u16

Please don't use pointers for source, use slices instead, then you don't need
to assume length is multiple of 4, you can just return error if it is.

fn pio_wr_bytes(
    &self,
    bar: &Bar0,
    data: &[u8],
    mem_base: u16,
    target_mem: FalconMem,
    port: u8,
    tag: u16
) -> Result {


> +    ) -> Result {
> +        // To avoid unnecessary complication in the write loop, make sure the buffer
> +        // length is aligned.  It always is, which is why an assertion is okay.
> +        assert!((length % 4) == 0);

Can get rid of this then and just return error if it is not multiple of 4.

> +
> +        // From now on, we treat the data as an array of u32
> +
> +        let length = length / 4;
> +        let mut remaining_len: usize = length;
> +        let mut img_offset: usize = 0;
> +        let mut tag = tag;
> +
> +        // Get data as a slice of u32s
> +        let img = unsafe {

Missing safety comment. Please go over the coding guidelines and format
comments according to guidelines.

> +            core::slice::from_raw_parts(source as *const u32, length)
> +        };
> +
> +        match target_mem {
> +            FalconMem::ImemSec | FalconMem::ImemNs => {
> +                regs::NV_PFALCON_FALCON_IMEMC::default()
> +                    .set_secure(target_mem == FalconMem::ImemSec)
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port as usize);
> +            },
> +            FalconMem::Dmem => {
> +                // gm200_flcn_pio_dmem_wr_init

Misplaced comment?

> +                regs::NV_PFALCON_FALCON_DMEMC::default()
> +                    .set_aincw(true)
> +                    .set_offs(mem_base)
> +                    .write(bar, &E::ID, port as usize);
> +            },
> +        }
> +
> +        while remaining_len > 0 {
> +            let xfer_len = core::cmp::min(remaining_len, 256 / 4); // pio->max = 256
> +
> +            // Perform the PIO write for the next 256 bytes.  Each tag represents
> +            // a 256-byte block in IMEM/DMEM.
> +            let mut len = xfer_len;
> +
> +            match target_mem {
> +                FalconMem::ImemSec | FalconMem::ImemNs => {
> +                    regs::NV_PFALCON_FALCON_IMEMT::default()
> +                        .set_tag(tag)
> +                        .write(bar, &E::ID, port as usize);
> +
> +                    while len > 0 {
> +                        regs::NV_PFALCON_FALCON_IMEMD::default()
> +                            .set_data(img[img_offset])
> +                            .write(bar, &E::ID, port as usize);
> +                        img_offset += 1;
> +                        len -= 1;
> +                    };
> +
> +                    tag += 1;
> +                },
> +                FalconMem::Dmem => {
> +                    // tag is ignored for DMEM
> +                    while len > 0 {
> +                        regs::NV_PFALCON_FALCON_DMEMD::default()
> +                            .set_data(img[img_offset])
> +                            .write(bar, &E::ID, port as usize);
> +                        img_offset += 1;
> +                        len -= 1;
> +                    };
> +                },
> +            }
> +
> +            remaining_len -= xfer_len;
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// See nvkm_falcon_pio_wr
> +    fn pio_wr<F: FalconFirmware<Target = E>>(
> +        &self,
> +        bar: &Bar0,
> +        fw: &F,
> +        target_mem: FalconMem,
> +        load_offsets: &FalconLoadTarget,
> +        port: u8,
> +        tag: u16,
> +    ) -> Result {
> +        // FIXME: There's probably a better way to create a pointer to inside the firmware
> +        // Maybe CoherentAllocation needs to implement a method for that.
> +        let start = unsafe { fw.start_ptr().add(load_offsets.src_start as usize) };
> +        self.pio_wr_bytes(bar, start,
> +            load_offsets.dst_start as u16,

Lossy conversions require comments. 'as' is a lossy conversion.

thanks,

 - Joel

[...]

