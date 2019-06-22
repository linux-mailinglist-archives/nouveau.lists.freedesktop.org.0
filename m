Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF04F7C8
	for <lists+nouveau@lfdr.de>; Sat, 22 Jun 2019 20:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887D26E89E;
	Sat, 22 Jun 2019 18:17:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5F86E89E
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 18:17:02 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id a27so6880917qkk.5
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 11:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version;
 bh=mt0XEKZ9nwbZI/uhv7PiEZQAifQvUBa1erUlbGcYDAc=;
 b=nT+jOXpPF0G+x2bEP+V92S+HRreN0EP/9fas+o45dj+BhNb6xfdOdNQ+qDRQTvxxwJ
 6UQ41OEIbVtbWb24SYpOP/T3oKahs0+vl/cdtGsWBivUoP+hFGLrpLP322kJWPBLYyqN
 WrOOcmj1AdGehNoYkZIYzO/mN62mj/blAtFocza8nVRvyt3lwsrXeEuVZUx+dIqLPsyk
 FhUPyiqy67xuvAtHXlQOrMqBg0SV4UiPayyNrHrdcBdjPU0VLSzLP+Uf9qKxDMnMNux1
 Rw7aeujgI7Bnia7lkK4aCUXWT2CDDz9WuOmpNTYcQCxW1t/iMs3Bhav7NXps03tt5YYR
 bcQg==
X-Gm-Message-State: APjAAAUuOaREqu/anCZLkmNXJHQd5Yyr9oyoC6BAu47PlmAd7EABZ5ZI
 DNY6k2HwERUux4trVLary7npvw==
X-Google-Smtp-Source: APXvYqzTZLoEmOuH4lquEJkGxCCGMpx2NyZr7++tKFIdxDjVnf87IqZRyChBwZhJAdhJH4rHC+8uFg==
X-Received: by 2002:ae9:e306:: with SMTP id v6mr115753451qkf.145.1561227422060; 
 Sat, 22 Jun 2019 11:17:02 -0700 (PDT)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id z63sm2909223qkb.136.2019.06.22.11.17.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 11:17:01 -0700 (PDT)
Message-ID: <ce271f475953d1580c2fa8ffb561eca1b0426993.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, Mar Mel <marmel6942@yahoo.com>
Date: Sat, 22 Jun 2019 14:16:59 -0400
In-Reply-To: <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============0382902422=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


--===============0382902422==
Content-Type: multipart/alternative; boundary="=-3I0k6uJjPJvf8VRYJir6"


--=-3I0k6uJjPJvf8VRYJir6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi, is this actually an nv50 GPU, or some other model? I can try to take a
closer look at this
On Sun, 2019-06-16 at 10:28 -0400, Ilia Mirkin wrote:
> I don't really see anything between v5.0..v5.1 which would account for this.
> Could have been a subtle change to the i2c logic somewhere. The fastest way
> to identify the problem would be to do a bisect on the kernel to identify
> the commit that caused this. There are many guides for this online.
> 
> On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942@yahoo.com> wrote:
> >         Unfortunately, even with this change now reverted in kernel
> > 5.1.10, the fan speed issue persists.
> > If someone could point me in the direction of a relevant commit(s) I'll
> > happily file a bug report.
> > 
> >         
> >         
> > 
> >             
> >                 
> >                 
> >                     On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <
> > marmel6942@yahoo.com> wrote:
> >                 
> >                 
> > 
> >                 
> > 
> >                 As of kernel 5.1.9, on resume from suspend, my NV50 fan
> > runs at full speed. 
> > 
> > Not sure if it has to do with this new config option
> > (NOUVEAU_LEGACY_CTX_SUPPORT)?
> > 
> > This issue is not present using kernel 5.0.21.
> > 
> > Years ago I filed a similar issue:
> > 
> > 60704 – [nouveau, git regression] - I2C PWM fan control broken on nv50
> > adt7475 on kernels 3.3.x+
> > 
> > Thanks.
> > 
> > 
> > 60704 – [nouveau, git regression] - I2C PWM fan control broken on nv50
> > a...
> > 
> > 
> > 
> >             
> >         
> > _______________________________________________
> > 
> > Nouveau mailing list
> > 
> > Nouveau@lists.freedesktop.org
> > 
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> 
> _______________________________________________Nouveau mailing 
> listNouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
-- 
Cheers,
	Lyude Paul

--=-3I0k6uJjPJvf8VRYJir6
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>Hi, is this actually an nv50 GPU, or some other model? I can try t=
o take a closer look at this</div><div><br></div><div>On Sun, 2019-06-16 at=
 10:28 -0400, Ilia Mirkin wrote:</div><blockquote type=3D"cite" style=3D"ma=
rgin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=
=3D"ltr">I don't really see anything between v5.0..v5.1 which would account=
 for this. Could have been a subtle change to the i2c logic somewhere. The =
fastest way to identify the problem would be to do a bisect on the kernel t=
o identify the commit that caused this. There are many guides for this onli=
ne.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sat, Jun 15, 2019 at 12:17 PM Mar Mel &lt;<a href=3D"mailto:marmel694=
2@yahoo.com">marmel6942@yahoo.com</a>&gt; wrote:<br></div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div><div class=3D"gmail-m_6577269616604786429ydpb69c7536yahoo-s=
tyle-wrap" style=3D"font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,=
sans-serif;font-size:13px"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I'll happily file a bu=
g report.</div><div><br></div>
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
<pre>_______________________________________________</pre><pre>Nouveau mail=
ing list</pre><a href=3D"mailto:Nouveau@lists.freedesktop.org"><pre>Nouveau=
@lists.freedesktop.org</pre></a><pre><br></pre><a href=3D"https://lists.fre=
edesktop.org/mailman/listinfo/nouveau"><pre>https://lists.freedesktop.org/m=
ailman/listinfo/nouveau</pre></a></blockquote><div><span><pre>-- <br></pre>=
<div style=3D"width: 78ch;">Cheers,</div><div style=3D"width: 78ch;">	Lyude=
 Paul</div></span></div></body></html>

--=-3I0k6uJjPJvf8VRYJir6--


--===============0382902422==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0382902422==--

