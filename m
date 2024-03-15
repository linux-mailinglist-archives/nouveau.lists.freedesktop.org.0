Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75687D6C8
	for <lists+nouveau@lfdr.de>; Fri, 15 Mar 2024 23:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF5811264F;
	Fri, 15 Mar 2024 22:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Gfs98Wq/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8AE11264F
 for <nouveau@lists.freedesktop.org>; Fri, 15 Mar 2024 22:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710542773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRIxaUBnHKjzxk/w28aUKJW59ZRRorJbI8C2dVILdKc=;
 b=Gfs98Wq/VWMOUyvaAvzznL2UsWKpn2pWc7MfU8nyFgMMlLyJdMj1UXvO+QwyuS9Beskw6N
 PnxJjF4p0J6Tg+4UWqXFoaMjaXTEechF0eC3RB1HQogpu8/07FZm9VutHMfYLnbGPhtogM
 bFogl4CCKgLbUcnSVjvq4Zsrbg+iO5M=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-c6YyJp5KNkGzQxbDQyInPg-1; Fri, 15 Mar 2024 18:46:11 -0400
X-MC-Unique: c6YyJp5KNkGzQxbDQyInPg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-60a2386e932so53181407b3.1
 for <nouveau@lists.freedesktop.org>; Fri, 15 Mar 2024 15:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710542771; x=1711147571;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRIxaUBnHKjzxk/w28aUKJW59ZRRorJbI8C2dVILdKc=;
 b=igTSiYoq3kiF25i+h5Akto2f3mJ0gP0mK7ApCB+l3lD0Rq5FppxkMes3UsvqRkErhf
 uQJtiN701qpulRxW7dvyLHXqjJWFA39b7RpysVfhA5NyijZfnk+QSQK24iXvGVlw5X0l
 urv2iFh4bOopT5MrLO7uIbRq+UFMot2PjblOFemo2/nhV8pE8FKGcbTcbzGyYi9/I0FB
 VNNLeF5WIeacgyYQQotLsiobTswwEv4XpH/QaYkOSZGI7nG9RYfgvPTQVszrEfEI7Te+
 NDQVlWoUPpArfheQG79MAWBftZftOAgBC4lYTP8RMZ2nCHlvKMTkm6lK+l2IjMbzkOkw
 xtcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMY/YsDg7Yui15PM3ji2f9LfIPl8d46fanhvQI1V91cO0RE2Anh7nK6UgVN06AcVJXFkxoGRbHGypIALHyRLqRfFpBkTBd7uv4tWZacQ==
X-Gm-Message-State: AOJu0YygMlI5bz3akMkgCmCoGj0ajIfPZirTbs6fN5+Eg3GPSNtjGH0B
 Sl8SfIkl8mydiXyE5MYR9k5h0WGT+Mt7NW3OxyQ1c/5tO+uNy/ZNWQW9LOW6WR7HqSK4I8iO0xJ
 qALhL+seEG2zxGgGb+VSuajybHzMtl4rDWcCQI1BA4ekKnFdgEBINUIoeeza36at3Q4ULC4Bzza
 p8XWwMFZaBRU6egqh8Bs3Q18/fs10PYzV4pxLFgQ==
X-Received: by 2002:a0d:c806:0:b0:5ff:7cca:a434 with SMTP id
 k6-20020a0dc806000000b005ff7ccaa434mr6671706ywd.51.1710542771373; 
 Fri, 15 Mar 2024 15:46:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE546xo3HvJPY2qu672aEMFegdumCBfdse8Abcj5PGVflapFASYr5pywdAPdVOlwGoIO8LpM2ar7PP1CaBsKGQ=
X-Received: by 2002:a0d:c806:0:b0:5ff:7cca:a434 with SMTP id
 k6-20020a0dc806000000b005ff7ccaa434mr6671688ywd.51.1710542771075; Fri, 15 Mar
 2024 15:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240315212104.776936-1-lyude@redhat.com>
In-Reply-To: <20240315212104.776936-1-lyude@redhat.com>
From: David Airlie <airlied@redhat.com>
Date: Sat, 16 Mar 2024 08:45:59 +1000
Message-ID: <CAMwc25qaqyJa179rkBUgZKU5Otne1S07Z3ir0qK6a9mc=U3EZA@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/dp: Fix incorrect return code in
 r535_dp_aux_xfer()
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 Karol Herbst <kherbst@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>, 
 open list <linux-kernel@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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

Reviewed-by: Dave Airlie <airlied@redhat.com>

On Sat, Mar 16, 2024 at 7:21=E2=80=AFAM Lyude Paul <lyude@redhat.com> wrote=
:
>
> I've recently been seeing some unexplained GSP errors on my RTX 6000 from
> failed aux transactions:
>
>   [  132.915867] nouveau 0000:1f:00.0: gsp: cli:0xc1d00002 obj:0x00730000
>   ctrl cmd:0x00731341 failed: 0x0000ffff
>
> While the cause of these is not yet clear, these messages made me notice
> that the aux transactions causing these transactions were succeeding - no=
t
> failing. As it turns out, this is because we're currently not returning t=
he
> correct variable when r535_dp_aux_xfer() hits an error - causing us to
> never propagate GSP errors for failed aux transactions to userspace.
>
> So, let's fix that.
>
> Fixes: 4ae3a20102b2 ("nouveau/gsp: don't free ctrl messages on errors")
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c b/drivers/gp=
u/drm/nouveau/nvkm/engine/disp/r535.c
> index 6a0a4d3b8902d..027867c2a8c5b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
> @@ -1080,7 +1080,7 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u=
32 addr, u8 *data, u8 *psize)
>         ret =3D nvkm_gsp_rm_ctrl_push(&disp->rm.objcom, &ctrl, sizeof(*ct=
rl));
>         if (ret) {
>                 nvkm_gsp_rm_ctrl_done(&disp->rm.objcom, ctrl);
> -               return PTR_ERR(ctrl);
> +               return ret;
>         }
>
>         memcpy(data, ctrl->data, size);
> --
> 2.43.0
>

