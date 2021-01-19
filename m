Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E162FB547
	for <lists+nouveau@lfdr.de>; Tue, 19 Jan 2021 11:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA996E147;
	Tue, 19 Jan 2021 10:22:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DBC6E0EA
 for <nouveau@lists.freedesktop.org>; Tue, 19 Jan 2021 10:22:28 +0000 (UTC)
Date: Tue, 19 Jan 2021 10:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1611051746;
 bh=vtNRLA5CE3I6wcgKrfTHuSBUc+uTmwDqtUGt5ElNsPU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=fCKI5HfShsUoM4GF9DEiDYOMlZ/uRKpa98tcc4F3MwCi5CAGkUrK3Q2lsKW/HyolT
 DOF8mTyfFwjtWD/Pl+P7U2SIZbp5Z3d5avlBC1ys6SNWhOluCVb+Q3SHhM3g361gBm
 xc1AkQwNuMa1ELxxffG3eZ9oN7LdqZuR9dq1/0gydrrCLPXMQgJHwZxU8TVplS+9VA
 U6UCoO6izgl5Rt4Hb4rweU8cbOXfdzP2ljcem/VV9ajDuwSRrX+hxMax1UIgGr08Y5
 xBVM56MRCWj+OGAZ/cxm2/4BCRVgowBiaxmYgMaRI0ZAbnT6SYAolFVhvCSxd0IZkF
 g9rPT9hQzAq3Q==
To: Lyude Paul <lyude@redhat.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <iyiRYoTlFNd1Crgc673rDXnfqahsfhKFP89rA0kKYEFUpLGwsFtYL-x-Jwh1ZAo7vJerbikydEDSUFtAoewsGkh3WSYeykScJdKC2PVrKQs=@emersion.fr>
In-Reply-To: <20210119015415.2511028-2-lyude@redhat.com>
References: <20210119015415.2511028-1-lyude@redhat.com>
 <20210119015415.2511028-2-lyude@redhat.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
Subject: Re: [Nouveau] [PATCH 2/3] drm/nouveau/kms/nv50-: Report max cursor
 size to userspace
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Takashi Iwai <tiwai@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tuesday, January 19th, 2021 at 2:54 AM, Lyude Paul <lyude@redhat.com> wrote:

> Cc: Martin Peres <martin.peres@free.fr>
> Cc: Jeremy Cline <jcline@redhat.com>
> Cc: Simon Ser <contact@emersion.fr>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index c6367035970e..5f4f09a601d4 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2663,6 +2663,14 @@ nv50_display_create(struct drm_device *dev)
>  	else
>  		nouveau_display(dev)->format_modifiers = disp50xx_modifiers;
>
> +	if (disp->disp->object.oclass >= GK104_DISP) {

I can confirm this works fine on GK208B. Tested with wlroots. I don't
have older cards to test, though.

Tested-by: Simon Ser <contact@emersion.fr>

> +		dev->mode_config.cursor_width = 256;
> +		dev->mode_config.cursor_height = 256;
> +	} else {
> +		dev->mode_config.cursor_width = 64;
> +		dev->mode_config.cursor_height = 64;
> +	}
> +
>  	/* create crtc objects to represent the hw heads */
>  	if (disp->disp->object.oclass >= GV100_DISP)
>  		crtcs = nvif_rd32(&device->object, 0x610060) & 0xff;
> --
> 2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
