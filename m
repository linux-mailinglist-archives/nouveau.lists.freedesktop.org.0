Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB4A3418F5
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:57:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198DF6E9DD;
	Fri, 19 Mar 2021 09:57:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E179C6E9E0
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsREr7KDpE+wzs5UrnU5bq27soizKgijk7jOaTMCif8=;
 b=V6Iqbxz2n64U1zJiA+9pWxx/O9XKThGpYU1nL0vMh0o73DI3C6KVY7Yq3J+riehiyRew1j
 RPaKb+nKRWE5kV/lJDhbEHuKLbmBmcXU/t4380hYiv9z39PiQxQgrEzOlr8FZsdnPpM066
 tsQSUnKMrVhrqa2iv3o/NTLL1oYX+pw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-Crh1FMsIOCGtr8Ysi9KTyg-1; Fri, 19 Mar 2021 05:57:42 -0400
X-MC-Unique: Crh1FMsIOCGtr8Ysi9KTyg-1
Received: by mail-wr1-f70.google.com with SMTP id b6so6218047wrq.22
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsREr7KDpE+wzs5UrnU5bq27soizKgijk7jOaTMCif8=;
 b=O1UeFsDGjZW4ofjpf1fJGWD3mEHKFjqSsOPYTOcoo9a9NrVjcQ3ed9jnrJDOg3vG3i
 VElSIsrebJvZ5Fx+9pE0LQM9xZrajJi7GFRSjiCp8lTzePa8UBVdO5JfmgCAcg7IrZd1
 POPAnaBNZzs8wB/ijDKMABZK/vBHSNbyCO7Cgo6/tYe0FqhyNS5jRufoMQrsDn5thrY5
 C929qKhk9frKtP0i3VYflH8e+F/yg70O6n2C4sqIs1NKuspO5oiS/K/NZAzQa5NXhGaS
 TJM0ZjEFHQgVxJZHtaigOvyMN71qtvyg4bQGNo4JkJBXb/mkvtSbkuYMwL0NcRaryVBX
 zo7Q==
X-Gm-Message-State: AOAM532yl/kGRPUqDz/VMnHBACynXxs3SCi79qCq9Occq2Bs9xSg2ePK
 ZtvsNlthU2KVdX+7m1ZNA51jOIs8k1LK7M3gJ1n8GAjmBr3Rde545BrmNm5u8xEE0OOzjOciYGn
 mdNtvkw1wyIBh+OS7PKOq5SPvUbK1z0TWV6++xPbONA==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3005059wmg.171.1616147861264; 
 Fri, 19 Mar 2021 02:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsfPewyX1Blixhz1/TwL1Ho9nuqLqhf9NMZtw3nWuN8DcHlGRHQ08GhxRWzE7D+tyku9OEoToJb5cXiQ8FNE8=
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3005053wmg.171.1616147861146; 
 Fri, 19 Mar 2021 02:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-13-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-13-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:30 +0100
Message-ID: <CACO55tvitU6wHR1DVNAx1rGVEYRCs_PKQpdgrARPTMZgg3K_Tg@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 12/19] drm/nouveau/dispnv04/crtc: Demote
 non-conforming kernel-doc headers
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'adjusted_mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'x' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'y' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'old_fb' not described in 'nv_crtc_mode_set'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index f9e962fd94d0d..f9a276ea5a9e0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
