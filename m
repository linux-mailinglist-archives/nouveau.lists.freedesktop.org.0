Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E1665F3
	for <lists+nouveau@lfdr.de>; Fri, 12 Jul 2019 06:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E2D66E2BD;
	Fri, 12 Jul 2019 04:59:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08CD6E2BD
 for <nouveau@lists.freedesktop.org>; Fri, 12 Jul 2019 04:59:00 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so7995765edr.13
 for <nouveau@lists.freedesktop.org>; Thu, 11 Jul 2019 21:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uDbLFg0YUk3iZD3EZzMAjN0ekw2tB5TqHo1Jh9hRnRk=;
 b=sIugZwMUr+GY4dZzjwr7xAURMeKRiWXHT10JhQqRzosGdcp0dxh1GF9YJ9IGFDUfxf
 59XW1sQmeozRk6JJwLFZPlcWdMUs+Umrpl0V0OXrQLae7gp3q/5HUEBmGveui4pLsfVt
 8yRlmJwhT4nIWLFav5zPRpu/gd/Or4AYBlNbIpeWXiSBQh2cRfH+iuKdoCy2XTQ9KphA
 nI0pm1eE8oO4fz7UkMXTKZKJHebOs/C1sTjYv79NxH3K9kmkFhZmWA9cpsbiK2r7tzQM
 m+zUwnkI3qHybuHVXEUdLhdal9C2PMOhmws6JbniYIAhwCGWnmCjlPTwPiSojc1M4/9e
 DN7Q==
X-Gm-Message-State: APjAAAVQKmubTJ63wkVMl9jax/Tr/gQ+iyzC9Eo2XdLfy3G2b+NHG+aO
 ukWlnv+EM5RlasNyBoAg8HWzg5oaW3SQ9tdiM3Q=
X-Google-Smtp-Source: APXvYqyh0nW9S/oMttRy8Dc+Zxf377aj3Gw/iubS2xdoI+WLJQdXIXkXHKRO1X02Hao6PdRYPrkkuttsxoo/L+XSc1Q=
X-Received: by 2002:a17:906:69c4:: with SMTP id g4mr6590446ejs.9.1562907539331; 
 Thu, 11 Jul 2019 21:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190711141153.7723-1-mmenzyns@redhat.com>
In-Reply-To: <20190711141153.7723-1-mmenzyns@redhat.com>
From: Rhys Kidd <rhyskidd@gmail.com>
Date: Fri, 12 Jul 2019 14:58:48 +1000
Message-ID: <CA+iOQUEzF9s_99zoHwEN0=FbzX0QQqw+_-FxuyuO38XZG2Pxcg@mail.gmail.com>
To: Mark Menzynski <mmenzyns@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uDbLFg0YUk3iZD3EZzMAjN0ekw2tB5TqHo1Jh9hRnRk=;
 b=QT8Hm25x55DZFAWp1UbAETvdO3wUXQxcRawQ+CLAIBv5Q9T8htj9oiVzU8q3ZsD1QQ
 t3QwiVzW8QMKpHUzAeLjrkheN3SruOstoDYB0dWegIZdqVM6jyOfxfMQWvlXXSWg7zM0
 6EI4jx/cnQEJ2rkl46bwPnbVWXmh/++OmthGVh1wgr3ETkJ7TZRnEfOH4Y/tC57PS8zL
 JAYSM9k6WntGHzpz6yEVUY5GfsMFDSMcGW3Oz1wmDPyR829U2L2A6ZWrXYk9mzWm91to
 8d6lMHuzoqWZdwhmGyYeuA0hiE/d5HMw6bWWMgkEmJxBKD4OILTOaB22lwRpzjIMB2u0
 IMkw==
Subject: Re: [Nouveau] [PATCH 0/4] Refuse to load if the power cable are not
 connected
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
Content-Type: multipart/mixed; boundary="===============1475519931=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1475519931==
Content-Type: multipart/alternative; boundary="000000000000b2dc98058d74c427"

--000000000000b2dc98058d74c427
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 00:42, Mark Menzynski <mmenzyns@redhat.com> wrote:

Hello Mark,

Thank you for your first kernel patch series to nouveau!
This is a good starting point. However, I would suggest a couple of general
improvements which apply to the whole series:

1. Invest a little bit more time in writing the commit messages.

There is a slightly subjective element to what makes a "good" commit
message, but generally the principle is that it should concisely
convey the "what" of the patch, but more importantly the "why" of the patch.

A future reader (which might be yourself!) can understand *what* the patch
does from the code, to a lesser or so amount of time.
The *why* of a patch really can only be communicated within the commit
message, so a little extra time spent here is well spent.

A helpful approach I suggest is trying to follow the style of the folder,
submodule or driver:

  $ git log -n20 drivers/gpu/drm/nouveau/

There's also a web resource here: https://chris.beams.io/posts/git-commit/
(although it's not Linux kernel specific)

2. Run ./scripts/checkpatch.pl on the final patch series

You may have already done this, as I noticed the current patches report no
errors or warnings. If so, well done!

It's a good habit to re-run this script against the final v2 patch series
again though.

You can also ask questions on freenode #nouveau where many of the nouveau
graphics stack driver developers hang out.

Rhys

trello card:
>
> https://trello.com/c/admzDRvd/50-reduce-performance-refuse-to-boot-if-not-all-the-power-connectors-are-plugged
>
> Mark Menzynski (4):
>   moved gpio so it is sorted by values
>   gpio: checking if gpu power cable is connected
>   gpio: added power check for another GPIO
>   gpio: added power check for another GPIO
>

I'd recommend adding to the first line of the commit message of these two
patches something which distinguishes them
apart. e.g. it appears you've identified that there are different gpio pin
functions for different nvidia gpu families, so perhaps
use the pre- / and post- family names to separate the two patches for a
reader.

Also, take a look at how the prefix before the ":" is usually written in
this area of the code:

  $ git log -n10 --oneline drivers/gpu/drm/nouveau/<relevant subfolders>


>
>  drm/nouveau/include/nvkm/subdev/bios/gpio.h |  5 ++++-
>  drm/nouveau/nvkm/subdev/gpio/base.c         | 25 +++++++++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> --
> 2.21.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--000000000000b2dc98058d74c427
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 12 Jul 2019 at 00:42, Mark Menzyn=
ski &lt;<a href=3D"mailto:mmenzyns@redhat.com" target=3D"_blank">mmenzyns@r=
edhat.com</a>&gt; wrote:</div><div dir=3D"ltr"><br></div><div>Hello Mark,</=
div><div><br></div><div>Thank you for your first kernel patch series to nou=
veau!</div><div>This is a good starting point. However, I would suggest a c=
ouple of general improvements which apply to the whole series:</div><div><b=
r></div><div>1. Invest a little bit more time in writing the commit message=
s.</div><div><br></div><div>There is a slightly subjective element to what =
makes a &quot;good&quot; commit message, but generally the principle is tha=
t it should concisely</div><div>convey the &quot;what&quot; of the patch, b=
ut more importantly the &quot;why&quot; of the patch.</div><div><br></div><=
div>A future reader (which might be yourself!) can understand *what* the pa=
tch does from the code, to a lesser or so amount of time.</div><div>The *wh=
y* of a patch really can only be communicated within the commit message, so=
 a little extra time spent here is well spent.<br></div><div><br></div><div=
>A helpful approach I suggest is trying to follow the style of the folder, =
submodule or driver:</div><div><br></div><div>=C2=A0 $ git log -n20 drivers=
/gpu/drm/nouveau/</div><div><br></div><div>There&#39;s also a web resource =
here: <a href=3D"https://chris.beams.io/posts/git-commit/" target=3D"_blank=
">https://chris.beams.io/posts/git-commit/</a> (although it&#39;s not Linux=
 kernel specific)<br></div><div><br></div><div>2. Run ./scripts/<a href=3D"=
http://checkpatch.pl" target=3D"_blank">checkpatch.pl</a> on the final patc=
h series<br></div><div dir=3D"ltr"><br></div><div>You may have already done=
 this, as I noticed the current patches report no errors or warnings. If so=
, well done!<br></div><div><br></div><div>It&#39;s a good habit to re-run t=
his script against the final v2 patch series again though.</div><div><br></=
div><div>You can also ask questions on freenode #nouveau where many of the =
nouveau graphics stack driver developers hang out.<br></div><div><br></div>=
<div>Rhys<br></div><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">trello card:<br>
<a href=3D"https://trello.com/c/admzDRvd/50-reduce-performance-refuse-to-bo=
ot-if-not-all-the-power-connectors-are-plugged" rel=3D"noreferrer" target=
=3D"_blank">https://trello.com/c/admzDRvd/50-reduce-performance-refuse-to-b=
oot-if-not-all-the-power-connectors-are-plugged</a><br>
<br>
Mark Menzynski (4):<br>
=C2=A0 moved gpio so it is sorted by values<br>
=C2=A0 gpio: checking if gpu power cable is connected<br>
=C2=A0 gpio: added power check for another GPIO<br>
=C2=A0 gpio: added power check for another GPIO<br></blockquote><div><br></=
div><div>I&#39;d recommend adding to the first line of the commit message o=
f these two patches something which distinguishes them</div><div>apart. e.g=
. it appears you&#39;ve identified that there are different gpio pin functi=
ons for different nvidia gpu families, so perhaps</div><div>use the pre- / =
and post- family names to separate the two patches for a reader.</div><div>=
<br></div><div>Also, take a look at how the prefix before the &quot;:&quot;=
 is usually written in this area of the code:</div><div><br></div><div>=C2=
=A0 $ git log -n10 --oneline drivers/gpu/drm/nouveau/&lt;relevant subfolder=
s&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
=C2=A0drm/nouveau/include/nvkm/subdev/bios/gpio.h |=C2=A0 5 ++++-<br>
=C2=A0drm/nouveau/nvkm/subdev/gpio/base.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 25 +++++++++++++++++++++<br>
=C2=A02 files changed, 29 insertions(+), 1 deletion(-)<br>
<br>
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

--000000000000b2dc98058d74c427--

--===============1475519931==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1475519931==--
