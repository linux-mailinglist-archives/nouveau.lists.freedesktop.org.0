Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7156BEACC
	for <lists+nouveau@lfdr.de>; Fri, 17 Mar 2023 15:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FBDC10EF10;
	Fri, 17 Mar 2023 14:13:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F30310E39B
 for <nouveau@lists.freedesktop.org>; Fri, 17 Mar 2023 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679062427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c3t3amNCtDqC/lfWvkx2OeWsv1F0lpA23KA/QFJT56c=;
 b=hSApxDA3UP5R0j1fjSr7bLYGMPlPMZuBmfI0wqfe7BNQSdICB2r5Ov0qlNO1X4St7/tmu3
 d6uYTvvlZbqK/Yz10DYC0ZhrJFecjr80IjiJ9a0TGlwSN/UhLswCmKrFzMpRkgYhi0ESkT
 SYrLpRKHreWqwqXaBsdVRBlQ0Bnhkgs=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-T_xF4GtaPbqWUwbdhevPGw-1; Fri, 17 Mar 2023 10:13:46 -0400
X-MC-Unique: T_xF4GtaPbqWUwbdhevPGw-1
Received: by mail-lf1-f69.google.com with SMTP id
 c29-20020a056512239d00b004e83ed6bbc5so2092949lfv.23
 for <nouveau@lists.freedesktop.org>; Fri, 17 Mar 2023 07:13:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679062425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c3t3amNCtDqC/lfWvkx2OeWsv1F0lpA23KA/QFJT56c=;
 b=Pgboi6Gv5JnhTq42Nad76xjElozJbcIDwukW2RlLOTj4NF9KhTBY5V+DJz+oLTSB5y
 accPdZXnBj/f5yZGPWRUf6HRnii0/85D7SiSo3oREd752jz602nS944c9xxO5M4kqvc4
 hdfLnp8WC9pvvjM+ES9QshvaPYG/IsJJa1wK07X3p24KnTjLtxzHLdmJ6aecNdJvw8x3
 CujdTo4SBwKv2XsV/xMN6my5CzHXvqcTsdKR5FKRUd9g8Gnh1Fbg3nZSd7ZvZm4rwq8U
 ee9qDh11BHYxMMbrs5FCsHdysrvyY3pS9ISLgOniLd3RIPGnPSHSB72spYRK9vNPWkHw
 Su8Q==
X-Gm-Message-State: AO0yUKXJoD8zeRzotfk8iO3FgQeoN0bWEyiGLrkmC8y1+r56aTrnC3H/
 14y+PleemLs8IumLzzV72bbD/wcLOPldJiYKiNa3RAeWX/gK5JGFVj+0IzE83KdhRvkfF3NrrSx
 67gU7oSMkIJtsioGWxRuLthXQHjbrJNAf6nOcDpnsQg==
X-Received: by 2002:a2e:7219:0:b0:299:a9db:9c with SMTP id
 n25-20020a2e7219000000b00299a9db009cmr1892444ljc.9.1679062425123; 
 Fri, 17 Mar 2023 07:13:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set/UVaZlNRO6LvO15jv6aTQnuB6SzJ0szl6fC+WBTGAbN3WhmLWh7oNZLb7TFuLt94eePQ6MUGSYqhV29x+safI=
X-Received: by 2002:a2e:7219:0:b0:299:a9db:9c with SMTP id
 n25-20020a2e7219000000b00299a9db009cmr1892428ljc.9.1679062424881; 
 Fri, 17 Mar 2023 07:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230317081718.2650744-1-lee@kernel.org>
 <20230317081718.2650744-35-lee@kernel.org>
In-Reply-To: <20230317081718.2650744-35-lee@kernel.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 17 Mar 2023 15:13:33 +0100
Message-ID: <CACO55tuhLEdRxGGnpMwfvj0s4E2kR74xyYdGfeokD4xSR3G7cg@mail.gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] 
	=?utf-8?q?=5BPATCH_34/37=5D_drm/nouveau/nvkm/engine/gr?=
	=?utf-8?q?/tu102=3A_Completely_remove_unused_function_=E2=80=98tu1?=
	=?utf-8?b?MDJfZ3JfbG9hZOKAmQ==?=
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
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 9:23=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: =E2=80=98=
tu102_gr_load=E2=80=99 defined but not used [-Wunused-function]
>

mhh, this looks a little fishy and might be a mistake not using this functi=
on.

Ben, is it safe to remove it? The code seems to be slightly different
things, but also looks like it needs to be rewritten a little anyway.

> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 10a7e59482a6f..a7775aa185415 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, str=
uct gf100_gr_pack **ppack)
>         return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
>
> -static int
> -tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
> -{
> -       int ret;
> -
> -       ret =3D gm200_gr_load(gr, ver, fwif);
> -       if (ret)
> -               return ret;
> -
> -       return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, t=
u102_gr_av_to_init_veid,
> -                                &gr->bundle_veid);
> -}
> -
>  static const struct gf100_gr_fwif
>  tu102_gr_fwif[] =3D {
>         {  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpc=
cs_acr },
> --
> 2.40.0.rc1.284.g88254d51c5-goog
>

