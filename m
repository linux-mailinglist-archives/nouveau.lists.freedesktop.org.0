Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736633A6BB
	for <lists+nouveau@lfdr.de>; Sun,  9 Jun 2019 18:10:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DF0891A8;
	Sun,  9 Jun 2019 16:10:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433DF891A8
 for <nouveau@lists.freedesktop.org>; Sun,  9 Jun 2019 16:10:37 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id j2so2231800uaq.5
 for <nouveau@lists.freedesktop.org>; Sun, 09 Jun 2019 09:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1tGwKEVeN8V5SG//Omz/8eFmvPwHCmmDKCqiROkdq54=;
 b=eF/J7xveo2W3BuRH3oSsI23Vt9Nmo41+3ipdEqwnXFmjj9shmlOzVEkM83g1jvfhXB
 oENbI+vuNnvdSAsnXtWWQD3VoCMlgCNolEC1ZECz3vObNZi9SokJVHY2rJPFn0U3k+hc
 eWBUlS4fm/ZeLCC69WCF6t3/AIwDh4DD82MDo3MMvsn0i6976f+CowLR2wezqdHdKJ/v
 FStZbw9bAKfPj8jGPBClqaBwuX0es3FR3KYWu1Ael6lwmGPhb5Gk+hw5DIKKjF1tsYtb
 a1fK0wfTazl98l7a8ZMABG7fO7+djxxY7etWl1X2rrelgJXq7uYvxY9IwglmvppwThlw
 q0iw==
X-Gm-Message-State: APjAAAVrejpjjvVYQv+6Bj8Wz2NXL7MQPJT+Wgo4jPSqYeK0A2Kfm9Fn
 LKUI/A2zqa3962fVqIYRBsfYCchi9NGQzbCIeolxwxciSGw=
X-Google-Smtp-Source: APXvYqxAlHLo9dXuZyFBEdVEIwQ/eIcn6Mvg9TsHjkz/JqkTucwgDQ6i+OdC1WaUWe2bCDaQc+c/8Flo4BS/16SAc9I=
X-Received: by 2002:ab0:208f:: with SMTP id r15mr16558918uak.38.1560096636237; 
 Sun, 09 Jun 2019 09:10:36 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Sun, 9 Jun 2019 12:10:25 -0400
Message-ID: <CA+MSTo_dCwtDxwT+2z__8gKayXmMmpGox_rVTMT-9QYoJkZa7A@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1tGwKEVeN8V5SG//Omz/8eFmvPwHCmmDKCqiROkdq54=;
 b=KkIPye/W45G1kBTytIl147ZAgydoXDXyCItW0m2n9Iw4e9zoC2Jc/1QSf+MFOW5u1x
 /reBdIfhbYlUXExnr+zVc8shG6YQQeVHZdFB3JogSmcpiAQe3fEU08tGnv1s1yv9KJHs
 OoGXjIkPlGwZlmJJf1zWnYfwhh0GovyuyKx/73M6tuzRhVesmquPkhYeZ7ivyjqOLn3I
 G+UrlkUX1gAd6fxL+eOKBSjOsM3qp1mYJo84YCNT1uywYe0gvdiu+umyOuGr4YNtwWBm
 3H91AO8BNM/vKrDXkv4iXoFNZXYaY1I7+i6or+Gv3mPM1zhXqJK+qo0A3/OUug2mI7R9
 KN1Q==
Subject: [Nouveau] Questions on syncing mechanisms
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
Content-Type: multipart/mixed; boundary="===============0182240893=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0182240893==
Content-Type: multipart/alternative; boundary="000000000000d18184058ae64d83"

--000000000000d18184058ae64d83
Content-Type: text/plain; charset="UTF-8"

So I have been implementing syncing mechanisms to yuzu's switch emulator,
aka Tegra X1 emulation and I already have: Semaphores, Syncpoints and
Queries to some extent. I'm missing the barriers (GPU waits for CPU):
I got this from RE:
Barrier mode has priority (from highest to lowest): 1) 0x08 sets needsWfi=0
-> highest priority, does puller refcnt + split(0,0) + 0x100 NoOperation +
rest of cmds + split(1,1) 2) 0x01 sets needsWfi=0 -> uses 0x0110
Serialize/"WaitForIdle" 3) 0x02 sets needsWfi=1 -> uses 0xDE0 (??) 4) 0x04
sets needsWfi=1 -> uses 0xF7C (??) <-- tile related? Used by
nvnQueue_ctrlTiledDownsample 5) nothing; sets needsWfi=0
 Do you guys know any info on this and how the GPU must behave in each
situation. For instance, on Serialize, what should the GPU be waiting for?
I do know you guys use that one not sure on the rest.

--000000000000d18184058ae64d83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So I have been implementing syncing mechanisms to yuzu&#39=
;s switch emulator, aka Tegra X1 emulation and I already have: Semaphores, =
Syncpoints and Queries to some extent. I&#39;m missing the barriers (GPU wa=
its for CPU):<div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"></div><div>I got this from RE:</div><div><span style=3D"col=
or:rgb(131,148,150);font-family:Consolas,&quot;Liberation Mono&quot;,Menlo,=
Courier,monospace;font-size:14px;white-space:pre-wrap;background-color:rgb(=
47,49,54)">Barrier mode has priority (from highest to lowest):

 1) 0x08 sets needsWfi=3D0 -&gt; highest priority, does puller refcnt + spl=
it(0,0) + 0x100 NoOperation + rest of cmds + split(1,1)
 2) 0x01 sets needsWfi=3D0 -&gt; uses 0x0110 Serialize/&quot;WaitForIdle&qu=
ot;
 3) 0x02 sets needsWfi=3D1 -&gt; uses 0xDE0 (??)
 4) 0x04 sets needsWfi=3D1 -&gt; uses 0xF7C (??) &lt;-- tile related? Used =
by nvnQueue_ctrlTiledDownsample
 5) nothing; sets needsWfi=3D0</span>=C2=A0</div><div>=C2=A0Do you guys kno=
w any info on this and how the GPU must behave in each situation. For insta=
nce, on Serialize, what should the GPU be waiting for? I do know you guys u=
se that one not sure on the rest.<br></div></div>

--000000000000d18184058ae64d83--

--===============0182240893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0182240893==--
