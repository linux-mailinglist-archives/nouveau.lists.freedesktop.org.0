Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 859943640B1
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166FA6E226;
	Mon, 19 Apr 2021 11:43:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3010E6E214
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832634;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UIAlb9HdBCrRLbA00IatqDn0EvB3C3eeDIiT2Wrei18=;
 b=OsSD0LBiaCV8UPK3paIM8Bml+yzrlUUzEyV0RawJ4Fj2vCxI1TcibxwnotikMz5+k34TYF
 IbdQ+KFHMzm0sZ/RcboAm7tAuYz3Pro5PBVtEYLH8A8DAnbgVuHgUVnQF3/0DVU+UlotKB
 C0bXDH8Ec+r/ycWqxvH/kSvraX4UCA8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-YB8OF2tEMP6lkF2Jl_82qA-1; Mon, 19 Apr 2021 07:43:51 -0400
X-MC-Unique: YB8OF2tEMP6lkF2Jl_82qA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h60-20020adf90420000b029010418c4cd0cso8057381wrh.12
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UIAlb9HdBCrRLbA00IatqDn0EvB3C3eeDIiT2Wrei18=;
 b=FG84nEGKQyG2cuPo6rBSTfAypHOZxbe9aVfTA0If+o47d9nBn9o7qJTCk/aGg/S1HH
 m+FqdoMJvjsYCXyKi3C9i+yDQvcp3egv3ILQvRP9SdYJm0g/gy29mH/9j3D+mPMQq15X
 bBSCuZ2Z3nre3e00cS6ups7tW68luzmNgUy14kL5IbgduJDk8U+ZdI5Vvb/soOw6BZ8d
 rblEkWqOe/UHRBJ/fxUemu4XHETIC446vtxlhHL8/+7NkfcMiDnwcTFu2OZrEITdiCsR
 aIzRS/CJXZrA9N+dTHftmW0atqnk358nJ3ji0PcBbw4mlaBHkgWBDDaamtec8ypx+18X
 AD7g==
X-Gm-Message-State: AOAM531XXqe7YzZrvvb19Ap3gC3lFVs85wKDFhQ3WEc5crjvM3mM1ANx
 JT1Imj444bcloTsY1vGn/dy2+N43tQHq3TgDzLaTVSM7y2k3DKhxhRbI5ymp0eKm9k1YDp2/bU9
 C3FvszO774DOYna6F8edYS10MDo5sf0ROLw0z9xlYIA==
X-Received: by 2002:a5d:4689:: with SMTP id u9mr13938291wrq.10.1618832630667; 
 Mon, 19 Apr 2021 04:43:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZFUZPXmteljMabJNWgNVI9Opvidiv/0XIcrby9r0EikNzgvp6/EpF3Cg7Zaq7P9Vbfx4BOYpgUjju1Vgg2Kc=
X-Received: by 2002:a5d:4689:: with SMTP id u9mr13938282wrq.10.1618832630547; 
 Mon, 19 Apr 2021 04:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-6-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-6-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:43:40 +0200
Message-ID: <CACO55tt+J=xmEPB=4HsDdNGrw9c5UaY_2R7BTwqYrLyiLNK6og@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 05/40] drm/nouveau/nvkm/subdev/volt/gk20a:
 Demote non-conformant kernel-doc headers
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:37 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:53: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'speedo' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'temp' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 's_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 't_scale' not described in 'gk20a_volt_get_cvb_t_voltage'
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c:69: warning: Function parameter or member 'coef' not described in 'gk20a_volt_get_cvb_t_voltage'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> index 8c2faa9645111..ccac88da88648 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/volt/gk20a.c
> @@ -45,7 +45,7 @@ static const struct cvb_coef gk20a_cvb_coef[] = {
>         /* 852 */ { 1608418, -21643, -269,     0,    763,  -48},
>  };
>
> -/**
> +/*
>   * cvb_mv = ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0)
>   */
>  static inline int
> @@ -58,7 +58,7 @@ gk20a_volt_get_cvb_voltage(int speedo, int s_scale, const struct cvb_coef *coef)
>         return mv;
>  }
>
> -/**
> +/*
>   * cvb_t_mv =
>   * ((c2 * speedo / s_scale + c1) * speedo / s_scale + c0) +
>   * ((c3 * speedo / s_scale + c4 + c5 * T / t_scale) * T / t_scale)
> --
> 2.27.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
