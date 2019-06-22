Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA84F35B
	for <lists+nouveau@lfdr.de>; Sat, 22 Jun 2019 05:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BF16E94C;
	Sat, 22 Jun 2019 03:35:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E22D6E94C
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 03:35:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so12946087edr.13
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jun 2019 20:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vio11vNYQjOD8T4SgMxDcfJ5dD22Z9JnAS5dfpi6BdU=;
 b=ir6JUZlmg/nM9ILIi4cw66Rnefr/Hp0/v3xdSTs323fiqN3MPduTqNvl4hVqx5UVkf
 q6PL154Kg8eUJdsVqVr/MsSkPfNU40nOey7Kn4DW0S79UkKlDA9Cn5quc4wI/K8ns8yw
 lUflBPYXJ7g3OBdXLmXMWcVThEWNAx+/4GtcxMl//MIiIiYQGjDsACea7tjBx7EldZvg
 Jlx/KyGxJSzOANIvHNYQdEyrX5KaUe8xW2GM1q33Ys6gHBoNnu4qQYKt48w21KNX4ylG
 oyjVoNFuisweQTlcPVeCOPaj9fnr0F/yzYb6MsjyY6eysO5jqL4euyAfeVwL4pZPqA+C
 qoLw==
X-Gm-Message-State: APjAAAVN0UOHrBL1Y2IpV0Entv5r/UEXwSFRR2sjBScaSIN76Z5L7nBf
 UlKdenmN2GiNUjrOHeAmGSWwjsMBO9bh3+Bu+s0=
X-Google-Smtp-Source: APXvYqzCSdbQK1kkBkZm905ePaitQoLCdRhMiuL12n3IcB5w9ktL+HvEPTOdH+A4SgMR3GH4crHnSG7Meuj84dCTtj8=
X-Received: by 2002:a17:906:eb93:: with SMTP id
 mh19mr46978791ejb.42.1561174511093; 
 Fri, 21 Jun 2019 20:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190618110133.9526-1-kherbst@redhat.com>
In-Reply-To: <20190618110133.9526-1-kherbst@redhat.com>
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Sat, 22 Jun 2019 13:35:00 +1000
Message-ID: <CA+iOQUEhHx2ofWeTEu95D2L=xXY2qAy6HZq7nboOw_9JkG1NyQ@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Vio11vNYQjOD8T4SgMxDcfJ5dD22Z9JnAS5dfpi6BdU=;
 b=VVObLUvPejolGa08nZc8Hj1WnF03eJjHw0rFZKgN+XMz6dM4ZY95Td4RgipV4XiKN8
 F4ZQ5tMLTM+/auOyT0cqc2fwSIafiFk4fhZnnJrWDsknjW3xw2YZsHT1cseMLfYM1S1I
 g5s4ryiFkhw1MLnPVyTW32NyGoCJq7xQr4rtbgaY3FQUkWNzuQeIX3sZHwJU3h5mza5x
 gIsqycM8JVdw3eL5MkzRf973ik/FXAWL8lPxMyVTu12xjlbRdf/52YemBwSDHw6dA+1A
 jljiyV46q0zqQ+m1r59cftkx6HYYSM2/Awt5zRDAG3s0zS515bIKXLqFWgog6/9A+1xs
 4X7Q==
Subject: Re: [Nouveau] [PATCH] hwmon: return EINVAL if the GPU is powered
 down for sensors reads
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
Content-Type: multipart/mixed; boundary="===============1456790316=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1456790316==
Content-Type: multipart/alternative; boundary="0000000000002a8e82058be1446b"

--0000000000002a8e82058be1446b
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jun 2019 at 21:01, Karol Herbst <kherbst@redhat.com> wrote:

> fixes bogus values userspace gets from hwmon while the GPU is powered down
>
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
>

Looks good to me and successfully tested on my GP107M with runtime power
management fixes, so

Reviewed-by: Rhys Kidd <rhyskidd@gmail.com>


> ---
>  drm/nouveau/nouveau_hwmon.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c
> index 618d8b780..d445c6f3f 100644
> --- a/drm/nouveau/nouveau_hwmon.c
> +++ b/drm/nouveau/nouveau_hwmon.c
> @@ -426,6 +426,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_temp_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 ret = nvkm_therm_temp_get(therm);
>                 *val = ret < 0 ? ret : (ret * 1000);
>                 break;
> @@ -472,6 +474,8 @@ nouveau_fan_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_fan_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = nvkm_therm_fan_sense(therm);
>                 break;
>         default:
> @@ -494,6 +498,8 @@ nouveau_in_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_in_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 ret = nvkm_volt_get(volt);
>                 *val = ret < 0 ? ret : (ret / 1000);
>                 break;
> @@ -525,6 +531,8 @@ nouveau_pwm_read(struct device *dev, u32 attr, int
> channel, long *val)
>                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
>                 break;
>         case hwmon_pwm_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = therm->fan_get(therm);
>                 break;
>         default:
> @@ -546,6 +554,8 @@ nouveau_power_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_power_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = nvkm_iccsense_read_all(iccsense);
>                 break;
>         case hwmon_power_max:
> --
> 2.21.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--0000000000002a8e82058be1446b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Jun 2019 at 21:01, Karol Herbs=
t &lt;<a href=3D"mailto:kherbst@redhat.com">kherbst@redhat.com</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">fixes bogus values userspace gets from hwmon while the GPU is=
 powered down<br>
<br>
Signed-off-by: Karol Herbst &lt;<a href=3D"mailto:kherbst@redhat.com" targe=
t=3D"_blank">kherbst@redhat.com</a>&gt;<br></blockquote><div><br></div><div=
>Looks good to me and successfully tested on my GP107M with runtime power m=
anagement fixes, so<br></div><div><br></div><div>Reviewed-by: Rhys Kidd &lt=
;<a href=3D"mailto:rhyskidd@gmail.com">rhyskidd@gmail.com</a>&gt;</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drm/nouveau/nouveau_hwmon.c | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c<br>
index 618d8b780..d445c6f3f 100644<br>
--- a/drm/nouveau/nouveau_hwmon.c<br>
+++ b/drm/nouveau/nouveau_hwmon.c<br>
@@ -426,6 +426,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int cha=
nnel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_temp_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_therm_=
temp_get(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ret &lt; 0=
 ? ret : (ret * 1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -472,6 +474,8 @@ nouveau_fan_read(struct device *dev, u32 attr, int chan=
nel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_fan_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D nvkm_therm=
_fan_sense(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
@@ -494,6 +498,8 @@ nouveau_in_read(struct device *dev, u32 attr, int chann=
el, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_in_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_volt_g=
et(volt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ret &lt; 0=
 ? ret : (ret / 1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -525,6 +531,8 @@ nouveau_pwm_read(struct device *dev, u32 attr, int chan=
nel, long *val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D therm-&gt;=
attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_pwm_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D therm-&gt;=
fan_get(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
@@ -546,6 +554,8 @@ nouveau_power_read(struct device *dev, u32 attr, int ch=
annel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D nvkm_iccse=
nse_read_all(iccsense);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_max:<br>
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

--0000000000002a8e82058be1446b--

--===============1456790316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1456790316==--
