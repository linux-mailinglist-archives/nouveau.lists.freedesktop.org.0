Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCAC90918B
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2024 19:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B0F810EA93;
	Fri, 14 Jun 2024 17:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qbtMJw70";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE6D10EDFC
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2024 17:33:03 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a6eso24038151fa.1
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jun 2024 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718386381; x=1718991181; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6A2ldgCGRbiaAOg5pCXVmpJrxkciuNJ03uPiR1OSrWk=;
 b=qbtMJw708B2SfznQojpV/8Pw0VuMTdB9NvJlO9lzWJvCTL3NevWEcBM38qLyVswziU
 kHs+vnOwfAax5bBeOx1Fte94e/asA0Yceij9X3VHjHw08oD6k5GEE2snM0FxK9UlMxZN
 tzNYUQAzOvwBlX0TJKTlisBIE3pm9h/jLwquVAnk/PIhyxeTm13mnYoh40mwmxOyRds8
 rKXzRpVqBPJTN1QpRFz9iiwBccBvZTMgn3VxNNng66o6ZdY4oRBjk1nUq46NfgW4m5Fl
 5H7N5y7PHUhI9oe8hxnzZbIo5JDKr0gzzB/9Lu4CY07IPtr2RT5JyN8RdeiQ0Lw0uAjW
 BQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718386381; x=1718991181;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6A2ldgCGRbiaAOg5pCXVmpJrxkciuNJ03uPiR1OSrWk=;
 b=WzEIDFGqt6G+QeCZ12dbRvwp1JR4WEHG0/kvYH9/2EWxolKhsOIhs381lUwqFTQa5O
 coV6l3Z+1tPFOUc1Hmv8E3bCH4vurYCiLgsePEKv3nEzWx6NiBuxQof+AZKdRjoZOu92
 hgKZESAP3ijDRZiqGkAqZXp+6W2+4NscAs4ixdnpZMq2/rXFWGOqe8HXF6tJgTGjMrr5
 Qrh8Ej1DyqB/eroWmEL0L9nLmQX0pcTZnxM395y1cwy3wImHWNtZfRw65wvQ7ETST7+t
 v0t4ZlBf1Y3zV1VpC3k5G+X6KN6InyYpWGUb0CE0/IF9HSzSnfI1WpAw6y0mYihN8yGw
 enMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYQ1xH3VLYKXGGb/uPT/zg3s1UDgA3cEmofizaoyCO17m0hfpICimVP5hL5csLNr7iPjsy1DENIRLTOrCUswrYhOT362AUsdAmN8nE4Q==
X-Gm-Message-State: AOJu0YxuumE0SMkjreFmRdV+yNDQO63yxPubbHneITIL+xcADXXwevtx
 gYJ59jR0geT23U7O7c4erFQfXgALwLE2eMCna2D1kp2GfGGlqwK4hvknmyk4Bmk=
X-Google-Smtp-Source: AGHT+IGGflvW9k9jMoe4a2j7bLc5DjsbVsi5TuTQwGN5Sq94prukV63YQPojspKpGvkvTN5wWda3rw==
X-Received: by 2002:a05:651c:220b:b0:2ec:165a:2250 with SMTP id
 38308e7fff4ca-2ec165a2453mr18905411fa.6.1718386381498; 
 Fri, 14 Jun 2024 10:33:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec05c06fecsm5894881fa.49.2024.06.14.10.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 10:33:01 -0700 (PDT)
Date: Fri, 14 Jun 2024 20:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, 
 Melissa Wen <mwen@igalia.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, 
 Simon Ser <contact@emersion.fr>, Pekka Paalanen <ppaalanen@gmail.com>,
 daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>,
 'Marek =?utf-8?B?T2zFocOhayc=?= <maraeo@gmail.com>, 
 Dave Airlie <airlied@gmail.com>, ville.syrjala@linux.intel.com,
 Xaver Hugl <xaver.hugl@gmail.com>, Joshua Ashton <joshua@froggi.es>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v6 0/8] drm: Support per-plane async flip configuration
Message-ID: <lxfxqbax6azdpeamwm2qqv2tulgxrb7y3qzb4ir4myt6x5sqez@imd3yd5mbk7u>
References: <20240614153535.351689-1-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240614153535.351689-1-andrealmeid@igalia.com>
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

On Fri, Jun 14, 2024 at 12:35:27PM GMT, Andr� Almeida wrote:
> AMD hardware can do async flips with overlay planes, but currently there's no
> easy way to enable that in DRM. To solve that, this patchset creates a new
> drm_plane field, bool async_flip, that allows drivers to choose which plane can
> or cannot do async flips. This is latter used on drm_atomic_set_property when
> users want to do async flips.
> 
> Patch 1 allows async commits with IN_FENCE_ID in any driver.
> 
> Patches 2 to 7 have no function change. As per current code, every driver that
> allows async page flips using the atomic API, allows doing it only in the
> primary plane. Those patches then enable it for every driver.
> 
> Patch 8 finally enables async flip on overlay planes for amdgpu.
> 
> Changes from v5:
> - Instead of enabling plane->async_flip in the common code, move it to driver
> code.
> - Enable primary plane async flip on every driver
> https://lore.kernel.org/dri-devel/20240612193713.167448-1-andrealmeid@igalia.com/
> 
> Andr� Almeida (8):
>   drm/atomic: Allow userspace to use explicit sync with atomic async
>     flips
>   drm: Support per-plane async flip configuration
>   drm/amdgpu: Enable async flips on the primary plane
>   drm: atmel-hlcdc: Enable async flips on the primary plane
>   drm/i915: Enable async flips on the primary plane
>   drm/nouveau: Enable async flips on the primary plane
>   drm/vc4: Enable async flips on the primary plane
>   drm/amdgpu: Make it possible to async flip overlay planes
> 
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 2 ++
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c         | 3 +++
>  drivers/gpu/drm/drm_atomic_uapi.c                       | 8 +++++---
>  drivers/gpu/drm/i915/display/i9xx_plane.c               | 3 +++
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c                 | 4 ++++
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c                 | 4 ++++
>  drivers/gpu/drm/vc4/vc4_plane.c                         | 4 +++-

The main question is why only these drivers were updated.

>  include/drm/drm_plane.h                                 | 5 +++++
>  8 files changed, 29 insertions(+), 4 deletions(-)
> 
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
