Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6B8C84345
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 10:24:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994010E396;
	Tue, 25 Nov 2025 09:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="DdqXD3HA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE29610E396
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 09:24:01 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-477a11d9e67so35841295e9.2
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 01:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1764062640; x=1764667440;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdct6hRNMC2a33F1SDQTUemoosYNL7hA0Cpixkq+5aE=;
 b=DdqXD3HA9o6hl9YHlqKyAujZrj4bmkOvNOqWd6ePGXtKTFO5QG1QQyPF2w/T9ma5wc
 MgTbt4NlZe3hRsqya9sv4Zqj8ey6mAhOkw6nxBV3Ucds/wY7qkATIg1uDlYRXZbRTV47
 VPbHAVBwta43Jp+E4+UAZe+qbASPyUeK2HmGiCFstJwcPieM4akSfdFN2VnQJB2hqnGp
 DvfbSF4519IShTWZhVQllOp1rGNdaWh9MubL/Y/hSJ3v9ZC+cugm9SBkKFHI3QaeL1iZ
 0xQ/jgKR4JpkT8gXjHHES7kp5CjBSQ1XG8bllVWMiF66IIZWQiojdOvqkIkqehFTA64t
 vdGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764062640; x=1764667440;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gdct6hRNMC2a33F1SDQTUemoosYNL7hA0Cpixkq+5aE=;
 b=saRswVtdCieUzNHFvt57XpeIKF3g17qPs5JGhBnZULBYVL5H33U2bV/zftMxEhSffX
 N9tr7U4BP2sG8tYAvUd6tOOFoUeUVlkoFUuJIokCWfOATRuAJaCiNxKr7WbN9B7un2jd
 8tYof2otvtLAJEjUQOUMwbVkJ3MVxXhSCYeDKwXMWTgKCddCrUqv9uZ6oZT2SQJUNFs2
 41KAiqAqL6cS7QJvan0LsDm/CW1raWxnyDOq8YMb7a5NqinJKLvRtS4XPttlj2C8DWWS
 kmlo5rhQ0EDckWJozpuGnxu5aG+S2hmdJknitbtdGUhZlP73HBSt+BhN34Voe9fZ5B94
 sMDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG7ct4hBMLJtPppA5c4CVD7jTwmEyLaGalgBka8z3PJJmQCtqzDPeBjKRf/HAtSbgv+I+ouvmR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2+eVBr1rO1bIanXckBdU+g8oZWD0dwrHFrC39DnoOH4VCFpWF
 DuvTLn8JCdrkLB73ac3QVYPIMV2dMMIZcouvfPw63Plw2tdZOU1Goh7B0RDif5MSPcgN5yHJZy+
 PTHigYCsk1bIkdCJa4A==
X-Google-Smtp-Source: AGHT+IGgXo8y5EZjUDnBVwTOnyAZJVGtwWGypNxUeeXb63lWRcPTjmeoWUCMdN3xat5RPemCnmCh9NC4gbF2QE0=
X-Received: from wmih8.prod.google.com ([2002:a05:600c:1448:b0:477:a2ad:bddc])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3588:b0:477:bcb:24cd with SMTP id
 5b1f17b1804b1-477c11179ffmr162794335e9.22.1764062640310; 
 Tue, 25 Nov 2025 01:24:00 -0800 (PST)
Date: Tue, 25 Nov 2025 09:23:59 +0000
In-Reply-To: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
Message-ID: <aSV1rxXq4KuInexy@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page
 size
From: Alice Ryhl <aliceryhl@google.com>
To: bshephar@bne-home.net
Cc: dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com, 
 jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, brendan.shephard@gmail.com
Content-Type: text/plain; charset="utf-8"
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

On Fri, Nov 21, 2025 at 02:04:28PM +1000, bshephar@bne-home.net wrote:
> Use page::page_align for GEM object memory allocation to ensure the
> allocation is page aligned. This ensures that the allocation is page
> aligned with the system in cases where 4096 is not the default.
> For example on 16k or 64k aarch64 systems this allocation should be
> aligned accordingly.
> 
> Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> ---
>  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.rs
> index 2760ba4f3450..a07e922e25ef 100644
> --- a/drivers/gpu/drm/nova/gem.rs
> +++ b/drivers/gpu/drm/nova/gem.rs
> @@ -3,6 +3,10 @@
>  use kernel::{
>      drm,
>      drm::{gem, gem::BaseObject},
> +    page::{
> +        page_align,
> +        PAGE_SIZE, //
> +    },
>      prelude::*,
>      sync::aref::ARef,
>  };
> @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl PinInit<Self, Error> {
>  impl NovaObject {
>      /// Create a new DRM GEM object.
>      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef<gem::Object<Self>>> {
> -        let aligned_size = size.next_multiple_of(1 << 12);
> -
> -        if size == 0 || size > aligned_size {
> +        // Check for 0 size or potential usize overflow before calling page_align
> +        if size == 0 || size > usize::MAX - PAGE_SIZE + 1 {

Maybe this should use isize::MAX as the maximum size instead? That's a
pretty common maximum size for allocations in Rust and big enough for
everyone.

Alice

>              return Err(EINVAL);
>          }
> 
> +        let aligned_size = page_align(size);
> +
>          gem::Object::new(dev, aligned_size)
>      }
> 
> --
