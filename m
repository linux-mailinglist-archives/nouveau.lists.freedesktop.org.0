Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 022F997DD84
	for <lists+nouveau@lfdr.de>; Sat, 21 Sep 2024 17:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA10110E04B;
	Sat, 21 Sep 2024 15:18:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8675C10E04B
 for <nouveau@lists.freedesktop.org>; Sat, 21 Sep 2024 15:18:35 +0000 (UTC)
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-49bc7387371so1097333137.2
 for <nouveau@lists.freedesktop.org>; Sat, 21 Sep 2024 08:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726931914; x=1727536714;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VtlUu5rY8f6jb1QvylEtITO/SxuSm7m2iSmUIAFTlfQ=;
 b=m78x5RGuP4ai58YBwXkctkyDXziqqZhTwNYvGvtU5KQlfzMs+fmyLYP3pBYhS5v/hG
 mWGFuhRK38YIsTMtzj+oZmyBWEMbxSaW5CBbpXW8xNoymc+elSE+Q6IeQmRSfQbCHLnT
 NX7IlDm/RrrE6gmjPyR17b0PFcU+8+AU2n5DTvyrBYQaaHlwDG3O/9JghA65bEhqVgzY
 fIdgrDYLH8IwTnhBqCv/64mDQwYAaMSXoA4vkE7jRHg2iMQBinSBHLI2Vg6KtbUecTzr
 L9kDY8S+5MT7OH4vKBSbaJ178c556NLe7PO0QXv8LoMYZYwsMNW7QQS9rlqfUyoh6KCi
 tdgA==
X-Gm-Message-State: AOJu0YxFXrIXnBFLegy2NsUsh7wFreeQTKoOCNyllj0IahjbN1mgbpnz
 /3ONIZHsw82vU2Rx9yO7O8GqlsvLN30DNkfx7a885lQz1LfY0uYhvcxuSgUlXFSHS2Izt0q6VOq
 ZucTTDE6mR+1J/bsLLTNW/RJJb8A=
X-Google-Smtp-Source: AGHT+IHSe7b+6NupMqzSU/4+JVSv2eMK8Gn9837CFzEwP6GVpJVB8bN/QJZ1X0c4uAi0+cybJVLwhLJJCmKdywz+D8s=
X-Received: by 2002:a05:6102:32c5:b0:49b:e7d7:3e1b with SMTP id
 ada2fe7eead31-49fc7537dfdmr7276716137.3.1726931914396; Sat, 21 Sep 2024
 08:18:34 -0700 (PDT)
MIME-Version: 1.0
References: <db268a78-5e39-4256-975d-ab5959448617@gmail.com>
In-Reply-To: <db268a78-5e39-4256-975d-ab5959448617@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 21 Sep 2024 11:18:23 -0400
Message-ID: <CAKb7Uvipo0fjDw4fkjH55aBePVBvXdH_mQR3A0eOMtHmLeGfuw@mail.gmail.com>
Subject: Re: Options for xorg.conf supported by driver
To: Jack Harrington <jackharro282@gmail.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="0000000000004f1ce70622a2abff"
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

--0000000000004f1ce70622a2abff
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jack,

If your goal is ensure that the dGPU doesn't go to sleep, you can boot with
"nouveau.runpm=3D0" which should disable the go-to-sleep stuff, I believe.

Depending on how things are wired up, it may not be possible to drive all
display on the igpu from the dgpu with Xorg. Xorg is generally set up to
allow you to render some things from the secondary GPU using DRI_PRIME
environment variable. This could even be the compositor, if you're using
one. Although more common is to do it for specific applications.

Cheers,

  -ilia

On Fri, Sep 20, 2024 at 10:42=E2=80=AFPM Jack Harrington <jackharro282@gmai=
l.com>
wrote:

> G'day,
>
> I'm configuring my xorg.conf to set my dGPU as the main GPU because my
> laptop's fans aren't supported and the GPU fan is really important for
> the thermals. The CPU fan sucks air from the base, and the dGPU fan
> pushes it out the back.
>
> It's an Inspiron 15 7000 which isn't support by i8x as far as I could tel=
l.
>
> So I'm wondering, is there a list of options that nouveau can understand
> from xorg.conf, in particular something to control switcherooctl like
> how nvidia has PrimaryGPU?
>
> I want to try out light gaming with nouveau on the 1050Ti before I mess
> with nvidia again.
>
> Cheers,
>
> Jack Harrington
>
>

--0000000000004f1ce70622a2abff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jack,<div><br></div><div>If your goal is ensure that th=
e dGPU doesn&#39;t go to sleep, you can boot with &quot;nouveau.runpm=3D0&q=
uot; which should disable the go-to-sleep stuff, I believe.</div><div><br><=
/div><div>Depending on how things are wired up, it may not be possible to d=
rive all display on the igpu from the dgpu with Xorg. Xorg is generally set=
 up to allow you to render some things from the secondary GPU using DRI_PRI=
ME environment variable. This could even be the compositor, if you&#39;re u=
sing one. Although more common is to do it for specific applications.</div>=
<div><br></div><div>Cheers,</div><div><br></div><div>=C2=A0 -ilia</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Sep 20, 2024 at 10:42=E2=80=AFPM Jack Harrington &lt;<a href=3D"mailto:=
jackharro282@gmail.com">jackharro282@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">G&#39;day,<br>
<br>
I&#39;m configuring my xorg.conf to set my dGPU as the main GPU because my =
<br>
laptop&#39;s fans aren&#39;t supported and the GPU fan is really important =
for <br>
the thermals. The CPU fan sucks air from the base, and the dGPU fan <br>
pushes it out the back.<br>
<br>
It&#39;s an Inspiron 15 7000 which isn&#39;t support by i8x as far as I cou=
ld tell.<br>
<br>
So I&#39;m wondering, is there a list of options that nouveau can understan=
d <br>
from xorg.conf, in particular something to control switcherooctl like <br>
how nvidia has PrimaryGPU?<br>
<br>
I want to try out light gaming with nouveau on the 1050Ti before I mess <br=
>
with nvidia again.<br>
<br>
Cheers,<br>
<br>
Jack Harrington<br>
<br>
</blockquote></div>

--0000000000004f1ce70622a2abff--
