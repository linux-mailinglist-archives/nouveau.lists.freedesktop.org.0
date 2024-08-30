Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E319966B33
	for <lists+nouveau@lfdr.de>; Fri, 30 Aug 2024 23:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A786710E028;
	Fri, 30 Aug 2024 21:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="No2Ym7CY";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="ecEgPjYD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod3-cph3.one.com
 (mailrelay2-1.pub.mailoutpod3-cph3.one.com [46.30.211.241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730FE10E1BF
 for <nouveau@lists.freedesktop.org>; Fri, 30 Aug 2024 21:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jEuY6S/kI3lo9LV32DY4PfRwtgqFMmCBoy1ALgvtglQ=;
 b=No2Ym7CYbNo4Ii9iR4AX6Tb1IkuPGthpT3LEw5DrOG46/zS6u94rQHruQy72pEGPt+KvuJeQ9/9f1
 BddrL/rqqpSi0F8mHSOxRRujIO6UswVtEVL3TJYWdWw+7nfwUFsfjVWr0n16V7tYKCH9eu+WLrbpJD
 84s2yIkEaZJhLtNjJasFgbHOckRkLJofZt+qN9jViHFYeR3FRt02y04Lc6KDLeoObhJtHts/XhuOiy
 rcJrBJ+t8Im63GYgpxFqZt9wZadZXYoKP26CkkkgkOTxCGh4siE+C5CvpWZG5n1piVyLpb2OpNNtII
 +tmE1nT8UJLdislxpB+kWhenTzkM5mg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=jEuY6S/kI3lo9LV32DY4PfRwtgqFMmCBoy1ALgvtglQ=;
 b=ecEgPjYDBf424PaqVkwxwu3dDbTwybsZ5Dg5ktHwPp6P8sfOVeUxSMlxgkPjBVX84+oOmBvYVWWvm
 sDBFO85DQ==
X-HalOne-ID: 605bb9c5-6715-11ef-bd32-7155eb331864
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay2.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
 id 605bb9c5-6715-11ef-bd32-7155eb331864;
 Fri, 30 Aug 2024 21:18:19 +0000 (UTC)
Date: Fri, 30 Aug 2024 23:18:18 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 11/81] drm/atmel-hdlcd: Run DRM default client setup
Message-ID: <20240830211818.GA142134@ravnborg.org>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830084456.77630-12-tzimmermann@suse.de>
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

On Fri, Aug 30, 2024 at 10:39:55AM +0200, Thomas Zimmermann wrote:
> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> v3:
> - add DRM_FBDEV_DMA_DRIVER_OPS macro (Sam)
> v2:
> - use drm_client_setup_with_fourcc()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
