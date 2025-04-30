Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40881AA5331
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 20:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E1510E2AF;
	Wed, 30 Apr 2025 18:03:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="jTdCnOzJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B546A10E2AF
 for <nouveau@lists.freedesktop.org>; Wed, 30 Apr 2025 18:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1746036217; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZsQT+bTlPZ7j9claR2jBQ/ou4qRLAW2nyMXvTMXoYbUpDaduLfLQ9TNQwMFuHbMfQH9tGAHT51vRGEZZzJWfo47LLl0CblUwBkP9G5TFnOJhmNfxi2ejlTPPKpGQcswA93pkgonSUnt7S3V6fFazlCyFO0F3ZYMcfnwHwOrGprU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1746036217;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=2Rf6ymuSsGCBVLUGE1N/Mgv/xMkNMjvOfaHB9wgboNk=; 
 b=nj8W26cFSBlGlEJ1OVSyiYh3AOh7KwjMA1J3mt/yCNbFp7Xy5uLJC8mmpI48mogaO98dKVArbNZNJy/s5Bc/0e0yJI9RDGgC85sMl4WG+1LgoUL5jBHC3bucPVO2sK12WdH88L0Ntm9TQEAz3BpFLY0numsCgWCCouY1mod3sss=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1746036217; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=2Rf6ymuSsGCBVLUGE1N/Mgv/xMkNMjvOfaHB9wgboNk=;
 b=jTdCnOzJGT7zVrPZ1D4H0U9lUltuxs22tZgPf5pLjIBX/0gDcDm8C+pjeD51lTlS
 bWXCHfCM552C2FhrjMPqYIritwcU2b9J8dtSX4nxLJkT0Xj4CgwRrMMI2GxdX5c0d2N
 G5rTZwp0rNJQsq0BWuCvacAsqLVzrUvx387zjZlk=
Received: by mx.zohomail.com with SMTPS id 174603621541992.01280155852487;
 Wed, 30 Apr 2025 11:03:35 -0700 (PDT)
Message-ID: <00b39168e6f8392eb624a6c97fcf010881f75d97.camel@collabora.com>
Subject: Announcement: 2025 X.Org Foundation Election voting OPEN
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 30 Apr 2025 14:03:34 -0400
Content-Type: multipart/alternative; boundary="=-ge8vd6y6fUsy7eAI8/2m"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42app2) 
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

--=-ge8vd6y6fUsy7eAI8/2m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To all X.Org Foundation Members:

The X.Org Foundation's annual election is now open and will remain open
until 23:59 UTC on 14 May 2025.

Four of the eight director seats are open during this election. The
four nominees receiving the highest vote totals serving as directors
for two year terms.

There were five candidates nominated. For a complete list of the
candidates and their personal statements, please
see=C2=A0https://www.x.org/wiki/BoardOfDirectors/Elections/2025/

Here are some instructions on how to cast your vote:

   1. Go directly to the voting link (you might need to log into the
      member system first)
     =20
      https://members.x.org/ballot/16/vote
     =20
   2. There is a pull-down selection of candidates next to each
      preference level.=C2=A0Note that you are NOT required to select your
      preferences for all five candidates. You can leave more than one
      blank.
     =20
   3. After you have completed your ballot, click the "Vote" button.
      Note that once you click this button, your votes will be cast and
      you will not be able to make further changes, so please make sure
      you are satisfied with your votes before clicking the "Vote"
      button.

After you click the "Cast vote" button, the system will verify that you
have completed a valid ballot. If your ballot is invalid (e.g., you
duplicated a selection or did not answer the By-laws approval
question), it will return you to the previous voting page. If your
ballot is valid, your votes will be recorded and the system will show
you a notice that your votes were cast.

Note that the election will close at 23:59 UTC on 14 May 2025. At that
time, the election committee will count the votes and present the
results to the current board for validation. After the current board
validates the results, the election committee will present the results
to the Members.

Mark Filion, on behalf of the X.Org elections committee

--=-ge8vd6y6fUsy7eAI8/2m
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
 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-var=
iant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-str=
oke-width: 0px; text-decoration: none;">To all X.Org Foundation Members:</d=
iv><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-famil=
y: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: norma=
l; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webk=
it-text-stroke-width: 0px; text-decoration: none;">The X.Org Foundation's a=
nnual election is now open and will remain open until 23:59 UTC on 14 May 2=
025.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); fon=
t-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; text-i=
ndent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -=
webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: =
0px; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0,=
 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4)=
; -webkit-text-stroke-width: 0px; text-decoration: none;">Four of the eight=
 director seats are open during this election. The four nominees receiving =
the highest vote totals serving as directors for two year terms.</div><div =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot=
;Adwaita Sans&quot;; font-style: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap-high=
light-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decor=
ation: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb=
(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-=
variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align:=
 start; text-indent: 0px; text-transform: none; white-space: normal; word-s=
pacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-=
stroke-width: 0px; text-decoration: none;">There were five candidates nomin=
ated. For a complete list of the candidates and their personal statements, =
please see&nbsp;<a href=3D"https://www.x.org/wiki/BoardOfDirectors/Election=
s/2025/" style=3D"color: rgb(46, 52, 54);">https://www.x.org/wiki/BoardOfDi=
rectors/Elections/2025/</a></div><div style=3D"caret-color: rgb(0, 0, 0); c=
olor: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -web=
kit-text-stroke-width: 0px; text-decoration: none;"><br></div><div style=3D=
"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita=
 Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-co=
lor: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: n=
one;">Here are some instructions on how to cast your vote:</div><div style=
=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwa=
ita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight:=
 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight=
-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration=
: none;"><br></div><ol style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: &quot;Adwaita Sans&quot;; font-style: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; text-align: start=
; text-indent: 0px; text-transform: none; white-space: normal; word-spacing=
: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke=
-width: 0px; text-decoration: none;"><li>Go directly to the voting link (yo=
u might need to log into the member system first)<br><br><a href=3D"https:/=
/members.x.org/ballot/16/vote" style=3D"color: rgb(46, 52, 54);">https://me=
mbers.x.org/ballot/16/vote</a><br><br></li><li>There is a pull-down selecti=
on of candidates next to each preference level.<span class=3D"Apple-convert=
ed-space">&nbsp;</span>Note that you are NOT required to select your prefer=
ences for all five candidates. You can leave more than one blank.<br><br></=
li><li>After you have completed your ballot, click the "Vote" button. Note =
that once you click this button, your votes will be cast and you will not b=
e able to make further changes, so please make sure you are satisfied with =
your votes before clicking the "Vote" button.</li></ol><div style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&q=
uot;; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-color: rg=
ba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration: none;"><=
br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font=
-family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: n=
ormal; font-weight: 400; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0=
px; text-decoration: none;">After you click the "Cast vote" button, the sys=
tem will verify that you have completed a valid ballot. If your ballot is i=
nvalid (e.g., you duplicated a selection or did not answer the By-laws appr=
oval question), it will return you to the previous voting page. If your bal=
lot is valid, your votes will be recorded and the system will show you a no=
tice that your votes were cast.</div><div style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br></div><div styl=
e=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: &quot;Adw=
aita Sans&quot;; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highligh=
t-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoratio=
n: none;">Note that the election will close at 23:59 UTC on 14 May 2025. At=
 that time, the election committee will count the votes and present the res=
ults to the current board for validation. After the current board validates=
 the results, the election committee will present the results to the Member=
s.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-=
family: &quot;Adwaita Sans&quot;; font-style: normal; font-variant-caps: no=
rmal; font-weight: 400; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0p=
x; text-decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-family: &quot;Adwaita Sans&quot;; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); =
-webkit-text-stroke-width: 0px; text-decoration: none;">Mark Filion, on beh=
alf of the X.Org elections committee</div><div><span></span></div></body></=
html>

--=-ge8vd6y6fUsy7eAI8/2m--
