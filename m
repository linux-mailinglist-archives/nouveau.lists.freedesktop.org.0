Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287BE8D726B
	for <lists+nouveau@lfdr.de>; Sun,  2 Jun 2024 00:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FA110E0DC;
	Sat,  1 Jun 2024 22:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GxA5rGXj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B010E10F
 for <nouveau@lists.freedesktop.org>; Sat,  1 Jun 2024 22:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717279969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZawYK/bgvUDs2pKjbY825P/MW2zIRhJxGAwLGim8/Q=;
 b=GxA5rGXjZe1pPOTjIihTiFfmDiokIkF/4UvVgHRcesMJXeZmxb8jR2eBSARkQUl/qSg7WI
 +iFLwM0vHZdRcLfXf0Dgt57tUuFeoQ1+0tvqZ7j4ebPCBnTjMWUxL25//F0HGXt2qBqZIc
 Csm1Mzm/OMn8cX/5cr+oxPwkncJWDeU=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-vJw66aqIMa-wSJwklCgRhQ-1; Sat, 01 Jun 2024 18:12:48 -0400
X-MC-Unique: vJw66aqIMa-wSJwklCgRhQ-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2e988befc75so1906431fa.1
 for <nouveau@lists.freedesktop.org>; Sat, 01 Jun 2024 15:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717279966; x=1717884766;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JZawYK/bgvUDs2pKjbY825P/MW2zIRhJxGAwLGim8/Q=;
 b=gfExwpSTujAN9VYyA/KGe3Ngov/ZAhGsU1W5+DxE+BDRnu310f0u7BwI7ilKUJ5L5U
 ilJ43iNz95oy795kQEROSAT8YJp4us2Ok30Sw/LzBkpFdUnC3QnNf3pAtpkLqFiejvOW
 pTc2jDpo+MXxfZ4idY2dvACPKEo2a2nddLoncDNcljdViASjyFK2PGhrFNrOJlMTZ9Fl
 L4UstqBso4uDDpcOI3RPjh3FbXuL5IU7NnpkyUmb1lrY5m1N0DxGAjYiKbyZ3bPSCIDx
 L5zng0xqBE+JXjVr9MPVo7GEkwsYWvNkVKg5VWl7di1OCJiFnSgMKlVZijIxdfgDLVYm
 PEgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdAsOBECoedGu1/a+Q6NdaHuRrE1OjjkROlT8ZnAyMp6Go7wIozib9oQkjACo/inL2urd8DaRXwsjPY4B8QRrd7HO5oEWqupCjFRPOfQ==
X-Gm-Message-State: AOJu0Ywnv2Q7VALnwskSC7XJf1dTj//k6QbvvMsnASzQ16Nyef4Udma3
 aDJWtMkDtRe0U4DHsN8xVLLFkjveK9EbqSTq8QvTQvxJf679Zj+M09lqNOIA8eCmvFHPPmxE+Nf
 vxSSoczIAbmSOeEw9QH6KwsfKatScUQGJw83qXz5taQNwOAnaVAohVhyxtRJe0IBVYDw2kuqd44
 nxXB0nnCm8Q7QgwGakoSR74aQHxfET5+96dCRc0A==
X-Received: by 2002:a2e:be0f:0:b0:2ea:806a:d701 with SMTP id
 38308e7fff4ca-2ea95242b93mr33945621fa.3.1717279966539; 
 Sat, 01 Jun 2024 15:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7KANX0x1+6xtQJgaisRd+fArXl1JaxG/bhUBu0TyGkGkZpTl+uXGgIOCXtlE/G7v9UTg0ukY7YvXfUzmjBYo=
X-Received: by 2002:a2e:be0f:0:b0:2ea:806a:d701 with SMTP id
 38308e7fff4ca-2ea95242b93mr33945481fa.3.1717279965930; Sat, 01 Jun 2024
 15:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240601212247.54786-1-egyszeregy@freemail.hu>
In-Reply-To: <20240601212247.54786-1-egyszeregy@freemail.hu>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 2 Jun 2024 00:12:09 +0200
Message-ID: <CACO55tvW7zDRt=ka0w5D8drbJiZFqMFmx=n=PttAjubZJ5zX2Q@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau/i2c: rename aux.c and aux.h to nvkm_i2c_aux.c
 and nvkm_i2c_aux.h
To: egyszeregy@freemail.hu
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

On Sat, Jun 1, 2024 at 11:33=E2=80=AFPM <egyszeregy@freemail.hu> wrote:
>
>         s=3D20181004; d=3Dfreemail.hu;
>         h=3DFrom:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:=
Content-Transfer-Encoding;
>         l=3D6462; bh=3DCnHSqkRX34kqCWN2/oPtvm9wm8HJCe8QhPwQypdpi3w=3D;
>         b=3DJDlDB9yOQDBY7EDnRMrt8qYnWfH8J/LKYKb90434FH1tuOL04za+3TXXSbU0u=
vs0
>         hWYDYjpbob4XGgUcd1s+lCkerOgDwkpWJWKFW8N5j6WENAKdR/hWJgcma2JEDDotX=
Z0
>         cisYRrLsQBfjyKkBWw0qv/5PDe7vliytix5oP2piBPJC+uR3pN8OKck/+zLBGlJY4=
za
>         qywwOiMNzHAdyOJT5kCg0yd+k186Oa1jX93iCpiRk5mxJQqJJcAxfW8rYbKRXi5QQ=
Tl
>         SymDGdZ72wK5PkHxGgpZ9qXZtFV3eH4+95xNzpoPowMkXFkBy1uMClZzxv1oBmRo8=
o6
>         CXPcfsWUsQ=3D=3D
> Content-Transfer-Encoding: quoted-printable
>
> From: Benjamin Sz=3DC5=3D91ke <egyszeregy@freemail.hu>
>
> The goal is to clean-up Linux repository from AUX file names, because
> the use of such file names is prohibited on other operating systems
> such as Windows, so the Linux repository cannot be cloned and
> edited on them.
>

something went horribly wrong with encoding so the patch is pretty much inv=
alid.

> Signed-off-by: Benjamin Sz=3DC5=3D91ke <egyszeregy@freemail.hu>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild                  | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c               | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c                | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c              | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c              | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c                  | 2 +-
>  .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D> nvkm_i2c_aux.c}   | 2 =
+-
>  .../gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D> nvkm_i2c_aux.h}   | 0
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c                | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c              | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c              | 2 +-
>  11 files changed, 10 insertions(+), 10 deletions(-)
>  rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.c =3D3D> nvkm_i2c_au=
x.=3D
> c} (99%)
>  rename drivers/gpu/drm/nouveau/nvkm/subdev/i2c/{aux.h =3D3D> nvkm_i2c_au=
x.=3D
> h} (100%)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild b/drivers/gpu=
=3D
> /drm/nouveau/nvkm/subdev/i2c/Kbuild
> index 819703913a00..c488dfce4392 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/Kbuild
> @@ -25,7 +25,7 @@ nvkm-y +=3D3D nvkm/subdev/i2c/busnv50.o
>  nvkm-y +=3D3D nvkm/subdev/i2c/busgf119.o
>  nvkm-y +=3D3D nvkm/subdev/i2c/bit.o
> =3D20
> -nvkm-y +=3D3D nvkm/subdev/i2c/aux.o
> +nvkm-y +=3D3D nvkm/subdev/i2c/nvkm_i2c_aux.o
>  nvkm-y +=3D3D nvkm/subdev/i2c/auxg94.o
>  nvkm-y +=3D3D nvkm/subdev/i2c/auxgf119.o
>  nvkm-y +=3D3D nvkm/subdev/i2c/auxgm200.o
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c b/drivers/=
=3D
> gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> index dd391809fef7..30bf84e77db9 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/anx9805.c
> @@ -24,7 +24,7 @@
>  #define anx9805_pad(p) container_of((p), struct anx9805_pad, base)
>  #define anx9805_bus(p) container_of((p), struct anx9805_bus, base)
>  #define anx9805_aux(p) container_of((p), struct anx9805_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "bus.h"
> =3D20
>  struct anx9805_pad {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c b/drivers/g=
=3D
> pu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> index 47068f6f9c55..9e07ba444ca8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxg94.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs <bskeggs@redhat.com>
>   */
>  #define g94_i2c_aux(p) container_of((p), struct g94_i2c_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
> =3D20
>  struct g94_i2c_aux {
>         struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c b/drivers=
=3D
> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> index dab40cd8fe3a..8709b728c38b 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgf119.c
> @@ -19,7 +19,7 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   * OTHER DEALINGS IN THE SOFTWARE.
>   */
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
> =3D20
>  static const struct nvkm_i2c_aux_func
>  gf119_i2c_aux =3D3D {
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c b/drivers=
=3D
> /gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> index 8bd1d442e465..f40c5709d217 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/auxgm200.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs <bskeggs@redhat.com>
>   */
>  #define gm200_i2c_aux(p) container_of((p), struct gm200_i2c_aux, base)
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
> =3D20
>  struct gm200_i2c_aux {
>         struct nvkm_i2c_aux base;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c b/drivers/gpu=
=3D
> /drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..736275f0c774 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs
>   */
>  #include "priv.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "bus.h"
>  #include "pad.h"
> =3D20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c b/drivers/gpu/=
=3D
> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> similarity index 99%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> index d063d0dc13c5..6b76df02c63a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.c
> @@ -24,7 +24,7 @@
> =3D20
>  #include <linux/string_helpers.h>
> =3D20
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "pad.h"
> =3D20
>  static int
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h b/drivers/gpu/=
=3D
> drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> similarity index 100%
> rename from drivers/gpu/drm/nouveau/nvkm/subdev/i2c/aux.h
> rename to drivers/gpu/drm/nouveau/nvkm/subdev/i2c/nvkm_i2c_aux.h
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c b/drivers/g=
=3D
> pu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> index 5904bc5f2d2a..e9c55a57c878 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padg94.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs
>   */
>  #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "bus.h"
> =3D20
>  void
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c b/drivers=
=3D
> /gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> index 3bc4d0310076..1af64e25d838 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgf119.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs
>   */
>  #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "bus.h"
> =3D20
>  static const struct nvkm_i2c_pad_func
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c b/drivers=
=3D
> /gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> index 7d417f6a816e..997a5a2146c4 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/padgm200.c
> @@ -22,7 +22,7 @@
>   * Authors: Ben Skeggs
>   */
>  #include "pad.h"
> -#include "aux.h"
> +#include "nvkm_i2c_aux.h"
>  #include "bus.h"
> =3D20
>  static void
> --=3D20
> 2.43.0
>

