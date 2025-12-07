Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F32ACBABF2
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE65010EB32;
	Sat, 13 Dec 2025 12:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KpkPA2su";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FF310E061
 for <nouveau@lists.freedesktop.org>; Sun,  7 Dec 2025 08:26:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-64166a57f3bso5682554a12.1
 for <nouveau@lists.freedesktop.org>; Sun, 07 Dec 2025 00:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765095993; x=1765700793; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wUAqt5njeLVh6MrbdJefpUGQCUq+3iNdkFktE67ektk=;
 b=KpkPA2su5uiHXDNK35ohFD6wj2paZ1LSo1/seoYsevoAmGP1cNOtvUNw1OpJhqiMHT
 9GIa8Z23msOXbJPMBv2yQtDpVSOa4zEQZ6dCpwA0t2jMcgFed3TMiG7LG4I3wR/8XaAI
 5555aYKhfV/lpSe7JnYpTfla5CQF73q908gUdCWMbKcQYL4Taj2YSbKRoypSdjfwBMd/
 iso59w3lj6Pv4wnbU6R/8K0gpGfqc+Nor/ZsC8k+wYoiKdIiocghoi3/XPnonpIlXb2B
 Tc81PPbD+qoiPbSW13MFNSGYPri77nntLwMnwcGyCawxPf2GmF0e+gKk6Nhv1EwUxfUN
 xPZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765095993; x=1765700793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wUAqt5njeLVh6MrbdJefpUGQCUq+3iNdkFktE67ektk=;
 b=NzOkHlfYZQQtSA6UOttOZgAqRzvfR4qhWAOw0AWYKn12J6hCQhtemwG1yrvwJtmEVx
 kBQmDxXnH+QYOv1uRGIpev/YqGy5n6gG0eudezG8Eaiz74pr70y2Tle9RwKUrQ+Wes3d
 o1ii9WU0YmOzIuxO6g5GFIFGohOEKKYj7Bi8Y3WBLixGCBEngRD/5r2B3RoX27D4Svvv
 NNvzraMSdpd8eaa06uKMcsFfuPAPZFHscKQOhOnHDJUjNR1h2D0vYdGGtCTHFDZAMach
 AENxK3wPXtWHHr+nWGtMTejgmfqjv7VaScmphTyRytbvCdOAtzNkGUi/zX04DJeolR7i
 F8Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqmKEuNZoo4gpTAAOZDx5aFKdV01hCNN4fSNIYVJ0bB8jl1W+KwHwalftU/2HxiJkGiWzAVh52@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3yPzFKRBg7WmVm8iZYORcErp6NglALwqULxG4yZ9ejd7Wu5Ql
 SXw8y/1PME+ocOyLFRTWBH0tUoi9d2xBY9ppRDE09UlqovMvwWuWnWcJ4GAyjz1D
X-Gm-Gg: ASbGncvaiY1dVG405muQTPbchU362IyndDhw8EG8KxEyDbUURnZ2cYqjeKQ4UWWsJDw
 S2pyityavWL+X1TVzd7SKlhHvbjQqeYD6J6JJ/ud89rtWlKyy828/fiMeOJtZJoasoJlKnKBTP4
 74DA4Y6unCdYXb2hacFgugbXlrXGFEyU3FVPD6uBdaLsfX17dMImbz9irOT6oraAFoDwLs1mZJu
 gn5sN+o1jdwvjGPdG3F5qOcK+NJybR+klaf5w09GA/g2XdDjPxxWUs0rqr/b97gu6O51oWJocC7
 jGEbo++iqd7RhccThau/JbqX/ikQ0jnnY0qNy0559XKgNFBZUQLIoA2EZmiikvfEzkqYSXDLc1v
 /hRHhZ5K1js4feEpzeXqUpY0Yw3xOX6QwL1mJ4ouL8wmGeAwa96SdYDIENPuTOyTtJdFJfqh6Hx
 d8hvu7dmn50IYIVkFSEVnKIuNCpShboS1nND9vwpYz/dMAga8R8DEmJ5zi1iYYN8oID5fmoOEZW
 OF85qBwYg2nOnhKNmGZDUGHATP2T14M/dl77AuSCSY=
X-Google-Smtp-Source: AGHT+IEVqNfD63Og/iUd5redAtxSFIwiSLJ5eCxMwzhmCuXyLMf5his7H3QmVu2l6AnzMWhPzE8plg==
X-Received: by 2002:a05:600c:3b07:b0:477:1af2:f40a with SMTP id
 5b1f17b1804b1-47939e242f1mr45974225e9.17.1765089776787; 
 Sat, 06 Dec 2025 22:42:56 -0800 (PST)
Received: from ?IPV6:2003:df:bf22:3c00:1c42:64e:ef2a:93cd?
 (p200300dfbf223c001c42064eef2a93cd.dip0.t-ipconnect.de.
 [2003:df:bf22:3c00:1c42:64e:ef2a:93cd])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930ca15adsm179162575e9.13.2025.12.06.22.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Dec 2025 22:42:56 -0800 (PST)
Message-ID: <7fe8b05d-cb49-48bd-ac0a-d993e173924c@gmail.com>
Date: Sun, 7 Dec 2025 07:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 7/7] gpu: nova-core: load the scrubber ucode when vGPU
 support is enabled
To: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: airlied@gmail.com, dakr@kernel.org, aliceryhl@google.com,
 bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org,
 cjia@nvidia.com, alex@shazbot.org, smitra@nvidia.com, ankita@nvidia.com,
 aniketa@nvidia.com, kwankhede@nvidia.com, targupta@nvidia.com,
 acourbot@nvidia.com, joelagnelf@nvidia.com, jhubbard@nvidia.com,
 zhiwang@kernel.org
References: <20251206124208.305963-1-zhiw@nvidia.com>
 <20251206124208.305963-8-zhiw@nvidia.com>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251206124208.305963-8-zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:47 +0000
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

On 06.12.25 13:42, Zhi Wang wrote:
> To support the maximum vGPUs on the device that support vGPU, a larger
> WPR2 heap size is required. By setting the WPR2 heap size larger than 256MB
> the scrubber ucode image is required to scrub the FB memory before any
> other ucode image is executed.
> 
> If not, the GSP firmware hangs when booting.
> 
> When vGPU support is enabled, execute the scrubber ucode image to scrub the
> FB memory before executing any other ucode images.
> 
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs        |  1 +
>  drivers/gpu/nova-core/firmware/booter.rs |  2 ++
>  drivers/gpu/nova-core/gsp/boot.rs        | 27 ++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs            | 11 ++++++++++
>  4 files changed, 41 insertions(+)
> 
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
> index 2d2008b33fb4..5ae1ab262d57 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -226,6 +226,7 @@ const fn make_entry_chipset(self, chipset: &str) -> Self {
>              .make_entry_file(chipset, "booter_unload")
>              .make_entry_file(chipset, "bootloader")
>              .make_entry_file(chipset, "gsp")
> +            .make_entry_file(chipset, "scrubber")
>      }
>  
>      pub(crate) const fn create(
> diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
> index f107f753214a..f622c9b960de 100644
> --- a/drivers/gpu/nova-core/firmware/booter.rs
> +++ b/drivers/gpu/nova-core/firmware/booter.rs
> @@ -269,6 +269,7 @@ fn new_booter(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self>
>  
>  #[derive(Copy, Clone, Debug, PartialEq)]
>  pub(crate) enum BooterKind {
> +    Scrubber,
>      Loader,
>      #[expect(unused)]
>      Unloader,
> @@ -286,6 +287,7 @@ pub(crate) fn new(
>          bar: &Bar0,
>      ) -> Result<Self> {
>          let fw_name = match kind {
> +            BooterKind::Scrubber => "scrubber",
>              BooterKind::Loader => "booter_load",
>              BooterKind::Unloader => "booter_unload",
>          };
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
> index ec006c26f19f..8ef79433f017 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -151,6 +151,33 @@ pub(crate) fn boot(
>  
>          Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
>  
> +        if vgpu_support {
> +            let scrubber = BooterFirmware::new(
> +                dev,
> +                BooterKind::Scrubber,
> +                chipset,
> +                FIRMWARE_VERSION,
> +                sec2_falcon,
> +                bar,
> +            )?;
> +
> +            sec2_falcon.reset(bar)?;
> +            sec2_falcon.dma_load(bar, &scrubber)?;
> +
> +            let (mbox0, mbox1) = sec2_falcon.boot(bar, None, None)?;
> +
> +            dev_dbg!(
> +                pdev.as_ref(),


I think you can use `dev` here?

Dirk


> +                "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
> +                mbox0,
> +                mbox1
> +            );
> +
> +            if !regs::NV_PGC6_BSI_SECURE_SCRATCH_15::read(bar).scrubber_completed() {
> +                return Err(ETIMEDOUT);
> +            }
> +        }
> +
>          let booter_loader = BooterFirmware::new(
>              dev,
>              BooterKind::Loader,
> diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
> index 82cc6c0790e5..9f3a52ca014f 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -173,6 +173,17 @@ pub(crate) fn higher_bound(self) -> u64 {
>      26:26   boot_stage_3_handoff as bool;
>  });
>  
> +register!(NV_PGC6_BSI_SECURE_SCRATCH_15 @ 0x001180fc {
> +    31:29   scrubber_handoff as u8;
> +});
> +
> +impl NV_PGC6_BSI_SECURE_SCRATCH_15 {
> +    /// Returns `true` if scrubber is completed.
> +    pub(crate) fn scrubber_completed(self) -> bool {
> +        self.scrubber_handoff() >= 0x3
> +    }
> +}
> +
>  // Privilege level mask register. It dictates whether the host CPU has privilege to access the
>  // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
>  register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,

