Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29A53418DB
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441456E9C2;
	Fri, 19 Mar 2021 09:55:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD686E9C2
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Bs/uc42CyNw28LGCDWnaaSfmqCsvJEY+pIrcxWbjT4=;
 b=PqJF6z09Mrw+HIWA1+IzrklEC8LC66bOuQoWrftalbkVNBiNJ1cMWrpIdjfhg5529cW9zJ
 cmi6jRABjzItQJoqtCY5zMETAO95MjQ37J7I6FiCyaTFoVC9Q1BfnjKQPhLPBcHDwk/+wY
 CqvtUTN+igEngx2iZ9mwmKdzAt3lroA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-503-XmglgbUfPzGch8Bo0v-CAA-1; Fri, 19 Mar 2021 05:55:21 -0400
X-MC-Unique: XmglgbUfPzGch8Bo0v-CAA-1
Received: by mail-wr1-f72.google.com with SMTP id b6so6215381wrq.22
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Bs/uc42CyNw28LGCDWnaaSfmqCsvJEY+pIrcxWbjT4=;
 b=DneMFU40uFtAKUf3xq1BKDjDnSqXubIhfXTg0gUu/FauYaNHuuDlYaXV+ZnKTJA61b
 u4QH2MRmANsXOOkxRjBJDf6QHkxcbmob13Bnneygwq88x5OQuPz83WHwQ5nq4hbMPCCh
 1qPu/aeRo792TwtSvnABQmZhBHZ7KEKuerxuE82/2VxRm2nIJP0Lo9FtL03ukKfQjmEs
 DSnbEVi5e7BF960bgklOIy5vaP7tBIbRWXkOEpF5AMabMy69cFaLZf77yHDRPsembn84
 qaLEv3HOzSVesU+fFi4Et1Diq4eoC2AdEl/pL0LTHzRbtS/9MkQTqqZ4Aa+8pK6UvSiA
 cLkA==
X-Gm-Message-State: AOAM533lD30aWhw3m4uQn3f7lm5inACDcWd9bR8kSVTLsZ5a3u2wQgR4
 uSrJrulzx0+Apx4T0slZdVq4ppRCk0El8HVD/VOWFC5Uy9X9LDfHCtFNl7oI/JrvyHrScvFldDU
 zfUH/damsVFaSHsXF+irR6Ln19QheOZivFTStaTwc1g==
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr2996531wmg.171.1616147719838; 
 Fri, 19 Mar 2021 02:55:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2w6RvVCfzpx4+7sRy74TxWSXSVvH+JqsUT+aEy6DCSrzWG7WAtBYMLzlvmCuYIkNsjk82Q1/s3kjxTw2KrEw=
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr2996519wmg.171.1616147719709; 
 Fri, 19 Mar 2021 02:55:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-6-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-6-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:55:09 +0100
Message-ID: <CACO55ttxZ9NdeMsBy8fDSFnv5VwJ4tP1y3zJUjmNybBgAtcOpg@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 05/19] drm/nouveau/nvkm/subdev/volt/gk20a:
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
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 9:24 AM Lee Jones <lee.jones@linaro.org> wrote:
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
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
