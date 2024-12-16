Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D262A9F302F
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2024 13:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1E10E5E5;
	Mon, 16 Dec 2024 12:11:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XeTKW15b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D714610E5E8
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 12:11:46 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3004028c714so40623101fa.2
 for <nouveau@lists.freedesktop.org>; Mon, 16 Dec 2024 04:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734351105; x=1734955905; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QYJ6bHIynmrdW1kW95N7YBXu67T1wjVBtmzNbXMkjmY=;
 b=XeTKW15bcNMi/ipMzG+AQV+aabI1vWgMCS6VMJZ0YYko9zznE2tDIVWiQVsG8v3oV9
 yyw+TlWKxmsYOy14AuwZJxnMhqsIFrITP5nkvFZ3ZsuGTatSeb3JMXct2a3gVjyFgHpE
 U0wt155XM3RXxHkklZ90HeFzF1HWdewiOAfBj7QNR3d7b49arL5B32KA52krVIpbPiN1
 FdZkBBcNuTo5N5wn87Obi8/wGJmg3ZF6wOBMaBPChYquJF1ubImNlZvmg1E0oH3zU8ip
 Hhp2I1KRvBYdpCFepgCq6rDZI1+3OLyF1bK3OynVJvAo4yIZOsDJcbMoo8++4OU02mmb
 K9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734351105; x=1734955905;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QYJ6bHIynmrdW1kW95N7YBXu67T1wjVBtmzNbXMkjmY=;
 b=HNoHt1RgHPXORuHKg2tN7Jm3YnFzL1h4GgDI13U2ty4kdl2ORxvFJUi1Jrly7w98cE
 wjbWXWY+OLiIPSbOLd21Ml0pDbynj0kXKjsVQGzKA5Hb93Ua+W1ehVhT/MseGJQbyg0f
 MmctN/1idmhBi6RF7N3KI5iTSbMCuKmOXS5u0yo1Mb0QkaB9qq+4uv3xJCVUP+VHnS/e
 i6JeqjOT2eJmfUUEuObkFLob6eD9Q0PzO2JJInRFicL8s3b5oJ76nwF4o4mHv8aYrZGw
 BbROLJ7sFsa450kRecUbXMxrtqVktC+3C6T1txPe1and3oqtDay+eMaeWo5W66Jw4Ns2
 ePuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9Use33xeA9BbbXMwA2dGQD5Cx6Sp318GXI+b3v8X/Ql1v3PyM+lT7IR25/phNsjo3LO7d8xLV@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxykr+ziiKLzhknfcONFiItqId5ELABdk2ztWgeW/Wt4N3TyUWh
 sbMVCp7O9C+VgdfqlWhfQvOakqyZctp9zr/8I+yrKQQsFNbUGtgcokXg45LMqnE=
X-Gm-Gg: ASbGncv6Lo3XDA1U8ZIqf3wcVJFnOGNCnnB0oMTeP3NZ/4nZD/DrFJzura8/HkNoQk+
 3WefnLz+D/Vz4tYSvIDiBIRCqoWUryNea4UgzHoEVNFPFV5rpuSiH68NQmXNb+8JW88yb43f6cJ
 bH/9vqcwBx+LbNwhmqKBvCa5jVCi+b7cepgvjclLNJjtstwPrRx8vFGVV5IkSr4nJZgscIYjwC2
 RwS18qI4dmnrXNqKNzdbQgDSbI2oKAlujuyFYTc3YjME6m1yWGXkpuGALYJignX8m7gIYWFeCPc
 ogkkwlCxoc4WVVWITJT6oL1likZTvIhnsRuE
X-Google-Smtp-Source: AGHT+IHrwRS1QfWMBwy9QLkErfwsKJMw9vVs4tgqRJfw5TQSQERm2FXX9oalBSjWvdHKRYw73Gk+nw==
X-Received: by 2002:a05:6512:308e:b0:540:3550:b1dd with SMTP id
 2adb3069b0e04-5408b800785mr4235963e87.3.1734351105082; 
 Mon, 16 Dec 2024 04:11:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120c13eb8sm822646e87.218.2024.12.16.04.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 04:11:43 -0800 (PST)
Date: Mon, 16 Dec 2024 14:11:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <fw7i3kusogrrsslb5sjdid27uqnwey5qa5yhyrfa677n4iqqhq@tfh5s6bmqgna>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
 <Z2ASy3TQ4suupdvd@cassiopeiae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2ASy3TQ4suupdvd@cassiopeiae>
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

On Mon, Dec 16, 2024 at 12:45:15PM +0100, Danilo Krummrich wrote:
> On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> > The nouveau driver is the only user of the drm_encoder_slave interface.
> > Demote it from KMS helpers module to the nouveau driver itself, moving
> > corresponding I2C encoders to be handled by nouveau driver too.
> 
> I understand nouveau is the only driver using this interface (and the
> corresponding i2c encoders).
> 
> However, I'm not quite seeing the advantage of folding the interface (including
> the two i2c drivers) into nouveau. I don't think this legacy interface does harm
> the subsystem in any way / does prevent the subsystem from moving forward.
> 
> Can't we just keep it as it is?

Well, drm_encoder_slave is a part of the DRM KMS helpers module, so it
take (a little bit) of space on every system. The nouveau situation
isn't unique, other drivers (i915, ast) also incorporate the code for
I2C backends. For the further discussion see the thread starting from
Laurent's email ([1]).

[1] https://lore.kernel.org/all/20241117205426.GE12409@pendragon.ideasonboard.com/

> 
> > 
> > Ideally those two drivers should be converted to the drm_bridge
> > interface, but it's unclear if it's worth spending time on that.
> 
> Probably not.
> 
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v2:
> > - Renamed symbols in defconfig (Laurent)
> > - Added missing Kbuild file (Laurent, LKP)
> > - Renamed guarding defines in include files.
> > - Dropped mentions of two removed functions.
> > - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> > 
> > ---
> > Dmitry Baryshkov (2):
> >       drm/nouveau: incorporate I2C TV encoder drivers
> >       drm/nouveau: vendor in drm_encoder_slave API
> > 
> >  arch/arm/configs/multi_v7_defconfig                |   4 +-
> >  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
> >  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
> >  drivers/gpu/drm/Makefile                           |   1 -
> >  drivers/gpu/drm/i2c/Kconfig                        |  18 ----
> >  drivers/gpu/drm/i2c/Makefile                       |   6 --
> >  drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
> >  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
> >  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
> >  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
> >  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
> >  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
> >  .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
> >  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
> >  .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
> >  .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
> >  .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
> >  drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
> >  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
> >  22 files changed, 172 insertions(+), 232 deletions(-)
> > ---
> > base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> > change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 

-- 
With best wishes
Dmitry
