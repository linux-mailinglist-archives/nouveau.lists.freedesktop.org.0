Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA2A6ED12D
	for <lists+nouveau@lfdr.de>; Mon, 24 Apr 2023 17:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A9110E1D4;
	Mon, 24 Apr 2023 15:20:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A2810E1D4
 for <nouveau@lists.freedesktop.org>; Mon, 24 Apr 2023 15:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682349635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ybXQpJGX8ksVbqeQTg5aMwu/7o/goFFitwiYzrK7BM=;
 b=TZWQoflSC8xQcNtYq58/yTGVvnswVa5Km0u7Gr7CFgzuE4rGIuC27NuJ91dnA/okrBR1tu
 sUxisp2bOeLrFnp7TF6upyMJr/v63Z8F0FKUoHsEJ/P+vMME2y2SD/EvSTivR7txeIvh9o
 BSLiSmVrNlx7jxXLavDswLcC8M1TC1Q=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-YhZGQmhBOxSmQC9m92zPZA-1; Mon, 24 Apr 2023 11:20:29 -0400
X-MC-Unique: YhZGQmhBOxSmQC9m92zPZA-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2a8aaa36757so2685431fa.0
 for <nouveau@lists.freedesktop.org>; Mon, 24 Apr 2023 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682349628; x=1684941628;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ybXQpJGX8ksVbqeQTg5aMwu/7o/goFFitwiYzrK7BM=;
 b=kxMlY4LSUbfrxP+1GK5rrtYCuK2grrpaYKj51YKrG9FNtT6uKDstoE7nhi1VlEqAFL
 wk/Itj/FY8tQE3onwMj7UjQ+lZ2WHthJSxteK6Nyw7lDVjTIIvncSUVBaL4KHj6DAYaq
 7+ysHLL+pH2fyVtK5tQP6DunFsKeQuXC/BeELtzLM5ARJ+IQa7gIIzU3NhotLKv94seU
 u++EvNWFfs94WK7gm46BkmgRyPq6dVexWtqlbMRGR6yZoJyIY5fdXoeufkosCQzvo0hr
 PvfI0kIZIIb5hBJirjNYrwFLxPR9e9yFAjXBeuwIzkEp+PQFoo95FRKlQmTUBN+Zk00Q
 rjDg==
X-Gm-Message-State: AAQBX9ejqVIl7li8ksNJId1mbzcDI4OTDCgOIxyQwh7IpSvScYxp7ych
 4xverZPtamwJgZTAJs5GYs+vww7RlqE3pNMlK2w0w4q0VyUSIltypamL7SYZnBb/dwgklmwYOWh
 acH3ah8NO+BKsY/OmWmAEN2xc3eHooZUgkqTe6MH5pw==
X-Received: by 2002:a2e:924b:0:b0:2a9:f6f0:fc84 with SMTP id
 v11-20020a2e924b000000b002a9f6f0fc84mr3486701ljg.4.1682349628263; 
 Mon, 24 Apr 2023 08:20:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350brn3/2mvZw23jR8Revx5XmXXtkygZGuUo8HD5LLVeLxmu8zC85TkjrgP/HdRDXdUOJ1/BuBAsvCCX/3rAcWwU=
X-Received: by 2002:a2e:924b:0:b0:2a9:f6f0:fc84 with SMTP id
 v11-20020a2e924b000000b002a9f6f0fc84mr3486688ljg.4.1682349627904; Mon, 24 Apr
 2023 08:20:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230204184307.never.825-kees@kernel.org>
 <0a48d61b-6e11-9144-b11e-dd46de836c53@embeddedor.com>
In-Reply-To: <0a48d61b-6e11-9144-b11e-dd46de836c53@embeddedor.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 24 Apr 2023 17:20:16 +0200
Message-ID: <CACO55tv43F7TQGYCmifyzOxR-Ddt28wpj9t9RyK4sQPR6aU+bQ@mail.gmail.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: More DP_RECEIVER_CAP_SIZE
 array fixes
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
Cc: Kees Cook <keescook@chromium.org>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Mar 22, 2023 at 10:40=E2=80=AFPM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
>
>
> On 2/4/23 12:43, Kees Cook wrote:
> > More arrays (and arguments) for dcpd were set to 16, when it looks like
> > DP_RECEIVER_CAP_SIZE (15) should be used. Fix the remaining cases, seen
> > with GCC 13:
> >
> > ../drivers/gpu/drm/nouveau/nvif/outp.c: In function 'nvif_outp_acquire_=
dp':
> > ../include/linux/fortify-string.h:57:33: warning: array subscript 'unsi=
gned char[16][0]' is partly outside array bounds of 'u8[15]' {aka 'unsigned=
 char[15]'} [-Warray-bounds=3D]
> >     57 | #define __underlying_memcpy     __builtin_memcpy
> >        |                                 ^
> > ...
> > ../drivers/gpu/drm/nouveau/nvif/outp.c:140:9: note: in expansion of mac=
ro 'memcpy'
> >    140 |         memcpy(args.dp.dpcd, dpcd, sizeof(args.dp.dpcd));
> >        |         ^~~~~~
> > ../drivers/gpu/drm/nouveau/nvif/outp.c:130:49: note: object 'dpcd' of s=
ize [0, 15]
> >    130 | nvif_outp_acquire_dp(struct nvif_outp *outp, u8 dpcd[DP_RECEIV=
ER_CAP_SIZE],
> >        |                                              ~~~^~~~~~~~~~~~~~=
~~~~~~~~~~~~
> >
> > Fixes: 813443721331 ("drm/nouveau/disp: move DP link config into acquir=
e")
> > Cc: Ben Skeggs <bskeggs@redhat.com>
> > Cc: Lyude Paul <lyude@redhat.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Dave Airlie <airlied@redhat.com>
> > Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: nouveau@lists.freedesktop.org
> > Signed-off-by: Kees Cook <keescook@chromium.org>
>
> Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

sorry for not seeing this earlier.

> Thanks!
> --
> Gustavo
>
> > ---
> >   drivers/gpu/drm/nouveau/include/nvif/if0012.h    | 4 +++-
> >   drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 3 ++-
> >   drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 +-
> >   3 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gp=
u/drm/nouveau/include/nvif/if0012.h
> > index eb99d84eb844..16d4ad5023a3 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
> > @@ -2,6 +2,8 @@
> >   #ifndef __NVIF_IF0012_H__
> >   #define __NVIF_IF0012_H__
> >
> > +#include <drm/display/drm_dp.h>
> > +
> >   union nvif_outp_args {
> >       struct nvif_outp_v0 {
> >               __u8 version;
> > @@ -63,7 +65,7 @@ union nvif_outp_acquire_args {
> >                               __u8 hda;
> >                               __u8 mst;
> >                               __u8 pad04[4];
> > -                             __u8 dpcd[16];
> > +                             __u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >                       } dp;
> >               };
> >       } v0;
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/=
gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > index b7631c1ab242..4e7f873f66e2 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
> > @@ -3,6 +3,7 @@
> >   #define __NVKM_DISP_OUTP_H__
> >   #include "priv.h"
> >
> > +#include <drm/display/drm_dp.h>
> >   #include <subdev/bios.h>
> >   #include <subdev/bios/dcb.h>
> >   #include <subdev/bios/dp.h>
> > @@ -42,7 +43,7 @@ struct nvkm_outp {
> >                       bool aux_pwr_pu;
> >                       u8 lttpr[6];
> >                       u8 lttprs;
> > -                     u8 dpcd[16];
> > +                     u8 dpcd[DP_RECEIVER_CAP_SIZE];
> >
> >                       struct {
> >                               int dpcd; /* -1, or index into SUPPORTED_=
LINK_RATES table */
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers=
/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index 4f0ca709c85a..fc283a4a1522 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -146,7 +146,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, voi=
d *argv, u32 argc)
> >   }
> >
> >   static int
> > -nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[16],
> > +nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER=
_CAP_SIZE],
> >                          u8 link_nr, u8 link_bw, bool hda, bool mst)
> >   {
> >       int ret;
>

