Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC624F5C2
	for <lists+nouveau@lfdr.de>; Sat, 22 Jun 2019 14:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C4B6E971;
	Sat, 22 Jun 2019 12:37:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic313-56.consmr.mail.ne1.yahoo.com
 (sonic313-56.consmr.mail.ne1.yahoo.com [66.163.185.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E286E971
 for <nouveau@lists.freedesktop.org>; Sat, 22 Jun 2019 12:37:59 +0000 (UTC)
X-YMail-OSG: E4yQ40wVM1kucdJysyvhDt54xnPizHmoutok3yOAR0cIddeUmV77hPCKJ9Fxw1E
 JU4W6cqY3lnYVK9eNgT0sOeI2ahSyvY4wYxtebK91cxGsR9aCUxD8W2L7Eoc3JFyrGLg541T9Keq
 riwwcTupLfMpRg1ht8j352Qh.aM_43kqdKqDwdBxMXY3v3ZpjUCFZx5p1C7Pw3xBqE3RAplKsr7Z
 5.X8zeic52xAjBVEpAMCtw3P3Uu0jIy1vnAlTexi5DDL6YH54JSmv5aU1f2jbEfETdz7wTjRSmq5
 ghRpXECVCBTj4MkErCBYegOlgjQf4OZTHTgaGJRhtUsYvDdStxFK_tq9U6QvMO7jqN1lskqfOqm5
 eVITjRse.F4woef2aSMijsln6pni2ysCOd.R4Z0iO.UCWtDWp10xrfTvBLVa74nl9zLhho.SzDwj
 3AqYb3IVPVdQq6KutVi_pWTXmDGeqgzz40hKxwVeIAm0Omm6lEysdpE2bPHjvAaSF0j2FsFuJiJB
 bvrG0gtSdNCtCH88DjkxITLp26r4LZI4LsvXrQDfjFOOIdUxEkkOHVmMb9yRiJIr6UGXHxTMOxF8
 yXBxa8KcDgewIyYXL0xwX112MjI6ONT8gvfKAMhhORG7NoSd5.3du5aOh6bM5pAJQnA3PogxCsm7
 PxmaUIwxooIeV5e.dkU7YXPSOGLZD79KNDdM7Z7VqO3.BpBbfmkK43y629a89rluAxq9omSiMgye
 SouGconTFBb6qY99UHBhkADxQZvnifu1ZcfAWYbKl4LRfTLI5kDV1AgTfyBsc8qjWH4hchd_Z5a.
 Ia.m10XPCaObLptXpEQirKRIuBx9rOx0_5HRHIDup4BpaxNFc5HgVWJ_vNEEXT8nwWvnVyzUe9AT
 1V_Y.T5nrM9YFRAwoSGEQJ7VI0LM6CBFdIKRSA9E7K4DDfWJPQnAD_CY6gWUSAj.4LMSSBhNIeYS
 2ejkFv5SeMVz8qcU49viLQzoTdL97UUCGAMkk8.uF1WYw7gH.QiIWXgENW9DA9EFDJ3kqWBxB0Fe
 kvKe5qVwcFNjklLQJP9EO9oA7BQcSOH7CEGfzmQ95zUAVuQSla.JSljemDs_qQtMGqLLo0CjSQUa
 zuVGIaC8OuFAAcOWl.hb36Rap4S5ouFrUoBTZqztcA4zMJghNCDLFUjErz6KxrxOQgoltGNkJVlz
 t_QEzsCaT5y8VL6BpYCzhrBieJy1aV8vuwFNQYDe.mcv7dgaLbXCAWqbGfRiy72fMDg--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Sat, 22 Jun 2019 12:37:57 +0000
Date: Sat, 22 Jun 2019 12:37:52 +0000 (UTC)
From: Mar Mel <marmel6942@yahoo.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>, 
 Emil Velikov <emil.l.velikov@gmail.com>
Message-ID: <1145494713.437238.1561207073010@mail.yahoo.com>
In-Reply-To: <2129174013.254112.1561148899599@mail.yahoo.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
 <495587496.1966749.1560615436420@mail.yahoo.com>
 <CAKb7UvhZYDRteWUmy0QUT1p5Tk+i_Ky0bFJU23pJSG7LHKLQYg@mail.gmail.com>
 <CACvgo518KhG9LFBFqFnRSDXtwhbM5Oc6PHY_vNtLSLiSemJeiA@mail.gmail.com>
 <2129174013.254112.1561148899599@mail.yahoo.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.13837 YMailNorrin Mozilla/5.0 (X11; Linux x86_64;
 rv:67.0) Gecko/20100101 Firefox/67.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1561207077;
 bh=Lqde3bZh+5igbGM1ykVtGuXXVdymd3PFNBAmdWnHNc0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject;
 b=modZijFPX+6LTPaxQWJfAdF0ZDWc6xyaph0Eo4n1hKwiLPyaMpX0DSuhWePlXNkprNDVAuEW6Gfy/b0HWFrr+m/pZBHPZ/twCePNyRtfvQ1OXwlJED3mfWFDhlHNlXG9BIpQCXFtUcmfJJm1pzaJwlpHdkZNdJB/G7f5zBbaHjOCwSIsrkODWGaxgkBGRmlpHv8xS4M1mzyO0zn9egPByfZRP7YD3KkvOqaiO3YMWCB1hbBVRNtpCK9bTCeTFLqXOLhkpgW62S/NE3Yf416Onhzaah6fgcW2Qs5dpcu4rqJJLEfkf8V1+BUub2XI2Ode3oqLWcpvW46R3wbrTK57MQ==
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
Content-Type: multipart/mixed; boundary="===============1432174693=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1432174693==
Content-Type: multipart/alternative; 
	boundary="----=_Part_437237_741748351.1561207073008"

------=_Part_437237_741748351.1561207073008
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 I can confirm that reverting just this commit fixes the fan speed regressi=
on using kernel 5.1.12.
How do we go about getting this reverted from stable kernels?=20

CCing the author.

    On Friday, June 21, 2019, 4:28:19 PM EDT, Mar Mel <marmel6942@yahoo.com=
> wrote: =20
=20
  Thanks for finding this Emil! The change you point out also landed on 4.1=
9.49 and I am able to reproduce the fan speed issue with that kernel as wel=
l, whereas previous 4.19.x series kernels were fine.
I'll attempt to build both the latest 4.19.x and 5.1.x stable kernels with =
that patch reverted and see if it's the sole culprit.
    On Friday, June 21, 2019, 1:32:19 PM EDT, Emil Velikov <emil.l.velikov@=
gmail.com> wrote: =20
=20
 Some weird interaction with disabling the i2c access, in the following pat=
ch perhaps?
commit cd68344b283174a9b38e9488d5a929464e1f417c
Author: Lyude Paul <lyude@redhat.com>
Date: =C2=A0 Tue Apr 9 16:23:30 2019 -0400

=C2=A0 =C2=A0 drm/nouveau/i2c: Disable i2c bus access after ->fini()

On Sun, 16 Jun 2019 at 15:28, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

I don't really see anything between v5.0..v5.1 which would account for this=
. Could have been a subtle change to the i2c logic somewhere. The fastest w=
ay to identify the problem would be to do a bisect on the kernel to identif=
y the commit that caused this. There are many guides for this online.
On Sat, Jun 15, 2019 at 12:17 PM Mar Mel <marmel6942@yahoo.com> wrote:

 Unfortunately, even with this change now reverted in kernel 5.1.10, the fa=
n speed issue persists.
If someone could point me in the direction of a relevant commit(s) I'll hap=
pily file a bug report.
    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel <marmel6942@yahoo.=
com> wrote: =20
=20
 As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full speed=
.=20

Not sure if it has to do with this new config option (NOUVEAU_LEGACY_CTX_SU=
PPORT)?

This issue is not present using kernel 5.0.21.
Years ago I filed a similar issue:

60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on n=
v50 adt7475 on kernels 3.3.x+
Thanks.



|=20
|=20
|  |=20
60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan control broken on n=
v50 a...


 |

 |

 |



  _______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
   =20
------=_Part_437237_741748351.1561207073008
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"ydp461185a2yahoo-style-wrap" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif; font-size: 13px;"><div></div>
        <div>I can confirm that reverting just this commit fixes the fan sp=
eed regression using kernel 5.1.12.</div><div><br></div><div>How do we go a=
bout getting this reverted from stable kernels? <br></div><div><br></div><d=
iv>CCing the author.<br></div><div><br></div>
       =20
        </div><div id=3D"ydpfecc7b4dyahoo_quoted_2185979816" class=3D"ydpfe=
cc7b4dyahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, June 21, 2019, 4:28:19 PM EDT, Mar Mel &lt;m=
armel6942@yahoo.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"ydpfecc7b4dyiv0878584982"><div><div class=
=3D"ydpfecc7b4dyiv0878584982ydpcd1ca9cayahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><div></div=
>
        <div>Thanks for finding this Emil! The change you point out also la=
nded on 4.19.49 and I am able to reproduce the fan speed issue with that ke=
rnel as well, whereas previous 4.19.x series kernels were fine.</div><div><=
br clear=3D"none"></div><div>I'll attempt to build both the latest 4.19.x a=
nd 5.1.x stable kernels with that patch reverted and see if it's the sole c=
ulprit.</div><div><br clear=3D"none"></div>
       =20
        </div><div class=3D"ydpfecc7b4dyiv0878584982yqt9894060672" id=3D"yd=
pfecc7b4dyiv0878584982yqt72798"><div class=3D"ydpfecc7b4dyiv0878584982ydpcf=
127bc9yahoo_quoted" id=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yahoo_quoted_1=
946356900">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Friday, June 21, 2019, 1:32:19 PM EDT, Emil Velikov =
&lt;emil.l.velikov@gmail.com&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div id=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv24789=
27360"><div><div dir=3D"ltr"><div>Some weird interaction with disabling the=
 i2c access, in the following patch perhaps?</div><div dir=3D"ltr"><br clea=
r=3D"none"></div><div dir=3D"ltr">commit cd68344b283174a9b38e9488d5a929464e=
1f417c<br clear=3D"none">Author: Lyude Paul &lt;<a shape=3D"rect" href=3D"m=
ailto:lyude@redhat.com" rel=3D"nofollow" target=3D"_blank">lyude@redhat.com=
</a>&gt;<br clear=3D"none">Date: &nbsp; Tue Apr 9 16:23:30 2019 -0400<br cl=
ear=3D"none"><br clear=3D"none">&nbsp; &nbsp; drm/nouveau/i2c: Disable i2c =
bus access after -&gt;fini()<br clear=3D"none"></div><br clear=3D"none"><di=
v class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail_quote"><di=
v class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail_attr" dir=
=3D"ltr">On Sun, 16 Jun 2019 at 15:28, Ilia Mirkin &lt;<a shape=3D"rect" hr=
ef=3D"mailto:imirkin@alum.mit.edu" rel=3D"nofollow" target=3D"_blank">imirk=
in@alum.mit.edu</a>&gt; wrote:<br clear=3D"none"></div><blockquote class=3D=
"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x;"><div dir=3D"ltr">I don't really see anything between v5.0..v5.1 which w=
ould account for this. Could have been a subtle change to the i2c logic som=
ewhere. The fastest way to identify the problem would be to do a bisect on =
the kernel to identify the commit that caused this. There are many guides f=
or this online.</div><br clear=3D"none"><div class=3D"ydpfecc7b4dyiv0878584=
982ydpcf127bc9yiv2478927360gmail_quote"><div class=3D"ydpfecc7b4dyiv0878584=
982ydpcf127bc9yiv2478927360gmail_attr" dir=3D"ltr">On Sat, Jun 15, 2019 at =
12:17 PM Mar Mel &lt;<a shape=3D"rect" href=3D"mailto:marmel6942@yahoo.com"=
 rel=3D"nofollow" target=3D"_blank">marmel6942@yahoo.com</a>&gt; wrote:<br =
clear=3D"none"></div><blockquote class=3D"ydpfecc7b4dyiv0878584982ydpcf127b=
c9yiv2478927360gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex;"><div><div class=3D"ydpfecc7b4d=
yiv0878584982ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577=
269616604786429ydpb69c7536yahoo-style-wrap"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br clear=3D"none"></div><div=
>If someone could point me in the direction of a relevant commit(s) I'll ha=
ppily file a bug report.</div><div><br clear=3D"none"></div>
       =20
        </div><div class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv247892736=
0gmail-m_425674517675831047gmail-m_6577269616604786429yahoo_quoted" id=3D"y=
dpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m_425674517675831047gm=
ail-m_6577269616604786429yahoo_quoted_0639155532">
            <div>
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;<a shape=3D"rect" href=3D"mailto:marmel6942@yahoo.com" rel=3D"nofollow" t=
arget=3D"_blank">marmel6942@yahoo.com</a>&gt; wrote:
                </div>
                <div><br clear=3D"none"></div>
                <div><br clear=3D"none"></div>
                <div><div id=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv24789=
27360gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794"><d=
iv><div class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m_42=
5674517675831047gmail-m_6577269616604786429yiv3381411794yahoo-style-wrap"><=
div>As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full sp=
eed. <br clear=3D"none"></div><div><br clear=3D"none"></div><div>Not sure i=
f it has to do with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPOR=
T)?</span><br clear=3D"none"></div><div><br clear=3D"none"></div><div>This =
issue is not present using kernel 5.0.21.</div><div><br clear=3D"none"></di=
v><div>Years ago I filed a similar issue:<br clear=3D"none"></div><div><br =
clear=3D"none"></div><div><a shape=3D"rect" class=3D"ydpfecc7b4dyiv08785849=
82ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_657726961660478=
6429yiv3381411794enhancr_card_0655079240" href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D60704" rel=3D"nofollow" target=3D"_blank">60704 =E2=
=80=93 [nouveau, git regression] - I2C PWM fan control broken on nv50 adt74=
75 on kernels 3.3.x+</a></div><div><br clear=3D"none"></div><div>Thanks.<br=
 clear=3D"none"></div><div><br clear=3D"none"></div><div><br clear=3D"none"=
></div><div class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-=
m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayaho=
o-link-enhancr-card ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m=
_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo=
-link-enhancr-not-allow-cover ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927=
360gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b=
97a3aymail-preserve-class ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360g=
mail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3=
aymail-preserve-style" id=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv24789273=
60gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b9=
7a3aenhancr_card_0655079240" style=3D"max-width:400px;font-family:Helvetica=
, Arial, sans-serif;"><a shape=3D"rect" class=3D"ydpfecc7b4dyiv0878584982yd=
pcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429=
yiv3381411794ydp73b97a3ayahoo-enhancr-cardlink" href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D60704" style=3D"text-decoration:none;color:rgb(=
0,0,0);" rel=3D"nofollow" target=3D"_blank"><table class=3D"ydpfecc7b4dyiv0=
878584982ydpcf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_65772696=
16604786429yiv3381411794ydp73b97a3acard-wrapper ydpfecc7b4dyiv0878584982ydp=
cf127bc9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429y=
iv3381411794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;" cells=
pacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" ro=
wspan=3D"1" width=3D"400"><table class=3D"ydpfecc7b4dyiv0878584982ydpcf127b=
c9yiv2478927360gmail-m_425674517675831047gmail-m_6577269616604786429yiv3381=
411794ydp73b97a3acard ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail=
-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayah=
oo-ignore-table" style=3D"max-width:400px;border-width:1px;border-style:sol=
id;border-color:rgb(224,228,233);border-radius:2px;" width=3D"100%" cellspa=
cing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" rows=
pan=3D"1"><table class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360g=
mail-m_425674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3=
acard-info ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m_42567451=
7675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3ayahoo-ignore-t=
able" style=3D"background-color:rgb(255,255,255);background-repeat:repeat;b=
ackground-image:none;background-size:auto;width:100%;max-width:400px;border=
-radius:0px 0px 2px 2px;border-top:1px solid rgb(224,228,233);" cellspacing=
=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td colspan=3D"1" rowspan=
=3D"1" style=3D"background-color:rgb(255,255,255);padding:16px 0px 16px 12p=
x;vertical-align:top;border-radius:0px 0px 0px 2px;"></td><td colspan=3D"1"=
 rowspan=3D"1" style=3D"vertical-align:middle;padding:12px 24px 16px 12px;w=
idth:99%;font-family:Helvetica, Arial, sans-serif;border-radius:0px 0px 2px=
;"><h2 class=3D"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m_425=
674517675831047gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-titl=
e" style=3D"font-size:14px;line-height:19px;margin:0px 0px 6px;font-family:=
Helvetica, Arial, sans-serif;color:rgb(38,40,42);">60704 =E2=80=93 [nouveau=
, git regression] - I2C PWM fan control broken on nv50 a...</h2><p class=3D=
"ydpfecc7b4dyiv0878584982ydpcf127bc9yiv2478927360gmail-m_425674517675831047=
gmail-m_6577269616604786429yiv3381411794ydp73b97a3acard-description" style=
=3D"font-size:12px;line-height:16px;margin:0px;color:rgb(151,155,167);"></p=
></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></ta=
ble></a></div><div><br clear=3D"none"></div><div><br clear=3D"none"></div><=
/div></div></div></div>
            </div>
        </div></div>_______________________________________________<br clea=
r=3D"none">
Nouveau mailing list<br clear=3D"none">
<a shape=3D"rect" href=3D"mailto:Nouveau@lists.freedesktop.org" rel=3D"nofo=
llow" target=3D"_blank">Nouveau@lists.freedesktop.org</a><br clear=3D"none"=
>
<a shape=3D"rect" href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" rel=3D"nofollow" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></blockquote></div>
_______________________________________________<div class=3D"ydpfecc7b4dyiv=
0878584982ydpcf127bc9yiv2478927360yqt1360240492" id=3D"ydpfecc7b4dyiv087858=
4982ydpcf127bc9yiv2478927360yqtfd61884"><br clear=3D"none">
Nouveau mailing list<br clear=3D"none">
<a shape=3D"rect" href=3D"mailto:Nouveau@lists.freedesktop.org" rel=3D"nofo=
llow" target=3D"_blank">Nouveau@lists.freedesktop.org</a><br clear=3D"none"=
>
<a shape=3D"rect" href=3D"https://lists.freedesktop.org/mailman/listinfo/no=
uveau" rel=3D"nofollow" target=3D"_blank">https://lists.freedesktop.org/mai=
lman/listinfo/nouveau</a></div></blockquote></div></div></div></div></div>
            </div>
        </div></div></div></div></div>
            </div>
        </div></body></html>
------=_Part_437237_741748351.1561207073008--

--===============1432174693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1432174693==--
