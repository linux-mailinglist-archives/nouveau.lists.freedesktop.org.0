Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4048CB31F80
	for <lists+nouveau@lfdr.de>; Fri, 22 Aug 2025 17:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA73E10EB5B;
	Fri, 22 Aug 2025 15:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="mMOx1aXl";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB8F10EB5B
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 15:51:30 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-24639fbdd87so6377365ad.1
 for <nouveau@lists.freedesktop.org>; Fri, 22 Aug 2025 08:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755877889; x=1756482689;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jQBbemLFLYPDd5EcE0uhxd4vtuQncUKd49J+aioLWvQ=;
 b=mMOx1aXl2nClXT7tcxwCxlOnp109mWB0K70aeRYgOGwlV/wn5gTDFGyY9Eax+eostz
 qoOWhvPojyZT03A09qFzBcv5BaT/XSwE0Rw1DU+0yDqYuJuZ6bEweR+JpyIsR7P30a22
 Eg7TUSwo8rgduma1/4manzyvR81rFfCfwMdgQwFedRKPraSSyjerlbSh9Q4RAsfjfcOd
 g38VHr4y9QPU2sjh9eeNFLz/8rjDh/6lSYbrdvnDoaL8kc4k0//VuDult04HjY/AiMZn
 Rk+1brbTJmwrFUOS1AuhtvWlklhVCW5lfv80eyAnwN4oY7grH/qoql2BYcwQYRzymhxj
 1URA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755877889; x=1756482689;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jQBbemLFLYPDd5EcE0uhxd4vtuQncUKd49J+aioLWvQ=;
 b=e4DtS5DGd35MXwtNU+9QTMGlfPcaTTPHbFjaDthcpBAz+Tm1bPlTmQAka1zpPw7IBY
 DA2qi4LB8KYgiSVJqMYMu81ekzdKRZPp4pc3inzo63lFeVyvsUvbvKFuZEK/oFRvXLtG
 8pn1l9WR7so9fzC+uxDl+u6AhlPYzx401FJ63uZk/Sy8LCWycDiYSgpY2lSzHHMQBhuH
 qlXo2SPIkMsAvyTwI6rIw+H9yUg+Me87wXuYByNIljNGVtpGM6AuTfr4ZFGjFgNbCUjo
 WCF0TvxMOQpoGyXk9OsloEn0TzRZSCAgeLoe97gtPGHT/7lLMUHo3j0+eOH6zdF46A0I
 V4RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZZkH+p/syVSaBFQYF25qS20Es/X/YMUmCPaE6R4pMFAvV6mE/oFK5s4/Q4AD9J1bD/G4Hf+W7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyvWhA2L3idiprCMY6CYBOYULMR0vKPGJF5mxKJGaR5qY/I3Osw
 5hTAVLFNJcMSy8GvKYZl4ea1J7wXlHqVzPJDmGL1od9uOnnyXRRrELZ8IF+VpQVviVO2o77mlHi
 T3U00f34JC24/tbprsbqS98UA3Gqt3Uy7QygX3s4yig==
X-Gm-Gg: ASbGncspJmU1NqiTObpjKgWhyMCqnzCA55SnPrkpeuUrvVAtP3cMSoYmcvm6Jz282od
 /OZ1f2yVUL4E1lMxuoah+W0JWuCLilcqA64lp5QuCeNsZ5mZ6jKuH98fKMqZWALdZcIsZJMiQG3
 Kk1PmviW8jp7N6aE61JDW8Gva7XY7+l6/u61pRRFJzaGlgaU6gXINaYMAd3TlXrgJedtju3gbiz
 cyZ3Yk=
X-Google-Smtp-Source: AGHT+IEszV1CkCqoykqAHatGBkdz/LCZLVn1BdCHAHGozrIbp96WgMI9JHAF+9dsYHVCHE5pM16pwMer2YET2I2Gseg=
X-Received: by 2002:a17:902:ec89:b0:234:986c:66cf with SMTP id
 d9443c01a7336-24632a36135mr44788285ad.16.1755877889575; Fri, 22 Aug 2025
 08:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250811220017.1337-1-jajones@nvidia.com>
 <20250811220017.1337-2-jajones@nvidia.com>
In-Reply-To: <20250811220017.1337-2-jajones@nvidia.com>
From: Faith Ekstrand <faith@gfxstrand.net>
Date: Fri, 22 Aug 2025 11:51:18 -0400
X-Gm-Features: Ac12FXxVgV2Pd_LVZDKN0hEsRDtVkAEORGru1yvRs-tE3T01S4PG8NI1hv-tGyI
Message-ID: <CAOFGe97dr5o5y-_jo_XKKtzuxHbBnuEjv+MFMutjMBj3o9VLxw@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm: define NVIDIA DRM format modifiers for GB20x
To: James Jones <jajones@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Faith Ekstrand <faith.ekstrand@collabora.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: multipart/alternative; boundary="000000000000e09f36063cf62dc1"
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

--000000000000e09f36063cf62dc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James Jones <jajones@nvidia.com> wr=
ote:

> The layout of bits within the individual tiles
> (referred to as sectors in the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)
> changed for 8 and 16-bit surfaces starting in
> Blackwell 2 GPUs (With the exception of GB10).
> To denote the difference, extend the sector field
> in the parametric format modifier definition used
> to generate modifier values for NVIDIA hardware.
>
> Without this change, it would be impossible to
> differentiate the two layouts based on modifiers,
> and as a result software could attempt to share
> surfaces directly between pre-GB20x and GB20x
> cards, resulting in corruption when the surface
> was accessed on one of the GPUs after being
> populated with content by the other.
>
> Of note: This change causes the
> DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to
> evaluate its "s" parameter twice, with the side
> effects that entails. I surveyed all usage of the
> modifier in the kernel and Mesa code, and that
> does not appear to be problematic in any current
> usage, but I thought it was worth calling out.
>
> Signed-off-by: James Jones <jajones@nvidia.com>
>

Reviewed-by: Faith Ekstrand <faith.ekstrand@collabora.com>


> ---
>  include/uapi/drm/drm_fourcc.h | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.=
h
> index ea91aa8afde9..e527b24bd824 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -979,14 +979,20 @@ extern "C" {
>   *               2 =3D Gob Height 8, Turing+ Page Kind mapping
>   *               3 =3D Reserved for future use.
>   *
> - * 22:22 s     Sector layout.  On Tegra GPUs prior to Xavier, there is a
> further
> - *             bit remapping step that occurs at an even lower level tha=
n
> the
> - *             page kind and block linear swizzles.  This causes the
> layout of
> - *             surfaces mapped in those SOC's GPUs to be incompatible
> with the
> - *             equivalent mapping on other GPUs in the same system.
> - *
> - *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout.
> - *               1 =3D Desktop GPU and Tegra Xavier+ Layout
> + * 22:22 s     Sector layout.  There is a further bit remapping step tha=
t
> occurs
> + * 26:27       at an even lower level than the page kind and block linea=
r
> + *             swizzles.  This causes the bit arrangement of surfaces in
> memory
> + *             to differ subtly, and prevents direct sharing of surfaces
> between
> + *             GPUs with different layouts.
> + *
> + *               0 =3D Tegra K1 - Tegra Parker/TX2 Layout
> + *               1 =3D Pre-GB20x, GB20x 32+ bpp, GB10, Tegra Xavier-Orin
> Layout
> + *               2 =3D GB20x(Blackwell 2)+ 8 bpp surface layout
> + *               3 =3D GB20x(Blackwell 2)+ 16 bpp surface layout
> + *               4 =3D Reserved for future use.
> + *               5 =3D Reserved for future use.
> + *               6 =3D Reserved for future use.
> + *               7 =3D Reserved for future use.
>   *
>   * 25:23 c     Lossless Framebuffer Compression type.
>   *
> @@ -1001,7 +1007,7 @@ extern "C" {
>   *               6 =3D Reserved for future use
>   *               7 =3D Reserved for future use
>   *
> - * 55:25 -     Reserved for future use.  Must be zero.
> + * 55:28 -     Reserved for future use.  Must be zero.
>   */
>  #define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \
>         fourcc_mod_code(NVIDIA, (0x10 | \
> @@ -1009,6 +1015,7 @@ extern "C" {
>                                  (((k) & 0xff) << 12) | \
>                                  (((g) & 0x3) << 20) | \
>                                  (((s) & 0x1) << 22) | \
> +                                (((s) & 0x6) << 25) | \
>                                  (((c) & 0x7) << 23)))
>
>  /* To grandfather in prior block linear format modifiers to the above
> layout,
> --
> 2.50.1
>
>

--000000000000e09f36063cf62dc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Aug 11, 2025 at 5:57=E2=80=AFPM James=
 Jones &lt;<a href=3D"mailto:jajones@nvidia.com">jajones@nvidia.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The layo=
ut of bits within the individual tiles<br>
(referred to as sectors in the<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro)<br>
changed for 8 and 16-bit surfaces starting in<br>
Blackwell 2 GPUs (With the exception of GB10).<br>
To denote the difference, extend the sector field<br>
in the parametric format modifier definition used<br>
to generate modifier values for NVIDIA hardware.<br>
<br>
Without this change, it would be impossible to<br>
differentiate the two layouts based on modifiers,<br>
and as a result software could attempt to share<br>
surfaces directly between pre-GB20x and GB20x<br>
cards, resulting in corruption when the surface<br>
was accessed on one of the GPUs after being<br>
populated with content by the other.<br>
<br>
Of note: This change causes the<br>
DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D() macro to<br>
evaluate its &quot;s&quot; parameter twice, with the side<br>
effects that entails. I surveyed all usage of the<br>
modifier in the kernel and Mesa code, and that<br>
does not appear to be problematic in any current<br>
usage, but I thought it was worth calling out.<br>
<br>
Signed-off-by: James Jones &lt;<a href=3D"mailto:jajones@nvidia.com" target=
=3D"_blank">jajones@nvidia.com</a>&gt;<br></blockquote><div><br></div><div>=
<div>Reviewed-by: Faith Ekstrand &lt;<a href=3D"mailto:faith.ekstrand@colla=
bora.com">faith.ekstrand@collabora.com</a>&gt;</div></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/uapi/drm/drm_fourcc.h | 25 ++++++++++++++++---------<br>
=C2=A01 file changed, 16 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h<=
br>
index ea91aa8afde9..e527b24bd824 100644<br>
--- a/include/uapi/drm/drm_fourcc.h<br>
+++ b/include/uapi/drm/drm_fourcc.h<br>
@@ -979,14 +979,20 @@ extern &quot;C&quot; {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =3D Gob He=
ight 8, Turing+ Page Kind mapping<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =3D Reserv=
ed for future use.<br>
=C2=A0 *<br>
- * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0 On Tegra GPUs prior to =
Xavier, there is a further<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bit remapping step that =
occurs at an even lower level than the<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page kind and block line=
ar swizzles.=C2=A0 This causes the layout of<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0surfaces mapped in those=
 SOC&#39;s GPUs to be incompatible with the<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0equivalent mapping on ot=
her GPUs in the same system.<br>
- *<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =3D Tegra K1 - =
Tegra Parker/TX2 Layout.<br>
- *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =3D Desktop GPU=
 and Tegra Xavier+ Layout<br>
+ * 22:22 s=C2=A0 =C2=A0 =C2=A0Sector layout.=C2=A0 There is a further bit =
remapping step that occurs<br>
+ * 26:27=C2=A0 =C2=A0 =C2=A0 =C2=A0at an even lower level than the page ki=
nd and block linear<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0swizzles.=C2=A0 This cau=
ses the bit arrangement of surfaces in memory<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to differ subtly, and pr=
events direct sharing of surfaces between<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0GPUs with different layo=
uts.<br>
+ *<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00 =3D Tegra K1 - =
Tegra Parker/TX2 Layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =3D Pre-GB20x, =
GB20x 32+ bpp, GB10, Tegra Xavier-Orin Layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =3D GB20x(Black=
well 2)+ 8 bpp surface layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =3D GB20x(Black=
well 2)+ 16 bpp surface layout<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04 =3D Reserved fo=
r future use.<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05 =3D Reserved fo=
r future use.<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06 =3D Reserved fo=
r future use.<br>
+ *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 =3D Reserved fo=
r future use.<br>
=C2=A0 *<br>
=C2=A0 * 25:23 c=C2=A0 =C2=A0 =C2=A0Lossless Framebuffer Compression type.<=
br>
=C2=A0 *<br>
@@ -1001,7 +1007,7 @@ extern &quot;C&quot; {<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06 =3D Reserv=
ed for future use<br>
=C2=A0 *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07 =3D Reserv=
ed for future use<br>
=C2=A0 *<br>
- * 55:25 -=C2=A0 =C2=A0 =C2=A0Reserved for future use.=C2=A0 Must be zero.=
<br>
+ * 55:28 -=C2=A0 =C2=A0 =C2=A0Reserved for future use.=C2=A0 Must be zero.=
<br>
=C2=A0 */<br>
=C2=A0#define DRM_FORMAT_MOD_NVIDIA_BLOCK_LINEAR_2D(c, s, g, k, h) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fourcc_mod_code(NVIDIA, (0x10 | \<br>
@@ -1009,6 +1015,7 @@ extern &quot;C&quot; {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((k) &amp; 0xff) &lt;&lt; 12)=
 | \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((g) &amp; 0x3) &lt;&lt; 20) =
| \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((s) &amp; 0x1) &lt;&lt; 22) =
| \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (((s) &amp; 0x6) &lt;&lt; 25) | \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(((c) &amp; 0x7) &lt;&lt; 23))=
)<br>
<br>
=C2=A0/* To grandfather in prior block linear format modifiers to the above=
 layout,<br>
-- <br>
2.50.1<br>
<br>
</blockquote></div></div>

--000000000000e09f36063cf62dc1--
