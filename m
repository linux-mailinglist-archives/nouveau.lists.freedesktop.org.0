Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E145DCCAC49
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 09:05:43 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C79310E4C6;
	Thu, 18 Dec 2025 08:05:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="07W6F93D";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C06D54566A;
	Thu, 18 Dec 2025 07:58:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766044691;
 b=DeI8jN21fpjlHo5iTsEvwW95kLHJBIk6fXFbuMjuOXnlS61EPVwRK73NiUdwegk1EKdT7
 RWSQdZxbES8fpS3bHQ2SDJHQB8r/crf8xjMzQRwLizXZ+yhYccy/88sWWkPT359Z7uwGm/2
 OVYAsH5jCWmi5m3NFT8uG4eGAAbYnxwEzmvK59VZLLdqE0MIdI9lY+xhZwIUwnWgEyRdKFo
 knoyc43BmN4l7qksVnhu2jqn2wR1SVLcmQM9gSt+9l/yyThTneJ9CYiiXAW03aFcLBOCrT8
 j+zrEyrXVB5HwiH0lvMz7miZoLsPx8khAo8o5IFM2T51P560QFzqeolnNHjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766044691; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uRQ5e+m9uoKPLq4mwQ9uY7M3Le121e2VbM1UWFU+Zek=;
 b=rhEp0i8aGFsF/HOS6YdHBSlfOCtxfTMMRL6X+m5My3THlID63A0+6aBrF/0UCskQDQtsX
 eGLF2h8OrFc+4BmzJXISeM6ZkQVJeWD4byps+z25NMzn0fXRg2DHg0qGqOaAP8VR9uly9c7
 xSzKusnajBYn5ryyH3wTLP+IYhCM4HLYnyrb+glnWXHaEIFyTpl2PRt2R7HFW3dXOXPw8KF
 HdFG4Eyi+8490F73uzySXMit01elF2KJYOMxbwfl4oS2PPaIbXyzIYlw1apDLD+bzbZKpV+
 dImlaFAku6lWZCaDpt/DxOXN/NQPNGOi4/L/yfsylWUBSWPPgcOQ9mVDk6kQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E6E3A434AB
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 07:58:08 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 05EA710E2E4
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 08:05:39 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477563e531cso2115545e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 18 Dec 2025 00:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766045137; x=1766649937;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uRQ5e+m9uoKPLq4mwQ9uY7M3Le121e2VbM1UWFU+Zek=;
        b=07W6F93D8USpyaq8FaZ4FudNE81vCvMAzNJyeW+MSSrsuSw8iIW8ZGRzkg2FXlvFpn
         khDp0CBYd7ajOPcDcJRicKzbseFr37+hvSzyqecw7bN1XqGlBG76fGHloUrhwllomXTH
         /QTY3FYzyzn69ieV2F9wb1/5lqnFLR3gHDyMDhR4gt6YraqAAw40kWDh0dEI0Z/FhmHd
         7SNZtYH8uu8keUU6qQKHcYdlUai6TWsjCFg507IfqortvR72gQtG+8qy+fgisn00pBQG
         WhEVIKqS1sT1tzbUPha04jYke5avWfWPLEFxUiTGfR/p1Mbwc0YIPF8rqS/CdKial9oW
         icGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045137; x=1766649937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRQ5e+m9uoKPLq4mwQ9uY7M3Le121e2VbM1UWFU+Zek=;
        b=pAlG6i8AOXExAeZ/3hNSWaXXtj5UBI3EOv7//nrnUp9lTd1wE88uQfQC+Z6tmTbeqg
         t3RcK7HEOultDxu+rh8T4vlkUCBDxY8p8lb/OO06Tuc0wpJ6FWzzVdm+w6pFa7ny/q+L
         wXKbmVZNEFK9sAhspPsPxHgvSUiK917URx1CyQuO4EVRXo+/xAB18OjlDywAvmaY6Fia
         6LJZHXgltOeUU2nqbYjE611C1NsiTnSv+V4THJNz+DLyYeAh3+gM7DhkXNGTLt8wvkM+
         vpYsvI5T/2IzWmtgS4cNxgQGk1B3nJXAytEO+2pjMNKb2FOwmp4arBu8tbWe2seD1T4o
         Yq6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNlQ3S1wZxSUci5UddIU13oxlwCw/WnNc0TLnW/W9kNkyUIiTmTVIjz1UpB87w4VRC12D0FTLe@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZ5Vha3nu0zUyJiTNH0znadLq355gSBEVqMd6YjGV6qvc+ISR9
	bQ1RgO+B0rTFXvUTaVr91xSeZpUw9a89b8Y06C87Rdgs17vZaah3HUiFjbHw9zwT3Zk2pKFkO4z
	hjBN+ZdxQIRtVSLAnbA==
X-Google-Smtp-Source: 
 AGHT+IFVLyUGqFPXJ/jLNqh/Cl8WufsEt+eQXJAGeUY8rF/nuPbWg44OEIh9nHDvKSQrufrdEJV+VPCsyhXDC+g=
X-Received: from wmlm24.prod.google.com ([2002:a7b:ca58:0:b0:46f:b32b:55f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46cf:b0:477:a3d1:aafb with SMTP id
 5b1f17b1804b1-47a8f90d757mr205509055e9.29.1766045137608;
 Thu, 18 Dec 2025 00:05:37 -0800 (PST)
Date: Thu, 18 Dec 2025 08:05:36 +0000
In-Reply-To: <20251218013910.459045-2-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20251218013910.459045-1-ttabi@nvidia.com>
 <20251218013910.459045-2-ttabi@nvidia.com>
Message-ID: <aUO10KftOHuOwDeP@google.com>
Subject: Re: [PATCH v3 1/9] rust: pci: add PCI device name method
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: IUME6NUPFRJE3326FLBZKX6EHFBNMH32
X-Message-ID-Hash: IUME6NUPFRJE3326FLBZKX6EHFBNMH32
X-MailFrom: 
 30bVDaQkKB5w6HE8ANUDHCKKCHA.8KIJKQRA6QHEOPO.BNAA9AOGPKL.KNC@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IUME6NUPFRJE3326FLBZKX6EHFBNMH32/>
Archived-At: <https://lore.freedesktop.org/aUO10KftOHuOwDeP@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Dec 17, 2025 at 07:39:02PM -0600, Timur Tabi wrote:
> Add a name() method to the PCI `Device` type, which returns a CStr
> that contains the device name, typically the BDF address.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/pci.rs | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
> index 82e128431f08..125fb39f4316 100644
> --- a/rust/kernel/pci.rs
> +++ b/rust/kernel/pci.rs
> @@ -427,6 +427,43 @@ pub fn pci_class(&self) -> Class {
>          // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
>          Class::from_raw(unsafe { (*self.as_raw()).class })
>      }
> +
> +    /// Returns the PCI device name.
> +    ///
> +    /// This returns the device name in the format "DDDD:BB:DD.F" where:
> +    /// - DDDD is the PCI domain (4 hex digits)
> +    /// - BB is the bus number (2 hex digits)
> +    /// - DD is the device number (2 hex digits)
> +    /// - F is the function number (1 hex digit)
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::{c_str, debugfs::Dir, device::Core, pci, prelude::*};
> +    /// fn create_debugfs(pdev: &pci::Device<Core>) -> Result {
> +    ///     let dir = Dir::new(pdev.name());
> +    ///     Ok(())
> +    /// }
> +    /// ```
> +    #[inline]
> +    pub fn name(&self) -> &CStr {
> +        // SAFETY: By its type invariant `self.as_raw` is always a valid pointer to a
> +        // `struct pci_dev`, which contains a `struct device dev` member.
> +        unsafe {

What's the actual unsafe operation in this block? We generally try to
limit the scope of unsafe as much as possible.

Alice

> +            let pci_dev = self.as_raw();
> +            let dev = &raw const (*pci_dev).dev;
> +
> +            // If init_name is set, use it; otherwise use the kobject name
> +            let init_name = (*dev).init_name;
> +            let name_ptr = if !init_name.is_null() {
> +                init_name
> +            } else {
> +                (*dev).kobj.name
> +            };
> +
> +            CStr::from_char_ptr(name_ptr)
> +        }
> +    }
>  }
>  
>  impl Device<device::Core> {
> -- 
> 2.52.0
> 
