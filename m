Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CB4F7C9
	for <lists+nouveau@lfdr.de>; Sat, 22 Jun 2019 20:19:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCE26E8AA;
	Sat, 22 Jun 2019 18:19:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982976E8AA
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 18:19:30 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id a186so5992463vsd.7
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 11:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qVksJeWQdo3RUiv1Iy72NzqWamMhJGfCPRA1+PcoD6M=;
 b=gN4GfppL+6EFvfUfCjmnNUmWs0wcpWGUZYmd/jVHvOsKC8XXLi7zHeUtZxdoQ+L9bs
 aNlGXtKQPRcoQTTZNgmfOnXt76nExWu3anfH7STFm1X5XJk9sgg/iwZIkU2CidzRkrWg
 DJAWMRBHOnR0cP5IjJk2kCETgwD1K2Vd6RwSudCd5K71N//bweL5xNw+x/wSPta/HPLK
 PFMiUATZcumnfRAMaqTeUdjEmKEjQuMSHDyBSDO4pC6IOyeT4fNE4XusNa4TMW8LRU9z
 6HZW8FKxrIElgrnbTF/0Mimbkwp8GSEgO2qhPLbTk1GfsyWbPGMjDXctjpErMIWOAq6s
 gugA==
X-Gm-Message-State: APjAAAX4rYXezZM0mo84LuezK2sEjATFgwEeeJrnl/3sI57yH3EZluQG
 V57u6FAnp05OAch3SNfj0dnrqbCbiVCRgPOnGiw=
X-Google-Smtp-Source: APXvYqxX4tpvUWQ8LXoyG9MLOGwwFNtJl5GVbDdc2FaGbXtrN5feoZFBMS9KtQYTpRnjkeNggycMNN0whkPixd30q4s=
X-Received: by 2002:a67:df8a:: with SMTP id x10mr8145992vsk.220.1561227569769; 
 Sat, 22 Jun 2019 11:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
 <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
In-Reply-To: <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 22 Jun 2019 14:19:18 -0400
Message-ID: <CAKb7UvhhSvF-RmvhVzrBeuf6S4m+pxzf_FPkRyocuXrNhLTuiw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Mar Mel <marmel6942@yahoo.com>
Content-Type: multipart/mixed; boundary="===============1604242021=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1604242021==
Content-Type: multipart/alternative; boundary="000000000000b5b062058bed9eb2"

--000000000000b5b062058bed9eb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mar - can you provide the output of

lspci -nn -d 10de:

On Sat, Jun 22, 2019 at 2:17 PM Lyude Paul <lyude@redhat.com> wrote:

> Hi, is this actually an nv50 GPU, or some other model? I can try to take =
a
> closer look at this
>
> On Sun, 2019-06-16 at 10:28 -0400, Ilia Mirkin wrote:
>
> I don't really see anything between v5.0..v5.1 which would account for
> this. Could have been a subtle change to the i2c logic somewhere. The
> fastest way to identify the problem would be to do a bisect on the kernel
> to identify the commit that caused this. There are many guides for this
> online.
>
> On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942@yahoo.com> wrote:
>
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
>
> _______________________________________________
>
> Nouveau mailing list
>
> Nouveau@lists.freedesktop.org
>
>
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
> --
>
> Cheers,
> Lyude Paul
>

--000000000000b5b062058bed9eb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Mar - can you provide the output of<div><br></div><div>lsp=
ci -nn -d 10de:</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, Jun 22, 2019 at 2:17 PM Lyude Paul &lt;<a href=
=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div style=3D"text-align:left;=
direction:ltr"><div>Hi, is this actually an nv50 GPU, or some other model? =
I can try to take a closer look at this</div><div><br></div><div>On Sun, 20=
19-06-16 at 10:28 -0400, Ilia Mirkin wrote:</div><blockquote type=3D"cite" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);pa=
dding-left:1ex"><div dir=3D"ltr">I don&#39;t really see anything between v5=
.0..v5.1 which would account for this. Could have been a subtle change to t=
he i2c logic somewhere. The fastest way to identify the problem would be to=
 do a bisect on the kernel to identify the commit that caused this. There a=
re many guides for this online.</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt=
;<a href=3D"mailto:marmel6942@yahoo.com" target=3D"_blank">marmel6942@yahoo=
.com</a>&gt; wrote:<br></div><blockquote type=3D"cite" style=3D"margin:0px =
0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left:1ex"><div=
><div class=3D"gmail-m_614245679332240585gmail-m_6577269616604786429ydpb69c=
7536yahoo-style-wrap" style=3D"font-family:&quot;Helvetica Neue&quot;,Helve=
tica,Arial,sans-serif;font-size:13px"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I&#39;ll happily file =
a bug report.</div><div><br></div>
       =20
        </div><div id=3D"gmail-m_614245679332240585gmail-m_6577269616604786=
429yahoo_quoted_0639155532" class=3D"gmail-m_614245679332240585gmail-m_6577=
269616604786429yahoo_quoted">
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
                <div><div id=3D"gmail-m_614245679332240585gmail-m_657726961=
6604786429yiv3381411794"><div><div class=3D"gmail-m_614245679332240585gmail=
-m_6577269616604786429yiv3381411794yahoo-style-wrap" style=3D"font-family:&=
quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:13px"><div>A=
s of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full speed. =
<br></div><div><br></div><div>Not sure if it has to do with this new config=
 option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><br></div><div><br></div>=
<div>This issue is not present using kernel 5.0.21.</div><div><br></div><di=
v>Years ago I filed a similar issue:<br></div><div><br></div><div><a rel=3D=
"nofollow" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" cl=
ass=3D"gmail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794en=
hancr_card_0655079240" target=3D"_blank">60704 =E2=80=93 [nouveau, git regr=
ession] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+</a><=
/div><div><br></div><div>Thanks.<br></div><div><br></div><div><br></div><di=
v id=3D"gmail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794y=
dp73b97a3aenhancr_card_0655079240" class=3D"gmail-m_614245679332240585gmail=
-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-card gmail=
-m_614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayah=
oo-link-enhancr-not-allow-cover gmail-m_614245679332240585gmail-m_657726961=
6604786429yiv3381411794ydp73b97a3aymail-preserve-class gmail-m_614245679332=
240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3aymail-preserve-sty=
le" style=3D"max-width:400px;font-family:Helvetica,Arial,sans-serif"><a rel=
=3D"nofollow" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704"=
 style=3D"text-decoration:none;color:rgb(0,0,0)" class=3D"gmail-m_614245679=
332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-enhancr-c=
ardlink" target=3D"_blank"><table class=3D"gmail-m_614245679332240585gmail-=
m_6577269616604786429yiv3381411794ydp73b97a3acard-wrapper gmail-m_614245679=
332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-ta=
ble" style=3D"max-width:400px" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr><td width=3D"400"><table class=3D"gmail-m_614245679332240=
585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard gmail-m_61424567=
9332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-t=
able" style=3D"max-width:400px;border-width:1px;border-style:solid;border-c=
olor:rgb(224,228,233);border-radius:2px" width=3D"100%" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0"><tbody><tr><td><table class=3D"gmail-m_614245=
679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-info gm=
ail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3a=
yahoo-ignore-table" style=3D"background-color:rgb(255,255,255);background-r=
epeat:repeat;background-image:none;background-size:auto;width:100%;max-widt=
h:400px;border-radius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233)=
" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"=
background-color:rgb(255,255,255);padding:16px 0px 16px 12px;vertical-align=
:top;border-radius:0px 0px 0px 2px"></td><td style=3D"vertical-align:middle=
;padding:12px 24px 16px 12px;width:99%;font-family:Helvetica,Arial,sans-ser=
if;border-radius:0px 0px 2px"><h2 class=3D"gmail-m_614245679332240585gmail-=
m_6577269616604786429yiv3381411794ydp73b97a3acard-title" style=3D"font-size=
:14px;line-height:19px;margin:0px 0px 6px;font-family:Helvetica,Arial,sans-=
serif;color:rgb(38,40,42)">60704 =E2=80=93 [nouveau, git regression] - I2C =
PWM fan control broken on nv50 a...</h2><p class=3D"gmail-m_614245679332240=
585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-description" sty=
le=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151,155,167)"></=
p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></t=
able></a></div><div><br></div><div><br></div></div></div></div></div>
            </div>
        </div></div>_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div>
<pre>_______________________________________________</pre><pre>Nouveau mail=
ing list</pre><a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_b=
lank"><pre>Nouveau@lists.freedesktop.org</pre></a><pre><br></pre><a href=3D=
"https://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D"_blank">=
<pre>https://lists.freedesktop.org/mailman/listinfo/nouveau</pre></a></bloc=
kquote><div><span><pre>-- <br></pre><div style=3D"width:78ch">Cheers,</div>=
<div style=3D"width:78ch">	Lyude Paul</div></span></div></div>
</blockquote></div>

--000000000000b5b062058bed9eb2--

--===============1604242021==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1604242021==--
