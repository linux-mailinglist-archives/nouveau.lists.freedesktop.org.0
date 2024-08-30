Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CA8965CE3
	for <lists+nouveau@lfdr.de>; Fri, 30 Aug 2024 11:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F71910E9DF;
	Fri, 30 Aug 2024 09:31:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 524 seconds by postgrey-1.36 at gabe;
 Fri, 30 Aug 2024 09:31:27 UTC
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6DE10E9DF
 for <nouveau@lists.freedesktop.org>; Fri, 30 Aug 2024 09:31:27 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by riemann.telenet-ops.be (Postfix) with ESMTPS id 4WwCNd1m17z50bsw
 for <nouveau@lists.freedesktop.org>; Fri, 30 Aug 2024 11:22:41 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:f0d5:75e3:232:dfed])
 by andre.telenet-ops.be with cmsmtp
 id 69Nb2D0084wyYGe019NbrW; Fri, 30 Aug 2024 11:22:40 +0200
Received: from geert (helo=localhost)
 by ramsan.of.borg with local-esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sjxpz-001KEG-4a;
 Fri, 30 Aug 2024 11:22:35 +0200
Date: Fri, 30 Aug 2024 11:22:35 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com, 
 javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v3 40/81] drm/stm: Run DRM default client setup
In-Reply-To: <20240830084456.77630-41-tzimmermann@suse.de>
Message-ID: <1bb15789-ae48-9a5f-aa35-c6c0b066d1dc@linux-m68k.org>
References: <20240830084456.77630-1-tzimmermann@suse.de>
 <20240830084456.77630-41-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
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

On Fri, 30 Aug 2024, Thomas Zimmermann wrote:
> Call drm_client_setup_with-fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
>
> v2:
> - use drm_client_setup_with_fourcc()
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Philippe Cornu <philippe.cornu@foss.st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Acked-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

WARNING: Duplicate signature

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
