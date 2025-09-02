Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E44A3B3F8BF
	for <lists+nouveau@lfdr.de>; Tue,  2 Sep 2025 10:39:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD5410E5D8;
	Tue,  2 Sep 2025 08:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="L4OpAzkV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A9F610E5D8
 for <nouveau@lists.freedesktop.org>; Tue,  2 Sep 2025 08:39:32 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-45b9c1b74e1so798595e9.1
 for <nouveau@lists.freedesktop.org>; Tue, 02 Sep 2025 01:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756802371; x=1757407171;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=JP1QA+RZ7uMNnI6suXZ0G9wwt/IV21LJWjZMZ+MqgQ0=;
 b=L4OpAzkVknhOoEYpJp1lLdKzZegSwWrMidPgay9TUfN0/n/IF5u7FO7HT9N9JjNBkt
 GUZn8rQfY+4LVsd6s48edF16gR3LKsfnq6meZF5vrIk+eDFrgyWI8IcW7+BIVahRSgJK
 N/AZVOPKtPlDa3kJRJ1fxpuCzEplML60q56ggbZbRr22FcXi5mK7w8rLswv+PLZT36BD
 MEnAC/UGcPOviJCbvZ+MmiS/TSrC6wd5+Kdmajlakj4OduwDcIfhnWFiwPUXEOK77I6i
 RDLWXjAryzS1o/yNMVSFvw8/Ls9H6BmZYhBMRL+vY44zNq74ylyKhnvVp20Vg0q7jHvl
 0jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756802371; x=1757407171;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JP1QA+RZ7uMNnI6suXZ0G9wwt/IV21LJWjZMZ+MqgQ0=;
 b=ic+eFS8t3lhBXYdrsgCCyl4orLS4DPOhlGOyPvn4wwJuAoL0FtaL91SsF7d95g9E8K
 DpUFibAOcIPl3Ib5X/tste0lMhC88+zyJzyvcrQYh9FIT6TMAdchdKm2a1bTov7Nw88z
 PVJMeNmzHDcxt7rYGE3OlQzhPgI6MD9PD++vfz9tr3DTS0J+9K60q/mtT++AFNzE7HgE
 5D9dD6b4GClkBG/TUKXal2cW6zA7SIv3GrtWPEXyPo2n3lKucuDj8kizq505oB38RZPE
 2hAYBLdiGHcTx7aHqq/vf4pPxaBiEs1FRO2owBmiAgMNhda0VOybCC6G23dDzQWCzw5R
 e8TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA1oX7wzu/sandXltScBQtKx1A6RBd4XjDvSvWvLdmu9NkGIOIJI5ER80GAs/JcBhLtVvFNwm9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxM2AnyrLjW6e8XEjoFRQF/uUWaB+8MZHmpXSiOg7RC7OtXFCij
 D4GbQ33Y2+MWriHwKBPjNQU5P+knLzHtxfRntYZv9kM9+dhHefcngdoJJvgYDgup6IFs8A14BVT
 tbT9ZiHyNp3VaRlG9bg==
X-Google-Smtp-Source: AGHT+IEJiBZvawIN2RgaGyQWpOpWEL1rOV3VDXt/kFR5FQk24WrYF7J15eKsT4qagQtBygvpi7Ak/mP13MhKKiw=
X-Received: from wmti8.prod.google.com ([2002:a05:600c:8b88:b0:45b:732e:5a16])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f94:b0:45b:772b:12b9 with SMTP id
 5b1f17b1804b1-45b855336dcmr90049625e9.15.1756802370679; 
 Tue, 02 Sep 2025 01:39:30 -0700 (PDT)
Date: Tue, 2 Sep 2025 08:39:29 +0000
In-Reply-To: <20250901202850.208116-1-dakr@kernel.org>
Mime-Version: 1.0
References: <20250901202850.208116-1-dakr@kernel.org>
Message-ID: <aLatQY1ea3on4n8I@google.com>
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

Acked-by: Alice Ryhl <aliceryhl@google.com>
