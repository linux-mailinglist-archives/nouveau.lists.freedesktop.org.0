Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01481B31F56
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 17:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BF810EB5A;
	Fri, 22 Aug 2025 15:48:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="gBDTbNGC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7F010EB5A
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 15:48:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2465cb0e81bso2442235ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755877695; x=1756482495;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xN84CYhIFGwjQYLkrLimX0GikQ2L4MHKGoucIYno+Qo=;
 b=gBDTbNGCAUr4UTpa3eIregxJtnSO0q5BuBcQW0vZ+gPMJts2bsiTc/hSsxvVxj3YI/
 TuXxNi6WGu4plLfWL7sw3uxvN9nfU8TQ75v/jTz4mBcqhs+4cwADDvJxM7RhmSg/APXE
 d7rcAmNq2nH73jCzMLZXr/q791vVyMAEMc+ZrYXRlv9sejgCkS6Xgm8jOk9XwOPWFn4L
 awnfQq84hk/a9GYOfkpsa/XS1g4HHOee8jZKL+zdJ1kfHq/zvetxOHYStN+JWiVKgnh4
 A6hPj+URzUAwAeBBNXSd91C0L3px1upwUOLrTX0pdbkWbkL7qBpr5183fiRdsl7Euq2B
 dJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755877695; x=1756482495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xN84CYhIFGwjQYLkrLimX0GikQ2L4MHKGoucIYno+Qo=;
 b=sbgsMC9zs2uBbGTPu9G5whSqyWIjyNQMvTyGRj/YM1iTst7kCbWgdhwyPGS6m8ej+W
 eTAWPxX83JVaPA8dsV2g1akPKOgeAPMcxKHkOjwWDVHsh2hqxrx5JSoNVdeIkZ32mJ3w
 9yRiy+ZbyLJUdl1J2ENBkFuNOG/4PaPQY8kDAiXI6PnM4CAx0RBpIRtfLf/YzqANxS84
 2IHcN/QnfBrBK/xKLHP7oSPvoPo91+dH2/ofHBVomdTtJvGpEJwPxix5CTYxqHgJwCiH
 flZqiXIWDmi2ivQMBJ0/egmmDdHgN+awZgIGRYTWY0srNxLoEi9w2yi5OGkIMJAEZm+w
 49Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnASL8CSu68MjmZhgz0x2Enbb6hEFxGZu5LJ09muM7Oa2oy+A87JOgw583ztTrvFO9OHg0TWcM@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqRWmPU0Wi3z7IhIWeEYOeEQQf8wbq4KyVuuVdMFiKikzth/Bq
 3zitKfKXBNALfngmMi3mfDBKYNPlqI/A9QIwsMuHFNFHBsIwtYfNESJP36S4XhXLb3dUI57WeE1
 kWZNZfQHOgR3Uf+5OObm6aDZKp7b+s27SXufTT+dWPg==
X-Gm-Gg: ASbGncuvcBs0YzUAC2VNFX1BWt+oH4t8RT61R+aQ4Kz8buIcy3vwF4qURW9a5+jxgkN
 e0QZ9SbkuO2+t4CTVV/0iia3B+OsrH867MsY4GzKw180+ezQELgBGtatSx1O4hwo1FYSeLk66EQ
 KU/bclfVlygwPfb1Fi87bGFp+9zKt6BKPJH5xTQ8j4CiefIst9o2l1/HA5EIyXVPcBN71xPEAbR
 vrdzwI=
X-Google-Smtp-Source: AGHT+IFCRvbO57Wx+hx3aoKumInURzltnjKAdS397FD58bXr/9xH2xi6/VieOLFfRFxloa4Rv7Id3CtPvlWPO0tMwpo=
X-Received: by 2002:a17:902:ce01:b0:240:967a:fec3 with SMTP id
 d9443c01a7336-2462ef1f1c7mr48407055ad.29.1755877695167; Fri, 22 Aug 2025
 08:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-4-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-4-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 11:48:04 -0400
X-Gm-Features: Ac12FXwss5vbKtmD-ywCXJZxR_u6_vIicgyUcM5oN8nUNbYSwfNA-YxOq8gTi3M
Message-ID: <CAOFGe97AN_yo7Mg4Z7s=qOFzSGzzs6CLEAhByf-ks2GthFj0aw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/nouveau: Advertise correct modifiers on GB20x
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: multipart/alternative; boundary="0000000000004a348e063cf6224c"
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

--0000000000004a348e063cf6224c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:

> 8 and 16 bit formats use a different layout on
> GB20x than they did on prior chips. Add the
> corresponding DRM format modifiers to the list of
> modifiers supported by the display engine on such
> chips, and filter the supported modifiers for each
> format based on its bytes per pixel in
> nv50_plane_format_mod_supported().
>
> Note this logic will need to be updated when GB10
> support is added, since it is a GB20x chip that
> uses the pre-GB20x sector layout for all formats.
>
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 ++-
>  drivers/gpu/drm/nouveau/dispnv50/disp.h     |  1 +
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 24 +++++++++++++--
>  drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 +++++++++++++++++++++
>  4 files changed, 59 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index e97e39abf3a2..12b1dba8e05d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)
>         }
>
>         /* Assign the correct format modifiers */
> -       if (disp->disp->object.oclass >=3D TU102_DISP)
> +       if (disp->disp->object.oclass >=3D GB202_DISP)
> +               nouveau_display(dev)->format_modifiers =3D
> wndwca7e_modifiers;
> +       else if (disp->disp->object.oclass >=3D TU102_DISP)
>                 nouveau_display(dev)->format_modifiers =3D
> wndwc57e_modifiers;
>         else
>         if (drm->client.device.info.family >=3D NV_DEVICE_INFO_V0_FERMI)
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> b/drivers/gpu/drm/nouveau/dispnv50/disp.h
> index 15f9242b72ac..5d998f0319dc 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
> @@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct
> drm_encoder *encoder);
>  extern const u64 disp50xx_modifiers[];
>  extern const u64 disp90xx_modifiers[];
>  extern const u64 wndwc57e_modifiers[];
> +extern const u64 wndwca7e_modifiers[];
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index e2c55f4b9c5a..ef9e410babbf 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)
>  }
>
>  /* This function assumes the format has already been validated against
> the plane
> - * and the modifier was validated against the device-wides modifier list
> at FB
> + * and the modifier was validated against the device-wide modifier list
> at FB
>   * creation time.
>   */
>  static bool nv50_plane_format_mod_supported(struct drm_plane *plane,
>                                             u32 format, u64 modifier)
>  {
>         struct nouveau_drm *drm =3D nouveau_drm(plane->dev);
> +       const struct drm_format_info *info =3D drm_format_info(format);
>         uint8_t i;
>
>         /* All chipsets can display all formats in linear layout */
> @@ -800,13 +801,32 @@ static bool nv50_plane_format_mod_supported(struct
> drm_plane *plane,
>                 return true;
>
>         if (drm->client.device.info.chipset < 0xc0) {
> -               const struct drm_format_info *info =3D
> drm_format_info(format);
>                 const uint8_t kind =3D (modifier >> 12) & 0xff;
>
>                 if (!format) return false;
>
>                 for (i =3D 0; i < info->num_planes; i++)
>                         if ((info->cpp[i] !=3D 4) && kind !=3D 0x70) retu=
rn
> false;
> +       } else if (drm->client.device.info.chipset >=3D 0x1b2) {
> +               const uint8_t slayout =3D ((modifier >> 22) & 0x1) |
> +                       ((modifier >> 25) & 0x6);
> +
> +               if (!format)
> +                       return false;
> +
> +               /*
> +                * Note in practice this implies only formats where cpp i=
s
> equal
> +                * for each plane, or >=3D 4 for all planes, are supporte=
d.
> +                */
> +               for (i =3D 0; i < info->num_planes; i++) {
> +                       if (((info->cpp[i] =3D=3D 2) && slayout !=3D 3) |=
|
> +                           ((info->cpp[i] =3D=3D 1) && slayout !=3D 2) |=
|
> +                           ((info->cpp[i] >=3D 4) && slayout !=3D 1))
> +                               return false;
> +
> +                       /* 24-bit not supported. It has yet another layou=
t
> */
> +                       WARN_ON(info->cpp[i] =3D=3D 3);
>

Should this really be a WARN_ON()? A DRM log message, maybe, but WARN_ON()
implies something went funky inside the kernel, not that userspace asked
for something it shouldn't.


> +               }
>         }
>
>         return true;
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> index 0d8e9a9d1a57..2cec8cfbd546 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
> @@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw, struct
> nv50_wndw_atom *asyw)
>         return 0;
>  }
>
> +/****************************************************************
> + *            Log2(block height) ----------------------------+  *
> + *            Page Kind ----------------------------------+  |  *
> + *            Gob Height/Page Kind Generation ------+     |  |  *
> + *                          Sector layout -------+  |     |  |  *
> + *                          Compression ------+  |  |     |  |  */
> +const u64 wndwca7e_modifiers[] =3D { /*         |  |  |     |  |  */
> +       /* 4cpp+ modifiers */
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 0),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 1),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 2),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 3),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 4),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, 0x06, 5),
> +       /* 1cpp/8bpp modifiers */
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 0),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 1),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 2),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 3),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 4),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, 0x06, 5),
> +       /* 2cpp/16bpp modifiers */
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 0),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 1),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 2),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 3),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 4),
> +       DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, 0x06, 5),
> +       /* All formats support linear */
> +       DRM_FORMAT_MOD_LINEAR,
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  static const struct nv50_wndw_func
>  wndwca7e =3D {
>         .acquire =3D wndwc37e_acquire,
> --
> 2.50.1
>
>

--0000000000004a348e063cf6224c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote gmail_quote_container"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM Ja=
mes Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">8 and=
 16 bit formats use a different layout on<br>
GB20x than they did on prior chips. Add the<br>
corresponding DRM format modifiers to the list of<br>
modifiers supported by the display engine on such<br>
chips, and filter the supported modifiers for each<br>
format based on its bytes per pixel in<br>
nv50_plane_format_mod_supported().<br>
<br>
Note this logic will need to be updated when GB10<br>
support is added, since it is a GB20x chip that<br>
uses the pre-GB20x sector layout for all formats.<br>
<br>
Signed-off-by: James Jones &lt;<a href=3D"mailto:jajones@nvidia.com" target=
=3D"_blank">jajones@nvidia.com</a>&gt;<br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 =
++-<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 1 =
+<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv50/wndw.c=C2=A0 =C2=A0 =C2=A0| 24 +++++=
++++++++--<br>
=C2=A0drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c | 33 ++++++++++++++++++++=
+<br>
=C2=A04 files changed, 59 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.c<br>
index e97e39abf3a2..12b1dba8e05d 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c<br>
@@ -2867,7 +2867,9 @@ nv50_display_create(struct drm_device *dev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Assign the correct format modifiers */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (disp-&gt;disp-&gt;object.oclass &gt;=3D TU1=
02_DISP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (disp-&gt;disp-&gt;object.oclass &gt;=3D GB2=
02_DISP)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_display(dev=
)-&gt;format_modifiers =3D wndwca7e_modifiers;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (disp-&gt;disp-&gt;object.oclass &gt;=
=3D TU102_DISP)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nouveau_display(dev=
)-&gt;format_modifiers =3D wndwc57e_modifiers;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm-&gt;<a href=3D"http://client.device.inf=
o" target=3D"_blank">client.device.info</a>.family &gt;=3D NV_DEVICE_INFO_V=
0_FERMI)<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouv=
eau/dispnv50/disp.h<br>
index 15f9242b72ac..5d998f0319dc 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h<br>
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h<br>
@@ -104,4 +104,5 @@ struct nouveau_encoder *nv50_real_outp(struct drm_encod=
er *encoder);<br>
=C2=A0extern const u64 disp50xx_modifiers[];<br>
=C2=A0extern const u64 disp90xx_modifiers[];<br>
=C2=A0extern const u64 wndwc57e_modifiers[];<br>
+extern const u64 wndwca7e_modifiers[];<br>
=C2=A0#endif<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouv=
eau/dispnv50/wndw.c<br>
index e2c55f4b9c5a..ef9e410babbf 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c<br>
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c<br>
@@ -786,13 +786,14 @@ nv50_wndw_destroy(struct drm_plane *plane)<br>
=C2=A0}<br>
<br>
=C2=A0/* This function assumes the format has already been validated agains=
t the plane<br>
- * and the modifier was validated against the device-wides modifier list a=
t FB<br>
+ * and the modifier was validated against the device-wide modifier list at=
 FB<br>
=C2=A0 * creation time.<br>
=C2=A0 */<br>
=C2=A0static bool nv50_plane_format_mod_supported(struct drm_plane *plane,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 u32 format, u64 modifier)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nouveau_drm *drm =3D nouveau_drm(plane-&=
gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_format_info *info =3D drm_form=
at_info(format);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t i;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* All chipsets can display all formats in line=
ar layout */<br>
@@ -800,13 +801,32 @@ static bool nv50_plane_format_mod_supported(struct dr=
m_plane *plane,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (drm-&gt;<a href=3D"http://client.device.inf=
o" target=3D"_blank">client.device.info</a>.chipset &lt; 0xc0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct drm_fo=
rmat_info *info =3D drm_format_info(format);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const uint8_t kind =
=3D (modifier &gt;&gt; 12) &amp; 0xff;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!format) return=
 false;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt=
; info-&gt;num_planes; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if ((info-&gt;cpp[i] !=3D 4) &amp;&amp; kind !=3D 0x70) return f=
alse;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (drm-&gt;<a href=3D"http://client.dev=
ice.info" target=3D"_blank">client.device.info</a>.chipset &gt;=3D 0x1b2) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const uint8_t slayo=
ut =3D ((modifier &gt;&gt; 22) &amp; 0x1) |<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0((modifier &gt;&gt; 25) &amp; 0x6);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!format)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * Note in practice=
 this implies only formats where cpp is equal<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * for each plane, =
or &gt;=3D 4 for all planes, are supported.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt=
; info-&gt;num_planes; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (((info-&gt;cpp[i] =3D=3D 2) &amp;&amp; slayout !=3D 3) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0((info-&gt;cpp[i] =3D=3D 1) &amp;&amp; slayout !=3D=
 2) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0((info-&gt;cpp[i] &gt;=3D 4) &amp;&amp; slayout !=
=3D 1))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* 24-bit not supported. It has yet another layout */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0WARN_ON(info-&gt;cpp[i] =3D=3D 3);<br></blockquote><div><br></div=
><div>Should this really be a WARN_ON()? A DRM log message, maybe, but WARN=
_ON() implies something went funky inside the kernel, not that userspace as=
ked for something it shouldn&#39;t.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/gpu/drm/=
nouveau/dispnv50/wndwca7e.c<br>
index 0d8e9a9d1a57..2cec8cfbd546 100644<br>
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c<br>
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c<br>
@@ -179,6 +179,39 @@ wndwca7e_ntfy_set(struct nv50_wndw *wndw, struct nv50_=
wndw_atom *asyw)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
<br>
+/****************************************************************<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Log2(block height) -----------=
-----------------+=C2=A0 *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Page Kind --------------------=
--------------+=C2=A0 |=C2=A0 *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Gob Height/Page Kind Generatio=
n ------+=C2=A0 =C2=A0 =C2=A0|=C2=A0 |=C2=A0 *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Sector layout -------+=C2=A0 |=C2=A0 =C2=A0 =C2=A0|=C2=
=A0 |=C2=A0 *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Compression ------+=C2=A0 |=C2=A0 |=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 |=C2=A0 */<br>
+const u64 wndwca7e_modifiers[] =3D { /*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 |=C2=A0 |=C2=A0 =C2=A0 =C2=A0|=C2=A0 |=C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 4cpp+ modifiers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 1, 2, =
0x06, 5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1cpp/8bpp modifiers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 2, 2, =
0x06, 5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* 2cpp/16bpp modifiers */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 0),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 1),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 2),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 3),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 4),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(0, 3, 2, =
0x06, 5),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* All formats support linear */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_LINEAR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_MOD_INVALID<br>
+};<br>
+<br>
=C2=A0static const struct nv50_wndw_func<br>
=C2=A0wndwca7e =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .acquire =3D wndwc37e_acquire,<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div></div>

--0000000000004a348e063cf6224c--
