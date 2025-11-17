Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E55C66727
	for <lists+nouveau@lfdr.de>; Mon, 17 Nov 2025 23:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7316B10E07C;
	Mon, 17 Nov 2025 22:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gwyjndq8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012004.outbound.protection.outlook.com
 [40.107.200.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3AE10E07C
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 22:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yv++H1wTjCEfXaYngd/+Pj9B7nme5iJyBhfGnCfPTgbZ5PmTfbcJiXjdn6gxGdtwCNwJaDk1HK1Wl1bMOpC2aOUAl71AC6HwtUe5qRHulMsfQOuaLjY6vFEh/qhzXji/fYYqBfOwo2qjPNcE8OH/cbZdh3SHrB6wu1Ok5fVe/d6Nm0n0O3f6zYi1V88WTFV1s//Pja9DI/sjl4v00tWBigrJaRsEwCvVQZB0P8PkMzYdob5COuj90sCHl4ntfQ+0OQzENl40/g+RMRd1KPKbTDPEjZaDiQiw5roA7clhL9S7U6eEj60ZHLKr8RubsMla9cJkn/xcFrqvf7lJRgBWQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoqxMER/wxe0VAVk+OmozmbxZkffuo9qJxWjbstBePg=;
 b=ta/NLEOnePW7YtkESsdKxTn6Al5NetLLppFhBJOqd4WyNmqLBn7U0gGWDQZ8GulMhW2K8ZrB3ysKBCzEP14MvZpPhXqpeo5+avYPptR8Yw9AHQjF7H6aNDEth7XPU1qYwBvEt/BgthR7yNv5BvCe+qc5GgDt6oFCSWdznKapPqIapajmCEWoOML2TqwmXtHG5XjbOECW0ckZpm5HQXRcx6cgCzTE5wxRjPJ8e15glfnKNQSbeBTYCkY0blOVH7l0mp9pb96uIPoEJXX0GycrEwawr5SgZ3GXCHvvSH5+0zKE26dn3YiJKu5F16kNskf8j8PTYpU7d1D77oQ7Xy5dUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoqxMER/wxe0VAVk+OmozmbxZkffuo9qJxWjbstBePg=;
 b=Gwyjndq8m/o2WBbLKQuJEpYMS4TS59vxcD67Erw8z+Ifomg8syPo+uZQl1gwZWYQaggUtnnbPs89cBFc1Pl+0PAflHPZdM4AGGAv1H8inyar7CTcs6wxksFtpMe46csOHVdEtGL8Mfs0cGFi8qI+lM6RUUWRoYEsCM71vRtYpLQxgyh6pyapQMwv6+aP3civxto8Z6hBSLn3NaiCiitytYE5bU4xsW0uPQvTr5o++wJv5TTHkxJSwlJ9ZiJic2vW1H/29ZDopC80m/7J0WHF/U4UqvTEhRFkadq5X0eNmBXOECx/eTA2oz6ClAjIfkgNqxQJ9v3nDjNd+CFTzUsyFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB7022.namprd12.prod.outlook.com (2603:10b6:806:261::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 22:41:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 22:41:38 +0000
Date: Mon, 17 Nov 2025 17:41:37 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 06/11] gpu: nova-core: add Turing boot registers
Message-ID: <20251117224137.GA1094848@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-7-ttabi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114233045.2512853-7-ttabi@nvidia.com>
X-ClientProxiedBy: MN2PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:208:120::41) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: 5743e31b-3e62-4310-fa13-08de262a787d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WQR/Hyr5Qsy+AH3epukIZIblSP3mD4dg9VbRY4xioLlI035pVQjucf4IC2qr?=
 =?us-ascii?Q?g7CKMAfVf3HLSsDcWM3aG2lR848bAEjbhq48nN7XloeA9ldyc6KE6CCumbTv?=
 =?us-ascii?Q?HnQJjFa5FeC2frEY0sPKtZkAiuTTLrX0r74fAsj1Vca//hKkCgf9I1zn0kJm?=
 =?us-ascii?Q?+Co2jDkDvR/CIfB3RwUpaec3BhPdugGVySX3+KdMEOqrUHqmwKxqjjY0KZoH?=
 =?us-ascii?Q?2NfXh6+PqEgvBmX56CUwpQ7Gcxn59e1XvoixaE7LZw5KeifEIz3TdJEUtuzT?=
 =?us-ascii?Q?ZRWG+ufNNdBa2Clrz24vUn18gsHMpeCRJpjVydizpX/TnsMrQzep/nvVjyqd?=
 =?us-ascii?Q?h1ZTZZagoNaSsZHCoeQF2L+oT49dMqeQp9sIva/qeTwuT6I9MWC0nvkIyisM?=
 =?us-ascii?Q?SOM3DCmYhWKZXGsW9fOk70ay9DG7hbYTotN+hGDrufsWgJ3PzOMSVJ5S30iZ?=
 =?us-ascii?Q?VrRy+T3TxSZmKxNXyaXkaoNYks/Ozhg6GURQ+bHFywBmF2bT/sk7LsMU5qQD?=
 =?us-ascii?Q?f8roPunkL5W/BMGuOXIFFh/AbuR+1NGoT+rH/2bW3MtvMwDLeJZV2DLgFCHp?=
 =?us-ascii?Q?Yv7MHEkqOqAHLWS8tQVT7899fbfC2oeEiJgWUAZmcTzRtlJmSD510GA5Mmzd?=
 =?us-ascii?Q?+vYleSFFgMl5PUNreNfeKr07+heIw6wY9gVHxBOnmWjeCDiBZ2/ZxbAw11+u?=
 =?us-ascii?Q?96oUlh2e6YluLRUvEUvZSNbEpYdriHqXgp1tdxcAQiZUOQkibqYHfBNmV6eR?=
 =?us-ascii?Q?X9WP9tnw+1Pajp1PK4uBtSC+4PP19FJDvC+2BxbCmmAEiFl6PTSBkBqC8bhq?=
 =?us-ascii?Q?zyg/gMoySi/PIsMkhzh9VzuWs43ywzdjDYL5UZW2Pra7kqLsuC1RrwHoESTQ?=
 =?us-ascii?Q?1AX5MWtnFFYTXYV3R+D4Le7a0pmz+SoKi7gTPqfKvj+A/9nV5pG9N3A8WYrv?=
 =?us-ascii?Q?Gm2pBHygmnml98im2i7uXU/2jXwoyOx2a+DlQbrv9PcwQmEItChP9VhtF6VK?=
 =?us-ascii?Q?+MsH77IiNHXRb+goTsb5Hpj7BoKDkW5IdlEqIYeD6EMpcdc6DkLxzVZXhQVD?=
 =?us-ascii?Q?TwW+GWz2ly1Kp5761g//SpB6Y0mkQrMehHzur8KYD5clCDv78q5rYgI4r01e?=
 =?us-ascii?Q?pr2Je7qCBIDJwUOwW0QRm4wrUtb1cHIBHi1KWLdVwQeyJkezJdI/vtfYzuHx?=
 =?us-ascii?Q?MDcULSYGvBx1v8rlOm82X6mY/sJQpARpTEq6ogKzec6BHini8ETl3uKxUJV/?=
 =?us-ascii?Q?m3ZztB+VDd1LF5RD925KOKbV6LpccE8J4k8zEQvysLFyMOuVSInPK0MYsYDI?=
 =?us-ascii?Q?KF56yBiaMnSUUwo9GEtZ+GO4Em1IIRH+hRZ1EP8qeEteXcRTNK2C0CM9eS2k?=
 =?us-ascii?Q?1mUrZXeaVty4t6N9p1wKKeKhPz+SlhVnyOGTCCx6K/lJQuiW4hVZWRnrohMi?=
 =?us-ascii?Q?qCQ4F9LfQBYI5J+BjyybQd8Zf4iz8/NU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w9pP5hD/cE20z720gwuFm0KGiasn5AHr2nodrqV0X/c3eDVqkwVrnnqgRkzH?=
 =?us-ascii?Q?xiT78vPFhe4OSCeJFOFRqZxdxtYQsrmVeCrNrzKcpnVk2ey9TaWg2b2uU/LQ?=
 =?us-ascii?Q?4v/8MolWCk1+ZWrAsg7XGKC2H+Tjnk4kxlHsuBKhP6/wSd9EaBkWW9dla/f7?=
 =?us-ascii?Q?OXxa/xfhDDQLv873kOmbgbYhWvWr4Djm38uxMu17NapOuUG1Eo4fh9yTdk4M?=
 =?us-ascii?Q?0YdioxPlp+5rffclPD0Eg9M2SydxSdE1/FrVjMbkaiemiDRJkY9foyPCQCjr?=
 =?us-ascii?Q?kHotoSM+nPImR98UrLZAjvWAkuw5NbWetgA1rhV1PSclgNQp5MD6m9r/QkZv?=
 =?us-ascii?Q?dkvMIIEakOocSKHgka+kfJZKs13D1yAwLsyXDaJGXZSAaArR7z6+ShWC9tuu?=
 =?us-ascii?Q?Mzr6bfwd2H+a4qPPm0PLN3Ou6JhE5jG8DR5IU7Qrj9iF9YHjSyC1qSdHJeSC?=
 =?us-ascii?Q?vD3lQvXW1aAFdMPg2aKpzgUF7awEjtvepaojvGKVul03s/GU/PbQhi+whXlz?=
 =?us-ascii?Q?GUs7hKV/U6Qst7x24qrhyiiZw3wYbziMIEfD09kSJemHfxP19rJWJI7/u6/n?=
 =?us-ascii?Q?48YW3zupD7pZ3cjbT5KG238sqkQV5FnFrZ6w8gwe9ehxZAPejquws3ylwqgg?=
 =?us-ascii?Q?tC44cFAfxAIiLq/e3Vi97NERtqtC0rcfR+NszGD/dXY6Pb2mEWYGMU31Fuqy?=
 =?us-ascii?Q?vDY5teMCIXkJjg1XEYuJbfe3Wlv+41WFNsUeKfCQPMyN7C0OGyDL3xa9kwbm?=
 =?us-ascii?Q?UGzre59Y9AZ/m+x9ysIOJ6h4uP8mGh08XcMhe8YSLM7YKosnW9+spX7zeYdx?=
 =?us-ascii?Q?QZSf0c89Ht55HhGmbbAXWMCVA+zd5rO0xxJ+gqVmzC7lJLSzitCFi35rhyMx?=
 =?us-ascii?Q?PdGXbBZ5ewLfu2A2w8BNQ3+/1zvWSBB2JoH6BBPRbkV7nU9JLTUY36zJXPaX?=
 =?us-ascii?Q?lLQx26Gomq7Z6/YduG50wU7bhP2erEu8i4sW6MGES6NvDwEMz0HjnLDNdq34?=
 =?us-ascii?Q?11fH4xr1IY9rMLQYZf/IOC83utrt8V1IFIhMAN8j3GQ3cnAfjFGHim6A6ixK?=
 =?us-ascii?Q?WCQAstf/tLkuhYwMaW5RE1jdqr5I2wdeyND5/Xh8j7QwO4TYVj+yPPEi1vzF?=
 =?us-ascii?Q?xqry6rvHM4PLpoevEyR99PstJVZgepLgljIr+TVzcYp4eJ/ChSSdnVgbMiz8?=
 =?us-ascii?Q?4WCXh4XoCtmhfZGSTPAGBevQcWBFPNZ6vB0vpon6Apv69lXpH8l5TpmNvd8y?=
 =?us-ascii?Q?y/hu8WlzDp15iXe6lD5v+qgzhw7bDZWYhsY3mYDrc9c6wXanyH2Dwm3QTyEn?=
 =?us-ascii?Q?C6k1VT6P61UspjRipWFxrZvUz6PYj9UdIudvaXJV5/XYOzs/2TdJPjLeV62D?=
 =?us-ascii?Q?/tgvezO4OzMCbut+n2jXZqB6mE22/lhJe3f6wH1DV3TjFLTqm/7VfwmY6kZL?=
 =?us-ascii?Q?nVPSQK/LPvzTf0NpzINA6ZV96Ca1p1w5k2QQOVp4DmQz/vF2q/Uy7I73Kgry?=
 =?us-ascii?Q?cVEIfjleqkgmBKjXrIcJ0H7zmMkA8UV2ww9qFt9ZfdmKrOAmFEoZuyC8tyDz?=
 =?us-ascii?Q?RIsE7nX8ru9ilr6LJJW1ICAtYgT9DS6ivgY1ad29?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5743e31b-3e62-4310-fa13-08de262a787d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:41:38.6103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVIm/2TmQ+mLuVCLZRddBYsd6pc4coSYzpXqryXTNPahclMBtWWpp6nOfGWbawDX/84VPoPZEC7aJ0rT+54Ing==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7022
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

On Fri, Nov 14, 2025 at 05:30:39PM -0600, Timur Tabi wrote:
> Define some more GPU registers used to boot GSP-RM on Turing and GA100.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

Please add some doc comments below on the registers, fields, purpose of
registers, etc.

thanks,

 - Joel

> ---
>  drivers/gpu/nova-core/regs.rs | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index f79c7fdae6d9..c5389db1d98d 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -223,6 +223,10 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
>      6:6     swgen0 as bool;
>  });
>  
> +register!(NV_PFALCON_FALCON_IRQMCLR @ PFalconBase[0x00000014] {
> +    31:0    value as u32;
> +});
> +
>  register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
>      31:0    value as u32;
>  });
> @@ -231,6 +235,13 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
>      31:0    value as u32;
>  });
>  
> +register!(NV_PFALCON_FALCON_ITFEN @ PFalconBase[0x00000048] {
> +    0:0     ctxen as bool;
> +    1:1     mthden as bool;
> +    2:2     postwr as bool;
> +    4:4     secwl_cpuctl_alias as bool;
> +});
> +
>  // Used to store version information about the firmware running
>  // on the Falcon processor.
>  register!(NV_PFALCON_FALCON_OS @ PFalconBase[0x00000080] {
> @@ -272,6 +283,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
>      7:7     secure_stat as bool;
>  });
>  
> +impl NV_PFALCON_FALCON_DMACTL {
> +    /// Returns `true` if memory scrubbing is completed.
> +    pub(crate) fn mem_scrubbing_done(self) -> bool {
> +        !self.dmem_scrubbing() && !self.imem_scrubbing()
> +    }
> +}
> +
>  register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
>      31:0    base as u32;
>  });
> @@ -318,6 +336,33 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
>      1:1     startcpu as bool;
>  });
>  
> +register!(NV_PFALCON2_FALCON_CMEMBASE @ PFalcon2Base[0x00000160] {
> +    31:18     value as u16;
> +});
> +
> +register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
> +    15:0      offs as u16;
> +    24:24     aincw as bool;
> +    28:28     secure as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
> +    31:0      data as u32;
> +});
> +
> +register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
> +    15:0      tag as u16;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
> +    15:0      offs as u16;
> +    24:24     aincw as bool;
> +});
> +
> +register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
> +    31:0      data as u32;
> +});
> +
>  // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
>  // instance.
>  register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
> @@ -355,6 +400,12 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
>  
>  // PRISCV
>  
> +// Turing and GA100 only
> +register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
> +    0:0     active_stat as bool;
> +});
> +
> +// GA102 and later
>  register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
>      0:0     halted as bool;
>      7:7     active_stat as bool;
> -- 
> 2.51.2
> 
