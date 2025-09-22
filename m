Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3F5CBA90E
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB74110E418;
	Sat, 13 Dec 2025 12:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPn9qxv8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FFEE10E1D0
 for <nouveau@lists.freedesktop.org>; Mon, 22 Sep 2025 15:25:05 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-78ed682e9d3so40754106d6.0
 for <nouveau@lists.freedesktop.org>; Mon, 22 Sep 2025 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758554704; x=1759159504; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PSkikTZXE02HYkXXjiWnrJ/oVniVcD53sHXP8wi/2es=;
 b=kPn9qxv8AUOMM1WIh5PK1qWS1lbKehHUNpdOWkcXRVjwksdgC20prt5FjkiFjphdcd
 YPZCZjuYpDpRRlU3GASUS1GLtlQq7zzWqk257wlBJ4+FOzMQYWmqOH/g7F188JN+K/o8
 l8bTsjU1qAnnRShnFPyIuj+9gmH73SoOBJ8VEGrDRtJEVMoA0jQr4qKxWaDulj5RMNlt
 CTGbZ3LrUcxIN6vFmKFn9boDzoQuOnTDArURsJ/lQB0VoRmdWAi7IPno6d+HMRGIysvJ
 NjmieJdlRnHjbvBKYpP+wX8ojA0DVhVD2B6PYg+l7XDEsnWLEZEdy+dd5GZbvbeEhNhD
 flkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758554704; x=1759159504;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PSkikTZXE02HYkXXjiWnrJ/oVniVcD53sHXP8wi/2es=;
 b=xB3GZnRkxcT0WjS3fbywVa742Z4mO9ubKy4I6eYJfr9NH5WPdaj6VFb/o3LJ0LgF0t
 I2r+RsS+FP9BAaHv965A709ZiZ43pTofWbFbe7WJVymQsN3PG2eolGnQ+6N557Hmrdfb
 kHlDyWtLsvFPBtJCG3qa50AH/hBWt8JgCCcgzZ4k0gUg8am2YKLwsWDgkm/MTdEds/21
 belER7xUr3b6g2hacOPWhuXNBWFrSO4jwyC0Wae50h78LlDBaxKZPakR1m2QIrVJEmSW
 F5WPRDMdN7HKpMFC3r76QRaHZ+X3fc87ES3n/vOPWFA2sPO6egzB5kobSF8O+6JzINn1
 31JA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGxe6bA7Yy+qjpiN2fx4flkWm3+Wjnh/JOr6g5gCRdP1Cx6M83Y/cUQkAMMHRwjvVHrh92R/Od@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZFk6ZIt+woTOlnrRoz0dVTk0ovfyelS8VAIBw3H150865HPUV
 Q2+Jdb5teqAjlHzhmbcHwlQ0NEsac8QQRBFWbcgfxcGka+aL8iSu76rZ
X-Gm-Gg: ASbGncut9WiMfW9OKRXr5JgJx9h90L6X70X2fs7/JCxMFJSCfurJkVQw1XY0VhII6eC
 CBSrnec/cFO3X2cH+OUjgHknLB8wKYgzV7BFiPmLjfBiPqPbOhvd4fy9FY3x/DdNMK3CWrZIdDr
 1FTnAY+UcjRUz95Nk+GL40X64QrCeKvDw4FhK2HjaoxDEBLEMtJwHrTfgCuXGDmodM+VacTRmzH
 iJkCnPyec8Zc7AB4992/kpv5D10r37P53omvdn3rIN4AFGXaG51Dl7fl5Q/XmEtLBemRMqHKuwX
 48TsdxSj6y1Wptj+jmAEVlx+HS6+qLwpA/dgrCIvktMXaOI3cV/T7fA7RPACCTopDbbPBWXRWQs
 TBW5Gs8gEYui4Q08JL0Ik8PunTViOIy8Q8hNNUcPWV220Biu1aQnMJQLLJ8ARzEWFdFvtTrY+bh
 o/eUlgEoni7oIu
X-Google-Smtp-Source: AGHT+IFLuh7hLmB3OCi2rCYdGej4o3AbyEiGyG+VTXpzKGHWHa/tEgW6eba5+uzwS6ylfJZwL6TVtg==
X-Received: by 2002:a05:6214:2523:b0:74a:c41c:1614 with SMTP id
 6a1803df08f44-7991cbb4c5bmr136386876d6.48.1758554704238; 
 Mon, 22 Sep 2025 08:25:04 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com
 (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-793548c6e02sm74743246d6.60.2025.09.22.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 08:25:03 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfauth.phl.internal (Postfix) with ESMTP id 38708F40066;
 Mon, 22 Sep 2025 11:25:03 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Mon, 22 Sep 2025 11:25:03 -0400
X-ME-Sender: <xms:T2rRaJh3AXIyZRADqZDkJRc9F_XwjvvGgVNn09ufyoy004M33RJ7Wg>
 <xme:T2rRaJCMDl5Lw5LPgoT5jE81B3B6rxyeC4HnFFlqVp6V6wtJIL2a-d-P1H5naEPWj
 _yvz-yckVHuUq6q6wAtOz7xOcnCaPi3QKEuS7t307-cr0l7vycHWA>
X-ME-Received: <xmr:T2rRaPuLA2I4fOIUYCy81l7cMsrcAZGayDDK5CpKVAXkQh57DbVxbpBIzKKvl7G_G6RtAsOzOW4z0-C2Jd1r-IJ0_ARAzNzm>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkedvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
 vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
 hrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveeiudffiedv
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqh
 hunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddu
 jeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvg
 drnhgrmhgvpdhnsggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghp
 thhtoheprghpohhpphhlvgesnhhvihguihgrrdgtohhmpdhrtghpthhtoheprhhushhtqd
 hfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughr
 ihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtth
 hopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprggtohhurhgsohhtsehn
 vhhiughirgdrtghomhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
 gtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
 ghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesph
 hrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:T2rRaL4t858O6616lJKjIOoRtNlD3un5kYPG9N8BQ_y54SQBcVMugA>
 <xmx:T2rRaBdUvNQAMWWUBEHyjzmjX8zh3-cMtAisohU5OXhgnb6cnsLEkw>
 <xmx:T2rRaLWmkpenwAmwnz-Prn2wXG-aTNpGUud4OQdFCUGezJ2cznjPig>
 <xmx:T2rRaGXlXRj_c2jlwOXNraSakXxl_Fs7Qa8MMJY3OSLo_VUTYkbcAg>
 <xmx:T2rRaEQFjF6qobnGRJILdvn2WdI0fvS12vl2HovQJZYF8b4vLZzhPY9c>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 11:25:02 -0400 (EDT)
Date: Mon, 22 Sep 2025 08:25:01 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 01/10] gpu: nova-core: Set correct DMA mask
Message-ID: <aNFqTYkkY4qgCyWP@tardis.local>
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-2-apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922113026.3083103-2-apopple@nvidia.com>
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:17:01 +0000
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

On Mon, Sep 22, 2025 at 09:30:17PM +1000, Alistair Popple wrote:
> Set the correct DMA mask. Without this DMA will fail on some setups.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> 
> ---
> 
> Changes for v2:
> 
>  - Update DMA mask to correct value for Ampere/Turing (47 bits)
> ---
>  drivers/gpu/nova-core/driver.rs | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
> index 1380b47617f7..ccc97340206e 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -1,6 +1,9 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> -use kernel::{auxiliary, bindings, c_str, device::Core, pci, prelude::*, sizes::SZ_16M, sync::Arc};
> +use kernel::{
> +    auxiliary, bindings, c_str, device::Core, dma::Device, dma::DmaMask, pci, prelude::*,
> +    sizes::SZ_16M, sync::Arc,
> +};
>  
>  use crate::gpu::Gpu;
>  
> @@ -34,6 +37,9 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
>          pdev.enable_device_mem()?;
>          pdev.set_master();
>  
> +        // SAFETY: No DMA allocations have been made yet
> +        unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<47>())? };

Any chance you give it this a const name? Otherwise 6 months later it
becomes a magic number ;-)

Otherwise than this,

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

> +
>          let devres_bar = Arc::pin_init(
>              pdev.iomap_region_sized::<BAR0_SIZE>(0, c_str!("nova-core/bar0")),
>              GFP_KERNEL,
> -- 
> 2.50.1
> 
