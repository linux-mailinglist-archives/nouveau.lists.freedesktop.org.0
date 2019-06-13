Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1641F43A33
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 17:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCD689B42;
	Thu, 13 Jun 2019 15:19:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic302-21.consmr.mail.ne1.yahoo.com
 (sonic302-21.consmr.mail.ne1.yahoo.com [66.163.186.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF9CF89B42
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 15:19:31 +0000 (UTC)
X-YMail-OSG: j1D5sz0VM1kI1XZvt4QN0OOuEB3OkFkysSQzbrjr_9dLC0ZhLJxskdZkpImFbsk
 QBbz_BMM0DJNvmV5EBCOA03MzadVr2plk0YclkASNjtI4uaSvREtPUSvd77.8z7ygr6qSmci3pra
 LS1qF5HJZgVygTZ3pNxPSh9kIa5VxuvEWz2zH422RYF6o.hfALGvpQn3U0XzLBQ4ulB.xno_6EiV
 iG7uJ_DKXmRDIt8LipE4kdhkPGENLVW8anz_gO9AccLKe3GjlRuAantns38Jy8_0Y3LpVHVYUcxy
 vFiaMhAnD_P9dLu0ATp7txVOxNZa2qoEMxx8joA9Scb_AlTbGxIVlGEep5ahlzGBVaMgehNY2ZBh
 WjTyZSGL.K7t4nz1VjXgTu4HrT2jyIpk7JjC.A78AOejLHcLmKSTIwHWzsSSEARKET52KQy1J4ti
 NlYx3wtKxKunuplI_2j1NDLYb87E2CRAo60EwoFtSLpeb1Hnv72QtdunALTRhTgInOzcFYp_W3l7
 aTdjX7gUO4uwPVfHwRzY_kFAcr.UxgrprLERnmuhnAzYO5Tbgs6sJp9Ti.eo4iCNzCD6f4VZVJHT
 smO.v2A08Nd_oiAjHeICHqhxZmZbxSUPUmkR3QpBkcJ11nIYXX_0fYre2eAAP3cFt6FHK8SHzTr5
 pwkFh_MWeKTskcdZV9F.dHoNmfH8mS5HwfYzoBF62Gs_0tnOvgLtLzcH2F8.hRwJ.bYaITZCGM4N
 _QvM1Xk4Yq9oH0opuXwae2c9Xpnm7rOzx3SaUAKY2E_4dzux.u0UNu7OGwyHYXWLdaYcQl6BVykv
 h8RbcUvE_HCvOqPrLtEulSDKjVre4lIrW5DyTih_4t3_8.SM4tnDw6u2fPCySwUCbdohz5JKnBG7
 0t3obkqf9T3gKnBaZcFmgCjAS2TfUuyxHQJRdrqT0OAbrW5mFBt6Ba5bFQoKw5RzVjUl.kUy6Dp7
 Nn1Mtq.dkTOSHTn6pkx8bThnMnMCtkqEWE5Jej7Z4IKo6mjXyuvoJo8tni0qCgkGgLh9Lz1rUB2T
 Om2t6iA7pvScqlQC_QsbSHD6.G9pf3e7r_XTS9zdsuGGavDrf0je0iMCbCrLVdDFqMiWWdg0lZ0i
 7U9jhkTHyUnulW4PV0_XsnhwRT2NoFD1fsJHUGXZ4zgqPFT6OdmeyL8MouzA7ZoR.6pUsZgDFEir
 Dq1XFzCt11duHv3AxvRmlD4leJSfLP8S1GaJyZwId._pvrqPa
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ne1.yahoo.com with HTTP; Thu, 13 Jun 2019 15:19:30 +0000
Date: Thu, 13 Jun 2019 15:19:25 +0000 (UTC)
From: Mar Mel <marmel6942@yahoo.com>
To: nouveau@lists.freedesktop.org
Message-ID: <1119631907.971876.1560439165339@mail.yahoo.com>
MIME-Version: 1.0
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13837 YMailNorrin Mozilla/5.0 (X11; Linux x86_64;
 rv:67.0) Gecko/20100101 Firefox/67.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1560439170;
 bh=2sDfekHiS/t+SKOSSFtIhr5g1sGgAGIx6yEa57ahtYc=;
 h=Date:From:To:Subject:References:From:Subject;
 b=LkHOvNx+x5KzCoLmHGf/qPTkthiPb4JWXQv1ESkWrSRzOKU6e9vZqd20OtmB1a2/urQNIuFMV76pMBummXTvOvxj92JqSSK8KgqHXgTw7sQrALR/XeIR/lwhni5v+cjxCoeFzjlkmHFsNK3Uk9KSsulJEZqYTBXd624ROqaJw3mTV7j2ByUkgwtwSNImIaI9LrHNDW1YSsYBgoOElpw0/IMJTNDQ6kpfRc6xAyOCMqYhUP+QIDYnK/sO12aehJ/LazfmArb7BvMAfN9wwd90BHEpiq5yqewz8i6FilI3Cp/11n1gYCUv6FHtjT+poyb2Vq3C/0dxRfcvDnnA9KiRdQ==
Subject: [Nouveau] NOUVEAU_LEGACY_CTX_SUPPORT Fan Speed
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
Content-Type: multipart/mixed; boundary="===============1723392338=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1723392338==
Content-Type: multipart/alternative; 
	boundary="----=_Part_971875_2077526317.1560439165337"

------=_Part_971875_2077526317.1560439165337
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As of kernel 5.1.9, on resume from suspend, my NV50 fan runs at full speed.=
=20

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




------=_Part_971875_2077526317.1560439165337
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"yahoo-style-wrap" style=3D"font-family:Helvetica Neue, Hel=
vetica, Arial, sans-serif;font-size:13px;"><div>As of kernel 5.1.9, on resu=
me from suspend, my NV50 fan runs at full speed. <br></div><div><br></div><=
div>Not sure if it has to do with this new config option (<span>NOUVEAU_LEG=
ACY_CTX_SUPPORT)?</span><br></div><div><br></div><div>This issue is not pre=
sent using kernel 5.0.21.</div><div><br></div><div>Years ago I filed a simi=
lar issue:<br></div><div><br></div><div><a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D60704" rel=3D"nofollow" target=3D"_blank" class=3D"e=
nhancr_card_0655079240">60704 =E2=80=93 [nouveau, git regression] - I2C PWM=
 fan control broken on nv50 adt7475 on kernels 3.3.x+</a></div><div><br></d=
iv><div>Thanks.<br></div><div><br></div><div><br></div><div id=3D"ydp73b97a=
3aenhancr_card_0655079240" class=3D"ydp73b97a3ayahoo-link-enhancr-card ydp7=
3b97a3ayahoo-link-enhancr-not-allow-cover ydp73b97a3aymail-preserve-class y=
dp73b97a3aymail-preserve-style" style=3D"max-width:400px;font-family:&quot;=
Helvetica Neue&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif" d=
ata-url=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" data-type=
=3D"YENHANCER" data-size=3D"MEDIUM" contenteditable=3D"false"><a href=3D"ht=
tps://bugs.freedesktop.org/show_bug.cgi?id=3D60704" style=3D"text-decoratio=
n:none !important;color:#000 !important" class=3D"ydp73b97a3ayahoo-enhancr-=
cardlink" rel=3D"nofollow" target=3D"_blank"><table class=3D"ydp73b97a3acar=
d-wrapper ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px" cellspac=
ing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td width=3D"400"><tabl=
e class=3D"ydp73b97a3acard ydp73b97a3ayahoo-ignore-table" style=3D"max-widt=
h:400px;border-width:1px;border-style:solid;border-color:rgb(224, 228, 233)=
;border-radius:2px" width=3D"100%" cellspacing=3D"0" cellpadding=3D"0" bord=
er=3D"0"><tbody><tr><td><table class=3D"ydp73b97a3acard-info ydp73b97a3ayah=
oo-ignore-table" style=3D"background-color: rgb(255, 255, 255); background-=
repeat: repeat; background-attachment: scroll; background-image: none; back=
ground-size: auto; position: relative; z-index: 2; width: 100%; max-width: =
400px; border-radius: 0px 0px 2px 2px; border-top: 1px solid rgb(224, 228, =
233);" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td styl=
e=3D"background-color:#ffffff;padding:16px 0 16px 12px;vertical-align:top;b=
order-radius:0 0 0 2px"></td><td style=3D"vertical-align:middle;padding:12p=
x 24px 16px 12px;width:99%;font-family:&quot;Helvetica Neue&quot;, &quot;Se=
goe UI&quot;, Helvetica, Arial, sans-serif;border-radius:0 0 2px 0"><h2 cla=
ss=3D"ydp73b97a3acard-title" style=3D"font-size: 14px; line-height: 19px; m=
argin: 0px 0px 6px; font-family: &quot;Helvetica Neue&quot;, &quot;Segoe UI=
&quot;, Helvetica, Arial, sans-serif; color: rgb(38, 40, 42);">60704 =E2=80=
=93 [nouveau, git regression] - I2C PWM fan control broken on nv50 a...</h2=
><p class=3D"ydp73b97a3acard-description" style=3D"font-size: 12px; line-he=
ight: 16px; margin: 0px; color: rgb(151, 155, 167);"></p></td></tr></tbody>=
</table></td></tr></tbody></table></td></tr></tbody></table></a></div><div>=
<br></div><div><br></div></div></body></html>
------=_Part_971875_2077526317.1560439165337--

--===============1723392338==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1723392338==--
