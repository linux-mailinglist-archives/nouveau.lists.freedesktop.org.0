Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ABB3418E0
	for <lists+nouveau@lfdr.de>; Fri, 19 Mar 2021 10:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D033C6E9C9;
	Fri, 19 Mar 2021 09:55:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D226E9C9
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uJ5ef4kdkKqYO2ysDRmL0Xx+1wY0nM5hZWCNcGD9eXA=;
 b=IjQdcrnScqKzhzsgRN8R0wwMt+A5veC97F8u//3Jr9Tqe/lNdhlV3eC47CuWyHyOAixI8Q
 ZJafitpTBiDSugbLfO+bxNcuONNOVuxv3y/lMaytq88DWqdFWjHOoW95Zs40Dvjl8guobM
 47fNUaVmB3cBqQyRqOgEPy3WitfHyA4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-1AO0bw7OMmmeJBYVWA75Tg-1; Fri, 19 Mar 2021 05:55:32 -0400
X-MC-Unique: 1AO0bw7OMmmeJBYVWA75Tg-1
Received: by mail-wr1-f69.google.com with SMTP id p15so21371061wre.13
 for <nouveau@lists.freedesktop.org>; Fri, 19 Mar 2021 02:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uJ5ef4kdkKqYO2ysDRmL0Xx+1wY0nM5hZWCNcGD9eXA=;
 b=l7ClY1m8gEimMoNU7uCDodfuLQ6QO/R6zh6Sn1drMyGEUF4Q4SjrDq1+BG+fkGdyHF
 13+4oYTHoLOAeVq9/XKF2ijUI0GDkFs5H0C82+rWPEZQoaMnLFJptkZXDTwiEQyax7rQ
 E/YUTC3osznlm/5OycwihjxF9dP4h39rSNRY0fuIxZcLHBfwFdrU0JTtEj8PxZ61ZQdo
 Q+rBG6mYXntaeX37eCY1Eojd6gew6zRylCJXl7D3qKMu8sVBMf0CfG3xLbHo6i+Uwc6y
 MPR1mcGtW9ybmRazUvqsh41rTWfmMsbOzDxg1vcZ7mBSRF5x2P13tzaVrHgHvUVxaMAr
 9bPw==
X-Gm-Message-State: AOAM531z2k8+ZJ2AIj+WmikqV3PczlklRZya1vu/CJUWq7BCsGxR2XGI
 EnP8dvay1G7FSetMg+4MWQv2C9oCaDtLUpa844/luf3z6YnYkKRdCHOqOCp58ibKn8iOgiFUUE5
 NRE9KBJJqMfsqEhq84b/RlS1Uv7TC5bJPxoKQnCdHzw==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr3485711wrw.415.1616147731754; 
 Fri, 19 Mar 2021 02:55:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeKPGrxBdpMmRWCOYaxf2YjC/UlnsVRPHxzh1erEAYqUTci6IHJuCkogRSQOq5aAaeWZ1tnsOMjF8dIXRf1qk=
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr3485702wrw.415.1616147731642; 
 Fri, 19 Mar 2021 02:55:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-10-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-10-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:55:21 +0100
Message-ID: <CACO55ts6Hmh07fib-QBB8nVxrVcfK-s2b-5MBaemxWJMJ=oyAw@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 09/19] drm/nouveau/nvkm/engine/gr/gf100:
 Demote non-conformant kernel-doc header
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
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c:992: warning: Function parameter or member 'gr' not described in 'gf100_gr_wait_idle'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> index 397ff4fe9df89..69e6008f99196 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -982,7 +982,7 @@ gf100_gr_zbc_init(struct gf100_gr *gr)
>         }
>  }
>
> -/**
> +/*
>   * Wait until GR goes idle. GR is considered idle if it is disabled by the
>   * MC (0x200) register, or GR is not busy and a context switch is not in
>   * progress.
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
