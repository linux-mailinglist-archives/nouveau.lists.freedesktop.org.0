Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D07F4752F
	for <lists+nouveau@lfdr.de>; Sun, 16 Jun 2019 16:28:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F04B8922F;
	Sun, 16 Jun 2019 14:28:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271D48922F
 for <nouveau@lists.freedesktop.org>; Sun, 16 Jun 2019 14:28:52 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 190so4598691vsf.9
 for <nouveau@lists.freedesktop.org>; Sun, 16 Jun 2019 07:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tExAt2ChiWZgBKH1K+SFdW/fTieCzIYiYynSCa/uJhM=;
 b=ZliplZi3cZj6Zfn3FTv/CSiPFCVM7kBk20eO32QY4MO/YxvVb7q98E+M79jLsZ7LAZ
 m2xWbHOmuGpTyLWl8FZXAISoqy1N2BGoP/2K7rdiCFmKDN9jfIp1fmXnXAqxV6GLg35J
 bA6/t7jv8Xh9kRW6zVSFE1bUD4iIerWhh65Qxcsow40iuMdnCgJuLDlU24yn2bjsw4ic
 m6grGf3orp5eSZpYNSbmFjsgd/ircL8FOcaP+HAOp2bia92eRc4wKCu97/PSsF3Zz5VH
 xTraaXK1XFQQu9Hnl1u2ct/PNu8E9DFJ0/CoGS00BqrTtvk6VQzJkjFpwO86dqRNBGuU
 N9Hw==
X-Gm-Message-State: APjAAAWu4jMnerUHdqDFfMkVLhxMJr5UQvyvPkA01rgo8C3q8w7Swyti
 /nxoO4t8JJmq2f5UK4Ob4/B4xzcjvIgQDpvHAY0=
X-Google-Smtp-Source: APXvYqwM9Nq+sbVnHVqjyXgHOHlpbSMUAA2A7xEcD5/sLBUNxhxtWpT4gzTB+RQ+/a8gSdQQ4wsdOSrqhOYkHIdJTyA=
X-Received: by 2002:a67:ecd4:: with SMTP id i20mr29578869vsp.210.1560695331267; 
 Sun, 16 Jun 2019 07:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
In-Reply-To: <495587496.1966749.1560615436420@mail.yahoo.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sun, 16 Jun 2019 10:28:40 -0400
Message-ID: <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
To: Mar Mel <marmel6942@yahoo.com>
Subject: Re: [Nouveau] NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
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
Content-Type: multipart/mixed; boundary="===============0598138817=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0598138817==
Content-Type: multipart/alternative; boundary="000000000000d2aa9f058b71b276"

--000000000000d2aa9f058b71b276
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't really see anything between v5.0..v5.1 which would account for
this. Could have been a subtle change to the i2c logic somewhere. The
fastest way to identify the problem would be to do a bisect on the kernel
to identify the commit that caused this. There are many guides for this
online.

On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942@yahoo.com> wrote:

> Unfortunately, even with this change now reverted in kernel 5.1.10, the
> fan speed issue persists.
>
> If someone could point me in the direction of a relevant commit(s) I'll
> happily file a bug report.
>
> On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <marmel6942@yahoo.co=
m>
> wrote:
>
>
> As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full
> speed.
>
> Not sure if it has to do with this new config option (
> NOUVEAU_LEGACY_CTX_SUPPORT)?
>
> This issue is not present using kernel 5.0.21.
>
> Years ago I filed a similar issue:
>
> 60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on=
 nv50
> adt7475 on kernels 3.3.x+
> <https://bugs.freedesktop.org/show_bug.cgi?id=3D60704>
>
> Thanks.
>
>
> 60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on=
 nv50 a...
>
> <https://bugs.freedesktop.org/show_bug.cgi?id=3D60704>
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--000000000000d2aa9f058b71b276
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t really see anything between v5.0..v5.1 which w=
ould account for this. Could have been a subtle change to the i2c logic som=
ewhere. The fastest way to identify the problem would be to do a bisect on =
the kernel to identify the commit that caused this. There are many guides f=
or this online.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt;<a href=3D"mai=
lto:marmel6942@yahoo.com">marmel6942@yahoo.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail-m_65=
77269616604786429ydpb69c7536yahoo-style-wrap" style=3D"font-family:&quot;He=
lvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:13px"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I&#39;ll happily file =
a bug report.</div><div><br></div>
       =20
        </div><div id=3D"gmail-m_6577269616604786429yahoo_quoted_0639155532=
" class=3D"gmail-m_6577269616604786429yahoo_quoted">
            <div style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px;color:rgb(38,40,42)">
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a href=3D"mailto:marmel6942@yahoo.com" target=3D"_blank">marmel6942@yaho=
o.com</a>&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"gmail-m_6577269616604786429yiv3381411794"><=
div><div class=3D"gmail-m_6577269616604786429yiv3381411794yahoo-style-wrap"=
 style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif=
;font-size:13px"><div>As of kernel 5.1.9, on resume from suspend, my NV50 f=
an runs at full speed. <br></div><div><br></div><div>Not sure if it has to =
do with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><b=
r></div><div><br></div><div>This issue is not present using kernel 5.0.21.<=
/div><div><br></div><div>Years ago I filed a similar issue:<br></div><div><=
br></div><div><a rel=3D"nofollow" href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D60704" class=3D"gmail-m_6577269616604786429yiv3381411794enhan=
cr_card_0655079240" target=3D"_blank">60704 =E2=80=93 [nouveau, git regress=
ion] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+</a></di=
v><div><br></div><div>Thanks.<br></div><div><br></div><div><br></div><div i=
d=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3aenhancr_card_065507=
9240" class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-lin=
k-enhancr-card gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-lin=
k-enhancr-not-allow-cover gmail-m_6577269616604786429yiv3381411794ydp73b97a=
3aymail-preserve-class gmail-m_6577269616604786429yiv3381411794ydp73b97a3ay=
mail-preserve-style" style=3D"max-width:400px;font-family:Helvetica,Arial,s=
ans-serif"><a rel=3D"nofollow" href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D60704" style=3D"text-decoration:none;color:rgb(0,0,0)" class=3D"=
gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" =
target=3D"_blank"><table class=3D"gmail-m_6577269616604786429yiv3381411794y=
dp73b97a3acard-wrapper gmail-m_6577269616604786429yiv3381411794ydp73b97a3ay=
ahoo-ignore-table" style=3D"max-width:400px" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"><tbody><tr><td width=3D"400"><table class=3D"gmail-m_65=
77269616604786429yiv3381411794ydp73b97a3acard gmail-m_6577269616604786429yi=
v3381411794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;border-w=
idth:1px;border-style:solid;border-color:rgb(224,228,233);border-radius:2px=
" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><t=
r><td><table class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3aca=
rd-info gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-tab=
le" style=3D"background-color:rgb(255,255,255);background-repeat:repeat;bac=
kground-image:none;background-size:auto;width:100%;max-width:400px;border-r=
adius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233)" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"background-color=
:rgb(255,255,255);padding:16px 0px 16px 12px;vertical-align:top;border-radi=
us:0px 0px 0px 2px"></td><td style=3D"vertical-align:middle;padding:12px 24=
px 16px 12px;width:99%;font-family:Helvetica,Arial,sans-serif;border-radius=
:0px 0px 2px"><h2 class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97=
a3acard-title" style=3D"font-size:14px;line-height:19px;margin:0px 0px 6px;=
font-family:Helvetica,Arial,sans-serif;color:rgb(38,40,42)">60704 =E2=80=93=
 [nouveau, git regression] - I2C PWM fan control broken on nv50 a...</h2><p=
 class=3D"gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-descripti=
on" style=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151,155,1=
67)"></p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tb=
ody></table></a></div><div><br></div><div><br></div></div></div></div></div=
>
            </div>
        </div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div>

--000000000000d2aa9f058b71b276--

--===============0598138817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0598138817==--
