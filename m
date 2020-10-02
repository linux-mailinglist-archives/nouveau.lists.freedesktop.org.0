Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC45281FB5
	for <lists+nouveau@lfdr.de>; Sat,  3 Oct 2020 02:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7E996EA08;
	Sat,  3 Oct 2020 00:21:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDE16E9C8
 for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2020 18:46:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s12so2842828wrw.11
 for <nouveau@lists.freedesktop.org>; Fri, 02 Oct 2020 11:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=cqLPfUuqb60ZIVoOQ31hnraU/Ifr39O5/ULDkN9IWmw=;
 b=LhoHpieZ6b1yu3Bgv5UVyYwE5gEJCucfXpQtCsua7dxm7nPU5GPxUoM22UNQQ6v2CK
 k0Y2QqxCtl6jlPSAgvR23+rIu6KvQsYlEl3KTS7hhk4KmBbGsS7srplNima8l2683HV3
 M+RegCjSI+WIRGmRnHJIv+DYHNTbkSdc4/ZqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=cqLPfUuqb60ZIVoOQ31hnraU/Ifr39O5/ULDkN9IWmw=;
 b=NjWi+cpsFsHetwG6JBD1ye9kt5vouOpCwLw18mcbyQbhxHPL5uGR8FaBgptwpHBJru
 +Xars3Xm/ItQBqmkYgX+EFHlq9PKXlRBaFjLGCE4veWpQuC1m3lReNv22YW5k23+ITtT
 HUouJO5JUmx+yqhzO6ong8OUqhbuFVZINK1SqcSzFMZX9xKwOFAji32OhrKUxTyhciCc
 Rmm1yaD7K+4fq/hJnTNHtnbYhlF1/18OJzWAOqp/GrNmPjT9c/twCr3UXp1NCrT9Eapt
 0pun47F/Psj8uFPp/srUbfsAdq7eQshkgvzrTR1ZKFaZWSH+cXGjB8WyQRYRzGvAzWR2
 29LA==
X-Gm-Message-State: AOAM532MwU2jHBTVKY6LI58VtsrSMiQ+s/uUUFkP/gC86dwooLaJp9/m
 OuHpDY/RPuF2OAGolBjlOKAWNg==
X-Google-Smtp-Source: ABdhPJzgHPhBsD8FZtMDQrfMIjGL4qmZj/8xNAuAHXm+0qz5n2h6pVB3S7OCKNZbK4qjctoXq1cGGA==
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr4528517wrq.297.1601664359823; 
 Fri, 02 Oct 2020 11:45:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n2sm2937452wma.29.2020.10.02.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 11:45:57 -0700 (PDT)
Date: Fri, 2 Oct 2020 20:45:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201002184554.GN438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-8-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929151437.19717-8-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Sat, 03 Oct 2020 00:21:42 +0000
Subject: Re: [Nouveau] [PATCH v3 7/7] drm/todo: Update entries around struct
 dma_buf_map
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
Cc: luben.tuikov@amd.com, heiko@sntech.de, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 melissa.srw@gmail.com, eric@anholt.net, ray.huang@amd.com, kraxel@redhat.com,
 sam@ravnborg.org, sumit.semwal@linaro.org, emil.velikov@collabora.com,
 robh@kernel.org, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 lima@lists.freedesktop.org, oleksandr_andrushchenko@epam.com, krzk@kernel.org,
 steven.price@arm.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, linux+etnaviv@armlinux.org.uk,
 spice-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 maarten.lankhorst@linux.intel.com, etnaviv@lists.freedesktop.org,
 mripard@kernel.org, inki.dae@samsung.com, hdegoede@redhat.com,
 christian.gmeiner@gmail.com, xen-devel@lists.xenproject.org,
 virtualization@lists.linux-foundation.org, sean@poorly.run, apaneers@amd.com,
 linux-arm-kernel@lists.infradead.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, tomeu.vizoso@collabora.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, yuq825@gmail.com, daniel@ffwll.ch,
 alexander.deucher@amd.com, linux-media@vger.kernel.org,
 christian.koenig@amd.com, l.stach@pengutronix.de
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 29, 2020 at 05:14:37PM +0200, Thomas Zimmermann wrote:
> Instances of struct dma_buf_map should be useful throughout DRM's
> memory management code. Furthermore, several drivers can now use
> generic fbdev emulation.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  Documentation/gpu/todo.rst | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
> =

> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 3751ac976c3e..023626c1837b 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -197,8 +197,10 @@ Convert drivers to use drm_fbdev_generic_setup()
>  ------------------------------------------------
>  =

>  Most drivers can use drm_fbdev_generic_setup(). Driver have to implement
> -atomic modesetting and GEM vmap support. Current generic fbdev emulation
> -expects the framebuffer in system memory (or system-like memory).
> +atomic modesetting and GEM vmap support. Historically, generic fbdev emu=
lation
> +expected the framebuffer in system memory or system-like memory. By empl=
oying
> +struct dma_buf_map, drivers with frambuffers in I/O memory can be suppor=
ted
> +as well.
>  =

>  Contact: Maintainer of the driver you plan to convert
>  =

> @@ -446,6 +448,24 @@ Contact: Ville Syrj=E4l=E4, Daniel Vetter
>  =

>  Level: Intermediate
>  =

> +Use struct dma_buf_map throughout codebase
> +------------------------------------------
> +
> +Pointers to shared device memory are stored in struct dma_buf_map. Each
> +instance knows whether it refers to system or I/O memory. Most of the DR=
M-wide
> +interface have been converted to use struct dma_buf_map, but implementat=
ions
> +often still use raw pointers.
> +
> +The task is to use struct dma_buf_map where it makes sense.
> +
> +* Memory managers should use struct dma_buf_map for dma-buf-imported buf=
fers.
> +* TTM might benefit from using struct dma_buf_map internally.
> +* Framebuffer copying and blitting helpers should operate on struct dma_=
buf_map.
> +
> +Contact: Thomas Zimmermann <tzimmermann@suse.de>, Christian K=F6nig, Dan=
iel Vetter
> +
> +Level: Intermediate
> +
>  =

>  Core refactorings
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -- =

> 2.28.0
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
