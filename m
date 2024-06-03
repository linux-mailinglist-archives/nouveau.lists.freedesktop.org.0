Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD48D7CC5
	for <lists+nouveau@lfdr.de>; Mon,  3 Jun 2024 09:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134310E234;
	Mon,  3 Jun 2024 07:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LrZpM6Vp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1DC510E234
 for <nouveau@lists.freedesktop.org>; Mon,  3 Jun 2024 07:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717401069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZM/qlijRGY09CL6SCWZrPLW5sIErx5xRvS0RDt3tq4s=;
 b=LrZpM6VpY4PHd0TLie30HMbpNB9Vu/obCqwijUfxy2ck6W6M/I+kkanloh5vFp+qNm3f0N
 BOLPK6KGxT0lL5GEF/aJeXJoo+M+iWyVfFXVE8FQcqaQ1iFJarw1Q5tHfWE4KZhrsHSzKF
 hfjva8kuO+GGJEk0rminhpajYcMLzK4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-333-tQAyGoBcM_6MvnE5TsMbjw-1; Mon, 03 Jun 2024 03:51:08 -0400
X-MC-Unique: tQAyGoBcM_6MvnE5TsMbjw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-57a3bc0ed15so77453a12.1
 for <nouveau@lists.freedesktop.org>; Mon, 03 Jun 2024 00:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717401067; x=1718005867;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZM/qlijRGY09CL6SCWZrPLW5sIErx5xRvS0RDt3tq4s=;
 b=u2E0OmxgONo2Y6y/hY/7/Lzwu6c6tNt0NbroRrAQLaU8TfnAzW61WNxbqhzV7WAeTd
 w/R1SnKwtR+fXCkwtN9t9Xq27+V3yQk0RsNClguyZUltskgGpH59ARklSdF1PEurJYYg
 AvxSqIRLwOe6v1g/14iXro6XuYfWJKR4diXPfsCb9dmDbZ2XBHh3DONjyJz/s1Hgb+4a
 ptC8pK/AU4SgcBFf15CRxw3lY/ofSs3cLDSv/C4kMSyY5c86z0OrAnSpHW0QJgMRPxAl
 q3jWW6ptmMkggQYnAFtxuWsGpA+dW8wy5xvrc8WodlVc7qFS4K8jU/PhMuwR4p/rnTz8
 OmTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUsVvDZPfhDVkXHfM1qZTOKD7XpKbhkZQbiTtwut74sb7iW6Fq7qpgequbBkQ/LoCPyvY21lFkOX2qWpE4UcK2VsYlL5i3sr3VEZMPSA==
X-Gm-Message-State: AOJu0YwiDL8xDjEccSQOJsGLR7Xh0O3DRKP1Ug+AG4pszdgSNtLby+sy
 yVBElHDHzlWuxaJu6O/naRVCoSz7t2qGMgWr/pz7iJI7EtXsmniTD+XlR8y+a+HYgMIrwXXncdI
 Iv1fJ+1Uom9tFxlqHQsWwRcBWwP2tr56Eft8ObJmSJrjbPGlLNgw0fiDDL2GLZqQrDs+VRD53Wu
 ofDQpHGALzbG/Cc9EO8DUM1MjPevbXusyZaO3tHQ==
X-Received: by 2002:a50:8e59:0:b0:57a:22aa:51b1 with SMTP id
 4fb4d7f45d1cf-57a3644a33dmr5150143a12.2.1717401067127; 
 Mon, 03 Jun 2024 00:51:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZwivxrSkC/S9Da55sUj850dmd7xFFbsWspH20JfHFqw8jW0FbWF7DUPXO/ifDroooMLXoN/Rm9331EW5vTKk=
X-Received: by 2002:a50:8e59:0:b0:57a:22aa:51b1 with SMTP id
 4fb4d7f45d1cf-57a3644a33dmr5150127a12.2.1717401066459; Mon, 03 Jun 2024
 00:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240601212247.54786-1-egyszeregy@freemail.hu>
 <CACO55tvW7zDRt=ka0w5D8drbJiZFqMFmx=n=PttAjubZJ5zX2Q@mail.gmail.com>
 <bec5f516-211d-4c6e-9204-311d1e31532a@freemail.hu>
In-Reply-To: <bec5f516-211d-4c6e-9204-311d1e31532a@freemail.hu>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 3 Jun 2024 09:50:29 +0200
Message-ID: <CACO55tuOQxQ=BuDj34SXGREE4numtRDFzJY4Qj_Fr0rrLj4ang@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c
 and nvkm_i2c_aux.h
To: =?UTF-8?Q?Sz=C5=91ke_Benjamin?= <egyszeregy@freemail.hu>
Cc: bskeggs@redhat.com, lyude@redhat.com, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, Jun 2, 2024 at 1:01=E2=80=AFAM Sz=C5=91ke Benjamin <egyszeregy@free=
mail.hu> wrote:
>
>         s=3D20181004; d=3Dfreemail.hu;
>         h=3DMessage-ID:Date:MIME-Version:Subject:To:Cc:References:From:In=
-Reply-To:Content-Type:Content-Transfer-Encoding;
>         l=3D8472; bh=3Diw0a2TUtlt0KIetu+spJR9WLW1F3MPSfBbxxiBBkhDM=3D;
>         b=3D1oSo+wfGjIoAfhgzfBaxNDoTN0TmXW/jadL52HL5ZAyzWMk15XqSBLjBkAd//=
Bh9
>         u1d+ypo+idz4sTys/CYP5oS8lb8fepRTYBFboPsOAnbHQg6tR0QizBnjyYGq1iMYD=
02
>         GmZWamFVQ/I9kT0XMOMhoKNp1jmr3tFr0iaoS+PqyGv5aNFi6tmiFSJT5fnNaf8/B=
ct
>         XgidaouR1QSqrB6vgHDUjd13+165V+RoCh/CflqZroE132r01M9mxZU5bk4M4uMO3=
8l
>         HwZjS8YTSOmTA49PcLYbh+hr+e+GVFHP+X1wgmd/93wqlySRgqM7N1fh84jucg03I=
MS
>         D/tvbePTzg=3D=3D
> Content-Transfer-Encoding: quoted-printable
>
> 2024. 06. 02. 0:12 keltez=3DC3=3DA9ssel, Karol Herbst =3DC3=3DADrta:
> > On Sat, Jun 1, 2024 at 11:33=3DE2=3D80=3DAFPM <egyszeregy@freemail.hu> =
wrote:
> >>
> >>          s=3D3D20181004; d=3D3Dfreemail.hu;
> >>          h=3D3DFrom:To:Cc:Subject:Date:Message-ID:MIME-Version:Content=
-T=3D
> ype:Content-Transfer-Encoding;
> >>          l=3D3D6462; bh=3D3DCnHSqkRX34kqCWN2/oPtvm9wm8HJCe8QhPwQypdpi3=
w=3D3D=3D
> ;
> >>          b=3D3DJDlDB9yOQDBY7EDnRMrt8qYnWfH8J/LKYKb90434FH1tuOL04za+3TX=
XS=3D
> bU0uvs0
> >>          hWYDYjpbob4XGgUcd1s+lCkerOgDwkpWJWKFW8N5j6WENAKdR/hWJgcma2JED=
=3D
> DotXZ0
> >>          cisYRrLsQBfjyKkBWw0qv/5PDe7vliytix5oP2piBPJC+uR3pN8OKck/+zLBG=
=3D
> lJY4za
> >>          qywwOiMNzHAdyOJT5kCg0yd+k186Oa1jX93iCpiRk5mxJQqJJcAxfW8rYbKRX=
=3D
> i5QQTl
> >>          SymDGdZ72wK5PkHxGgpZ9qXZtFV3eH4+95xNzpoPowMkXFkBy1uMClZzxv1oB=
=3D
> mRo8o6
> >>          CXPcfsWUsQ=3D3D=3D3D
> >> Content-Transfer-Encoding: quoted-printable
> >>
> >> From: Benjamin Sz=3D3DC5=3D3D91ke <egyszeregy@freemail.hu>
> >>
> >> The goal is to clean-up Linux repository from AUX file names, because
> >> the use of such file names is prohibited on other operating systems
> >> such as Windows, so the Linux repository cannot be cloned and
> >> edited on them.
> >>
> >=3D20
> > something went horribly wrong with encoding so the patch is pretty much=
=3D
>  invalid.
> >=3D20
> >> Signed-off-by: Benjamin Sz=3D3DC5=3D3D91ke <egyszeregy@freemail.hu>
> >> ---
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild                  | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c               | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c                | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                  | 2 =
=3D
> +-
> >>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D3D> nvkm_i2c_aux.c} =
  =3D
> | 2 +-
> >>   .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D3D> nvkm_i2c_aux.h} =
  =3D
> | 0
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c                | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c              | 2 =
=3D
> +-
> >>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c              | 2 =
=3D
> +-
> >>   11 files changed, 10 insertions(+), 10 deletions(-)
> >>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D3D> nvkm_=
i2=3D
> c_aux.=3D3D
> >> c} (99%)
> >>   rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D3D> nvkm_=
i2=3D
> c_aux.=3D3D
> >> h} (100%)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/=
=3D
> gpu=3D3D
> >> /drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> index 819703913a00..c488dfce4392 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> >> @@ -25,7 +25,7 @@ nvkm-y +=3D3D3D nvkm/subdev/i2c/busnv50.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/busgf119.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/bit.o
> >> =3D3D20
> >> -nvkm-y +=3D3D3D nvkm/subdev/i2c/aux.o
> >> +nvkm-y +=3D3D3D nvkm/subdev/i2c/nvkm_i2c_aux.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxg94.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxgf119.o
> >>   nvkm-y +=3D3D3D nvkm/subdev/i2c/auxgm200.o
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drive=
=3D
> rs/=3D3D
> >> gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> index dd391809fef7..30bf84e77db9 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> >> @@ -24,7 +24,7 @@
> >>   #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
> >>   #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
> >>   #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   struct anx9805_pad {
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/driver=
=3D
> s/g=3D3D
> >> pu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> index 47068f6f9c55..9e07ba444ca8 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs <bskeggs@redhat.com>
> >>    */
> >>   #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   struct g94_i2c_aux {
> >>          struct nvkm_i2c_aux base;
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> index dab40cd8fe3a..8709b728c38b 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> >> @@ -19,7 +19,7 @@
> >>    * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE US=
=3D
> E OR
> >>    * OTHER DEALINGS IN THE SOFTWARE.
> >>    */
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   static const struct nvkm_i2c_aux_func
> >>   gf119_i2c_aux =3D3D3D {
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> index 8bd1d442e465..f40c5709d217 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs <bskeggs@redhat.com>
> >>    */
> >>   #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, bas=
=3D
> e)
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >> =3D3D20
> >>   struct gm200_i2c_aux {
> >>          struct nvkm_i2c_aux base;
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/=
=3D
> gpu=3D3D
> >> /drm/nouveau/nvkm/subdev/i2c/base.c
> >> index 976539de4220..736275f0c774 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "priv.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >>   #include "pad.h"
> >> =3D3D20
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/g=
=3D
> pu/=3D3D
> >> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> similarity index 99%
> >> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> >> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> index d063d0dc13c5..6b76df02c63a 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> >> @@ -24,7 +24,7 @@
> >> =3D3D20
> >>   #include <linux/string_helpers.h>
> >> =3D3D20
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "pad.h"
> >> =3D3D20
> >>   static int
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/g=
=3D
> pu/=3D3D
> >> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> >> similarity index 100%
> >> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> >> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/driver=
=3D
> s/g=3D3D
> >> pu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> index 5904bc5f2d2a..e9c55a57c878 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   void
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> index 3bc4d0310076..1af64e25d838 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   static const struct nvkm_i2c_pad_func
> >> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/driv=
=3D
> ers=3D3D
> >> /gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> index 7d417f6a816e..997a5a2146c4 100644
> >> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> >> @@ -22,7 +22,7 @@
> >>    * Authors: Ben Skeggs
> >>    */
> >>   #include "pad.h"
> >> -#include "aux.h"
> >> +#include "nvkm_i2c_aux.h"
> >>   #include "bus.h"
> >> =3D3D20
> >>   static void
> >> --=3D3D20
> >> 2.43.0
> >>
> >=3D20
>
> Hi,
>
> This patched is totally fine and visible in "linux-kernel@vger.kernel.org=
=3D
> " list=3D20
> page, so it should not be invalid. Please check your e-mail client SW and=
=3D
>  fix=3D20
> your settings.
>
> https://lore.kernel.org/lkml/20240601212247.54786-1-egyszeregy@freemail.h=
=3D
> u/
> https://lore.kernel.org/lkml/20240601212247.54786-1-egyszeregy@freemail.h=
=3D
> u/raw
>
> kernel test robot used it for a build test successfully, so it has to be =
=3D
> a valid=3D20
> patch.
> https://github.com/intel-lab-lkp/linux/commits/egyszeregy-freemail-hu/drm=
=3D
> -nouveau-i2c-rename-aux-c-and-aux-h-to-nvkm_i2c_aux-c-and-nvkm_i2c_aux-h/=
=3D
> 20240602-053530
>

oh indeed. Looks like a client problem then. Sorry for the noise.

