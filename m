Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FBBB43901
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 12:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 527F810E9DB;
	Thu,  4 Sep 2025 10:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="hjGLJSjZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9354010E9DC
 for <nouveau@lists.freedesktop.org>; Thu,  4 Sep 2025 10:40:26 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-3dc3f943e6eso557977f8f.2
 for <nouveau@lists.freedesktop.org>; Thu, 04 Sep 2025 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756982425; x=1757587225;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
 b=hjGLJSjZt/qdFQzKrl+iLCHnvBaLr/Ru7F+mYeajPQqOVlQx9Esp+OOeqnS5FjbWCh
 XnP6Rsni1CKvhLS9N+rKo+8f4nRo4weqzJcn+RjLaqWvCDc+h8E72tqOt7VvjbeaFNMO
 6XYeaEoD1RQFh+Xstr3jINuAvbjFtMvFRkkhzOIA04JjoEnPKgrjjaSIeSYPTkzCROfn
 awws5I9QL6Gh2i2OEZpT29NcDw6L0FK4Pj9S52A80fy2r+sL84rYQCW0qxgtTY5SoIhe
 OsKzpRw+iHQ1Kko8A7+1DRLSzxp93obkYDPgJ7WbfmsPKzJEQKRwSuXQlLOnpmRlOXqs
 kTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756982425; x=1757587225;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6y2QOBZu14x36SZiIQblNfOse9Z30SqsU6mw32en+A=;
 b=Dlt85wDzmq6cFmgsscKt+vhQtljoF+asDHPRG0UDDzlDRkm/HIAFRvw7b2TtP2MauB
 AgxCM3d3zs/ztFXwzxuYnrecUh0RygBG91sPeJhzwpjVYUeyi2k51MXorM+NgsE70Rxk
 3ONk7FcuxadXlD3XqqRWDdFDH/k7z5L21MgVP9OxhzjZYWdsact5X6xZpY7WN2yE/3wl
 EwvTsc0fvtpLFVKK5EVJHp0GcvhYI00rYx+5zQVEysJhrqOWXYpk2VCxzUiTqkUj+AeE
 QN3JK1AFAl/sGKoULpsvA4wybHqfEBLeQe83IVonuqjXCmF2jjj8YAj+ntaHamLJsHhY
 dcyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1Yj2qhE3u2aUoNz0ikZBRE6T/Faijffu4gfpHVpsJycdGpTeTV1HA9ZwgO9YLy50pTtriccAL@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2Tz0AjHDLEpyrvP1yfqj2Q4SLwdIXfvJR5Bqgvu0oo6p4HlTI
 43282/ARbiFUk2NzocERoKa3rayx6cHdH3gph6+wEpLR0VmKK8X0ajPEaHV9iY1G/juPhBYTwjI
 j8YVPQgOWSMLFGewX4g==
X-Google-Smtp-Source: AGHT+IF9yvAHvKVOXXpEFHka86WFsWc+ojWObCx+xIgC+kdLnrHsvwSPcYjH86gfddOM2J9YtQ9wDriAn1Gd+jI=
X-Received: from wrbfu17.prod.google.com
 ([2002:a05:6000:25f1:b0:3e1:aeb6:bd24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:420c:b0:3d6:212b:9ae2 with SMTP id
 ffacd0b85a97d-3d6212b9f09mr13611267f8f.63.1756982425153; 
 Thu, 04 Sep 2025 03:40:25 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:40:24 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLlsmNzp_KardLUt@google.com>
Subject: Re: [PATCH] MAINTAINERS: Add drm-rust tree for Rust DRM drivers and
 infrastructure
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, acourbot@nvidia.com, 
 daniel.almeida@collabora.com, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Sep 01, 2025 at 10:26:39PM +0200, Danilo Krummrich wrote:
> Multiple DRM Rust drivers (e.g. nova-core, nova-drm, Tyr, rvkms) are in
> development, with at least Nova and (soon) Tyr already upstream. Having a
> shared tree will ease and accelerate development, since all drivers can
> consume new infrastructure in the same release cycle.
> 
> This includes infrastructure shared with other subsystem trees (e.g. Rust
> or driver-core). By consolidating in drm-rust, we avoid adding extra
> burden to drm-misc maintainers, e.g. dealing with cross-tree topic
> branches.
> 
> The drm-misc tree is not a good fit for this stage of development, since
> its documented scope is small drivers with occasional large series.
> 
> Rust drivers in development upstream, however, regularly involve large
> patch series, new infrastructure, and shared topic branches, which may
> not align well with drm-misc at this stage.
> 
> The drm-rust tree may not be a permanent solution. Once the core Rust,
> DRM, and KMS infrastructure have stabilized, drivers and infrastructure
> changes are expected to transition into drm-misc or standalone driver
> trees respectively. Until then, drm-rust provides a dedicated place to
> coordinate development without disrupting existing workflows too much.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Alexandre Courbot <acourbot@nvidia.com>
> Cc: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  MAINTAINERS | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe168477caa4..1cd6597c7f1d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8079,7 +8079,6 @@ F:	Documentation/devicetree/bindings/gpu/
>  F:	Documentation/gpu/
>  F:	drivers/gpu/drm/
>  F:	drivers/gpu/vga/
> -F:	rust/kernel/drm/
>  F:	include/drm/drm
>  F:	include/linux/vga*
>  F:	include/uapi/drm/
> @@ -8096,6 +8095,16 @@ X:	drivers/gpu/drm/radeon/
>  X:	drivers/gpu/drm/tegra/
>  X:	drivers/gpu/drm/xe/
>  
> +DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
> +M:	Danilo Krummrich <dakr@kernel.org>
> +M:	Alice Ryhl <aliceryhl@google.com>
> +S:	Supported
> +W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html

It looks like the right path is:
https://drm.pages.freedesktop.org/maintainer-tools/repositories/drm-rust.html

Alice
