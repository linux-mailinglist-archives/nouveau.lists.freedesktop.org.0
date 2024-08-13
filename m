Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D1950D5A
	for <lists+nouveau@lfdr.de>; Tue, 13 Aug 2024 21:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E8F10E3EE;
	Tue, 13 Aug 2024 19:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="HAnrD4q5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 13 Aug 2024 19:48:06 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34D610E3EE
 for <nouveau@lists.freedesktop.org>; Tue, 13 Aug 2024 19:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1723577584; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D60nVyjEuUS9+PPD6Afc2UgGqYrhSVDbIc4aRGkl6zWRqBiz9AsmBaVyZHjEuxA6by8KJQ/sl1ANwsH1cDE7I0c7iejt8y2Vb9IBTbYSvvlQlOaVrWjUue9Eps39C6ataGL9WKShL+wZLDY2LRcN/y2h06fGn713JgK48+goHXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723577584;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=dXMOYDOAAB8iexIu2Ncl8y/kzRaEBV7GCZYtJiwFV2g=; 
 b=BNdog1L/AE/EC+ywkcoxyYIMExCd/t2eKENnyRkf0ZIkCgZr3o6nvVz3EfnXHToQsptsFhZxKsgGC2hJDFpBrX9hawUMltZhifZ/aFA8SWNzSnQQKmgArlRICFlWBUrwNrOlTQlmTrMZCkhyilCU7VOJZx9GGKNliCb6BJWADuw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723577584; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=dXMOYDOAAB8iexIu2Ncl8y/kzRaEBV7GCZYtJiwFV2g=;
 b=HAnrD4q5CJ9ufHGeDsjponQocpjPPcvxZ5ByBITdr2tbyZLy8yfwuatS7vBotl2A
 /rNrjTENpsjoUZPt+qlo+V7xbqR71qB18R3kxvhzGKGjFmTY45BQU05ag6ozQIdnHb5
 CF/QjWqmkI5Y/3VonGeQHxWiEdwUgPFhsVtI6lMc=
Received: by mx.zohomail.com with SMTPS id 1723577582931379.5311742990334;
 Tue, 13 Aug 2024 12:33:02 -0700 (PDT)
Message-ID: <40033850e24fc91f85a54a2bb4b2eb04ff552a12.camel@collabora.com>
Subject: XDC 2024: Call for Proposals deadline extended to August 19
From: Mark Filion <mark.filion@collabora.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 13 Aug 2024 15:33:01 -0400
Content-Type: multipart/alternative; boundary="=-WqDGY9RWwpOdFvsqDill"
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
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

--=-WqDGY9RWwpOdFvsqDill
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

The CfP deadline for talks, workshops=C2=A0and demos at XDC=C2=A02024 has b=
een
extended to next Monday, 19 August 2024.=C2=A0

You have one more week to submit, don't wait!

https://indico.freedesktop.org/event/6/abstracts/

While any serious proposal will be gratefully=C2=A0considered, topics of
interest to X.Org and freedesktop.org developers are encouraged. The
program focus is on new development, ongoing challenges and anything
else that will spark discussions among attendees in the hallway track.

We are open to talks across all layers of the graphics stack, from the
kernel to desktop environments / graphical applications and about how
to make things better for the developers who build them. Head to the
CfP page to learn more!
=C2=A0=C2=A0=C2=A0
As usual, the conference is free of charge and open to the general
public. If you plan on attending, please make sure to register as early
as possible!

And don't forget, you can follow us on Mastodon for all the latest
updates and to stay connected:

=C2=A0=C2=A0=C2=A0=C2=A0https://floss.social/@XOrgDevConf

Best,

Mark

--=-WqDGY9RWwpOdFvsqDill
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
</style></head><body><div><span style=3D"caret-color: rgb(46, 52, 54); colo=
r: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: 13=
.333333px;">Hello!</span><br><br><span style=3D"caret-color: rgb(46, 52, 54=
); color: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quot;; font-s=
ize: 13.333333px;">The CfP deadline for talks, workshops&nbsp;and demos at =
XDC</span>&nbsp;<span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;=
">2024 has been<br>extended to next Monday, 19 August 2024.&nbsp;</span></d=
iv><div><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;"><br></=
span></div><div><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46,=
 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;=
">You have one more week to submit, don't wait!</span><br><br><a href=3D"ht=
tps://indico.freedesktop.org/event/6/abstracts/" title=3D"Click to open htt=
ps://indico.freedesktop.org/event/6/abstracts/">https://indico.freedesktop.=
org/event/6/abstracts/</a><br><br><span style=3D"caret-color: rgb(46, 52, 5=
4); color: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quot;; font-=
size: 13.333333px;">While any serious proposal will be gratefully&nbsp;cons=
idered, topics of</span><br><span style=3D"caret-color: rgb(46, 52, 54); co=
lor: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: =
13.333333px;">interest to X.Org and freedesktop.org developers are encourag=
ed. The</span><br><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(4=
6, 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: 13.333333p=
x;">program focus is on new development, ongoing challenges and anything</s=
pan><br><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;">else t=
hat will spark discussions among attendees in the hallway track.</span><br>=
<br><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); fo=
nt-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;">We are ope=
n to talks across all layers of the graphics stack, from the</span><br><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Source Code Pro&quot;; font-size: 13.333333px;">kernel to desktop =
environments / graphical applications and about how</span><br><span style=
=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quo=
t;Source Code Pro&quot;; font-size: 13.333333px;">to make things better for=
 the developers who build them. Head to the</span><br><span style=3D"caret-=
color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Source C=
ode Pro&quot;; font-size: 13.333333px;">CfP page to learn more!</span><br><=
span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-fa=
mily: &quot;Source Code Pro&quot;; font-size: 13.333333px;">&nbsp;&nbsp;&nb=
sp;</span><br><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 5=
2, 54); font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;">=
As usual, the conference is free of charge and open to the general</span><b=
r><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font=
-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;">public. If y=
ou plan on attending, please make sure to register as early</span><br><span=
 style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family=
: &quot;Source Code Pro&quot;; font-size: 13.333333px;">as possible!</span>=
<br><br><span style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54)=
; font-family: &quot;Source Code Pro&quot;; font-size: 13.333333px;">And do=
n't forget, you can follow us on Mastodon for all the latest</span><br><spa=
n style=3D"caret-color: rgb(46, 52, 54); color: rgb(46, 52, 54); font-famil=
y: &quot;Source Code Pro&quot;; font-size: 13.333333px;">updates and to sta=
y connected:</span><br><br><span style=3D"caret-color: rgb(46, 52, 54); col=
or: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quot;; font-size: 1=
3.333333px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><a href=3D"https://floss.social=
/@XOrgDevConf" title=3D"Click to open https://floss.social/@XOrgDevConf">ht=
tps://floss.social/@XOrgDevConf</a><br><br><span style=3D"caret-color: rgb(=
46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Source Code Pro&quo=
t;; font-size: 13.333333px;">Best,</span><br><br><span style=3D"caret-color=
: rgb(46, 52, 54); color: rgb(46, 52, 54); font-family: &quot;Source Code P=
ro&quot;; font-size: 13.333333px;">Mark</span></div><div><span></span></div=
></body></html>

--=-WqDGY9RWwpOdFvsqDill--
