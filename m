Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63744652C
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:41:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5299B6E88C;
	Fri,  5 Nov 2021 14:41:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA76E88C
 for <nouveau@lists.freedesktop.org>; Fri,  5 Nov 2021 14:41:56 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id s20so679521qtk.0
 for <nouveau@lists.freedesktop.org>; Fri, 05 Nov 2021 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=YgjHUE6TT1UmT+VYiTGLIEcoJ5L3+flJLBV1W04dFGc=;
 b=N7qGrk+LYnhsuLgr5CBTGMhyms0CmKVyzLIcE3LS/QBxxl6/NWzZhDBfzggX0XZB0U
 bsmqUdDovgKQT96ajtBWnaP396xp3KwxFfqUJnFNmxpchW8YNLP8W8NCtAKM7KQXY8rL
 YSBdqXs3JJSJYcHV7WgTJl/JsojrzkGEFs0cZqN7WE6yWL9lyn8WAm2sSjj6S/P9vLnn
 sz6AkBaD1Yk9rsPhBvDpIMtMe16wzk4xYZulyhmjjFWX+QaQaScbsAU2KxyeYt3/WQap
 +hfgXttLMRDEAeumBbtJ2M7H+OnGbJlF/kiZ5Jeuab6vJZE6ySXdx07TIo3UD6QI7htH
 qSKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YgjHUE6TT1UmT+VYiTGLIEcoJ5L3+flJLBV1W04dFGc=;
 b=PJOx2hyK8UJn/O7DKZyrt+Sha48e+C6S2+JoWmJaZOxUbUFD7VMp7oBhNCEbvUdIqJ
 HO5ynOvWc2LZuOZ4cuTcthDlccN7rt7zRiOIyt0mREPzQHOJwZgyZlwoqbs6cH/Y8I1F
 UrLrzDWjqYKDpk/L3DsS3zM2BVaFlGdNeWYT6laN6lGwIeE6T7A+/syW375QiAiFOI2H
 iA4NX+ELaNgZsW8VFhecfMhOlrrW/Dk0RdXjtRe2G59EL48l5Sa4o72oK3yTqzp5Gk4f
 +8N9U8VoWZ6PBDbz72Y23VawiZdzt8wJ0B/w6EQAZaD+/36QPR2nZdWicxnC0ewHCbx1
 NP4Q==
X-Gm-Message-State: AOAM531g9oKHmt8Y0TFF46CuPVBbjN+jS5rMtoa2gDXz35aj/Nl4M9fA
 506nC24lhYDWdcxPzk5k0RQOnn7j0rN4zOjW8HALzeW+6aA=
X-Google-Smtp-Source: ABdhPJw496kLKc4/fNcs3NXF3C/UUgPPa/9hfC2BOqobe02KDc1XvDAyLyZGX4wpYVlaIMm3DHNibckkBJsFBGGJa5E=
X-Received: by 2002:a05:622a:493:: with SMTP id
 p19mr55015004qtx.97.1636123315591; 
 Fri, 05 Nov 2021 07:41:55 -0700 (PDT)
MIME-Version: 1.0
From: Jerry Geis <jerry.geis@gmail.com>
Date: Fri, 5 Nov 2021 10:41:44 -0400
Message-ID: <CABr8-B7QAn9LV18d2HEWGqzvM3x4NcYj5rpvcXq=YsK-ozcoMQ@mail.gmail.com>
To: nouveau <nouveau@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="00000000000008def105d00ba53d"
Subject: [Nouveau] Ubuntu 20.04 and vlc
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

--00000000000008def105d00ba53d
Content-Type: text/plain; charset="UTF-8"

Hi All,

I am using Ubuntu 20.04 with VLC... normally the box boots up runs an
plays videos just fien with about 20% usage for VLC (celeron and or intel
Atom hardware).
After some time - day or two of playing videos. Something happens.
The CPU usage jumps way up like 120% kind of usage.  Like the vdpau stuff
is no longer working.

Is this a know issue ?
What should I look for  ?
What can I provide to help ?

 Intel(R) Atom(TM) CPU D525   @ 1.80GHz
03:00.0 VGA compatible controller: NVIDIA Corporation GT218 [ION] (rev a2)

Thanks

Jerry

--00000000000008def105d00ba53d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All,<div><br></div><div>I am using Ubuntu 20.04 with VL=
C... normally the box boots up runs an plays=C2=A0videos just fien=C2=A0wit=
h about 20% usage for VLC (celeron and or intel Atom hardware).</div><div>A=
fter some time - day or two of playing videos. Something happens.</div><div=
>The CPU usage jumps way up like 120% kind of usage.=C2=A0 Like the vdpau s=
tuff is no longer working.</div><div><br></div><div>Is this a know issue ?<=
/div><div>What should=C2=A0I look for=C2=A0 ?</div><div>What can I provide =
to help ?</div><div><br></div><div>=C2=A0Intel(R) Atom(TM) CPU D525 =C2=A0 =
@ 1.80GHz<br></div><div>03:00.0 VGA compatible controller: NVIDIA Corporati=
on GT218 [ION] (rev a2)<br></div><div><br></div><div>Thanks</div><div><br><=
/div><div>Jerry</div></div>

--00000000000008def105d00ba53d--
