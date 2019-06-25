Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8AF5533C
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 17:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FBB66E13A;
	Tue, 25 Jun 2019 15:21:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDB6E13A
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 15:21:24 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 130so3535868vkn.9
 for <nouveau@lists.freedesktop.org>; Tue, 25 Jun 2019 08:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Jl2u38IfQ+MYMBLFq+/wIJSxEO2273zSidScAIdd6YQ=;
 b=grKZNMlyziDYwm+KzLJxGMMFE7xYw150L3m1fOiSeXUfhTB3X1xeGTDgvlzY9oXYk+
 +mYKXsxUC32Aa5m3v3xcaRH1YMlbVCjO3KdzYoYYtA0BQmRQcIcHTyeAKhIc1Se7JSGL
 94CTm1qNH0FpMENF52W6hQu7O1dBFpzRwCF2JIq71pQsOL0n7ZSen/EyL6i3in7m8sYW
 9YhmAnocl7ujzjsE4nP8Ni7HE/urODVS5vx79nm4yxFIILSUprWzGdULPvR0XGRvzIKi
 sck8Qc/17qI92DDK5lNxV79TkRZ7wZYwT9iZt4vagBwzIkf/dGKsLz5BO2lIDsltT91U
 Rfjw==
X-Gm-Message-State: APjAAAW1+6f7WcsecBQ2dhK1p0tkvywCkQjN5TQWCCqFJxIFNEaJT/ZM
 42CSB32rHvfI6h7Yt75VVsM+J0rLXQXpOcLYhEI=
X-Google-Smtp-Source: APXvYqzhc7jS6evBIYU+7YCJ7gvWaR6EDpVtyYG1ACCvuuCzYYzK/YwlWyjRaX/bvuKZNAgEU5F2oYACJ1kYj/0dsRA=
X-Received: by 2002:a1f:2fca:: with SMTP id v193mr47040206vkv.14.1561476083307; 
 Tue, 25 Jun 2019 08:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
 <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
 <CAKb7UvhhSvF-RmvhVzrBeuf6S4m+pxzf_FPkRyocuXrNhLTuiw@mail.gmail.com>
 <2050407925.625695.1561264488082@mail.yahoo.com>
In-Reply-To: <2050407925.625695.1561264488082@mail.yahoo.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 25 Jun 2019 11:21:12 -0400
Message-ID: <CAKb7UvjrFu1h4rHx7X3WfA2Rr3-89xfbsZQ8BvsNbHmUy=1pFw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0839007432=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============0839007432==
Content-Type: multipart/alternative; boundary="0000000000004559ea058c277b59"

--0000000000004559ea058c277b59
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mar,

Could you file a bug (bugs.freedesktop.org under xorg -> Driver/nouveau)
with a summary of this info (i.e. a problem statement, that reverting the
commit in question fixes it, the lspci output) and additionally, your
VBIOS. You can obtain this with nouveau loaded by doing

cp /sys/kernel/debug/dri/0/vbios.rom /tmp

This will help centralize all the info.

Thanks,

  -ilia

On Sun, Jun 23, 2019 at 12:34 AM Mar Mel <marmel6942@yahoo.com> wrote:

> Sure:
>
> $ lspci -nn -d 10de:
> 01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200
> [GeForce GTX 260] [10de:05e2] (rev a1)
>
>
> On Saturday, June 22, 2019, 2:19:31 PM EDT, Ilia Mirkin <
> imirkin@alum.mit.edu> wrote:
>
>
> Mar - can you provide the output of
>
> lspci -nn -d 10de:
>
> On Sat, Jun 22, 2019 at 2:17 PM Lyude Paul <lyude@redhat.com> wrote:
>
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
>

--0000000000004559ea058c277b59
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Mar,<div><br></div><div>Could you file a bug (<a href=
=3D"http://bugs.freedesktop.org">bugs.freedesktop.org</a> under xorg -&gt; =
Driver/nouveau) with a summary of this info (i.e. a problem statement, that=
 reverting the commit in question fixes it, the lspci output) and additiona=
lly, your VBIOS. You can obtain this with nouveau loaded by doing</div><div=
><br></div><div>cp /sys/kernel/debug/dri/0/vbios.rom /tmp</div><div><br></d=
iv><div>This will help centralize all the info.</div><div><br></div><div>Th=
anks,</div><div><br></div><div>=C2=A0 -ilia</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 23, 2019 at 12=
:34 AM Mar Mel &lt;<a href=3D"mailto:marmel6942@yahoo.com">marmel6942@yahoo=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div><div class=3D"gmail-m_-7030857759207306626ydpb82cc8f1yahoo-style-w=
rap" style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-s=
erif;font-size:13px"><div></div>
        <div>Sure:</div><div><br></div><div><div>$ lspci -nn -d 10de:<br>01=
:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT200 [GeForce G=
TX 260] [10de:05e2] (rev a1)</div><br></div><div><br></div>
       =20
        </div><div id=3D"gmail-m_-7030857759207306626yahoo_quoted_177324533=
9" class=3D"gmail-m_-7030857759207306626yahoo_quoted">
            <div style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px;color:rgb(38,40,42)">
               =20
                <div>
                    On Saturday, June 22, 2019, 2:19:31 PM EDT, Ilia Mirkin=
 &lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=3D"_blank">imirkin@alum=
.mit.edu</a>&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"gmail-m_-7030857759207306626yiv0375592993">=
<div><div dir=3D"ltr">Mar - can you provide the output of<div><br clear=3D"=
none"></div><div>lspci -nn -d 10de:</div></div><br clear=3D"none"><div clas=
s=3D"gmail-m_-7030857759207306626yiv0375592993yqt1925052404" id=3D"gmail-m_=
-7030857759207306626yiv0375592993yqt50702"><div class=3D"gmail-m_-703085775=
9207306626yiv0375592993gmail_quote"><div class=3D"gmail-m_-7030857759207306=
626yiv0375592993gmail_attr" dir=3D"ltr">On Sat, Jun 22, 2019 at 2:17 PM Lyu=
de Paul &lt;<a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:lyude@redhat.=
com" target=3D"_blank">lyude@redhat.com</a>&gt; wrote:<br clear=3D"none"></=
div><blockquote class=3D"gmail-m_-7030857759207306626yiv0375592993gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div style=3D"text-align:left;direction:ltr"><div>Hi, i=
s this actually an nv50 GPU, or some other model? I can try to take a close=
r look at this</div><div><br clear=3D"none"></div><div>On Sun, 2019-06-16 a=
t 10:28 -0400, Ilia Mirkin wrote:</div><blockquote type=3D"cite" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:2px solid rgb(114,159,207);padding-left=
:1ex"><div dir=3D"ltr">I don&#39;t really see anything between v5.0..v5.1 w=
hich would account for this. Could have been a subtle change to the i2c log=
ic somewhere. The fastest way to identify the problem would be to do a bise=
ct on the kernel to identify the commit that caused this. There are many gu=
ides for this online.</div><br clear=3D"none"><div class=3D"gmail-m_-703085=
7759207306626yiv0375592993gmail_quote"><div class=3D"gmail-m_-7030857759207=
306626yiv0375592993gmail_attr" dir=3D"ltr">On Sat, Jun 15, 2019 at 12:17 PM=
 Mar Mel &lt;<a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:marmel6942@y=
ahoo.com" target=3D"_blank">marmel6942@yahoo.com</a>&gt; wrote:<br clear=3D=
"none"></div><blockquote type=3D"cite" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:2px solid rgb(114,159,207);padding-left:1ex"><div><div class=3D"g=
mail-m_-7030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_6=
577269616604786429ydpb69c7536yahoo-style-wrap"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br clear=3D"none"></div><div=
>If someone could point me in the direction of a relevant commit(s) I&#39;l=
l happily file a bug report.</div><div><br clear=3D"none"></div>
       =20
        </div><div class=3D"gmail-m_-7030857759207306626yiv0375592993gmail-=
m_614245679332240585gmail-m_6577269616604786429yahoo_quoted" id=3D"gmail-m_=
-7030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_65772696=
16604786429yahoo_quoted_0639155532">
            <div>
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:marmel6942@yahoo.com" t=
arget=3D"_blank">marmel6942@yahoo.com</a>&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div id=3D"gmail-m_-7030857759207306626yiv0375592993gm=
ail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794"><div><div=
 class=3D"gmail-m_-7030857759207306626yiv0375592993gmail-m_6142456793322405=
85gmail-m_6577269616604786429yiv3381411794yahoo-style-wrap"><div>As of kern=
el 5.1.9, on resume from suspend, my NV50 fan runs at full speed. <br clear=
=3D"none"></div><div><br clear=3D"none"></div><div>Not sure if it has to do=
 with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><br =
clear=3D"none"></div><div><br clear=3D"none"></div><div>This issue is not p=
resent using kernel 5.0.21.</div><div><br clear=3D"none"></div><div>Years a=
go I filed a similar issue:<br clear=3D"none"></div><div><br clear=3D"none"=
></div><div><a rel=3D"nofollow" shape=3D"rect" class=3D"gmail-m_-7030857759=
207306626yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429=
yiv3381411794enhancr_card_0655079240" href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D60704" target=3D"_blank">60704 =E2=80=93 [nouveau, git re=
gression] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+</a=
></div><div><br clear=3D"none"></div><div>Thanks.<br clear=3D"none"></div><=
div><br clear=3D"none"></div><div><br clear=3D"none"></div><div class=3D"gm=
ail-m_-7030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_65=
77269616604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-card gmail-m_-7=
030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_6577269616=
604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-not-allow-cover gmail-m=
_-7030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_6577269=
616604786429yiv3381411794ydp73b97a3aymail-preserve-class gmail-m_-703085775=
9207306626yiv0375592993gmail-m_614245679332240585gmail-m_657726961660478642=
9yiv3381411794ydp73b97a3aymail-preserve-style" id=3D"gmail-m_-7030857759207=
306626yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429yiv=
3381411794ydp73b97a3aenhancr_card_0655079240" style=3D"max-width:400px;font=
-family:Helvetica,Arial,sans-serif"><a rel=3D"nofollow" shape=3D"rect" clas=
s=3D"gmail-m_-7030857759207306626yiv0375592993gmail-m_614245679332240585gma=
il-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" style=3D"text-de=
coration:none;color:rgb(0,0,0)" target=3D"_blank"><table class=3D"gmail-m_-=
7030857759207306626yiv0375592993gmail-m_614245679332240585gmail-m_657726961=
6604786429yiv3381411794ydp73b97a3acard-wrapper gmail-m_-7030857759207306626=
yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429yiv338141=
1794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px" cellspacing=3D=
"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" rowspan=3D"=
1" width=3D"400"><table class=3D"gmail-m_-7030857759207306626yiv0375592993g=
mail-m_614245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3=
acard gmail-m_-7030857759207306626yiv0375592993gmail-m_614245679332240585gm=
ail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-table" style=
=3D"max-width:400px;border-width:1px;border-style:solid;border-color:rgb(22=
4,228,233);border-radius:2px" width=3D"100%" cellspacing=3D"0" cellpadding=
=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" rowspan=3D"1"><table class=
=3D"gmail-m_-7030857759207306626yiv0375592993gmail-m_614245679332240585gmai=
l-m_6577269616604786429yiv3381411794ydp73b97a3acard-info gmail-m_-703085775=
9207306626yiv0375592993gmail-m_614245679332240585gmail-m_657726961660478642=
9yiv3381411794ydp73b97a3ayahoo-ignore-table" style=3D"background-color:rgb(=
255,255,255);background-repeat:repeat;background-image:none;background-size=
:auto;width:100%;max-width:400px;border-radius:0px 0px 2px 2px;border-top:1=
px solid rgb(224,228,233)" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"=
><tbody><tr><td colspan=3D"1" rowspan=3D"1" style=3D"background-color:rgb(2=
55,255,255);padding:16px 0px 16px 12px;vertical-align:top;border-radius:0px=
 0px 0px 2px"></td><td colspan=3D"1" rowspan=3D"1" style=3D"vertical-align:=
middle;padding:12px 24px 16px 12px;width:99%;font-family:Helvetica,Arial,sa=
ns-serif;border-radius:0px 0px 2px"><h2 class=3D"gmail-m_-70308577592073066=
26yiv0375592993gmail-m_614245679332240585gmail-m_6577269616604786429yiv3381=
411794ydp73b97a3acard-title" style=3D"font-size:14px;line-height:19px;margi=
n:0px 0px 6px;font-family:Helvetica,Arial,sans-serif;color:rgb(38,40,42)">6=
0704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on nv=
50 a...</h2><p class=3D"gmail-m_-7030857759207306626yiv0375592993gmail-m_61=
4245679332240585gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-des=
cription" style=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151=
,155,167)"></p></td></tr></tbody></table></td></tr></tbody></table></td></t=
r></tbody></table></a></div><div><br clear=3D"none"></div><div><br clear=3D=
"none"></div></div></div></div></div>
            </div>
        </div></div>_______________________________________________<br clea=
r=3D"none">
Nouveau mailing list<br clear=3D"none">
<a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:Nouveau@lists.freedesktop=
.org" target=3D"_blank">Nouveau@lists.freedesktop.org</a><br clear=3D"none"=
>
<a rel=3D"nofollow" shape=3D"rect" href=3D"https://lists.freedesktop.org/ma=
ilman/listinfo/nouveau" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></blockquote></div>
<pre>_______________________________________________</pre><pre>Nouveau mail=
ing list</pre><a rel=3D"nofollow" shape=3D"rect" href=3D"mailto:Nouveau@lis=
ts.freedesktop.org" target=3D"_blank"><pre>Nouveau@lists.freedesktop.org</p=
re></a><pre><br clear=3D"none"></pre><a rel=3D"nofollow" shape=3D"rect" hre=
f=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D"_bla=
nk"><pre>https://lists.freedesktop.org/mailman/listinfo/nouveau</pre></a></=
blockquote><div><span></span><pre>-- <br clear=3D"none"></pre><div>Cheers,<=
/div><div>	Lyude Paul</div></div></div>
</blockquote></div></div></div></div></div>
            </div>
        </div></div></blockquote></div>

--0000000000004559ea058c277b59--

--===============0839007432==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0839007432==--
