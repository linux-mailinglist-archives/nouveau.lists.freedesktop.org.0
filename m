Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9827141AD6F
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 12:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C864C6E06B;
	Tue, 28 Sep 2021 10:58:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2A36E06B
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 10:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o8c+hflDGNsMrT5vO+jy/cfJzWzyzHOCwO8M7rh07Hg=;
 b=B/xuW6vixVRmDx4v88tuEsbmHjHSFMIJaUUojQCCR+8PqPn5UnLV7NckYPAE9CcZ+y5Xse
 /zpCPM2VYi1mZn8W+4CH26RbCVSaasqw4vMR56EFywC6uDm8/FhI7j5tXBZ7N5mJQl2Fyc
 VPq5K01r434y9v/Ln8f7pkkXyV0Um1Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-e3snGFQZP8-duIV5P0_54w-1; Tue, 28 Sep 2021 06:58:53 -0400
X-MC-Unique: e3snGFQZP8-duIV5P0_54w-1
Received: by mail-wr1-f71.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso14918644wrb.20
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 03:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o8c+hflDGNsMrT5vO+jy/cfJzWzyzHOCwO8M7rh07Hg=;
 b=F8Qsqum/Ldwp3ugQEr8BrWSf4Kl0E4iceXnlzkoERJEAsPIrXJ8mPMpqOhgp3bDtGI
 p/J8PCdsdcvTaT87C2IwZEj3iOYnCe3Iyogi9zmtcKFGdkEMKaY9pF1D1LG9FnYoo1Qb
 TkOQO/G0hl9PFaNQEA/2SxvVP/Vfgnw1p9lLZVTvvpDyPars+cSPwndRDqbNdqe1ba2x
 fRELernejm+jISWcnXN6MGKf12XcxR17Zjc3Vikx7iYaIw8WVoUVGfYuoAYfHpoZzrty
 VY+6q4ZirLvP3VgIffEBRwcMFlBGaNjsMiMHSDK38BQgscmzI4H6y/PtGpeZnvTDIkwv
 zeyA==
X-Gm-Message-State: AOAM532j27eS0/PEb2mvKXVNQUEoYAkLiWGLpAJwklJzv/CF4VN/yW2c
 XHP/Nk8W7Ww/sPPif6KL3K6o7RLMTbNsf4DNhkcI2wkbr9NEKTnCPxOsHVqwujwT4Rysq6A7CWw
 zzI0dCQsAujH9TU/GzX3X477STt6PWtASbAmymCIXxw==
X-Received: by 2002:adf:e684:: with SMTP id r4mr5677725wrm.229.1632826732810; 
 Tue, 28 Sep 2021 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygTC0Jp4Je4Y9cx0DBYAkxxSPfYMtxRdQ9C+S8cLTPvi1JkgxasSroln52KwncpyJXM3dc/8k14aIWfFB+2GU=
X-Received: by 2002:adf:e684:: with SMTP id r4mr5677714wrm.229.1632826732610; 
 Tue, 28 Sep 2021 03:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210807032054.642867-1-yong.yiran@zte.com.cn>
In-Reply-To: <20210807032054.642867-1-yong.yiran@zte.com.cn>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 12:58:41 +0200
Message-ID: <CACO55tvKSF59imAr3_-6DshDz2wVrTtJ9ZHGfMStc9vgDh6H6w@mail.gmail.com>
To: cgel.zte@gmail.com
Cc: Ben Skeggs <bskeggs@redhat.com>, yong.yiran@zte.com.cn, 
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, 
 Zeal Robot <zealci@zte.com.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH linux-next] drm/nouveau/nvenc: remove
 duplicate include in base.c
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

and picked

On Mon, Aug 9, 2021 at 12:14 AM <cgel.zte@gmail.com> wrote:
>
> From: yong yiran <yong.yiran@zte.com.cn>
>
> 'priv.h' included in 'base.c' is duplicated.
> Remove all but the first include of priv.h from base.c.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: yong yiran <yong.yiran@zte.com.cn>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
> index c39e797dc7c9..cf5dcfda7b25 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/nvenc/base.c
> @@ -21,7 +21,6 @@
>   */
>  #include "priv.h"
>
> -#include "priv.h"
>  #include <core/firmware.h>
>
>  static void *
> --
> 2.25.1
>

