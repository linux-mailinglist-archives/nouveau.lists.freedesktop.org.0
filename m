Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 831FEA71E35
	for <lists+nouveau@lfdr.de>; Wed, 26 Mar 2025 19:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8C510E777;
	Wed, 26 Mar 2025 18:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="WBzbmWyO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 26 Mar 2025 18:22:05 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47F10E777
 for <nouveau@lists.freedesktop.org>; Wed, 26 Mar 2025 18:22:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743012421; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EUG4bSI9C5jmn97M/qlHGN5GEe6nyTiGYKl9W9jYUlTln4mbCWxepC+3W2ws/orGoIcM53Hse6kxSJpP5GsjyLPbDFuSaK2ByrUOHd4d0o3uUVf+/LGlY6uWYIZI1au3goSB2SAnwArYWmQAx0gCkqEVt90w+UAXQ5/rQgNCk4A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743012421;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=2++tGDIxxVvZc22ImIHR6BxZsewU5CD0RMC/tY69JHo=; 
 b=mog/b2PsTE/AY+kiN2znWy/d5EpNoKw9LHTatc2U8ZDD5g8Kvpz5dkykOZTv75h/43VRn5Z59f9nNtYiq+HbTtiDjE1lCDCgpLYDQrK8fp2C9VlbTxwzxVnxfzI9DWVVpQKKAMnw18G8fwI0bjG66F63aDukLDZ58GLvMpm1J8Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743012421; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=2++tGDIxxVvZc22ImIHR6BxZsewU5CD0RMC/tY69JHo=;
 b=WBzbmWyOURCpcVulGIMEzEBDhnsQDxIxyK+KL2OMHmIHIVy3SwVipdE3Y/dgNTaO
 eWjUHttrJOiUjmR1LF+/i10f8zUZfZnAxNk6k8hOT9+CLvOf1mh0kq3DqVcH9xbWbzh
 vB4pExI9Hb5NaEV9OSYLsPtR+jTHG5wAXpIs1k90=
Received: by mx.zohomail.com with SMTPS id 1743012419143413.88162924848496;
 Wed, 26 Mar 2025 11:06:59 -0700 (PDT)
Message-ID: <ffcf8ecf10127200ec80e47e889d245b152683ed.camel@collabora.com>
Subject: 2025 X.Org Foundation Membership deadline for voting in the
 upcoming election
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 26 Mar 2025 14:06:58 -0400
Content-Type: multipart/alternative; boundary="=-6OlHiPr+HaI2ZG727FQ8"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
X-ZohoMailClient: External
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

--=-6OlHiPr+HaI2ZG727FQ8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Now that the freedesktop server migration is almost done, it's time to
turn our attention on the 2025 X.Org Foundation elections, which are
rapidly approaching! We will be forwarding the election schedule and
nominating process to the membership shortly.

Please note that only current members can vote in the upcoming
election, and that the deadline for new memberships or renewals to vote
in the upcoming election is 23 April 2025 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site
at:=C2=A0https://members.x.org/

Mark Filion, on behalf of the X.Org elections committee

--=-6OlHiPr+HaI2ZG727FQ8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;">Hello,</div><div style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-st=
roke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-style: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -=
webkit-text-stroke-width: 0px; text-decoration: none;">Now that the freedes=
ktop server migration is almost done, it's time to turn our attention on th=
e 2025 X.Org Foundation elections, which are rapidly approaching! We will b=
e forwarding the election schedule and nominating process to the membership=
 shortly.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: Cantarell; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">Please note that only current members can =
vote in the upcoming election, and that the deadline for new memberships or=
 renewals to vote in the upcoming election is 23 April 2025 at 23:59 UTC.</=
div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fami=
ly: Cantarell; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-=
color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration:=
 none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: Cantarell; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;">If you are interested in joining the X.Org Foundation=
 or in renewing your membership, please visit the membership system site at=
:<span class=3D"Apple-converted-space">&nbsp;</span><a href=3D"https://memb=
ers.x.org/" style=3D"color: rgb(238, 238, 236);">https://members.x.org/</a>=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: Cantarell; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highligh=
t-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoratio=
n: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; =
text-decoration: none;">Mark Filion, on behalf of the X.Org elections commi=
ttee</div><div><span></span></div></body></html>

--=-6OlHiPr+HaI2ZG727FQ8--
