Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E6667EE75
	for <lists+nouveau@lfdr.de>; Fri, 27 Jan 2023 20:42:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43CA10E1B2;
	Fri, 27 Jan 2023 19:42:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CA510E1AD
 for <nouveau@lists.freedesktop.org>; Fri, 27 Jan 2023 19:42:25 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id f3so3891397pgc.2
 for <nouveau@lists.freedesktop.org>; Fri, 27 Jan 2023 11:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/oF44rT15tnjTMjQqM9aBjASabRej4gnAjmMBpVIsHQ=;
 b=av1vpqTXDSdm9xZW/Pg/m0TrwGFvEz3WN0oSIPaCtlst7AUmhhMvzYihzOQ3jpxqEK
 HrDRzoWFLwx63eVyZyD+Dmu4KB8bgEP7vuGqBPqTd0ggMBMz0OCaE7TPLICA+PlL0OaW
 fuHtg+LAkdqb5FNHESN/k20N8PGx4fxm5NKkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oF44rT15tnjTMjQqM9aBjASabRej4gnAjmMBpVIsHQ=;
 b=nwpD2n3DJhGhbGTbdLhokweQYYMnDQ9djQKWzs6kDYZdVQQyk/w5IdvQIb2L/aRkFz
 GzeUPCVxdS0u2gezKf5094YcXtKWtygjMng2ElJEzr3Ge397z7gkuujI976lUJfqWTRi
 xEmYtvtuUTWMmpHxrEMdv5haKEhfQsQZNo49t/tKic7Mi7MP/59wUq/+xli76w4tas4r
 y4AU4kHOmknpzfS0up4S1Eps7dmrYwqIcUOmGcsVLd9nRUMKwLXh5Lg05OdHV4sRQ8t0
 covPpBxBP3hHcQDzeBnGuawZSr3NKQ2iMgSB7fgvN9/yNz1+q/BsZSh5kAp+EbDdL+aw
 6NDQ==
X-Gm-Message-State: AO0yUKVrASjf1bkRZjhkXjFSHPwmQnbGtQWkGS9mmb14eC0x55GiSHt2
 ee0gKZtZ3x3FTvGd0ujkPnMgAQ==
X-Google-Smtp-Source: AK7set+Z9W6Rrw9FWwFFm8G6j0bcNgI/h1gaBfNaPxU5jp1YhAt6lKHsciXU4RrC0pla1N+iDmml2A==
X-Received: by 2002:a05:6a00:2484:b0:592:514f:636d with SMTP id
 c4-20020a056a00248400b00592514f636dmr7324690pfv.22.1674848544849; 
 Fri, 27 Jan 2023 11:42:24 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 i19-20020aa796f3000000b0058dbd7a5e0esm3002526pfq.89.2023.01.27.11.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 11:42:24 -0800 (PST)
Date: Fri, 27 Jan 2023 11:42:23 -0800
From: Kees Cook <keescook@chromium.org>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <202301271141.6741F43@keescook>
References: <20221127183036.never.139-kees@kernel.org>
 <202301251214.8E52414D0@keescook>
 <9c53c624604b7415ceeedf7222e78abc2c64430f.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c53c624604b7415ceeedf7222e78abc2c64430f.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: Fix nvif_outp_acquire_dp()
 argument size
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 04:24:19PM -0500, Lyude Paul wrote:
> Sorry! I've been pretty busy until now, this is:
> 
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> 
> Let me know if you've pushed it already or if you want me to push it to drm-
> misc

Either way is fine. I'm currently carrying it, but I can easily drop it
if you prefer it go via drm-misc.

Thanks!

-Kees

> 
> On Wed, 2023-01-25 at 12:15 -0800, Kees Cook wrote:
> > Ping. I'll take this via my tree unless someone else wants to take it...
> > 
> > On Sun, Nov 27, 2022 at 10:30:41AM -0800, Kees Cook wrote:
> > > Both Coverity and GCC with -Wstringop-overflow noticed that
> > > nvif_outp_acquire_dp() accidentally defined its second argument with 1
> > > additional element:
> > > 
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_pior_atomic_enable':
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: error: 'nvif_outp_acquire_dp' accessing 16 bytes in a region of size 15 [-Werror=stringop-overflow=]
> > >  1813 |                 nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
> > >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: note: referencing argument 2 of type 'u8[16]' {aka 'unsigned char[16]'}
> > > drivers/gpu/drm/nouveau/include/nvif/outp.h:24:5: note: in a call to function 'nvif_outp_acquire_dp'
> > >    24 | int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> > >       |     ^~~~~~~~~~~~~~~~~~~~
> > > 
> > > Avoid these warnings by defining the argument size using the matching
> > > define (DP_RECEIVER_CAP_SIZE, 15) instead of having it be a literal
> > > (and incorrect) value (16).
> > > 
> > > Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> > > Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
> > > Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
> > > Link: https://lore.kernel.org/lkml/202211100848.FFBA2432@keescook/
> > > Link: https://lore.kernel.org/lkml/202211100848.F4C2819BB@keescook/
> > > Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")
> > > Cc: Ben Skeggs <bskeggs@redhat.com>
> > > Cc: Karol Herbst <kherbst@redhat.com>
> > > Cc: Lyude Paul <lyude@redhat.com>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Dave Airlie <airlied@redhat.com>
> > > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: nouveau@lists.freedesktop.org
> > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > ---
> > >  drivers/gpu/drm/nouveau/include/nvif/outp.h | 3 ++-
> > >  drivers/gpu/drm/nouveau/nvif/outp.c         | 2 +-
> > >  2 files changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > > index 45daadec3c0c..fa76a7b5e4b3 100644
> > > --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > > +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> > > @@ -3,6 +3,7 @@
> > >  #define __NVIF_OUTP_H__
> > >  #include <nvif/object.h>
> > >  #include <nvif/if0012.h>
> > > +#include <drm/display/drm_dp.h>
> > >  struct nvif_disp;
> > >  
> > >  struct nvif_outp {
> > > @@ -21,7 +22,7 @@ int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
> > >  int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
> > >  			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
> > >  int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
> > > -int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> > > +int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > >  			 int link_nr, int link_bw, bool hda, bool mst);
> > >  void nvif_outp_release(struct nvif_outp *);
> > >  int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
> > > diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> > > index 7da39f1eae9f..c24bc5eae3ec 100644
> > > --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> > > +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> > > @@ -127,7 +127,7 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0
> > >  }
> > >  
> > >  int
> > > -nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> > > +nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
> > >  		     int link_nr, int link_bw, bool hda, bool mst)
> > >  {
> > >  	struct nvif_outp_acquire_v0 args;
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> -- 
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
> 

-- 
Kees Cook
