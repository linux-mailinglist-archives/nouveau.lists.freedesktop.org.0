Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA1BFB5D1
	for <lists+nouveau@lfdr.de>; Wed, 22 Oct 2025 12:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3716F10E744;
	Wed, 22 Oct 2025 10:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gcc1KUjt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66F610E0C8
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 10:17:01 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-78f3bfe3f69so5843848b3a.2
 for <nouveau@lists.freedesktop.org>; Wed, 22 Oct 2025 03:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761128221; x=1761733021; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=haEcx+owQUrAtI+Twa4lANyM7LrcsC0gpzpLCA3x0ZA=;
 b=gcc1KUjtZL2bz7eB/Q2XHg6mWqCjEf3pnAUcCoBFeIfPyIyegdnibMbzNk3OIshF6j
 UIwEfSgCbW0JNoKriR4rMtLFZGLDQHuBgvc7Yvaj+4tWgJVBvxK6T/Irj1uaU0hoRmev
 9qneyJTid0lmgRiorPdeGinYuhmV7E5Zg1vWQ7rtWFJV9w61/8lhjW4yt94w/X6WKaSx
 b4wP7DwWjIvrCRw6MYDUehvhGiPQI0r79BpKm0yKBxrF2258ZxheGJBaFivHAieOduYn
 25Q8jjW5D6E5Hw8L1tG1NV180Tco13GQjdiBAQoWQyyCvVwFxK/YiZHdtHHM+/Vczs39
 0oFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761128221; x=1761733021;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=haEcx+owQUrAtI+Twa4lANyM7LrcsC0gpzpLCA3x0ZA=;
 b=vNQwERPiP/MpNMzeCJMO5VH0pmxx795p6wcw3se+ghS6PeCNXisPAWa2rZjzmzXYNP
 s3cjvaf23KF8DP2ZtaX6jUtVI2TmQTejCB3576Ji9j2gVV5n3mRb636bwwu4fq0Wd8El
 8DhMBt3Jh9akz180DyiBlvezpXHxAcb9MohD4UitJ+4HsqktDWkecveuzC2PCArU2Qo2
 Ec8uInwYRRhL+w7b5+/AAP+3JT3r6J8PClUP8i2HCq7jxi3sRxdoehU8myZj903fJlbv
 +g3gRn7TqJDt8h6bUW6aXoHSdr8B2yZtg+N4Cqow+Vw3FNFVfHyI8wEmmlL5eb/KltWr
 bYow==
X-Forwarded-Encrypted: i=1;
 AJvYcCViiJBJ3AlynGFpD4wDbuRSzXDlarr+3V5y/7HjyqZvUPjXn24XJuozEnpiHhZKavOosfWdGLUr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyoMG1ayriM1W+4qKWX2tQE5uE7tjsTmuOYN46Qn+FKCFzL5SA9
 1kfFTU8GFX0lzFs/JU2FzDITdBtxPqRhDBnMR0IPXkRxP/qMTwFFpOG8sO05GQia/j+591WDVu+
 fH6W6mrhkeTE2ptXMAmzkbZYrTZmBboA=
X-Gm-Gg: ASbGncvYMw6S1AE9KaG3MQ5tkw54H8QQf6JBojbM8f250vWJrJW5n+VdhpUaeAjEX56
 rqYJDxatiqHyZMyvBv7TUw8avZ9uBHbb7FvQBp0A0iSlstnZL6VhkGDMLBQC2wlKApxzBVROO2Z
 WnDMji8tO5ut7TT0Dw7gB0BP8MSk4ZM1VfwzZeYcHulio8vcMtfw9mSLiwBZR/x1NubiBmGXq1t
 r8yYrGFY/jPuF+qkkv7pC90INPjeY3D6MQ7i+X3TnYzq2GOwOYuL2rhGARHqw==
X-Google-Smtp-Source: AGHT+IFJTEE/HiXWIG5TrFeKs4d/L4HVAF/6dXh5N41lm9MqW0h0eE/vtqgH9ezqqCt3yptuBI/ANyhTR2qjHPJdc28=
X-Received: by 2002:a17:903:3806:b0:24c:bc02:788b with SMTP id
 d9443c01a7336-290cb27d765mr263955945ad.44.1761128221090; Wed, 22 Oct 2025
 03:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
 <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
In-Reply-To: <20251009233837.10283-3-mohamedahmedegypt2001@gmail.com>
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Date: Wed, 22 Oct 2025 13:16:47 +0300
X-Gm-Features: AS18NWBQRfdO1-l7UglbvLD1hS6ztsSHvm9zOj3-1-7RwG9-CwiA8rLqNmZ653w
Message-ID: <CAA+WOBvVasy2wRP_wmP-R6Q8y5B4sN08jNYfHuDVjiWXV+m23Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/nouveau/uvmm: Allow larger pages
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello,

Pinging again re: review and also was asking if we can revert the
select_page_shift() handling back to v1 behavior with a fall-back
path, as it looks like there are some cases where
nouveau_bo_fixup_align() isn't enough;
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450#note_315919=
9.

Thanks!

On Fri, Oct 10, 2025 at 2:39=E2=80=AFAM Mohamed Ahmed
<mohamedahmedegypt2001@gmail.com> wrote:
>
> From: Mary Guillemard <mary@mary.zone>
>
> Now that everything in UVMM knows about the variable page shift, we can
> select larger values.
>
> The proposed approach relies on nouveau_bo::page unless if it would cause
> alignment issues (in which case we fall back to searching for an
> appropriate shift)
>
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> Co-developed-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_uvmm.c | 29 ++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nou=
veau/nouveau_uvmm.c
> index 2cd0835b05e8..26edc60a530b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> @@ -454,6 +454,31 @@ op_unmap_prepare_unwind(struct drm_gpuva *va)
>         drm_gpuva_insert(va->vm, va);
>  }
>
> +static bool
> +op_map_aligned_to_page_shift(const struct drm_gpuva_op_map *op, u8 page_=
shift)
> +{
> +       u64 page_size =3D 1ULL << page_shift;
> +
> +       return op->va.addr % page_size =3D=3D 0 && op->va.range % page_si=
ze =3D=3D 0 &&
> +                  op->gem.offset % page_size =3D=3D 0;
> +}
> +
> +static u8
> +select_page_shift(struct nouveau_uvmm *uvmm, struct drm_gpuva_op_map *op=
)
> +{
> +       struct nouveau_bo *nvbo =3D nouveau_gem_object(op->gem.obj);
> +
> +       /* nouveau_bo_fixup_align() guarantees for us that the page size =
will be aligned
> +        * but just in case, make sure that it is aligned.
> +        */
> +       if (op_map_aligned_to_page_shift(op, nvbo->page))
> +               return nvbo->page;
> +
> +       /* This should never happen, but raise a warning and return 4K if=
 we get here. */
> +       WARN_ON(1);
> +       return PAGE_SHIFT;
> +}
> +
>  static void
>  nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *uvmm,
>                                struct nouveau_uvma_prealloc *new,
> @@ -506,7 +531,7 @@ nouveau_uvmm_sm_prepare_unwind(struct nouveau_uvmm *u=
vmm,
>                         if (vmm_get_range)
>                                 nouveau_uvmm_vmm_put(uvmm, vmm_get_start,
>                                                      vmm_get_range,
> -                                                    PAGE_SHIFT);
> +                                                    select_page_shift(uv=
mm, &op->map));
>                         break;
>                 }
>                 case DRM_GPUVA_OP_REMAP: {
> @@ -599,7 +624,7 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
>
>         uvma->region =3D args->region;
>         uvma->kind =3D args->kind;
> -       uvma->page_shift =3D PAGE_SHIFT;
> +       uvma->page_shift =3D select_page_shift(uvmm, op);
>
>         drm_gpuva_map(&uvmm->base, &uvma->va, op);
>
> --
> 2.51.0
>
