Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63D48FCE8F
	for <lists+nouveau@lfdr.de>; Wed,  5 Jun 2024 15:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55EE10E3BB;
	Wed,  5 Jun 2024 13:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YsEXPveQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F207010E3BB
 for <nouveau@lists.freedesktop.org>; Wed,  5 Jun 2024 13:11:44 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-57a50ac2ca1so5153949a12.0
 for <nouveau@lists.freedesktop.org>; Wed, 05 Jun 2024 06:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717593103; x=1718197903; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3q3Yi0zzTiuDCKFIdly7zaVexQGOnZpitg0epyTyLVk=;
 b=YsEXPveQ43ubG3ZU1Hevu0EDxepor81jLHfodt5ezd4R75DipNNnirFSwL9dTFcCt5
 xDs6NyxoAQJqjnEObuvaSKPHBsTMruqw43yujVGxs8rRWwQQKXdxlblbsId2RS4TiXd2
 AhgVuzhd/EZamG5H4CKrA694tsn6WaPkd9m+5ddqr6oS5Uquw8xH4530t0DPPsZ2FYak
 vyIcLthTItfiMEEfoVBuLOyUbTRkryavF7tJGAWy1arjhCgEMWBeZg63ctMSJjjdvNXO
 nqHOU6sQKiLHkWgCxeTs/xysouh/zLDE1kSLqSfEK8EgiuVMERwfVgiOwTX//O9PUqQp
 psqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717593103; x=1718197903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3q3Yi0zzTiuDCKFIdly7zaVexQGOnZpitg0epyTyLVk=;
 b=ApFutKlTlX8Ne2Vwrc7Akzph1CldELR6VJ6C8kYtbbza1HX4X2WD9mrkr7Ct9CQXHb
 /DhSd/MnXMhbqb1kdyZSt0SG19nsbzN8bSzwreK+Tts9KUj0M/ZpZa6oP91LHfSjg3xk
 HkWVnew9X5W6wa41RDOXvsadd7AsRkikMBH3otHTta1Ldg3BO9z9RtXfqX61r3OUmt87
 SxfTyldafQJfyZqM76fz2eBTGl0FLKUu5QjJO/Tijja0TVG103ffMDPcReRVBK4B8MNo
 9cNk2Z/l2o/FHZ6Y977i1OdUEwy4ULo+CqBYmisxtPfytqk8YcPVefNptIQJe3zcUQtA
 qvaw==
X-Gm-Message-State: AOJu0YwXqv/NZf9xuz1oEEXAG+4RXUw/CBhlH8yWiA9eLJ/QFa+iBpR2
 4WslZ84CX8xaJeN087VclfUFi68vjkuV7eEBSqrIimB09AYd8ZZrVuZRx70Xi4Za8tOjey2AjT8
 PSiokupODNyqiUkNPDtq6Sd90Hqf1X/iI
X-Google-Smtp-Source: AGHT+IFEmJ/3mRgY6jSnhlZsc9QsWP3y7roZej1sgtOWB8DgPhmYK/nA9vpbx8q/ppAtmxyVyjuVH9jujJdh4nCCz4E=
X-Received: by 2002:a50:a697:0:b0:57a:3424:b36e with SMTP id
 4fb4d7f45d1cf-57a8b6a60e4mr1668035a12.13.1717593102851; Wed, 05 Jun 2024
 06:11:42 -0700 (PDT)
MIME-Version: 1.0
References: <CABwHSOvVc5ZbGv=zj9CJJfkO=aU+X2_W8ms816dufVx2P7LSvg@mail.gmail.com>
 <8a3a64f300eb3a5bbc291d6527a1b4bfdef59acb.camel@redhat.com>
In-Reply-To: <8a3a64f300eb3a5bbc291d6527a1b4bfdef59acb.camel@redhat.com>
From: Blake McBride <blake1024@gmail.com>
Date: Wed, 5 Jun 2024 08:11:31 -0500
Message-ID: <CABwHSOtp2u6kDGSjthi06+-wOdu8eX_0fvtpQREtimDoX5Ugsw@mail.gmail.com>
Subject: Re: LLM GPU Support
To: Philipp Stanner <pstanner@redhat.com>
Cc: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000c3aa7d061a244e8a"
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

--000000000000c3aa7d061a244e8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am sorry.  Perhaps I am under the wrong impression.  My understanding is
that there are three pieces needed (in addition to the hardware) as follows=
:

1. the low-level drivers (nouveau or Nvidia)
2. the GPU library (Nvidia only)
3. the LLM software

#3 requires #2.  #2 requires the Nvidia low-level driver and will not work
with the nouveau driver.

If I am correct, specifying any of what you ask is superfluous.  If I am
incorrect, great!  Glad to hear it!  I need to investigate further.

Please let me know if nouveau supports the Nvidia's GPU library or not (or
perhaps my assumptions are incorrect)?

Thanks!

Blake McBride


On Wed, Jun 5, 2024 at 5:42=E2=80=AFAM Philipp Stanner <pstanner@redhat.com=
> wrote:

> On Tue, 2024-06-04 at 10:27 -0500, Blake McBride wrote:
> > Greetings,
> >
> > I have used the nouveau driver with my Nvidia card on Linux.  Works
> > fine.  However, my problem has to do with running LLM on my GPU with
> > your driver.  My impression is, it doesn't work.  Am I correct?
>
> Yo,
>
> "it doesn't work" is not a very precise error description.
>
> The maintainers will need info such as:
>
> Which kernel version, what payload, how's the payload invoked and what
> is the observed error?
>
>
> P.
>
> >
> > Given today's environment, this may be a good FAQ.
> >
> > Thanks!
> >
> > Blake McBride
> >
>
>

--000000000000c3aa7d061a244e8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I am sorry.=C2=A0 Perhaps I am under the =
wrong impression.=C2=A0 My understanding is that there are three pieces nee=
ded (in addition to the=C2=A0hardware) as follows:<div><br></div><div>1. th=
e low-level drivers (nouveau or Nvidia)</div><div>2. the GPU library (Nvidi=
a only)</div><div>3. the LLM software</div><div><br></div><div>#3 requires =
#2.=C2=A0 #2 requires the Nvidia=C2=A0low-level driver and will not work wi=
th the nouveau=C2=A0driver.</div><div><br></div><div>If I am correct, speci=
fying=C2=A0any of what you ask is superfluous.=C2=A0 If I am incorrect, gre=
at!=C2=A0 Glad to hear it!=C2=A0 I need to investigate=C2=A0further.</div><=
div><br></div><div>Please let me know if nouveau supports the Nvidia&#39;s =
GPU library or not (or perhaps my assumptions are incorrect)?</div><div><br=
></div><div>Thanks!</div><div><br></div><div>Blake McBride</div><div><br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jun 5, 2024 at 5:42=E2=80=AFAM Philipp Stanner &lt;<a href=3D"m=
ailto:pstanner@redhat.com">pstanner@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 2024-06-04 at 10:27 -=
0500, Blake McBride wrote:<br>
&gt; Greetings,<br>
&gt; <br>
&gt; I have used the nouveau driver with my Nvidia card on Linux.=C2=A0 Wor=
ks<br>
&gt; fine.=C2=A0 However, my problem has to do with running LLM on my GPU w=
ith<br>
&gt; your driver.=C2=A0 My impression is, it doesn&#39;t work.=C2=A0 Am I c=
orrect?<br>
<br>
Yo,<br>
<br>
&quot;it doesn&#39;t work&quot; is not a very precise error description.<br=
>
<br>
The maintainers will need info such as:<br>
<br>
Which kernel version, what payload, how&#39;s the payload invoked and what<=
br>
is the observed error?<br>
<br>
<br>
P.<br>
<br>
&gt; <br>
&gt; Given today&#39;s environment, this may be a good FAQ.<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; Blake McBride<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000c3aa7d061a244e8a--
