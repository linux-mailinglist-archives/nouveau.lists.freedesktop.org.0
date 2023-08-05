Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D47710AE
	for <lists+nouveau@lfdr.de>; Sat,  5 Aug 2023 19:02:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8939710E0F2;
	Sat,  5 Aug 2023 17:02:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E21589343
 for <nouveau@lists.freedesktop.org>; Sat,  5 Aug 2023 17:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691254970;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AwC2ZFlhYxmRV4GegFNry2xNQ2qKII2yxV/GxFfD/+Q=;
 b=QRdHD3hjtLpyFARvkD3iXYX4WLzHGPgtBC0/jH+Woft7HBO2Q4yY/g6I4cQPHzeAGnGLQ0
 mjDIayRPCEC+dGUbUXuDKKuADPZi6PdM5DPXmJ2oYiDxW9n3J4UXgTHSgYOIG4R64bjqAQ
 Bgi/ypTy8fnqcWa1YCrBJsX+bIX5fMg=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-lR7eInoyPrO4uqNyXILr4Q-1; Sat, 05 Aug 2023 13:02:49 -0400
X-MC-Unique: lR7eInoyPrO4uqNyXILr4Q-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so6723181fa.1
 for <nouveau@lists.freedesktop.org>; Sat, 05 Aug 2023 10:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691254967; x=1691859767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AwC2ZFlhYxmRV4GegFNry2xNQ2qKII2yxV/GxFfD/+Q=;
 b=Qp5dBHa9IP8vEGgx/5HMaa6+p38ZzdBNq6HrWT5+1YuThHgtHnTs+DADhiPsOAZXFG
 y0voSxTBqnERQZNr+qRzWneakK0IPYVFZAUC5l04YC10QTMmfI1xvt6wG6Du7FDJpXo9
 9EG5yYIg3jiqHq+D+aDJElf/k8ahmgYJd4l2RM9yYMD3siKmRIBamtzQ2xCnMTTlKIGm
 AU7o8nGIus9719KxTr1KGXVY/Ee9DtJPJ6AlZDN0Y2FGO0AURYvbFExgarg/c8EfkL+N
 KbCAUL8b/ZFqOnikZrncF1qnEHjMLeBFSNG9z2sINJrv51hO5k+5xrm2dBaPR2tfKTTe
 80CQ==
X-Gm-Message-State: ABy/qLZGkaxmAIvAgv/sxtU9FHEfl84JKW8V5cZC2yoOab97DFgY8L6G
 MO8eCiv5/LWy8OmMigjfLgFKtqrt679o5txaCocJda8lNScSPTOZGMkuHV4QbuRGH0hMRvCKybU
 W4w45yIIRLgjFkjhNvP3AV7fUoPfom+7bbV/5woyQMw==
X-Received: by 2002:a05:651c:2c6:b0:2b6:120a:af65 with SMTP id
 f6-20020a05651c02c600b002b6120aaf65mr11587131ljo.3.1691254967644; 
 Sat, 05 Aug 2023 10:02:47 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYiaAtFICZukz9GbgjadQIab1/CS12YPAHJmL8CGE4gx4kvaxS7NRq41yHA7pyNnx9RsTZk5QJDcTdUUMT23U=
X-Received: by 2002:a05:651c:2c6:b0:2b6:120a:af65 with SMTP id
 f6-20020a05651c02c600b002b6120aaf65mr11587124ljo.3.1691254967373; Sat, 05 Aug
 2023 10:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230805160027.88116-1-dakr@redhat.com>
In-Reply-To: <20230805160027.88116-1-dakr@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 5 Aug 2023 19:02:36 +0200
Message-ID: <CACO55tuS=tg_r-9W1fCr55svT8U0GhxLauMAmAmW7A052S_Mdg@mail.gmail.com>
To: Danilo Krummrich <dakr@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH drm-misc-next] nouveau/dmem: fix copy-paste
 error in nouveau_dmem_migrate_chunk()
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Aug 5, 2023 at 6:00=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> w=
rote:
>
> Fix call to nouveau_fence_emit() with wrong channel parameter.
>
> Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nou=
veau/nouveau_dmem.c
> index 4ad40e42cae1..61e84562094a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -678,7 +678,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau=
_drm *drm,
>         }
>
>         if (!nouveau_fence_new(&fence))
> -               nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan)=
;
> +               nouveau_fence_emit(fence, drm->dmem->migrate.chan);
>         migrate_vma_pages(args);
>         nouveau_dmem_fence_done(&fence);
>         nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
>
> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

