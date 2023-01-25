Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E593B67BC64
	for <lists+nouveau@lfdr.de>; Wed, 25 Jan 2023 21:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C176110E398;
	Wed, 25 Jan 2023 20:15:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A46B10E85E
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jan 2023 20:15:06 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id k13so30763plg.0
 for <nouveau@lists.freedesktop.org>; Wed, 25 Jan 2023 12:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g2N/7kJHsM/uMFl1vK4chpOhxOn6kXj3cUzmime38z8=;
 b=erh34wiBfF8ZcjbgaZm58uG7hplqgLQHbhXzmoV9yKWnpHQxUUp/X/H7/gEX+1TuNj
 nHagAj4mjgV4X/Y/3P+pSXPWfikcqsSDocAnb0PWsxU+NwsKLpQFKUw997LoA8s+mNyH
 MCaae0Ft1fjVk+93HtFUVXcsJ3WS7BYaqAQsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g2N/7kJHsM/uMFl1vK4chpOhxOn6kXj3cUzmime38z8=;
 b=stUU5Dk5wjRieE8ic1JNN6wz5rd6EYGZI+LsAXVvIhe/VurNy52a7vzwUloF1oREej
 /S/9xVwU5ANbI3b6uyUeMGI8ucngNzJ8sBSNc85k+lD3rvvyahENEL87mPDmr5rLROB7
 +PCMNjQH1SH4rc+rQJLlY9HzQlMP6kMj0iqjU09Dqq7g6GfsKIyOCNtZgq0/tIRmyOrE
 OX5MSr/l+gsyaAPjzMvOHYWGjWQXYOpIYyf3lPchpLj+FCilZD40kPS/wsCPsMIYrJkv
 HAyxZJYjrjntQpENwMgN29gJP/OeVHzTNkybriuPh+tb2PCXQ1m7Wg3EM3RyJNLLUZK5
 +/Tg==
X-Gm-Message-State: AFqh2kqZ+2c1CXBY2HSRnY57FYZaFcXCP5kRy5ilq1SvPj+Xjq3uQAa7
 c9HmrAboPpVggQKW8DDw4Mnlgw==
X-Google-Smtp-Source: AMrXdXs6l74h/YQbfQL0Reby1hhdTavqq9M5qaz1j8FUN8zyFATcdnMg16iS5lGlq/OeiNBwqipenA==
X-Received: by 2002:a05:6a20:6a92:b0:b8:7ef5:4308 with SMTP id
 bi18-20020a056a206a9200b000b87ef54308mr31737202pzb.23.1674677705908; 
 Wed, 25 Jan 2023 12:15:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a638c04000000b0046f7e1ca434sm3616124pgd.0.2023.01.25.12.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 12:15:05 -0800 (PST)
Date: Wed, 25 Jan 2023 12:15:04 -0800
From: Kees Cook <keescook@chromium.org>
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <202301251214.8E52414D0@keescook>
References: <20221127183036.never.139-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127183036.never.139-kees@kernel.org>
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
 dri-devel@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ping. I'll take this via my tree unless someone else wants to take it...

On Sun, Nov 27, 2022 at 10:30:41AM -0800, Kees Cook wrote:
> Both Coverity and GCC with -Wstringop-overflow noticed that
> nvif_outp_acquire_dp() accidentally defined its second argument with 1
> additional element:
> 
> drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_pior_atomic_enable':
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: error: 'nvif_outp_acquire_dp' accessing 16 bytes in a region of size 15 [-Werror=stringop-overflow=]
>  1813 |                 nvif_outp_acquire_dp(&nv_encoder->outp, nv_encoder->dp.dpcd, 0, 0, false, false);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/nouveau/dispnv50/disp.c:1813:17: note: referencing argument 2 of type 'u8[16]' {aka 'unsigned char[16]'}
> drivers/gpu/drm/nouveau/include/nvif/outp.h:24:5: note: in a call to function 'nvif_outp_acquire_dp'
>    24 | int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
>       |     ^~~~~~~~~~~~~~~~~~~~
> 
> Avoid these warnings by defining the argument size using the matching
> define (DP_RECEIVER_CAP_SIZE, 15) instead of having it be a literal
> (and incorrect) value (16).
> 
> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
> Addresses-Coverity-ID: 1527269 ("Memory - corruptions")
> Addresses-Coverity-ID: 1527268 ("Memory - corruptions")
> Link: https://lore.kernel.org/lkml/202211100848.FFBA2432@keescook/
> Link: https://lore.kernel.org/lkml/202211100848.F4C2819BB@keescook/
> Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquire")
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/nouveau/include/nvif/outp.h | 3 ++-
>  drivers/gpu/drm/nouveau/nvif/outp.c         | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> index 45daadec3c0c..fa76a7b5e4b3 100644
> --- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
> +++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
> @@ -3,6 +3,7 @@
>  #define __NVIF_OUTP_H__
>  #include <nvif/object.h>
>  #include <nvif/if0012.h>
> +#include <drm/display/drm_dp.h>
>  struct nvif_disp;
>  
>  struct nvif_outp {
> @@ -21,7 +22,7 @@ int nvif_outp_acquire_rgb_crt(struct nvif_outp *);
>  int nvif_outp_acquire_tmds(struct nvif_outp *, int head,
>  			   bool hdmi, u8 max_ac_packet, u8 rekey, u8 scdc, bool hda);
>  int nvif_outp_acquire_lvds(struct nvif_outp *, bool dual, bool bpc8);
> -int nvif_outp_acquire_dp(struct nvif_outp *, u8 dpcd[16],
> +int nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  			 int link_nr, int link_bw, bool hda, bool mst);
>  void nvif_outp_release(struct nvif_outp *);
>  int nvif_outp_infoframe(struct nvif_outp *, u8 type, struct nvif_outp_infoframe_v0 *, u32 size);
> diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
> index 7da39f1eae9f..c24bc5eae3ec 100644
> --- a/drivers/gpu/drm/nouveau/nvif/outp.c
> +++ b/drivers/gpu/drm/nouveau/nvif/outp.c
> @@ -127,7 +127,7 @@ nvif_outp_acquire(struct nvif_outp *outp, u8 proto, struct nvif_outp_acquire_v0
>  }
>  
>  int
> -nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[16],
> +nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  		     int link_nr, int link_bw, bool hda, bool mst)
>  {
>  	struct nvif_outp_acquire_v0 args;
> -- 
> 2.34.1
> 

-- 
Kees Cook
