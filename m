Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B9847138
	for <lists+nouveau@lfdr.de>; Sat, 15 Jun 2019 18:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51AE4892BE;
	Sat, 15 Jun 2019 16:17:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic308-9.consmr.mail.ne1.yahoo.com
 (sonic308-9.consmr.mail.ne1.yahoo.com [66.163.187.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B940892BE
 for <nouveau@lists.freedesktop.org>; Sat, 15 Jun 2019 16:17:19 +0000 (UTC)
X-YMail-OSG: HfwD2zQVM1l3.bOv4IV6nXcCfqlDddO5DnR4RGEJOJvHjqAtWkr_h1whOgjsl3v
 f.vI.DAcMBE4GZzXBVlmsntRwyxPu6cAsfLlwW1ZyQC19isI9j..Q4xTZs65g2KGWZ78NuPZklBU
 mP3VY_RE7sjmuIwMzFZIxBwJSY.zB_82GrBYaoxIpnyqePKvJ.Y2DBxbpaaGHJLQcl6sZSfVrCyi
 zVw3KCb.fo9ljUhvU.HRkAE8H9nsEAL5svqD3atbNFnnDb.1UAgL6b_q2RRofB4FKTetoKXIlgxH
 cUg47tlwBZIjv581.DZcAr5CubzNSSbVQcVPS3bXn1TdFUc1IR6bgQeRRLWRl4uWyR_pqzOE5.Pq
 MvEjcoV_9u4Whg4nkIflpqEkYuwkp0jrwwDCsTE.6Tv3apoOJ_zGhA4mLIar2fpDlD49DjGZ4VHm
 luuoLSsRJOnh_K_kbc8sP2a10Y1Ga4FDWSROUEGOb0xW.4UIGwIKftpKXdWnSKo3u2XjDMmuTtHk
 LLb7B.ZRMhzDYBA6EZD3AfacLz4zszsXj71WgFxl1KyEIF0RMCDjEqtzcHcAbvagCIotrI8utTHW
 _5WPHMvM7CsoWJ8IYoLuq9zRfODxY.Kx4ZfRM1TviBgcD2Z7OnkKgjFC0rTjKxqwLr6qNfS8WTW8
 mRZK7DGj1HyPfIIa7d9TCKQb.BUd3cIW.Po8O7MujzRxfeRDtdvq02dvFf6VwMIUMCVyiBq.PewY
 RNLH9f5jKrvHPx5AWzWk8KEOOnh2JUomSR8AhqlVYZjTDVe4hli2LStE6HkF_Jf9VntPHBssmdOk
 runyrZXJq7KmxWDGoSWGN_3AkXbZUpvQrc6JNzw.uqlCw0pWW.eQ.gGOeyDLr9CvMCl3s0PgEPtn
 OBtoIlstgaLJRU_FDhc2KWKtP4n1jwbrCImM_wJVSR7QSNf8IoyKI4Y1cUjxDp_kjwo5dH75.48_
 dpTLR1apPorgVI4uGLaV2s2XlZbQPQR7CSxKhfaQdfOxGPqcB86SI4rrcYv_qLL7w0N_gaippsOK
 0XbTT7F1wYoEoFTUDJ8iMmOGrzFRa0FBz0FVY.TnAJbnjyuz3zk11LcObvWDxMnFPkUaWsN9nV9b
 D2ljebgd6Bcz55rInAmmpzrsCLlTRJhKRan5tY1HSvUmuwvoy90pY.YeGAYd9ikGoL.pTl0QVp3g
 4KtJaQAKmarUz.4Emov1ig7Yp2RdBHxjI6eUeLAFE
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ne1.yahoo.com with HTTP; Sat, 15 Jun 2019 16:17:18 +0000
Date: Sat, 15 Jun 2019 16:17:16 +0000 (UTC)
From: Mar Mel <marmel6942@yahoo.com>
To: nouveau@lists.freedesktop.org
Message-ID: <495587496.1966749.1560615436420@mail.yahoo.com>
In-Reply-To: <1119631907.971876.1560439165339@mail.yahoo.com>
References: <1119631907.971876.1560439165339.ref@mail.yahoo.com>
 <1119631907.971876.1560439165339@mail.yahoo.com>
MIME-Version: 1.0
X-Mailer: WebService/1.1.13837 YMailNorrin Mozilla/5.0 (X11; Linux x86_64;
 rv:67.0) Gecko/20100101 Firefox/67.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1560615438;
 bh=9+0eDv80y+GtLsAEgsS56l3NPoze8WcjHUVeKzgy/k8=;
 h=Date:From:To:In-Reply-To:References:Subject:From:Subject;
 b=ha8dlszAhr5q/bPzsaEfyp1XwlA37WciN6FnLM5SDgP/0W20EU3QhpTFrMIaZb1pEZNoi8/to2qWOWUPPyoDzDqKm/MRk64lHIUCYsBYhJuCUIOu950dojhGsvfIg1rMmKdPMPIpkr66Vfo1tOKHNhe+gMMkTIcveMXhhn2rqxFUnIRDgrR51SWH7po8B5YMj0Lj/l4THMGplpBZDGULZz7/i+THAkSOeuyNNy4YZHsS1V2BmPP5k1B0rDGXKqxP0Z2YT/j470A+pi7nbQlvdkotdhLPyljqobBbzWFvhwGzzOX0AjErM0+uXmhCZaYK3Vami9KGftgoALj8PeZC/A==
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
Content-Type: multipart/mixed; boundary="===============1659026647=="
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

--===============1659026647==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1966748_1458472801.1560615436418"

------=_Part_1966748_1458472801.1560615436418
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

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



 =20
------=_Part_1966748_1458472801.1560615436418
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" xmlns:v=3D"urn:schemas-microso=
ft-com:vml" xmlns:o=3D"urn:schemas-microsoft-com:office:office"><head><!--[=
if gte mso 9]><xml><o:OfficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>=
96</o:PixelsPerInch></o:OfficeDocumentSettings></xml><![endif]--></head><bo=
dy><div class=3D"ydpb69c7536yahoo-style-wrap" style=3D"font-family: Helveti=
ca Neue, Helvetica, Arial, sans-serif; font-size: 13px;"><div></div>
        <div>Unfortunately, even with this change now reverted in kernel 5.=
1.10, the fan speed issue persists.</div><div><br></div><div>If someone cou=
ld point me in the direction of a relevant commit(s) I'll happily file a bu=
g report.</div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_0639155532" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Thursday, June 13, 2019, 11:19:25 AM EDT, Mar Mel &l=
t;marmel6942@yahoo.com&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div id=3D"yiv3381411794"><!--[if gte mso 9]><xml><o:O=
fficeDocumentSettings><o:AllowPNG/><o:PixelsPerInch>96</o:PixelsPerInch></o=
:OfficeDocumentSettings></xml><![endif]--><div><div class=3D"yiv3381411794y=
ahoo-style-wrap" style=3D"font-family:Helvetica Neue, Helvetica, Arial, san=
s-serif;font-size:13px;"><div>As of kernel 5.1.9, on resume from suspend, m=
y NV50 fan runs at full speed. <br></div><div><br></div><div>Not sure if it=
 has to do with this new config option (<span>NOUVEAU_LEGACY_CTX_SUPPORT)?<=
/span><br></div><div><br></div><div>This issue is not present using kernel =
5.0.21.</div><div><br></div><div>Years ago I filed a similar issue:<br></di=
v><div><br></div><div><a rel=3D"nofollow" target=3D"_blank" href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D60704" class=3D"yiv3381411794enhanc=
r_card_0655079240">60704 =E2=80=93 [nouveau, git regression] - I2C PWM fan =
control broken on nv50 adt7475 on kernels 3.3.x+</a></div><div><br></div><d=
iv>Thanks.<br></div><div><br></div><div><br></div><div id=3D"yiv3381411794y=
dp73b97a3aenhancr_card_0655079240" class=3D"yiv3381411794ydp73b97a3ayahoo-l=
ink-enhancr-card yiv3381411794ydp73b97a3ayahoo-link-enhancr-not-allow-cover=
 yiv3381411794ydp73b97a3aymail-preserve-class yiv3381411794ydp73b97a3aymail=
-preserve-style" style=3D"max-width:400px;font-family:Helvetica, Arial, san=
s-serif;" data-url=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704"=
 data-type=3D"YENHANCER" data-size=3D"MEDIUM"><a rel=3D"nofollow" target=3D=
"_blank" href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D60704" styl=
e=3D"text-decoration:none !important;color:#000 !important;" class=3D"yiv33=
81411794ydp73b97a3ayahoo-enhancr-cardlink"><table class=3D"yiv3381411794ydp=
73b97a3acard-wrapper yiv3381411794ydp73b97a3ayahoo-ignore-table" style=3D"m=
ax-width:400px;" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><t=
r><td width=3D"400"><table class=3D"yiv3381411794ydp73b97a3acard yiv3381411=
794ydp73b97a3ayahoo-ignore-table" style=3D"max-width:400px;border-width:1px=
;border-style:solid;border-color:rgb(224, 228, 233);border-radius:2px;" wid=
th=3D"100%" cellspacing=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td=
><table class=3D"yiv3381411794ydp73b97a3acard-info yiv3381411794ydp73b97a3a=
yahoo-ignore-table" style=3D"background-color:rgb(255, 255, 255);background=
-repeat:repeat;background-attachment:scroll;background-image:none;backgroun=
d-size:auto;position:relative;z-index:2;width:100%;max-width:400px;border-r=
adius:0px 0px 2px 2px;border-top:1px solid rgb(224, 228, 233);" cellspacing=
=3D"0" cellpadding=3D"0" border=3D"0"><tbody><tr><td style=3D"background-co=
lor:#ffffff;padding:16px 0 16px 12px;vertical-align:top;border-radius:0 0 0=
 2px;"></td><td style=3D"vertical-align:middle;padding:12px 24px 16px 12px;=
width:99%;font-family:Helvetica, Arial, sans-serif;border-radius:0 0 2px 0;=
"><h2 class=3D"yiv3381411794ydp73b97a3acard-title" style=3D"font-size:14px;=
line-height:19px;margin:0px 0px 6px;font-family:Helvetica, Arial, sans-seri=
f;color:rgb(38, 40, 42);">60704 =E2=80=93 [nouveau, git regression] - I2C P=
WM fan control broken on nv50 a...</h2><p class=3D"yiv3381411794ydp73b97a3a=
card-description" style=3D"font-size:12px;line-height:16px;margin:0px;color=
:rgb(151, 155, 167);"></p></td></tr></tbody></table></td></tr></tbody></tab=
le></td></tr></tbody></table></a></div><div><br></div><div><br></div></div>=
</div></div></div>
            </div>
        </div></body></html>
------=_Part_1966748_1458472801.1560615436418--

--===============1659026647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1659026647==--
