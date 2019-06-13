Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244B436CF
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 15:42:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07EC3896E5;
	Thu, 13 Jun 2019 13:42:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com
 [IPv6:2607:f8b0:4864:20::e2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAE9896E5
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 13:42:21 +0000 (UTC)
Received: by mail-vs1-xe2f.google.com with SMTP id q64so12655622vsd.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 06:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ss3amPnUM/PV7WJJ/idqzvxWAOhnX+47EM8HXc3tkJo=;
 b=QQeKJ9LYcWO2SgIstyfwVZ17oS3fDvojwOmtr/77nvAsAVYZeJ1f+kPGsi11hDaVqx
 pDIFK2BHKh+ex1EzLK6KYx4kJMniblNyxQCO0mg6JvhHNUFQKswSx7nDhDUJ8hmvJZ3r
 qye/xSrGDaXiO6mHMYBAuYEAmD+JdMo6+qveXMp3YSa11LimVZlbmyfKbpU25R7dhMAq
 gJr319LHWFMNzN4f98FJwVliD9qNtqWK9H/0fhOxhEWo9nRO5EU06A+/PB0nW6kfFhwW
 2+TsF2eAvMmW6Ddjo2OHhnBoaK9CA+5Sf5yXbQ27qkA6H8SQwtzTfeo1P6ge1iLNVzFP
 CKdg==
X-Gm-Message-State: APjAAAUov3G/6ebXkbPbtzXx7X9PT7fBeuqD0yghqj5wY03bV9yxBMiQ
 W3j6aERIfc/lUUryd1OZsY4QmJHQri4MrGFeOHV/N+DMMHvTJQ==
X-Google-Smtp-Source: APXvYqzEL04kUftrYIT1pf8nInD0QOrDwAdPrZ3mpkLKAvpbJF0RGCrT/zJj5KN9fmJhZKXutvoLvBpYm8los/+l2rc=
X-Received: by 2002:a67:68ce:: with SMTP id
 d197mr38735191vsc.111.1560433340537; 
 Thu, 13 Jun 2019 06:42:20 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Thu, 13 Jun 2019 09:42:09 -0400
Message-ID: <CA+MSTo-h0aOj25dJNmoavQvRLTjEEekKFVSV3ixdLLcZwmJ_dQ@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ss3amPnUM/PV7WJJ/idqzvxWAOhnX+47EM8HXc3tkJo=;
 b=paYLETDwqEYilQz/7nvMcv+DKGZc+TQ2LgaMMnktnsg9uPHQcGCkfrRBX9OozyXofq
 f/2mfenXINXEfzjz/Kf4+1GrwizcvBBGntkhYZmZJOfY7Bgo432AK+oEkqBUkzlj99q+
 luQtA7rj/LAMx92/K7oOOS596z3JR7yGyxEH2NHVXrhDeCfnm7+zxVyeqlNwmSNL2XyK
 wahv6OkYkJ0mNRsRyD2xxb8weFYKFCN56Uy87KmjPU533h1ubnWG2XpKCupK9s2fwIxv
 vv7h7YXQt8krjAbI7aS0rTZO5cLHCiOXZpq+YDxP6YTSmCMjhXuRbDZBtdaaZI6ljlBn
 peGQ==
Subject: [Nouveau] Question on interoperability with Nouveau
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
Content-Type: multipart/mixed; boundary="===============0414508906=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0414508906==
Content-Type: multipart/alternative; boundary="000000000000f55f35058b34b265"

--000000000000f55f35058b34b265
Content-Type: text/plain; charset="UTF-8"

Hi guys again. A homebrew developer (homebrew is custom software made for
the switch using openGL under nouveau) reported to me that 'glGenerateMipmap'
wasn't working on yuzu (Nintendo Switch emulator). I looked into it and I
noticed all the triangle data used by nouveau to render the mipmaps was all
zeroed out, meaning that probably we don't implement the mechanism you guys
use to upload that data.

How can I track this in your code and know what you guys use to upload the
triangles data into gpu memory ?

--000000000000f55f35058b34b265
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi guys again. A homebrew developer (homebrew is custom so=
ftware made for the switch using openGL under nouveau) reported to me that =
&#39;<span style=3D"background-color:transparent;font-family:SFMono-Regular=
,Consolas,&quot;Liberation Mono&quot;,Menlo,Courier,monospace;color:rgb(36,=
41,46);font-size:11.9px">glGenerateMipmap&#39; wasn&#39;t working on yuzu (=
Nintendo Switch emulator). I looked into it and I noticed all the triangle =
data used by nouveau to render the mipmaps was all zeroed out, meaning that=
 probably we don&#39;t implement the mechanism you guys use to upload that =
data.<br><br>How can I track this in your code and know what you guys use t=
o upload the triangles data into gpu memory ?</span><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"></div></div>

--000000000000f55f35058b34b265--

--===============0414508906==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0414508906==--
