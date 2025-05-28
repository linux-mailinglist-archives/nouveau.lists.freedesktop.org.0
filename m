Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A3FAC71C0
	for <lists+nouveau@lfdr.de>; Wed, 28 May 2025 21:56:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A27310E696;
	Wed, 28 May 2025 19:56:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Tl8GMEA7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F06F10E696
 for <nouveau@lists.freedesktop.org>; Wed, 28 May 2025 19:56:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so2202015e9.1
 for <nouveau@lists.freedesktop.org>; Wed, 28 May 2025 12:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748462189; x=1749066989;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8L7PhpfmS2m6BHlUu71cqULvSSH20y8r59Td9C3Kyo=;
 b=Tl8GMEA7fqyLpZRbn4uXvDihUq4iClHUJLvxXXsxl2bM02GfU6HO44gKs8r+yuwsud
 be7gXnIAIbSVD0Y9sxTSy5bgjtIIS+w0j4rBY7Lmz5J4qkDdnM19uN8tQorQxoyL+8iF
 HADLKHCn3rTnDeF/uOQSf/uJNXGITcgX3DznRQQ3jLMFCM15hBOVmgAS8SIyUDxdyTUs
 9IC3+waJkas1RVPb99kUiPsdecaV2BEd6I9oTaAOeVOH3bLp10sN7oFt0T1Z1+qrQ4m2
 o7ZbnbFvo2Q5ihrbcbckKchioqK2bbfqk0meriKSjmqUYPvvdm7r7iXbMvyCM8CaFov6
 AtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748462189; x=1749066989;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W8L7PhpfmS2m6BHlUu71cqULvSSH20y8r59Td9C3Kyo=;
 b=GvXzil77nuDM0zFDcEjfIyx/EYXjKDOX+2KNGUTV2Am2JkivRCi7RgLHe/GolODk1A
 bdhGuFrmasGjMSNlWvaLoHZVV83ygOuN1udd6ASNBpzh7i+c/0Uy5eMqtUwTvLwzevLd
 Lb1IQzU/eS/0Euycqcuys+2Ht+i8O3xD5LQMvJ98uzTjzVrn99Yvoupf8KaBM9PUq+kk
 IDMWGy9BtBrcBFPEzvblzq4R+kl6zrcopTaMtF/TlaTp2UkJzRriw43K8FV0fI/lhcBE
 PVgQ1DkOP3jtMvAzwajsaNbhY2w5FFbXP5RyPs0qaWT4eJGMAECHdYNaT+eO1AVG3MPE
 hfpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsZGG18yFU4gOrKMHNdX+LaJL+oRDLfhvUuUQqvPFivvGyOTtDeD+RubdpyWfbc27qe86T8shW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeMXP4Zu7/sHGg4I0GS5PdgRGfvb7mofMHC/tvPL+NLWeVEa8e
 2EUvGNw6zceSFKkKfAw8WDqghD7LvTCLIpldSIckpBkH/xD7GWLk0rHSpbRILhdCLjg3oJ1rm9a
 oUR3w6dFu608oMB/4qJfzQz64LYrl+Qi9TTLVpq4X
X-Gm-Gg: ASbGncs0DybTewILckk1I/eDu4g7JLHZ4Ngrh1j9PaTaxkutLWP7LCUNbf3e/c6oyLO
 RrpEp6eN/Gvcm07LeN1RIqFFirGLyAC8igFAk4gyXKjV/XmrcfMK6lvyDmAF+Ul/6EvYUbM9jRq
 tTb2UAWRHJD9KW6DItL7ifj04wuRdc7RP7a1CofVrsv9j7
X-Google-Smtp-Source: AGHT+IFRVTFehgHIP4jtTiYzkqzpeEat7ZA6bJJwBruO3MHFT/UlZRIXUBmqTA+/UeIEFdiM+66uwtk4K0Bw983sfEM=
X-Received: by 2002:a05:6000:402b:b0:3a4:cbc6:9db0 with SMTP id
 ffacd0b85a97d-3a4e95818e6mr3321018f8f.51.1748462189419; Wed, 28 May 2025
 12:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-4-05dfd4f39479@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 28 May 2025 21:56:17 +0200
X-Gm-Features: AX0GCFvvfi0IO-4qmWiebEf60BPOOjb4AGpy4FTSeIFi9VcgYiwZXSln0SEgVK0
Message-ID: <CAH5fLgg6s2JM3HtzR3jimUnjLY0BBBpnNLuBUdrsOYCqmx+8pg@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] rust: add new `num` module with useful integer
 operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, May 21, 2025 at 8:45=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Introduce the `num` module, featuring the `NumExt` extension trait
> that expands unsigned integers with useful operations for the kernel.
>
> These are to be used by the nova-core driver, but they are so ubiquitous
> that other drivers should be able to take advantage of them as well.
>
> The currently implemented operations are:
>
> - align_down()
> - align_up()
> - fls()
>
> But this trait is expected to be expanded further.
>
> `NumExt` is on unsigned types using a macro. An approach using another
> trait constrained by the operator traits that we need (`Add`, `Sub`,
> etc) was also considered, but had to be dropped as we need to use
> wrapping operations, which are not provided by any trait.
>
> Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 82 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 83 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index ab0286857061d2de1be0279cbd2cd3490e5a48c3..be75b196aa7a29cf3eed7c902=
ed8fb98689bbb50 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -67,6 +67,7 @@
>  pub mod miscdevice;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..05d45b59313d830876c1a7b45=
2827689a6dd5400
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// Extension trait providing useful methods for the kernel on integers.
> +pub trait NumExt {

I wonder if these should just be standalone methods instead of an
extension trait?

> +    /// Align `self` down to `alignment`.
> +    ///
> +    /// `alignment` must be a power of 2 for accurate results.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x4fffu32.align_down(0x1000), 0x4000);
> +    /// assert_eq!(0x4fffu32.align_down(0x0), 0x0);
> +    /// ```
> +    fn align_down(self, alignment: Self) -> Self;
> +
> +    /// Align `self` up to `alignment`.
> +    ///
> +    /// `alignment` must be a power of 2 for accurate results.
> +    ///
> +    /// Wraps around to `0` if the requested alignment pushes the result=
 above the type's limits.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::num::NumExt;
> +    ///
> +    /// assert_eq!(0x4fffu32.align_up(0x1000), 0x5000);
> +    /// assert_eq!(0x4000u32.align_up(0x1000), 0x4000);
> +    /// assert_eq!(0x0u32.align_up(0x1000), 0x0);
> +    /// assert_eq!(0xffffu16.align_up(0x100), 0x0);
> +    /// assert_eq!(0x4fffu32.align_up(0x0), 0x0);
> +    /// ```
> +    fn align_up(self, alignment: Self) -> Self;

I would probably make alignment into a const parameter.

fn align_up<ALIGN: usize>(value: usize) -> usize {
    const { assert!(ALIGN.is_power_of_two()) };
    self.wrapping_add(ALIGN.wrapping_sub(1)).align_down(ALIGN)
}

Here the check for power-of-two happens at compile time. Unless you
have cases where the alignment is a dynamic parameter?

Alice
