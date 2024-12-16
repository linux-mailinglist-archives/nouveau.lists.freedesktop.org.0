Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D09F2FB2
	for <lists+nouveau@lfdr.de>; Mon, 16 Dec 2024 12:45:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114A010E5D0;
	Mon, 16 Dec 2024 11:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HBtpCDPi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A8210E5D0;
 Mon, 16 Dec 2024 11:45:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 847675C5C19;
 Mon, 16 Dec 2024 11:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6361C4CED0;
 Mon, 16 Dec 2024 11:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734349521;
 bh=WTOoaCm/YBEOFwnlmetmHLAw1bQPebroxLWPCI/KuzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HBtpCDPiiLGdhIMrs2nzQ0gaX8GQiSsbg9IRMMdwgeEWTJCnNRfPkkmDlopn93+fP
 u5oSbwSqUdfqmE7hS5WiQX1dzbzp45l3N5c4e1ehPquM9rmKBbnMys3d+m7/y4n1H5
 bQ8ad1/0Pm75iGknuobmgc+RpZi27qyyPKi2Hgc6wOPPiSkZnW2oVouZWDszqNicHG
 XCZdZTb6GR2y6wanoeCcIoaaSmBmm7B3dgC5u0IThQejxFZQO1OcPn1+wAVQD92V/c
 UHnZVrhmspfqU2KxRdnpsLGXuFBB6DvgjYcHmDphhnmKJHYNmqUFcotBPusfs+7u2B
 vqn1QQEUnY/vg==
Date: Mon, 16 Dec 2024 12:45:15 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] drm/nouveau: remove drm_encoder_slave interface
Message-ID: <Z2ASy3TQ4suupdvd@cassiopeiae>
References: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241215-nouveau-encoder-slave-v2-0-ef7a0e687242@linaro.org>
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

On Sun, Dec 15, 2024 at 12:19:22PM +0200, Dmitry Baryshkov wrote:
> The nouveau driver is the only user of the drm_encoder_slave interface.
> Demote it from KMS helpers module to the nouveau driver itself, moving
> corresponding I2C encoders to be handled by nouveau driver too.

I understand nouveau is the only driver using this interface (and the
corresponding i2c encoders).

However, I'm not quite seeing the advantage of folding the interface (including
the two i2c drivers) into nouveau. I don't think this legacy interface does harm
the subsystem in any way / does prevent the subsystem from moving forward.

Can't we just keep it as it is?

> 
> Ideally those two drivers should be converted to the drm_bridge
> interface, but it's unclear if it's worth spending time on that.

Probably not.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Renamed symbols in defconfig (Laurent)
> - Added missing Kbuild file (Laurent, LKP)
> - Renamed guarding defines in include files.
> - Dropped mentions of two removed functions.
> - Link to v1: https://lore.kernel.org/r/20241214-nouveau-encoder-slave-v1-0-beda767472e3@linaro.org
> 
> ---
> Dmitry Baryshkov (2):
>       drm/nouveau: incorporate I2C TV encoder drivers
>       drm/nouveau: vendor in drm_encoder_slave API
> 
>  arch/arm/configs/multi_v7_defconfig                |   4 +-
>  arch/parisc/configs/generic-32bit_defconfig        |   4 +-
>  arch/parisc/configs/generic-64bit_defconfig        |   4 +-
>  drivers/gpu/drm/Makefile                           |   1 -
>  drivers/gpu/drm/i2c/Kconfig                        |  18 ----
>  drivers/gpu/drm/i2c/Makefile                       |   6 --
>  drivers/gpu/drm/nouveau/Kconfig                    |  20 ++++
>  drivers/gpu/drm/nouveau/dispnv04/Kbuild            |   3 +
>  drivers/gpu/drm/nouveau/dispnv04/dfp.c             |  12 +--
>  drivers/gpu/drm/nouveau/dispnv04/i2c/Kbuild        |   5 +
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_drv.c    |  30 +++---
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_mode.c   |   8 +-
>  .../drm/{ => nouveau/dispnv04}/i2c/ch7006_priv.h   |  11 ++-
>  .../drm/{ => nouveau/dispnv04}/i2c/sil164_drv.c    |  33 ++++---
>  .../dispnv04/nouveau_i2c_encoder.c}                |  85 +++++-----------
>  drivers/gpu/drm/nouveau/dispnv04/tvnv04.c          |  20 ++--
>  drivers/gpu/drm/nouveau/dispnv04/tvnv17.c          |   4 +-
>  .../gpu/drm/nouveau/include}/i2c/ch7006.h          |   4 +-
>  .../gpu/drm/nouveau/include/i2c/encoder_i2c.h      | 109 ++++++++-------------
>  .../gpu/drm/nouveau/include}/i2c/sil164.h          |   4 +-
>  drivers/gpu/drm/nouveau/nouveau_connector.c        |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_encoder.h          |  13 +--
>  22 files changed, 172 insertions(+), 232 deletions(-)
> ---
> base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
> change-id: 20241214-nouveau-encoder-slave-a6dd422fa4a9
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
