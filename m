Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A582C66879
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 00:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3751610E1D6;
	Mon, 17 Nov 2025 23:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DTP58TvC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011029.outbound.protection.outlook.com [52.101.62.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110B510E1D6
 for <nouveau@lists.freedesktop.org>; Mon, 17 Nov 2025 23:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXDZFWV+An064p7SlwvMhbvOBfjxDJegEz7Kumqtf8pN6znNngDqDdlslijkCk/TzsG8cNNIo6LrWpYWwYsFsCtLsMJhK6nAuDCPRfAsjF7QyjpHJAuKDFmef5bt0swiWU6PHpDv+zYxtgHaBcoZE9ewDwgjjK+waCSKAZ0wIXo8QZv1CcTiDTnZXMeGU9BJ8r/TZaQFxuEONiU+AIYf9EDYGflFUTHIMmZXNq+V58w/aEQGiNCLAKppiMfApSRiF5V5z8EzMWINiY4gZyDp/HOJpPANK8l8WSSTvmR/+b9+j2YOOyW6ZZyhmpGBRRxBIL5FelaiOMQOxT8+MPv7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVimn0Qbv3F1exB+RiHO4bitUiU6uExJo5eAEzvuMo0=;
 b=jcRiQ4mtxNPkgwIAHVz0+ejv4EmmS2JT6iXKOtb+ceiEr1/do5NNe2UbqIP+CtYBES7EsaEQEREaHHo+6zAjV9+izmS2uqyVz8rpdEOMmYjPmiM6DXTki72cuol83BuEc/QiJbb7kl5kQ4rfuuid2JUveZ7XMdBv3CbTUyNTbRMBaARt36I1QL0bddTdLCUeaxXTgDAXCQ7cgvOr+GcwNaR1GiP161mRareV8/JZdrYiZiXOreGpZpmHHkx8B/JNRkUfkQxaYMfm15HQFPtcvjzPJ3VFDKn9Al5U7HYJEuQiL/iqx+tjuVWKr4Sf9QAIsnF5pUZjz/ZC/Dsy9ffQNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVimn0Qbv3F1exB+RiHO4bitUiU6uExJo5eAEzvuMo0=;
 b=DTP58TvC7WYitmPY9TCdDdfYfChXBOFZ/4aa9KnpCNpilC/ePspeOh9Alytz6gQk4rV+7cDFRIIdzJrNcvAtcjyahKKj5nWAXr4cf/mE2AtEQ9fvPeNFxAAaKDzLUPZDqeu2mKRDPC4SqcfzfRFp1DstVK5/QGJJ17F+33wgZ10BX33C1LQ3tELENe6cbje1Ps+Bd6hdmaKJLcCQh12utd8k2A3p0r8asnUrhqbWFeNwIAJNMAgGkIdXTsl2djFoa1JZFWHaiNuD8shIC1yc8CUpx6NxiAD5k8C+/ba0kfgjSSY8094Qd8SuqnoZnchJZbk4CVSkKYuqXkbnItYQog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 17 Nov
 2025 23:10:30 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 23:10:30 +0000
Date: Mon, 17 Nov 2025 18:10:28 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Message-ID: <20251117231028.GA1095236@joelbox2>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114233045.2512853-10-ttabi@nvidia.com>
X-ClientProxiedBy: BN0PR07CA0011.namprd07.prod.outlook.com
 (2603:10b6:408:141::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: a51e206f-5355-47aa-00dc-08de262e8071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wuNOp4Zga8zWfZ1HvqmrLfPDKqDFP9nkPzVX9m6wNUGYsHx44/HhIXUTL7i7?=
 =?us-ascii?Q?N9GdbBis8Gxm2NOyIk5YmbBSXlFSXaZRyipdiC8Bz+I/YskN8hapN8BsRewP?=
 =?us-ascii?Q?iRTKRnRpWx1wnRqkHUKJmN2t3FOq4McEZVrLab3ZDfVe577mtmzP3OSs1wUr?=
 =?us-ascii?Q?Crr3xhMJ0XQoL0MeCo3LfeC/zwh/L1KfIOUoaTRP5hVX1taNn+6dgdNTn1v/?=
 =?us-ascii?Q?m6g/nKMQh/6anwYAzE26reUuxSPZjr/RLADbTbpY9l4HdZw32HCn2fORvZv9?=
 =?us-ascii?Q?OdFRbsJmPgbgaYO7aQMMUDc5A8fuPKINFjwninmp3y/CoO0dQpzfInw4tgT4?=
 =?us-ascii?Q?AzKH28ndSvEyQH7hYUauvocckMk+kp7GpzsYHK4FCXsu6nS3ZdZb0lNyb/tX?=
 =?us-ascii?Q?BCODpAbo3ArAlg0KMS+9OD6JJMrKyTbn/hgcj+lhItjbla7mKOP9Cd2bTFXC?=
 =?us-ascii?Q?Qkotxc2GGeGnU/h3sMcT92+u8UyhzozI+oIJ4NJ4aT6wh7m1VOapJWo5ukIX?=
 =?us-ascii?Q?S6g7xMuqfsbr/jiGSZAaTdXmTUM7B3L8r+sJGRH0loMgxlE/W3ULxI7RmypI?=
 =?us-ascii?Q?Z+gJzkvA8RoXPzlE45aIuMoXofGIgRCIuDpr5x67MlKxnijvUGnnLqIT8qLm?=
 =?us-ascii?Q?fZWlTxaXlciW/Nt9nXgEPcYRWwZQoMqwmFBpRENWWlPxRxCCtP1TjgM9Sbmu?=
 =?us-ascii?Q?L8y+Yk3Mx4W6UBT5kcSbBYb8dBr0L7MzSphEJ4xd7378l/GhDL9Uxx98dunW?=
 =?us-ascii?Q?vRAD5lNQD+Jx6YbnD/HK8XoDIF3LUZC0xqYKGOzpEVAPgsQXzgqwkdJuwGx7?=
 =?us-ascii?Q?OyC3e983ZA7n9UpBk643+rpGIciiMFlBbjoGziQONJZ7x7XivrILYyILFWCk?=
 =?us-ascii?Q?JCfzhO/CRKFFRC1+Hh+Ofzhk2BM08tsG2/K0TJbpK9U/tm9I5eqa5QZUZsSy?=
 =?us-ascii?Q?87AOx3vz/SlHh+oj3kTHoucEXnotG1jGhH9sLsf8xBZviFuKTSTGlvXIEns/?=
 =?us-ascii?Q?yHUywFQb6l9nPJrZ2qy/IF+1EsWHdehDNao9hOgeHVL5Dskh09/vc0pJtf1U?=
 =?us-ascii?Q?/2p5prJk5+UCaIei9JcQN/bqG/EJ4P6iaKAjV83AZ+9NYItGgU/T2matE+vi?=
 =?us-ascii?Q?4XgKZ79epfkVGZ5A+0EBIwcCSxRLHLoE+5fWE5fN9oKU47C1dEHGQXny9N3i?=
 =?us-ascii?Q?KsPQk114UwbQrJ8X3ctmGWpAQgpUUpc5IuXuofYLGzNG1NRGhiLlbOvyDX+q?=
 =?us-ascii?Q?vREfxACv1cY3s4bk8LJ98vecC7OOmdZ/CJGGwiMH9zY9JCrKspq4xlGOLnmF?=
 =?us-ascii?Q?AP6QT93ozxR7U7lhyUkybzpf0MrqIC//JP0x7E+2NTNgqOmAJN7yr6JzKBYY?=
 =?us-ascii?Q?9vbYgyc4gK+Nezoo7zwsHJddikJiAUP4NAs2FGt8VYFDkOzoYyLWwQBElU1e?=
 =?us-ascii?Q?Y2Q5Zr6tdkooBpeFoR/ONZB6FzDv2kf5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8E4UogB77wkDVRhNTtePYNAJ6WvXRd7yeM1TfYtH5czQEeNpgztFADeqpxst?=
 =?us-ascii?Q?cHl7GAk6M2cCIpgRhfSg9F3EkTfYO/xhzN827fa676+MZ6oJnNjcIyO1lm6q?=
 =?us-ascii?Q?7CfCuLrHBQ+oRYyw9Lfk1f2/ZjzCpY10SlKgRyV2lwV/0QbKPfM9zESQ0Oc6?=
 =?us-ascii?Q?00uvMhawZuV0+81igH3EV9Dc9jCZs+G6qM07EIHdaPVswJxn2Mpee8RRN+uX?=
 =?us-ascii?Q?x51BSRViYnmY7K/kjNMZXiCf2BXL66z7x4PXv/gDN1kxNO/gxhEbgq6r2CM1?=
 =?us-ascii?Q?doNBxffb+qojx+5T+CCP7o72L+1vIJ38pXZDF5ZQSSWtkPH2GymhwQ8D3ZND?=
 =?us-ascii?Q?BEw2sNj7oyO2ZCzdle1tCaZusAnupEU38anDbkG5ujZDy1G/m+A0z3PBctU8?=
 =?us-ascii?Q?O6MVlFunimcU6fvkgrGSkf3wyDutuf+G9dnW+wXffR0M6VILQDANZ6DR+g7o?=
 =?us-ascii?Q?4d3LFeluXkP2bG+QKYeZ8xgT9YKev7157wx1fEX7N0dhaXk9bR6ZPIKAh9ho?=
 =?us-ascii?Q?i7zgZ5k65XbAhHhbBi/29dYPcEQ1oWI2mU7W9BImj92Blcst/lj2BA4YVGMK?=
 =?us-ascii?Q?6q9SxQbBwx3zwApz2+D10lZ4x2Dq7NddVoefyX/MGQMUniNz0dkHnhDvb1XD?=
 =?us-ascii?Q?cEENsGWngUJvOuvQFv5AVOLC3rtWO4/H3Y1pW3WzhnbYJKSSl/vWM+/0lxkW?=
 =?us-ascii?Q?CytQWx+du0FDHoZIvKCLxaI1k+crQBD9liHSyOZ08iwcjfi+suu2D20OLQuj?=
 =?us-ascii?Q?jFZEa8LCH5B0AFsZdRB39eP1aKYXtYvB3cbZ7iAQUGG6WRr3UOI96HSQUQRq?=
 =?us-ascii?Q?LVNUrD/brTzOD5VsHLulSZoLMf7vP/NiwbpCOzXlrmLYz3yJGkCcjSaJbJTa?=
 =?us-ascii?Q?Sz2y1+chRt5pa4LFUMzaNqaAN+3m+Bwq0fZsOC/zba1y4oqm/g33aObNRza5?=
 =?us-ascii?Q?AWXSm128Y5z6ws7IFcrHIy/k+4zjOEmuYaPcFAa1HKUzuWeEUO3l+VFSeOQK?=
 =?us-ascii?Q?XANoAnB0zsyHsve5K02powHUacyJ8s9BnXgGnaxrmh5HmUI5eWIwNhbSeOn8?=
 =?us-ascii?Q?TEQdagqdVhfdYEbeOvc2JFddYt9BcjS9yoWm8kJT/g9w/JRWx9nSwCAOOLWd?=
 =?us-ascii?Q?oSyB9fOZiof1BUTlhi1GNbjPu6zw7xTuRaW7vsOYnBBJlig7nci5AG//Rnbx?=
 =?us-ascii?Q?bpdD/RsUwlzpwad0G3p82XEQT0k+/G7XlCpMDnTzVG32t1/5use2+SA2L3c0?=
 =?us-ascii?Q?t/B4GpxckbpLJfboo3fZNFWGPcIV0BF3bH/7nD91kDOX9Atjb5gweapxxUIl?=
 =?us-ascii?Q?Sr1g7X+WUP6B2iNqeXXatVOVeeiiC7LJtO4ZuG6rwo6RpUlrE9WH6nIx55ud?=
 =?us-ascii?Q?uVf6UbmVO5Vy6C3LUddbwB8UAafYJdgzDuwpxmrvshqSYfxBx+lZ6/ulUA4x?=
 =?us-ascii?Q?oGk2OrArbd0I0rJS90U2LY1Xb0+1BgwqkAJ6QiQLoh1ds18ZfUMNBQ97QXWU?=
 =?us-ascii?Q?nVrPM7oBdwYpPOSeXUx3cAf1FgU/5EFqw6Hu1p1ZbNqqHwXXv799kWbWpyZ1?=
 =?us-ascii?Q?jkZb+D57u/g7aBKZ8TM313hD/zCqZTNbiyBKehZo?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51e206f-5355-47aa-00dc-08de262e8071
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 23:10:30.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Trf7IOh5k44GcUUT/T3NKdVLny8RJnLDVLe3AEgqKhRi44uUkJCzayVi0SPvXHhAUw1KklwwGYZJIiN15JINTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
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

On Fri, Nov 14, 2025 at 05:30:42PM -0600, Timur Tabi wrote:
> The FRTS firmware in Turing and GA100 VBIOS has an older header
> format (v2 instead of v3).  To support both v2 and v3 at runtime,
> add the FalconUCodeDescV2 struct, and update code that references
> the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
> encapsulates both.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs       | 108 +++++++++++++++++++++++-
>  drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++++++------
>  drivers/gpu/nova-core/vbios.rs          |  74 ++++++++++------
>  3 files changed, 202 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 2d2008b33fb4..5ca5bf1fb610 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -43,6 +43,43 @@ fn request_firmware(
>          .and_then(|path| firmware::Firmware::request(&path, dev))
>  }
>  
> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
> +#[repr(C)]
> +#[derive(Debug, Clone)]
> +pub(crate) struct FalconUCodeDescV2 {
> +    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
> +    hdr: u32,
> +    /// Stored size of the ucode after the header, compressed or uncompressed
> +    stored_size: u32,
> +    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
> +    /// is not compressed.
> +    pub(crate) uncompressed_size: u32,
> +    /// Code entry point
> +    pub(crate) virtual_entry: u32,
> +    /// Offset after the code segment at which the Application Interface Table headers are located.
> +    pub(crate) interface_offset: u32,
> +    /// Base address at which to load the code segment into 'IMEM'.
> +    pub(crate) imem_phys_base: u32,
> +    /// Size in bytes of the code to copy into 'IMEM'.
> +    pub(crate) imem_load_size: u32,
> +    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
> +    pub(crate) imem_virt_base: u32,
> +    /// Virtual address of secure IMEM segment.
> +    pub(crate) imem_sec_base: u32,
> +    /// Size of secure IMEM segment.
> +    pub(crate) imem_sec_size: u32,
> +    /// Offset into stored (uncompressed) image at which DMEM begins.
> +    pub(crate) dmem_offset: u32,
> +    /// Base address at which to load the data segment into 'DMEM'.
> +    pub(crate) dmem_phys_base: u32,
> +    /// Size in bytes of the data to copy into 'DMEM'.
> +    pub(crate) dmem_load_size: u32,
> +    /// "Alternate" Size of data to load into IMEM.
> +    pub(crate) alt_imem_load_size: u32,
> +    /// "Alternate" Size of data to load into DMEM.
> +    pub(crate) alt_dmem_load_size: u32,
> +}
> +
>  /// Structure used to describe some firmwares, notably FWSEC-FRTS.
>  #[repr(C)]
>  #[derive(Debug, Clone)]
> @@ -76,13 +113,80 @@ pub(crate) struct FalconUCodeDescV3 {
>      _reserved: u16,
>  }
>  
> -impl FalconUCodeDescV3 {
> +#[derive(Debug, Clone)]
> +pub(crate) enum FalconUCodeDesc {
> +    V2(FalconUCodeDescV2),
> +    V3(FalconUCodeDescV3),
> +}
> +
> +impl FalconUCodeDesc {
>      /// Returns the size in bytes of the header.
>      pub(crate) fn size(&self) -> usize {
> +        let hdr = match self {
> +            FalconUCodeDesc::V2(v2) => v2.hdr,
> +            FalconUCodeDesc::V3(v3) => v3.hdr,
> +        };
> +
>          const HDR_SIZE_SHIFT: u32 = 16;
>          const HDR_SIZE_MASK: u32 = 0xffff0000;
> +        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    }
> +
> +    pub(crate) fn imem_load_size(&self) -> u32 {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2.imem_load_size,
> +            FalconUCodeDesc::V3(v3) => v3.imem_load_size,
> +        }
> +    }


This looks like the perfect use case for a trait object. You can define a
trait, make both descriptors implement the trait and get rid of a lot of the
match statements:

// First define trait
pub(crate) trait FalconUCodeDescriptor {
    fn imem_load_size(&self) -> u32;
    fn dmem_load_size(&self) -> u32;
    fn engine_id_mask(&self) -> u16; // V3-only field, V2 returns 0
    ...
}

// Implement trait for both versions
impl FalconUCodeDescriptor for FalconUCodeDescV2 {
    fn imem_load_size(&self) -> u32 { self.imem_load_size }
    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
    fn engine_id_mask(&self) -> u16 { 0 } // V2 doesn't have this field
    ...
}

impl FalconUCodeDescriptor for FalconUCodeDescV3 {
    fn imem_load_size(&self) -> u32 { self.imem_load_size }
    fn dmem_load_size(&self) -> u32 { self.dmem_load_size }
    fn engine_id_mask(&self) -> u16 { self.engine_id_mask }
    ...
}

// Keep the same enum. If you want to get rid of the enum, you'll need Box,
// but then that requires allocation.
pub(crate) enum FalconUCodeDesc {
    V2(FalconUCodeDescV2),
    V3(FalconUCodeDescV3),
}

impl FalconUCodeDesc {
    // Return trait object, the only match needed.
    pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
        match self {
            FalconUCodeDesc::V2(v2) => v2,
            FalconUCodeDesc::V3(v3) => v3,
        }
    }

    // delegate to trait, no match statements!
    pub(crate) fn imem_load_size(&self) -> u32 {
        self.as_descriptor().imem_load_size()
    }

    pub(crate) fn dmem_load_size(&self) -> u32 {
        self.as_descriptor().dmem_load_size()
    }
}

// Usage example - no more match statements needed!
impl FalconLoadParams for FwsecFirmware {
    fn dmem_load_params(&self) -> FalconLoadTarget {
        FalconLoadTarget {
            src_start: 0,
            dst_start: 0,
            len: self.desc.dmem_load_size(),
        }
    }
}


thanks,

 - Joel


> +
> +    pub(crate) fn interface_offset(&self) -> u32 {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2.interface_offset,
> +            FalconUCodeDesc::V3(v3) => v3.interface_offset,
> +        }
> +    }
> +
> +
> +    pub(crate) fn dmem_load_size(&self) -> u32 {
> +        match self {
> +            FalconUCodeDesc::V2(v2) => v2.dmem_load_size,
> +            FalconUCodeDesc::V3(v3) => v3.dmem_load_size,
> +        }
> +    }
> +
> +    pub(crate) fn pkc_data_offset(&self) -> u32 {
> +        match self {
> +            FalconUCodeDesc::V2(_v2) => 0,
> +            FalconUCodeDesc::V3(v3) => v3.pkc_data_offset,
> +        }
> +    }
>  
> -        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
> +    pub(crate) fn engine_id_mask(&self) -> u16 {
> +        match self {
> +            FalconUCodeDesc::V2(_v2) => 0,
> +            FalconUCodeDesc::V3(v3) => v3.engine_id_mask,
> +        }
> +    }
> +
> +    pub(crate) fn ucode_id(&self) -> u8 {
> +        match self {
> +            FalconUCodeDesc::V2(_v2) => 0,
> +            FalconUCodeDesc::V3(v3) => v3.ucode_id,
> +        }
> +    }
> +
> +    pub(crate) fn signature_count(&self) -> u8 {
> +        match self {
> +            FalconUCodeDesc::V2(_v2) => 0,
> +            FalconUCodeDesc::V3(v3) => v3.signature_count,
> +        }
> +    }
> +
> +    pub(crate) fn signature_versions(&self) -> u16 {
> +        match self {
> +            FalconUCodeDesc::V2(_v2) => 0,
> +            FalconUCodeDesc::V3(v3) => v3.signature_versions,
> +        }
>      }
>  }
>  
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index e4009faba6c5..36ff8ed51c23 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -40,7 +40,7 @@
>          FalconLoadTarget, //
>      },
>      firmware::{
> -        FalconUCodeDescV3,
> +        FalconUCodeDesc,
>          FirmwareDmaObject,
>          FirmwareSignature,
>          Signed,
> @@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
>  /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
>  pub(crate) struct FwsecFirmware {
>      /// Descriptor of the firmware.
> -    desc: FalconUCodeDescV3,
> +    desc: FalconUCodeDesc,
>      /// GPU-accessible DMA object containing the firmware.
>      ucode: FirmwareDmaObject<Self, Signed>,
>  }
>  
>  impl FalconLoadParams for FwsecFirmware {
>      fn imem_sec_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: 0,
> -            dst_start: self.desc.imem_phys_base,
> -            len: self.desc.imem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_sec_base,
> +                len: v2.imem_sec_size,
> +            },
> +            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v3.imem_phys_base,
> +                len: v3.imem_load_size,
> +            }
>          }
>      }
>  
>      fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
> -        // Only used on Turing and GA100, so return None for now
> -        None
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
> +                src_start: 0,
> +                dst_start: v2.imem_phys_base,
> +                len: v2.imem_load_size - v2.imem_sec_size,
> +            }),
> +            // Not used on V3 platforms
> +            FalconUCodeDesc::V3(_v3) => None,
> +        }
>      }
>  
>      fn dmem_load_params(&self) -> FalconLoadTarget {
> -        FalconLoadTarget {
> -            src_start: self.desc.imem_load_size,
> -            dst_start: self.desc.dmem_phys_base,
> -            len: self.desc.dmem_load_size,
> +        match &self.desc {
> +            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
> +                src_start: v2.dmem_offset,
> +                dst_start: v2.dmem_phys_base,
> +                len: v2.dmem_load_size,
> +            },
> +            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
> +                src_start: v3.imem_load_size,
> +                dst_start: v3.dmem_phys_base,
> +                len: v3.dmem_load_size,
> +            }
>          }
>      }
>  
>      fn brom_params(&self) -> FalconBromParams {
>          FalconBromParams {
> -            pkc_data_offset: self.desc.pkc_data_offset,
> -            engine_id_mask: self.desc.engine_id_mask,
> -            ucode_id: self.desc.ucode_id,
> +            pkc_data_offset: self.desc.pkc_data_offset(),
> +            engine_id_mask: self.desc.engine_id_mask(),
> +            ucode_id: self.desc.ucode_id(),
>          }
>      }
>  
> @@ -273,10 +294,10 @@ impl FalconFirmware for FwsecFirmware {
>  impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
>      fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
>          let desc = bios.fwsec_image().header()?;
> -        let ucode = bios.fwsec_image().ucode(desc)?;
> +        let ucode = bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object = DmaObject::from_data(dev, ucode)?;
>  
> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
> +        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>          // SAFETY: we have exclusive access to `dma_object`.
>          let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
>  
> @@ -303,7 +324,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>              let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
>                  transmute_mut(
>                      &mut dma_object,
> -                    (desc.imem_load_size + dmem_base).into_safe_cast(),
> +                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
>                  )
>              }?;
>  
> @@ -317,7 +338,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>              let frts_cmd: &mut FrtsCmd = unsafe {
>                  transmute_mut(
>                      &mut dma_object,
> -                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
> +                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
>                  )
>              }?;
>  
> @@ -364,11 +385,12 @@ pub(crate) fn new(
>  
>          // Patch signature if needed.
>          let desc = bios.fwsec_image().header()?;
> -        let ucode_signed = if desc.signature_count != 0 {
> -            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
> -            let desc_sig_versions = u32::from(desc.signature_versions);
> +        let ucode_signed = if desc.signature_count() != 0 {
> +            let sig_base_img =
> +                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
> +            let desc_sig_versions = u32::from(desc.signature_versions());
>              let reg_fuse_version =
> -                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
> +                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
>              dev_dbg!(
>                  dev,
>                  "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
> @@ -402,7 +424,7 @@ pub(crate) fn new(
>              dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
>              let signature = bios
>                  .fwsec_image()
> -                .sigs(desc)
> +                .sigs(&desc)
>                  .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
>  
>              ucode_dma.patch_signature(signature, sig_base_img)?
> @@ -411,7 +433,7 @@ pub(crate) fn new(
>          };
>  
>          Ok(FwsecFirmware {
> -            desc: desc.clone(),
> +            desc: desc,
>              ucode: ucode_signed,
>          })
>      }
> diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
> index abf423560ff4..860d6fb3f516 100644
> --- a/drivers/gpu/nova-core/vbios.rs
> +++ b/drivers/gpu/nova-core/vbios.rs
> @@ -19,6 +19,8 @@
>      driver::Bar0,
>      firmware::{
>          fwsec::Bcrt30Rsa3kSignature,
> +        FalconUCodeDesc,
> +        FalconUCodeDescV2,
>          FalconUCodeDescV3, //
>      },
>      num::FromSafeCast,
> @@ -1004,19 +1006,10 @@ fn build(self) -> Result<FwSecBiosImage> {
>  
>  impl FwSecBiosImage {
>      /// Get the FwSec header ([`FalconUCodeDescV3`]).
> -    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
> +    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
>          // Get the falcon ucode offset that was found in setup_falcon_data.
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
> -        // Make sure the offset is within the data bounds.
> -        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
> -            dev_err!(
> -                self.base.dev,
> -                "fwsec-frts header not contained within BIOS bounds\n"
> -            );
> -            return Err(ERANGE);
> -        }
> -
>          // Read the first 4 bytes to get the version.
>          let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
>              .try_into()
> @@ -1024,33 +1017,60 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
>          let hdr = u32::from_le_bytes(hdr_bytes);
>          let ver = (hdr & 0xff00) >> 8;
>  
> -        if ver != 3 {
> -            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
> -            return Err(EINVAL);
> +        let hdr_size = match ver {
> +            2 => core::mem::size_of::<FalconUCodeDescV2>(),
> +            3 => core::mem::size_of::<FalconUCodeDescV3>(),
> +            _ => {
> +                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
> +                return Err(EINVAL);
> +            }
> +        };
> +        // Make sure the offset is within the data bounds
> +        if falcon_ucode_offset + hdr_size > self.base.data.len() {
> +            dev_err!(
> +                self.base.dev,
> +                "fwsec-frts header not contained within BIOS bounds\n"
> +            );
> +            return Err(ERANGE);
>          }
>  
> -        // Return a reference to the FalconUCodeDescV3 structure.
> -        //
> -        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
> -        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
> -        // in `BiosImageBase` is immutable after construction.
> -        Ok(unsafe {
> +        let v2 = unsafe {
> +            &*(self
> +                .base
> +                .data
> +                .as_ptr()
> +                .add(falcon_ucode_offset)
> +                .cast::<FalconUCodeDescV2>())
> +        };
> +
> +        let v3 = unsafe {
>              &*(self
>                  .base
>                  .data
>                  .as_ptr()
>                  .add(falcon_ucode_offset)
>                  .cast::<FalconUCodeDescV3>())
> -        })
> +        };
> +
> +        // Return a FalconUCodeDesc structure.
> +        //
> +        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDesc>` is
> +        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
> +        // in `BiosImageBase` is immutable after construction.
> +        match ver {
> +            2 => Ok(FalconUCodeDesc::V2(v2.clone())),
> +            3 => Ok(FalconUCodeDesc::V3(v3.clone())),
> +            _ => Err(EINVAL),
> +        }
>      }
>  
>      /// Get the ucode data as a byte slice
> -    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
> +    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
>          let falcon_ucode_offset = self.falcon_ucode_offset;
>  
>          // The ucode data follows the descriptor.
>          let ucode_data_offset = falcon_ucode_offset + desc.size();
> -        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
> +        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
>  
>          // Get the data slice, checking bounds in a single operation.
>          self.base
> @@ -1066,10 +1086,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
>      }
>  
>      /// Get the signatures as a byte slice
> -    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
> +    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
> +        let hdr_size = match desc {
> +            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
> +            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
> +        };
>          // The signatures data follows the descriptor.
> -        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
> -        let sigs_count = usize::from(desc.signature_count);
> +        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
> +        let sigs_count = usize::from(desc.signature_count());
>          let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
>  
>          // Make sure the data is within bounds.
> -- 
> 2.51.2
> 
