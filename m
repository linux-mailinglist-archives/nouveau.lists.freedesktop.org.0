Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665B75B244
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 00:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DA889C85;
	Sun, 30 Jun 2019 22:55:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986B289C85
 for <nouveau@lists.freedesktop.org>; Sun, 30 Jun 2019 22:55:08 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id j8so4296905uan.6
 for <nouveau@lists.freedesktop.org>; Sun, 30 Jun 2019 15:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=28s+c37m3VXpaJ520kJKvJesRC8LkNMO+StUJLwU1rQ=;
 b=avGAKRxmlhh2Cmbisp7KgCVUlz4p7bG4NGTscGu4hjk0pOtlcrX05SNBMEYli6R4Ll
 Ch5UbVy3AYjkZII/cEhvZPKFDRd1j6grRFbspPWG8eSzc5DHBLGTmkd2fSc3z0Ag4QDp
 hADEUKE2KAnzjQXnYbQ3ymyZhOOZBPCrZeeyz1V5qCpfWw2xwgBLspmzKzGvpocADZ5y
 ODK16b/iSIxF1cLU7Vrz2sXryFqhSDT3DJfV6up1hhP46eq735C1gNQfarkGD3D+931J
 40IoBWYPrRARnmnJdWEBtVJSROU4Xd1Ws/xizW4JkOLBffEmkESLCu4kO54d+NEcthDW
 fIIw==
X-Gm-Message-State: APjAAAXxLJQCEU+ecRGl71p1DfwnhmMVbxM2Ro2F/lhlN59JFHwuGz1e
 LRulg+IHaFak9hnksdNCoN0MsY2JbGxbl9LzfJRudvKOaFg=
X-Google-Smtp-Source: APXvYqydvZo+wYsD7iK2fgHvvHa1YYxgvcjdzk9138gRQAxxer5Smhw2zIU/3doPzQsgvVM17pA9p35PTq2MkQo29h8=
X-Received: by 2002:ab0:208f:: with SMTP id r15mr11869783uak.38.1561935307606; 
 Sun, 30 Jun 2019 15:55:07 -0700 (PDT)
MIME-Version: 1.0
From: Fernando Sahmkow <fsahmkow27@gmail.com>
Date: Sun, 30 Jun 2019 18:54:57 -0400
Message-ID: <CA+MSTo_HoKD2vxF68oJm6OpVf76Uy9shmB2itBucYv4CJj8VEg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=28s+c37m3VXpaJ520kJKvJesRC8LkNMO+StUJLwU1rQ=;
 b=rOm/ktS6g7YJHd0PypKR3HejR5XDh5UsDMJsoK4YeI7xACSJN/sURP5O0DEVyUGojL
 I14hF47UmCzZKtXcnkmOwuKAsC7u6r/X/Hfoq/8VA3lwXdCu2XwpnKkqHU1EGeBqBJ24
 ZYrGJQ7IxPEeqRH602S9I6oQz967PcT27JbC8tfF4k5eRj3mlhlH3LmmxTRSsiAeLFQI
 hQ2BMo0sOYlVU9OokwqrluAx4TMicWchlBh/a6NEkmZl8UWWTzw1QowQqlPrGdikxfii
 Kg21NDBXqjqPG9+PgZ8wv5Y6aGmz8FI93DAHAq17kF0Z9gZRgvBJar27fG934yta9WNq
 JbaQ==
Subject: [Nouveau] Question on Conditional Rendering Maxwell/Pascal
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
Content-Type: multipart/mixed; boundary="===============1755129873=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1755129873==
Content-Type: multipart/alternative; boundary="0000000000002c0ed5058c9267db"

--0000000000002c0ed5058c9267db
Content-Type: text/plain; charset="UTF-8"

So we are currently doing tests and complying with them in our Emulator.
Currently the conditional rendering test does not pass (no wonder we not
even implement it). I've been looking at the current documentation
https://github.com/envytools/envytools/blob/master/rnndb/graph/gf100_3d.xml#L796
So
far I don't understand how the cond address is used and to what it's
compared.
https://github.com/envytools/envytools/blob/0d91b8bcef3ceb47ff0b114025d301edb790d472/rnndb/g80_defs.xml#L61

It says it uses 2 queries, how do I know which query it's talking off and
what it's the comparison that should be done.

Also, does failing conditional rendering makes registers not write into the
engine or just drawcalls/claers are ignored?

--0000000000002c0ed5058c9267db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So we are currently doing tests and complying with them in=
 our Emulator. Currently the conditional rendering test does not pass (no w=
onder we not even implement it). I&#39;ve been looking at the current docum=
entation=C2=A0<a href=3D"https://github.com/envytools/envytools/blob/master=
/rnndb/graph/gf100_3d.xml#L796">https://github.com/envytools/envytools/blob=
/master/rnndb/graph/gf100_3d.xml#L796</a>=C2=A0So far I don&#39;t understan=
d how the cond address is used and to what it&#39;s compared.=C2=A0<a href=
=3D"https://github.com/envytools/envytools/blob/0d91b8bcef3ceb47ff0b114025d=
301edb790d472/rnndb/g80_defs.xml#L61">https://github.com/envytools/envytool=
s/blob/0d91b8bcef3ceb47ff0b114025d301edb790d472/rnndb/g80_defs.xml#L61</a><=
div><br></div><div>It says it uses 2 queries, how do I know which query it&=
#39;s talking off and what it&#39;s the comparison that should be done.</di=
v><div><br></div><div>Also, does failing conditional rendering makes regist=
ers not write into the engine or just drawcalls/claers are ignored?</div></=
div>

--0000000000002c0ed5058c9267db--

--===============1755129873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1755129873==--
