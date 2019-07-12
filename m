Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C971F665FD
	for <lists+nouveau@lfdr.de>; Fri, 12 Jul 2019 07:03:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61C6E2BF;
	Fri, 12 Jul 2019 05:03:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20B36E2BF
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2019 05:03:31 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id k21so8028995edq.3
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 22:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akC4OzIlCt11mCFXcw3pwvEzrpWLS7xVtjnVl5z6IXQ=;
 b=rOyNNUF6XKqBcy9Bi/89D55JpMBNZ7CBhEeuCAPvJhCvOnZjAm3f54uBj/x+LJC+3y
 JAjX9FZpZgJ9uprtfN8LpcLMrxOMb7Hnf/moY0s7zx1NFWWseEpwaCAla6YmzsHdO5bw
 QdHjwFgKpQDVuHxrcnDZhHxDJw3yY0SVSDNBHEfLpkW+fwYxwkKo/DDx42trcu1U1Arm
 +7RWNYc3yLtilT+8EFBEGJRziw4QsfjI6YSDuSFdTURhsqT2qkLXxAAQQDU4V5m5SE2J
 t72CI4bYgt83o9YalScurV4J6lYXEMFm023UufNM6lI3km3ZwINKe/8qlZk727aFV5bB
 R75w==
X-Gm-Message-State: APjAAAWoOxgbj0nxl49bK9AReL3yVeAO6bTNoUlGINuDia53ogUa/7ma
 3sgVeySi3TaTSYOywm6+wA6Ub2z7rPun24ZmjNaH8Dor
X-Google-Smtp-Source: APXvYqx+u8vIJQ7Z7BT9SJT2VmDUdvWb7fp4ZX/RyZIOFQVTnabtBfqF+4FHyiiZbg11OncRF8hc2U5Kxbi64HTLQGA=
X-Received: by 2002:a05:6402:6cb:: with SMTP id
 n11mr7294010edy.101.1562907810488; 
 Thu, 11 Jul 2019 22:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190711141153.7723-1-mmenzyns@redhat.com>
 <20190711141153.7723-2-mmenzyns@redhat.com>
In-Reply-To: <20190711141153.7723-2-mmenzyns@redhat.com>
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Fri, 12 Jul 2019 15:03:19 +1000
Message-ID: <CA+iOQUGGshxRTo43fjMTZ53-z+xQ02L3z9Syf_EQyiVZn-2g7g@mail.gmail.com>
To: Mark Menzynski <mmenzyns@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=akC4OzIlCt11mCFXcw3pwvEzrpWLS7xVtjnVl5z6IXQ=;
 b=AaNqOgGAEUbCUFPAH31JjwH5mzRSKAkhfoFUoKyh43qHf0myab2zCZjbpkRDFMKhsk
 mUf9XX8c13SygD/Zm83Ojl6FE7bnPwltj7iVuiBLiLZPuP6EUurmlMb7cuc8zOBUHBit
 KZrhHtRZ+iex0vhAny8u9UX4Dk8n1+oCwpSpC/OLkVWbuyg9h8ADFOXWz+Z7R/LGXoAP
 n3PXkwbTucRrgZU8SSYmUk1QCDZVbIx0rmLD8X5c96PDqOxSuzwJE9+0n2URMDrn5MTO
 qjhzS2VWkI+57hvCHIGv2BaAlp1znGNZukM4D4H1bWzJ2QbKMf4M/hlih23+HWahMtnp
 sGgQ==
Subject: Re: [Nouveau] [PATCH 1/4] moved gpio so it is sorted by values
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1147692857=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1147692857==
Content-Type: multipart/alternative; boundary="000000000000dc65a5058d74d4be"

--000000000000dc65a5058d74d4be
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 00:42, Mark Menzynski <mmenzyns@redhat.com> wrote:

> Signed-off-by: Mark Menzynski <mmenzyns@redhat.com>
>

In addition to the general comments I provided to this patch series, you
should add a prefix before ":" to the first line of
this commit message:

Maybe something like "drm/nouveau/bios/gpio: sort gpio function names by
value"

You can see the general approach with:

  $ git log -n10 --oneline
drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/gpio.h

---
>  drm/nouveau/include/nvkm/subdev/bios/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> b/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> index b71a3555..2f40935f 100644
> --- a/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> +++ b/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> @@ -3,9 +3,9 @@
>  #define __NVBIOS_GPIO_H__
>  enum dcb_gpio_func_name {
>         DCB_GPIO_PANEL_POWER = 0x01,
> +       DCB_GPIO_FAN = 0x09,
>         DCB_GPIO_TVDAC0 = 0x0c,
>         DCB_GPIO_TVDAC1 = 0x2d,
> -       DCB_GPIO_FAN = 0x09,
>         DCB_GPIO_FAN_SENSE = 0x3d,
>         DCB_GPIO_LOGO_LED_PWM = 0x84,
>         DCB_GPIO_UNUSED = 0xff,
> --
> 2.21.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--000000000000dc65a5058d74d4be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 12 Jul 2019 at 00:42, Mark Menzyn=
ski &lt;<a href=3D"mailto:mmenzyns@redhat.com">mmenzyns@redhat.com</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: Mark Menzynski &lt;<a href=3D"mailto:mmenz=
yns@redhat.com" target=3D"_blank">mmenzyns@redhat.com</a>&gt;<br></blockquo=
te><div><br></div><div>In addition to the general comments I provided to th=
is patch series, you should add a prefix before &quot;:&quot; to the first =
line of</div><div>this commit message:</div><div><br></div><div>Maybe somet=
hing like &quot;drm/nouveau/bios/gpio: sort gpio function names by value&qu=
ot;<br></div><div><br></div><div>You can see the general approach with:</di=
v><div><br></div><div>=C2=A0 $ git log -n10 --oneline drivers/gpu/drm/nouve=
au/include/nvkm/subdev/bios/gpio.h</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0drm/nouveau/include/nvkm/subdev/bios/gpio.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drm/nouveau/include/nvkm/subdev/bios/gpio.h b/drm/nouveau/incl=
ude/nvkm/subdev/bios/gpio.h<br>
index b71a3555..2f40935f 100644<br>
--- a/drm/nouveau/include/nvkm/subdev/bios/gpio.h<br>
+++ b/drm/nouveau/include/nvkm/subdev/bios/gpio.h<br>
@@ -3,9 +3,9 @@<br>
=C2=A0#define __NVBIOS_GPIO_H__<br>
=C2=A0enum dcb_gpio_func_name {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_PANEL_POWER =3D 0x01,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DCB_GPIO_FAN =3D 0x09,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_TVDAC0 =3D 0x0c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_TVDAC1 =3D 0x2d,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DCB_GPIO_FAN =3D 0x09,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_FAN_SENSE =3D 0x3d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_LOGO_LED_PWM =3D 0x84,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_UNUSED =3D 0xff,<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div></div>

--000000000000dc65a5058d74d4be--

--===============1147692857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1147692857==--
