Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6F96144C3
	for <lists+nouveau@lfdr.de>; Tue,  1 Nov 2022 07:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3096D10E16C;
	Tue,  1 Nov 2022 06:45:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C169310E16C
 for <nouveau@lists.freedesktop.org>; Tue,  1 Nov 2022 06:44:56 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id sc25so34762686ejc.12
 for <nouveau@lists.freedesktop.org>; Mon, 31 Oct 2022 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=x4E+vrU+v81EDyYUyN3hvsAswEovIWqU1A9918vvO9U=;
 b=P2BVxCoVeKIiteYzWr9i/BLouF7XVHjOCU6reApDe+7TZF20Fk3KwhiVTt6zZ1TN9z
 pR20/9d0pR7ZfqzWQNNYr9HdoqVxaIkmmm87XPBPjXkL/FT1414IWfv8D1DfHaD9EZs6
 WPWezZwQ48k04pYz566DZSuzC2MWmpBj3je35kwWiWMX4MilMGFVMRqm+izTnvbE8Sha
 ScDdedFUZppGr2/J/LDYkP6+3r6jcUVl8bB3FOjk1p0JCEx64kAxCgbRSv+qalOvi6JX
 OV5w2DvOsFbLYFqSoB7kmoLumIjCbxVnlISP5fpmNiaegnRAXIjrMZiZ6O1uWRiGeMst
 RtoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x4E+vrU+v81EDyYUyN3hvsAswEovIWqU1A9918vvO9U=;
 b=McuMDMYiZfjIIwBU16NJCN0v74XLHOdgHlzGSeG9xKkbQ7j7hBFgVfuMiuJbME+Lw6
 jAExunf+SQEo62LBdyqZ7FU0vdtunQgjG0e1Qjb9tzbjF7nkyYzHZu6dAhOTfhNXyxQ5
 ztdIn/5mVRvmge2zuixTpXwqYNcxlIYJh94fYxNS98KyyNilqB5ogBlg5yEkjjOhqDra
 0AN+xiDPb8zxQzCgn49sWdJGravPXklpNFP87RVzFFes6K/jqvOLt878zbK8GX8F7g0l
 UrTAB6JzrnU3VZRS48NYpiBqtinHK8i4EuxT9UZbbVEAQXsNnW/HzbExiEI0jIfSH/2O
 laXg==
X-Gm-Message-State: ACrzQf3jI4eyZZCk8YHW161rApZtY7OkuQiMuV0O1Tt1QBE368VcQrOe
 h5wBgQuj1ZnVZlfE2MNArpOxq2DzIkDYMZVou2w=
X-Google-Smtp-Source: AMsMyM5fSvln4yOx7FqMtiwYiKourK7UvyDmtbK2bjdT7pIY0PUpQGLAlZgr0LElrfhhk2tjJ3Z6KCiBIhC3VZNjCmQ=
X-Received: by 2002:a17:906:99c3:b0:78d:9cc9:deda with SMTP id
 s3-20020a17090699c300b0078d9cc9dedamr16941957ejn.712.1667285094511; Mon, 31
 Oct 2022 23:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220819200928.401416-1-kherbst@redhat.com>
In-Reply-To: <20220819200928.401416-1-kherbst@redhat.com>
From: Computer Enthusiastic <computer.enthusiastic@gmail.com>
Date: Tue, 1 Nov 2022 07:44:41 +0100
Message-ID: <CAHSpYy0HAifr4f+z64h+xFUmMNbB4hCR1r2Z==TsB4WaHatQqg@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hello,

Il giorno ven 19 ago 2022 alle ore 22:09 Karol Herbst
<kherbst@redhat.com> ha scritto:
>
> It is a bit unlcear to us why that's helping, but it does and unbreaks
> suspend/resume on a lot of GPUs without any known drawbacks.
>
> Cc: stable@vger.kernel.org # v5.15+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 35bb0bb3fe61..126b3c6e12f9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
>                 if (ret == 0) {
>                         ret = nouveau_fence_new(chan, false, &fence);
>                         if (ret == 0) {
> +                               /* TODO: figure out a better solution here
> +                                *
> +                                * wait on the fence here explicitly as going through
> +                                * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> +                                *
> +                                * Without this the operation can timeout and we'll fallback to a
> +                                * software copy, which might take several minutes to finish.
> +                                */
> +                               nouveau_fence_wait(fence, false, false);
>                                 ret = ttm_bo_move_accel_cleanup(bo,
>                                                                 &fence->base,
>                                                                 evict, false,
> --
> 2.37.1
>

Do you think it could be possible to make the patch land in kernel
5.10.x in the near future ?

Is there something I can do to help it to happen ?

Thanks.
