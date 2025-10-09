Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEE0BCAF1F
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 23:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D1310E22D;
	Thu,  9 Oct 2025 21:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZYcxrQ+q";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010041.outbound.protection.outlook.com [52.101.46.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BB310E22D
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 21:33:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QZGepG0qEva9wRdE9LKnMFNaejpVZj3eSBl3kxK2G3afrxuBu9ONFzRGS2+KQ/iIhDTEcrX3lgPaq5MFBK2bzgD1GfThrlLNFKWpzaxk060NrvVVz86zxxfkokwx6q4B5K/GmX+dNomUMq4u3ksdggj6jj0qy/j9cCEEHsty/Zn+w6EDIX6IlsRuHWCQ63LgTEdE5/vXn3PH12ULTyLnxdLvVFOkOVSn3VxNK/kewT2npCFlaHi3Q6IYFS+Z2kaLLFd6toAOnGyHk4kEY5y7Gt97Pow9r9DSZ0sbuK5Z9EatjFUtooCXaCKcriFL88PFuEZLQW9zntNrY1shdfAt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAZEWHG2dQqIKX6RVJz66GDWGxcE2/e4EEdFgRji4zc=;
 b=dVbBJfwP4N8D+9gp3GnJIufbANzus84rnX5u/q99EPpRDKEXgHJlmTI4p8VnrCVBRK0BKhLLaVr2Uxy47GFmj+k70vkct73pEtX3iekIiiEFcL1Va18eZvoq9pqJJ3KRDsgTkddm8EfN1zD44KkT0QNFIke3MkLSXqs6LnyHnUsWF9IhiFJc4eoxUME3kiw9DmABNiK4fREAYZIGq05I9ZioQF2rf6VGgY0/Z8UqczHyBjp/6FS+fRMhSL55jlI2GSteFgxCCZkrI8FUB+O0Gs+rJYDKzHIDBgi10RngFujY1BRdd4BB865YA9dPxZGzQ2rXVlfRIv7ZACPgLi1d/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IAZEWHG2dQqIKX6RVJz66GDWGxcE2/e4EEdFgRji4zc=;
 b=ZYcxrQ+q4LBtuooKUvyPjSlli5Wn1hMOOANqB9qm+FXdLL2zRTbwLITOQQ11gG7KBwDhlRz1AIMZP6NzCzi7QgT62N8lWCVQy2Vs0TKYkCvxqKmv0qlIFsih5yszI0uETKPpIHd2b6grz2PzMjJ4ugSalZotIaJmHYZWwvq2qGosdJguNKZiwV/3fCSi5X7G38jUN9ITY1mYqtG5/2zk+7Zx8NT6NDSixOcIqJbI+v7k4JS3VyN6kHdPuN+/ysDobBLB83QeBGjdY1VAHAx6EbZCgLBYGZZGOmFnyW7aq8cs1CZH+0bpPr83jD3lwByvJrvDVaPgbxCu/qoAgW8jHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9687.namprd12.prod.outlook.com (2603:10b6:8:27b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Thu, 9 Oct
 2025 21:33:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:33:55 +0000
Date: Thu, 9 Oct 2025 17:33:53 -0400
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/3] rust: kernel: add bounded integer types
Message-ID: <20251009213353.GA2326866@joelbox2>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009-bounded_ints-v2-2-ff3d7fee3ffd@nvidia.com>
X-ClientProxiedBy: BN0PR04CA0095.namprd04.prod.outlook.com
 (2603:10b6:408:ec::10) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9687:EE_
X-MS-Office365-Filtering-Correlation-Id: 89c3ccf2-7fc4-4cc3-89e6-08de077b8c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yOQy4t2fVL5fB9z+IWIjlwPtgMKQ9C4fnctQndLSBwyMYrSwOeY5GM1RYRy4?=
 =?us-ascii?Q?K16q8WEVvJ2Em7aKDG8pvqEP02pmnL5F4UCjS6yTx3Z5E/iteSpzkyFws4Ex?=
 =?us-ascii?Q?g4Q3d1kBXk6wKzeFCLsP82gp2eEkH4PPgKYxwYv/kfhNUTdioT1emL+Rndnp?=
 =?us-ascii?Q?dtY7B/VY0lw49dpmHVE/aCW2fldNSjrSfQiVXAEEmZfdiHyAiHvkQ+Tu6/0H?=
 =?us-ascii?Q?tVe/fPIFT8yDf1qvjB1qd6UA2gTMM2wSZB5tFBv1IiUp1ta3H9kCLDCK4+Xg?=
 =?us-ascii?Q?g1fKrtniFqirosxeSL9VJNXe+zoIPHsZkm1/b8KGzr3b9HffxkgDWtv1pc+r?=
 =?us-ascii?Q?rE/iuPw8llwvnvl+dNOnOn9yaOVdVdBgfecz7RpwzemKQmkSP10TOJhF2wDA?=
 =?us-ascii?Q?L1RP0fERvv4RBazyMt4k4mZy5nKfv8VN/zCY2qdwpGEcGGLJvnmHi7xbst7Y?=
 =?us-ascii?Q?EC3w4MZ3RfSslIFch+wb6rjWUJgYU8DdSqkKx8oighwA0j3/0buE5hxE9Lns?=
 =?us-ascii?Q?8VWKYSmpDQxUub+ijw15gcBaQLbKPibqqo5UgJ+eOZog26ZiOO8Vo106KF61?=
 =?us-ascii?Q?eFc31YJRBHHh+K+xEZYhhk7Chms50NYrYDFHI7uHdwWOEEIf7SaBR+ViWKQW?=
 =?us-ascii?Q?AbMeobiReIhAjJxJRTSear36zpGxzM/81/5gia8mvM2RNRu7ISGs+HWsNXl2?=
 =?us-ascii?Q?XSAIznLlNY1QuNkZMqhxEl+DG1DPB20k+bGW9ZSWnb/+M9DnYAHaigAGjO4y?=
 =?us-ascii?Q?5yjybqCCIjxPlBiu8TutlKrS7Bsz6x71XMCrQoBU24P51z+Aea0Y7T4h5g7V?=
 =?us-ascii?Q?lUyyKntqTq55GPd+quxSODfPmrE/qVfgLbuyNpANze4+N3SIHlH1h/Qolf8E?=
 =?us-ascii?Q?/WwAZ0PSSTQo6IeA3pCr+QiuxVUOJwSD+PeLgQ6H2FTkfUHgxtaC8Vnc1WcZ?=
 =?us-ascii?Q?JerPXlA+WLX7IfTrSiqQ0qBmMKyGKHmvvmDY1LRWpqH4UFh6PJD9Z6lGeQOU?=
 =?us-ascii?Q?lBm1/stoHOTElPD8VvlNW0Gj+UKGNrcsOzjzQgC9ZzhoY/y4IRaD6CZByuoM?=
 =?us-ascii?Q?RPuf9rQVC2m5NCsJljLBexCtrKkLgMM+XB36D/7SQLCMCbwPdlZTETKoLHGW?=
 =?us-ascii?Q?W/8m5VmQU+XbhpqkOG0MuKmOIwhYzKBAkmUStH1c+/izEVORHjfI44g6Vl/i?=
 =?us-ascii?Q?i7DCfSJP2EUm9K7khCqRjmVp2JqHrEyr6tGF1fPbSrynxz0XKhwuKFf8oy41?=
 =?us-ascii?Q?UoRz5ZFenwWmubjWtkOuS6C+7Mgn7z5pzE3jXDXXBdn0CdIsuDhzZD/Sb810?=
 =?us-ascii?Q?ToiAYL8s85ampGrzHSIiFbHI+7yHddfKz1Sg4E7khdp6FrMYmNytm60vNayi?=
 =?us-ascii?Q?f6VvJG5PDn03nLntIxfl7IbLtErmfXqIKgivNgJI7UwYhiPXRbMZAkEMmZv9?=
 =?us-ascii?Q?QhWyZ1EgHC88JjEsoeHAVa3sMsASnN5F?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r76WTiqLxUlk/x9f61JvCoJiQZgQl7RL2pYOt4NdJIxiVOob55TdYSyfbRzK?=
 =?us-ascii?Q?sGrSKR8D0jhE84sjjRhS6yyrMnbbjITA62LsTMo/NB9PVunyLpw0FuZvBWqI?=
 =?us-ascii?Q?4179XaPNt0Mg5VWfwo3BX26T6/eNdFJSklwgKv7M3h43XnEhnMQffdxXe23g?=
 =?us-ascii?Q?oPBd8GbZOyN3LyuYjgX36+b9+ypss0KcihbUBmPk6e0pkJteyR3MKzmX7dkZ?=
 =?us-ascii?Q?3OAqhPn1+lZEggdJN3zyWLlcidJ8jgV+gjP+SWtrTXbxala5jX2aUuQoJqo2?=
 =?us-ascii?Q?fLDa/jUPb25V7IWMd8Oa9OQRb8RUXlhoHn7+L5Uj3DdYVp4GtwmVhZHpsdQF?=
 =?us-ascii?Q?UBUfdkhYGEmS88+b+z7RjbC85vi/eZ6qi3n2119mLRWAytoM/azrM7J3z5Cb?=
 =?us-ascii?Q?XwsxXXpGYUtAFroJIFweuAWMzSn93KpqSiLRPaVEx5oJkfo2+/zL9mucUIqf?=
 =?us-ascii?Q?4zRqy+atJyfDXC4CCQYz1hf5xzrsPpGIFFS7Qmu5S1Mb8aaU/dcIhEuAQTY9?=
 =?us-ascii?Q?lS5CmEF3Y2HEMDU+jNS/wE5om0IiIVtkX+AKLpuXQauyWWyH281Wut7uj1DX?=
 =?us-ascii?Q?nVHcaSf8gc/em8F7e4dxBWi56EoSZjvy8Ljfa3c5Rx7fby/Z+2DVrshW6v3s?=
 =?us-ascii?Q?Bns7yV4GdnH+7/UXvYyNeq0H6m2aKVpbPw8CrxmNCmTr45wGbwZExzSj6YYR?=
 =?us-ascii?Q?7+fQjNMVHd0MyW/pmc4lkvWtLOpEfTNHTwWsKxyEY2Z7W0WGIb98PHd/LFvJ?=
 =?us-ascii?Q?FAe7Ys+tMHux2sBYPAXbHDm8DUtQT+V+NzYHqMgOac3UuTIvpt5iojNQcW9Z?=
 =?us-ascii?Q?wsv382reY5gF9dWPXFD7bkut/n3BeyX+Cy3kxhSudsh51DUjBChVA88WuPfN?=
 =?us-ascii?Q?cfoKDRL8Efb0VyfND8C0q8YaDB9e9SmIjJd251RFotFO8IhIzAejS2MjxbeF?=
 =?us-ascii?Q?WA3WbT4mPwogfIgYYict0oi+e6WWD6LTl2iVwBh7lhGvx5cxJFApWsmZtQ9Y?=
 =?us-ascii?Q?Unn4/2gjEV1q9yWXuobb7vzj6VN6Tnd0yupFgF8fdnwVM+UoR+84BhcEYtKA?=
 =?us-ascii?Q?btHWiQBbh4DdBKTREEe07HDYc2lBudThZyvV4rmUa+AvkigeqXN+8c02E7ue?=
 =?us-ascii?Q?mi6woUWTJAf98rkG3DQHFlguCSHax0S6Zr9WhR8my86N6digYvMvmWAKAz/J?=
 =?us-ascii?Q?ZxaAHzB509KYJkEQWzwDb+PkWRM+e40fEhzbUMwlXzJdFWJR5gbvmfady/ss?=
 =?us-ascii?Q?3inAJ/WIaRHlPYki28d45OvS+aLuIerAPWSl0dEug7IKXpKEq0tZqd0MvQ/P?=
 =?us-ascii?Q?FlPWrvO3EaJlp0IKCeM0ptLgioetnjVnUQR/GrmI7RHuUNgwO3FtbKvLwjMP?=
 =?us-ascii?Q?JjljdyBjh8szBAoItgS3jadPfWJPQaUCmQ4xnxObQY5RFoQe3ZqyFfur7umH?=
 =?us-ascii?Q?fdJpLy36eyFKyS/8Px7DyLLfAXexRVzP0vn4T4jqikIpeXH6aa74MT4uSwKR?=
 =?us-ascii?Q?1aEqrSeQLCcFtUpEe3Ey+Ov0JxadKszcjCEFRIDmGvSTU4gVsmM3R/+EZpbX?=
 =?us-ascii?Q?ls8ofTpOd547i889u6nXlIyPOmO3RDg1g5lT5Tkf?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89c3ccf2-7fc4-4cc3-89e6-08de077b8c80
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:33:55.4116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QD2demk9rl0kigUhpyoMGZJimu3KWy1B5zSiVO4naOTJrJduyrXhZnuQhLYeFgBbNwHaWq174QsqYjcIiyigw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9687
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

Hi Alex,

Great effort, thanks. I replied with few comments below. Since the patch is
large, it would be great if could be possibly split. Maybe the From
primitives deserve a separate patch.

On Thu, Oct 09, 2025 at 09:37:09PM +0900, Alexandre Courbot wrote:
> Add the BoundedInt type, which restricts the number of bits allowed to
> be used in a given integer value. This is useful to carry guarantees
> when setting bitfields.
> 
> Alongside this type, many `From` and `TryFrom` implementations are
> provided to reduce friction when using with regular integer types. Proxy
> implementations of common integer traits are also provided.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |   1 +
>  rust/kernel/num.rs | 499 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 500 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fcffc3988a90..21c1f452ee6a 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -101,6 +101,7 @@
>  pub mod mm;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  #[cfg(CONFIG_PM_OPP)]
>  pub mod opp;
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 000000000000..b2aad95ce51c
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,499 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical types for the kernel.
> +
> +use kernel::prelude::*;
> +
> +/// Integer type for which only the bits `0..NUM_BITS` are valid.
> +///
> +/// # Invariants
> +///
> +/// Stored values are represented with at most `NUM_BITS` bits.
> +#[repr(transparent)]
> +#[derive(Clone, Copy, Debug, Default, Hash)]
> +pub struct BoundedInt<T, const NUM_BITS: u32>(T);
> +
> +/// Returns `true` if `$value` can be represented with at most `$NUM_BITS` on `$type`.
> +macro_rules! is_in_bounds {
> +    ($value:expr, $type:ty, $num_bits:expr) => {{
> +        let v = $value;
> +        v & <$type as Boundable<NUM_BITS>>::MASK == v
> +    }};
> +}
> +
> +/// Trait for primitive integer types that can be used with `BoundedInt`.
> +pub trait Boundable<const NUM_BITS: u32>
> +where
> +    Self: Sized + Copy + core::ops::BitAnd<Output = Self> + core::cmp::PartialEq,
> +    Self: TryInto<u8> + TryInto<u16> + TryInto<u32> + TryInto<u64>,
> +{
> +    /// Mask of the valid bits for this type.
> +    const MASK: Self;
> +
> +    /// Returns `true` if `value` can be represented with at most `NUM_BITS`.
> +    ///
> +    /// TODO: post-RFC: replace this with a left-shift followed by right-shift operation. This will
> +    /// allow us to handle signed values as well.
> +    fn is_in_bounds(value: Self) -> bool {
> +        is_in_bounds!(value, Self, NUM_BITS)
> +    }
> +}
> +
> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u8 {
> +    const MASK: u8 = crate::bits::genmask_u8(0..=(NUM_BITS - 1));
> +}
> +
> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u16 {
> +    const MASK: u16 = crate::bits::genmask_u16(0..=(NUM_BITS - 1));
> +}
> +
> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u32 {
> +    const MASK: u32 = crate::bits::genmask_u32(0..=(NUM_BITS - 1));
> +}
> +
> +impl<const NUM_BITS: u32> Boundable<NUM_BITS> for u64 {
> +    const MASK: u64 = crate::bits::genmask_u64(0..=(NUM_BITS - 1));
> +}
> +
> +impl<T, const NUM_BITS: u32> BoundedInt<T, NUM_BITS>
> +where
> +    T: Boundable<NUM_BITS>,
> +{
> +    /// Checks that `value` is valid for this type at compile-time and build a new value.
> +    ///
> +    /// This relies on [`build_assert!`] to perform validation at compile-time. If `value` cannot
> +    /// be inferred to be in bounds at compile-time, use the fallible [`Self::try_new`] instead.
> +    ///
> +    /// When possible, use one of the `new_const` methods instead of this method as it statically
> +    /// validates `value` instead of relying on the compiler's optimizations.

This sounds like, users might use the less-optimal API first with the same
build_assert issues we had with the IO accessors, since new() sounds very obvious.
How about the following naming?

new::<VALUE>()        // Primary constructor for constants using const generics.
try_new(value)        // Keep as-is for fallible runtime
new_from_expr(value)  // For compile-time validated runtime values

If new::<VALUE>() does not work for the user, the compiler will fail.

Or, new_from_expr() could be from_value(), Ok with either naming or a better name.

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::BoundedInt;
> +    ///
> +    /// # fn some_number() -> u32 { 0xffffffff }
> +    ///
> +    /// assert_eq!(BoundedInt::<u8, 1>::new(1).get(), 1);
> +    /// assert_eq!(BoundedInt::<u16, 8>::new(0xff).get(), 0xff);
> +    ///
> +    /// // Triggers a build error as `0x1ff` doesn't fit into 8 bits.
> +    /// // assert_eq!(BoundedInt::<u32, 8>::new(0x1ff).get(), 0x1ff);
> +    ///
> +    /// let v: u32 = some_number();
> +    /// // Triggers a build error as `v` cannot be asserted to fit within 4 bits...
> +    /// // let _ = BoundedInt::<u32, 4>::new(v);
> +    /// // ... but this works as the compiler can assert the range from the mask.
> +    /// let _ = BoundedInt::<u32, 4>::new(v & 0xf);
> +    /// ```
> +    pub fn new(value: T) -> Self {
> +        crate::build_assert!(
> +            T::is_in_bounds(value),
> +            "Provided parameter is larger than maximal supported value"
> +        );
> +
> +        Self(value)
> +    }
> +
> +    /// Attempts to convert `value` into a value bounded by `NUM_BITS`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::BoundedInt;
> +    ///
> +    /// assert_eq!(BoundedInt::<u8, 1>::try_new(1).map(|v| v.get()), Ok(1));
> +    /// assert_eq!(BoundedInt::<u16, 8>::try_new(0xff).map(|v| v.get()), Ok(0xff));
> +    ///
> +    /// // `0x1ff` doesn't fit into 8 bits.
> +    /// assert_eq!(BoundedInt::<u32, 8>::try_new(0x1ff), Err(EOVERFLOW));
> +    /// ```
> +    pub fn try_new(value: T) -> Result<Self> {
> +        if !T::is_in_bounds(value) {
> +            Err(EOVERFLOW)
> +        } else {
> +            Ok(Self(value))
> +        }
> +    }
> +
> +    /// Returns the contained value as a primitive type.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::BoundedInt;
> +    ///
> +    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
> +    /// assert_eq!(v.get(), 7u32);
> +    /// ```
> +    pub fn get(self) -> T {
> +        if !T::is_in_bounds(self.0) {
> +            // SAFETY: Per the invariants, `self.0` cannot have bits set outside of `MASK`, so
> +            // this block will
> +            // never be reached.
> +            unsafe { core::hint::unreachable_unchecked() }
> +        }

Does this if block help the compiler generate better code? I wonder if code
gen could be checked to confirm the rationale.

> +        self.0
> +    }
> +
> +    /// Increase the number of bits usable for `self`.
> +    ///
> +    /// This operation cannot fail.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::BoundedInt;
> +    ///
> +    /// let v = BoundedInt::<u32, 4>::new_const::<7>();
> +    /// let larger_v = v.enlarge::<12>();
> +    /// // The contained values are equal even though `larger_v` has a bigger capacity.
> +    /// assert_eq!(larger_v, v);
> +    /// ```
> +    pub const fn enlarge<const NEW_NUM_BITS: u32>(self) -> BoundedInt<T, NEW_NUM_BITS>
> +    where
> +        T: Boundable<NEW_NUM_BITS>,
> +        T: Copy,

Boundable already implies copy so T: Copy is redundant.

> +    {
> +        build_assert!(NEW_NUM_BITS >= NUM_BITS);
> +
> +        // INVARIANT: the value did fit within `NUM_BITS`, so it will all the more fit within
> +        // `NEW_NUM_BITS` which is larger.
> +        BoundedInt(self.0)
> +    }
> +
> +    /// Shrink the number of bits usable for `self`.
> +    ///
> +    /// Returns `EOVERFLOW` if the value of `self` cannot be represented within `NEW_NUM_BITS`.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::BoundedInt;
> +    ///
> +    /// let v = BoundedInt::<u32, 12>::new_const::<7>();
> +    /// let smaller_v = v.shrink::<4>()?;
> +    /// // The contained values are equal even though `smaller_v` has a smaller capacity.
> +    /// assert_eq!(smaller_v, v);
> +    ///
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    pub fn shrink<const NEW_NUM_BITS: u32>(self) -> Result<BoundedInt<T, NEW_NUM_BITS>>
> +    where
> +        T: Boundable<NEW_NUM_BITS>,
> +        T: Copy,

Here too.

[...]
> +impl_const_new!(u8 u16 u32 u64);
> +
> +/// Declares a new `$trait` and implements it for all bounded types represented using `$num_bits`.
> +///
> +/// This is used to declare properties as traits that we can use for later implementations.
> +macro_rules! impl_size_rule {
> +    ($trait:ident, $($num_bits:literal)*) => {
> +        trait $trait {}
> +
> +        $(
> +        impl<T> $trait for BoundedInt<T, $num_bits> where T: Boundable<$num_bits> {}
> +        )*
> +    };
> +}
> +
> +// Bounds that are larger than a `u64`.
> +impl_size_rule!(LargerThanU64, 64);
> +
> +// Bounds that are larger than a `u32`.
> +impl_size_rule!(LargerThanU32,
> +    32 33 34 35 36 37 38 39

If num_bits == 32 (number of bits), how could BoundedInt<T, 32> a
LargerThanU32? It should be AtleastU32 or something.

Or the above list should start from 33. Only a >= 33-bit wide integer can be
LargerThanU32.

Thanks.

