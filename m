Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B2B4EDDC
	for <lists+nouveau@lfdr.de>; Fri, 21 Jun 2019 19:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ED466E905;
	Fri, 21 Jun 2019 17:32:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C0B6E905
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jun 2019 17:32:19 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id v129so4345735vsb.11
 for <nouveau@lists.freedesktop.org>; Fri, 21 Jun 2019 10:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rO8H/5HnIJZMc9HrwA1SnlIpFq5/kLzBLAKE3T6sCAU=;
 b=XVPaJ6/ihIrUz3YjBpXzgaI314pFE2MJIOKRwvZ/ESp/1riaEBW7SqRZVPfQqsnVNf
 F4i6BPOwBnB+Y8LEnh2YaLLfJ2VYmlAa/4yW8UhETQncrpJ46Hd4rOv7BznFqtNWXIgS
 WZPeDiaWHLkHdiYiXlrxJWtSTgg5erI/jVGS3jAras6D/U/kW3CQoB9IGrUtxwIjQexT
 IVNejnkuzy8vTapAnRCw8YJZGIpZ94cid+i2l7JuwFSxIlXz1e20lQfdXxNEQ+CwjRtA
 Z8dIUrtwCDJx1PdpCf1x6Q4VFPPr1HF+C77WRaRkMqYvGg6dk+gsgJSmhXYebhS2lkbi
 BZfg==
X-Gm-Message-State: APjAAAV1nTJ6jCfOKhTCQNr/d30NSmvOKTwaT8JisRljBWC1bIAUmXE+
 0awasyM6x4QwxGe/84jsL7yc73N/VDV2nQZpXnQ=
X-Google-Smtp-Source: APXvYqxPi99qpsjj+Z5GRu//yNF5287Y/fkY7JlmuuCzrNgL0H8WQxXassjupF0aiMXfVWiT0eJjqlq9KrMwpuJivkU=
X-Received: by 2002:a67:ee12:: with SMTP id f18mr13849876vsp.186.1561138338837; 
 Fri, 21 Jun 2019 10:32:18 -0700 (PDT)
MIME-Version: 1.0
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
In-Reply-To: <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Jun 2019 18:30:01 +0100
Message-ID: <CACvgo518KhG9LFBFqFnRSDXtwhbM5Oc6PHY_vNtLSLiSemJeiA@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=rO8H/5HnIJZMc9HrwA1SnlIpFq5/kLzBLAKE3T6sCAU=;
 b=ZwyGbSW6Rf8KW9WaQ43vRLgH7DETULGGxezK4LZNzLIEECVJ7OKPnswZIu6dbks/F2
 8v3o5UjRSsOac4r9gjMO159Ehgf5LKkP3QTGslMHXaUWgS+9C/IFYrVp57F+hB0R8i9H
 2W1Ccj32UptzysIovDg81HEwlzIuXzlsCK52moqRD5bkkcyvUj41dIU1yHaoz+bPJJHX
 Ll1pKKbMcIj3C1rqXgo+yjfDvj/LgKOdfHhe0pqZW64DD+GdkSvsMrJ9liAY32Spib8S
 bsOgGIEhieDs99s6Boa37ZtBTXXjvaCjolehYIy9rx97x6BTyqXZyuiwUCEm64EHrwE3
 YNNg==
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
Content-Type: multipart/mixed; boundary="===============1681126554=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1681126554==
Content-Type: multipart/alternative; boundary="00000000000021bc61058bd8d888"

--00000000000021bc61058bd8d888
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Some weird interaction with disabling the i2c access, in the following
patch perhaps?

commit cd68344b283174a9b38e9488d5a929464e1f417c
Author: Lyude Paul <lyude@redhat.com>
Date:   Tue Apr 9 16:23:30 2019 -0400

    drm/nouveau/i2c: Disable i2c bus access after ->fini()

On Sun, 16 Jun 2019 at 15:28, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> I don't really see anything between v5.0..v5.1 which would account for
> this. Could have been a subtle change to the i2c logic somewhere. The
> fastest way to identify the problem would be to do a bisect on the kernel
> to identify the commit that caused this. There are many guides for this
> online.
>
> On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942@yahoo.com> wrote:
>
>> Unfortunately, even with this change now reverted in kernel 5.1.10, the
>> fan speed issue persists.
>>
>> If someone could point me in the direction of a relevant commit(s) I'll
>> happily file a bug report.
>>
>> On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <
>> marmel6942@yahoo.com> wrote:
>>
>>
>> As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full
>> speed.
>>
>> Not sure if it has to do with this new config option (
>> NOUVEAU_LEGACY_CTX_SUPPORT)?
>>
>> This issue is not present using kernel 5.0.21.
>>
>> Years ago I filed a similar issue:
>>
>> 60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken o=
n nv50
>> adt7475 on kernels 3.3.x+
>> <https://bugs.freedesktop.org/show_bug.cgi?id=3D60704>
>>
>> Thanks.
>>
>>
>> 60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken o=
n nv50
>> a...
>>
>> <https://bugs.freedesktop.org/show_bug.cgi?id=3D60704>
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--00000000000021bc61058bd8d888
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Some weird interaction with disabling the i2c access,=
 in the following patch perhaps?</div><div dir=3D"ltr"><br></div><div dir=
=3D"ltr">commit cd68344b283174a9b38e9488d5a929464e1f417c<br>Author: Lyude P=
aul &lt;<a href=3D"mailto:lyude@redhat.com">lyude@redhat.com</a>&gt;<br>Dat=
e: =C2=A0 Tue Apr 9 16:23:30 2019 -0400<br><br>=C2=A0 =C2=A0 drm/nouveau/i2=
c: Disable i2c bus access after -&gt;fini()<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, 16 Jun 2019 at 15:28=
, Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.=
edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr">I don&#39;t really see anything between v5.0..v5.1 whic=
h would account for this. Could have been a subtle change to the i2c logic =
somewhere. The fastest way to identify the problem would be to do a bisect =
on the kernel to identify the commit that caused this. There are many guide=
s for this online.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt;<a href=3D"m=
ailto:marmel6942@yahoo.com" target=3D"_blank">marmel6942@yahoo.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div=
 class=3D"gmail-m_425674517675831047gmail-m_6577269616604786429ydpb69c7536y=
ahoo-style-wrap" style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,=
Arial,sans-serif;font-size:13px"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I&#39;ll happily file =
a bug report.</div><div><br></div>
       =20
        </div><div id=3D"gmail-m_425674517675831047gmail-m_6577269616604786=
429yahoo_quoted_0639155532" class=3D"gmail-m_425674517675831047gmail-m_6577=
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
                <div><div id=3D"gmail-m_425674517675831047gmail-m_657726961=
6604786429yiv3381411794"><div><div class=3D"gmail-m_425674517675831047gmail=
-m_6577269616604786429yiv3381411794yahoo-style-wrap" style=3D"font-family:&=
quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:13px"><div>A=
s of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full speed. =
<br></div><div><br></div><div>Not sure if it has to do with this new config=
 option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?</span><br></div><div><br></div>=
<div>This issue is not present using kernel 5.0.21.</div><div><br></div><di=
v>Years ago I filed a similar issue:<br></div><div><br></div><div><a rel=3D=
"nofollow" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" cl=
ass=3D"gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794en=
hancr_card_0655079240" target=3D"_blank">60704 =E2=80=93 [nouveau, git regr=
ession] - I2C PWM fan control broken on nv50 adt7475 on kernels 3.3.x+</a><=
/div><div><br></div><div>Thanks.<br></div><div><br></div><div><br></div><di=
v id=3D"gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794y=
dp73b97a3aenhancr_card_0655079240" class=3D"gmail-m_425674517675831047gmail=
-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-link-enhancr-card gmail=
-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayah=
oo-link-enhancr-not-allow-cover gmail-m_425674517675831047gmail-m_657726961=
6604786429yiv3381411794ydp73b97a3aymail-preserve-class gmail-m_425674517675=
831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3aymail-preserve-sty=
le" style=3D"max-width:400px;font-family:Helvetica,Arial,sans-serif"><a rel=
=3D"nofollow" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704"=
 style=3D"text-decoration:none;color:rgb(0,0,0)" class=3D"gmail-m_425674517=
675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-enhancr-c=
ardlink" target=3D"_blank"><table class=3D"gmail-m_425674517675831047gmail-=
m_6577269616604786429yiv3381411794ydp73b97a3acard-wrapper gmail-m_425674517=
675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-ta=
ble" style=3D"max-width:400px" cellspacing=3D"0" cellpadding=3D"0" border=
=3D"0"><tbody><tr><td width=3D"400"><table class=3D"gmail-m_425674517675831=
047gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard gmail-m_42567451=
7675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-t=
able" style=3D"max-width:400px;border-width:1px;border-style:solid;border-c=
olor:rgb(224,228,233);border-radius:2px" width=3D"100%" cellspacing=3D"0" c=
ellpadding=3D"0" border=3D"0"><tbody><tr><td><table class=3D"gmail-m_425674=
517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-info gm=
ail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3a=
yahoo-ignore-table" style=3D"background-color:rgb(255,255,255);background-r=
epeat:repeat;background-image:none;background-size:auto;width:100%;max-widt=
h:400px;border-radius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233)=
" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"=
background-color:rgb(255,255,255);padding:16px 0px 16px 12px;vertical-align=
:top;border-radius:0px 0px 0px 2px"></td><td style=3D"vertical-align:middle=
;padding:12px 24px 16px 12px;width:99%;font-family:Helvetica,Arial,sans-ser=
if;border-radius:0px 0px 2px"><h2 class=3D"gmail-m_425674517675831047gmail-=
m_6577269616604786429yiv3381411794ydp73b97a3acard-title" style=3D"font-size=
:14px;line-height:19px;margin:0px 0px 6px;font-family:Helvetica,Arial,sans-=
serif;color:rgb(38,40,42)">60704 =E2=80=93 [nouveau, git regression] - I2C =
PWM fan control broken on nv50 a...</h2><p class=3D"gmail-m_425674517675831=
047gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-description" sty=
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
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau@lists.freedesktop.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div></div>

--00000000000021bc61058bd8d888--

--===============1681126554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1681126554==--
