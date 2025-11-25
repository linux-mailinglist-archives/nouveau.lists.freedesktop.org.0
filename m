Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DDBC85C9A
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 16:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B6610E421;
	Tue, 25 Nov 2025 15:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="jE/3c8sZ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15BA10E421
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 15:33:24 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-b737502f77bso814580066b.2
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 07:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1764084803; x=1764689603;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
 b=jE/3c8sZDi01KZmUPQyCNFxN2nsByHjowKkCU9dQcBhksmgb1JHrX6TyjhJ2b7IgGB
 qSR/dnBCTTjKmXQ19Wubkqrg+nMiL89TLsPTZD5h2EWAjbTyERctxhfyb/8cAKphwhNN
 sg4GK4wrg/xq5xeqZEdQZEuoRoJK6Wl+3rWmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764084803; x=1764689603;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wCZdld6CYrWFXkrUxJ5abCqUL/Pa1DX9edqJLOysax8=;
 b=BiEEDAsUFQ+tjiN0vAgaLs7TXDV9HTEYkSXtWuj3qfHPZ3dkphkrK54Js+K/HS3JxY
 IHSCOIaNHB4hMpTElfiKJRSw76Dvk6C+9mcG7u+b36t43TCfPrPCJ195c2d3OALLzu+X
 6IYfwrdhRx8Hta1MO3bAmVLvya1AI05TBT+mIRjS9rabSEH5tJx5Zn2NNQrYMyXKKXKP
 7aYNE0sT9ZCNk09X7NSHECQWu0ayvBhY7gkkpDPXx88L+ehRi0DrtPT34MRfBByy3han
 fy8ifYDCpuTzr05E2nzXUI+XACO0ot8wXca3S6aRefbowMi88wMyGA5wnEhKvP7AoqvA
 lZQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQPA7WXW+PIXYFaQClVJfFB/Og/llqbVjLAzfS06xs/bi5gAYepdv80ASkL/hEmaTWoxxED7de@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwfsH4SAnVjKXEikGlL1Se/bYT94AAARsmM1rnm88rHG2LYEaTV
 TjX4wlHgveqRSlX7nk+trju5+bd88gvyZ0SCp14rt89vMuI7QcS7+LEVM7n48YeWWxhuV9VTq5q
 8aBGA8Bcz
X-Gm-Gg: ASbGncsMKSkR2lj92pkoERLX8xhz39JqePBBZYUCcTkGteuJccSrt1fiimusjTrkjv5
 xk0NbC7x1AqFvDeuzUkBkPH7MC9XrHlXM1sXO1peD+Hx0Dqf5vNkliQZTAefUqmQ1slezuFHC85
 tz/KKdhgMtmYh0p7u8cHGDRu/oRiGCIj17YEJItFmrz81o3nAccwpP+mvS6yDvDvGotaEAzKkEm
 FRRY4guv+lHXuhLf/vwUGCQhaboQydKWUnL06OFouZGkTyVVOj+QpEJLbCBmaGL0ZcO0evZ8D0K
 qBXT2shnKo+6nUBqfQKJhgZgkMphtbOsClADxEcaNJveWQ0ZOkZoh1PnvCgJNaSBrWO7uf5x2BG
 S5XHGCMqWwgn2Hr08VEiEJOzd9I1E2fkkwc4+eD94c8PuuacjBCad1D1pdXE8X75xa5kQGeaPA/
 TQa5eF9vMDGeV5R7QysvupMHTesQ0q5KyPApghDD9+hW2wqZ81AQ==
X-Google-Smtp-Source: AGHT+IF1DHcMDH4yphLqRfcGwJxX/gDPrZT7chUGkgTGOK4gSLmYQUtA3CVeE1dvEyA93a0FPF4Kqw==
X-Received: by 2002:a17:906:c142:b0:b70:b700:df98 with SMTP id
 a640c23a62f3a-b76c5356501mr326394366b.5.1764084802442; 
 Tue, 25 Nov 2025 07:33:22 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d56a70sm1624457766b.22.2025.11.25.07.33.22
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 07:33:22 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-6408f9cb1dcso1836864a12.3
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 07:33:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCV6sX9Fw/756qOx2yiq3K0fsgJlnSyNNy43/MjuC/y+zMf0Ez6azFJRIgpg3RfjR0a6DP3ODwO1@lists.freedesktop.org
X-Received: by 2002:a05:6000:381:b0:42b:3ad7:fdd3 with SMTP id
 ffacd0b85a97d-42e0f21e953mr3395597f8f.18.1764084405547; Tue, 25 Nov 2025
 07:26:45 -0800 (PST)
MIME-Version: 1.0
References: <20251125130634.1080966-1-tzimmermann@suse.de>
In-Reply-To: <20251125130634.1080966-1-tzimmermann@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 25 Nov 2025 07:26:33 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
X-Gm-Features: AWmQ_bldhiBpRCqVYkj0GufunmE0LiqT8gw4vCTv4PiT8j1h28du9Cx4NWXFEj8
Message-ID: <CAD=FV=X_-t2AF5osp7Hamoe7WYE_2YWJZCaPaOj=9seSbnwwVA@mail.gmail.com>
Subject: Re: [PATCH 0/5] drm: Remove remaining support for kdb
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, lyude@redhat.com, dakr@kernel.org, deller@gmx.de, 
 mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
 jason.wessel@windriver.com, danielt@kernel.org, 
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nir Lichtman <nir@lichtman.org>
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

Hi,

On Tue, Nov 25, 2025 at 5:06=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Remove the rest of the kbd support from DRM. Driver support has been
> broken for years without anyone complaining.
>
> Kdb cannot use regular DRM mode setting, so DRM drivers have to
> implement an additional hook to make it work (in theory). As outlined
> by Sima in commit 9c79e0b1d096 ("drm/fb-helper: Give up on kgdb for
> atomic drivers") from 2017, kdb is not compatible with DRM atomic mode
> setting. Non-atomic mode setting meanwhile has become rare.
>
> Only 3 DRM drivers implement the hooks for kdb support. Amdgpu and
> nouveau use non-atomic mode setting on older devices. But both drivers
> have switched to generic fbdev emulation, which isn't compatible with
> kdb. Radeon still runs kdb, but it doesn't work in practice. See the
> commits in this series for details
>
> Therefore remove the remaining support for kdb from the DRM drivers
> and from DRM fbdev emulation. Also remove the hooks from fbdev, as
> there are no fbdev drivers with kdb support.
>
> If we ever want to address kdb support within DRM drivers, a place to
> start would be the scanout buffers used by DRM's panic screen. These
> use the current display mode. They can be written and flushed without
> mode setting involved.
>
> Note: kdb over serial lines is not affected by this series and continues
> to work as before.
>
> Thomas Zimmermann (5):
>   drm/amdgpu: Do not implement mode_set_base_atomic callback
>   drm/nouveau: Do not implement mode_set_base_atomic callback
>   drm/radeon: Do not implement mode_set_base_atomic callback
>   drm/fbdev-helper: Remove drm_fb_helper_debug_enter/_leave()
>   fbcon: Remove fb_debug_enter/_leave from struct fb_ops

Personally, I've never worked with kdb over anything other than
serial, so this won't bother any of my normal workflows. That being
said, at least as of a year ago someone on the lists was talking about
using kdb with a keyboard and (presumably) a display. You can see a
thread here:

http://lore.kernel.org/r/20241031192350.GA26688@lichtman.org

Daniel may also have comments here?

-Doug
