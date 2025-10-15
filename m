Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F388BE01AA
	for <lists+nouveau@lfdr.de>; Wed, 15 Oct 2025 20:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA67D10E8B4;
	Wed, 15 Oct 2025 18:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="HNqQoCoQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic303-22.consmr.mail.ne1.yahoo.com
 (sonic303-22.consmr.mail.ne1.yahoo.com [66.163.188.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54910E8B4
 for <nouveau@lists.freedesktop.org>; Wed, 15 Oct 2025 18:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1760552402; bh=ApibINrKc2P8cJHp68T1559e6Ind6miCC2XttzMIbBQ=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=HNqQoCoQDOYUlY+Rks4KSDA3eXYyg0Vr88NxSmd9/gRzp52FLNHU8kAMVU0MmZvmDRROnrM40wRRUevcNPUr7zbJmu+65a5bKCUIOtwO08X7hCsq5ZDIa9pw7AxZxF5O5PevKRlg1jkmCnsNUBM100WoU6R7zLxLvo3eGg+TBX7RqT4lTQm/75Uw3ZYgXQmkaDjJ4Vv9BOaeZNManR2igWg1LdOxQQxf+iOyNO6iK9pn2ARJK8bF99/f2JFUZhhkSJx4t6359bToZsotAqJllemkhLmdDyKmvdoDZ/q2a23M/qKFAn56XfOUSOkS/RXf4NrY985xuxR6xNzxc1accw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760552402; bh=rwQuhD1CAYaYYNnOhcNGgipGbWFXwSKVim0Wl2Ifuh4=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=DmjBanLiQAeaQTyZvglARG0Y9sWKQK8Dc+zKYK9EMoY0TRvWjmAiOCYaZ0Ljh30fxOql5JdvW1aPzCRbRrLTIP3f3bkUdEokxu5WRFimTpUbhIzMKD4oLIGpgKBi3QcRi7qbHpbtWQOdpZEFAn2WrASC+OT/gWb/XIgCUKHWTOOjsFBdec1tDPKG+ntS0tWYk3fOMQtXk5UEjMDSyW9sq9UKCaIkyvpn/j7IqNpYbyO+dRIDa62Ztopkv0V7UC/FmDl8gHZnxaYzXm1FmIWMpz6vHeMGrTjLOpApCjNs8xDUaiDv/1dV1cr4RBfE/Bs+COsqhZitL7bbj8gxo9B48w==
X-YMail-OSG: YTVyddAVM1m1aURgFPecXfZZfIK_xRX7q_vm1NpYE7t_RFWdmkX3FZ7JPsb33Zi
 SgdG3TDDyAaRmWXlH4C2.94BsW9oJvQEQ_zcgHxLd0npOLFH.xS8T3OQNoK1JF03YZIi9fktFagq
 T4wRXotDQw0EHGN43k1si0Hj_IEkqynXWhd0Emu7mEHt0cmPFETcv63ZoAM4CZ9AxWd6Ue1.qDQM
 dGSAMftWgZnLGAN9wUSS51v5PhMpfHP3g.JOto2h84T.74Wsbv7a9zWdP30mOgOPj_5lhqO90EfZ
 9Vuw86CZPE88hKiH84gXY4hEUDeh9yvvLuPxx9WWdXZ6G2p4XF4BrICzgg6ekWoLG3L56z2ROuJ1
 Y2ckyGK11eLpjScRb_X6iOXavm_Sv_duTD7FONn0eDFJGRCLQIuFbMBhjYGM8V9081HGeE7eTlzU
 bzfCu5WsEAOa5ENlEtBU98WSjMs0Ewj.1pNt_pwAkzz2wayuInkjdeHTXZHnSOztrfPAmFxiZ_bZ
 t82uPVaQ9UNx1zDuNN8iUjQxjKM50oG5l1hM0sZrzrh1MqHtdEFXUpTIaeR9pLFYTtDnkHaU4ZZo
 feckg3ic4nahfu6kh4IarCcqwKsi5bJ8SnH.gpOAgHBuBsvt3VZ0r9WwzZU9rpZHA5q38KjCGxNQ
 uTr2ywPiwYbD5hpBQ7KMuzqlxToJaapc71y1UoswevOdwesqvzv9ko4Jtw09Iac_Ve1RPgUlE_1I
 BjIxlJ3H9uuMnAk7Hy4qLvIhKd3i2iBFwA06AiMcdeme4S4QVRsz058lbPruXGWtFvitA2ZSd8fG
 vS1X1MFFy40mI2hwKrl.ohHAwbcNsggq8d6296K01h3PGI_b5DGIPEfXlX7jiBAan5V7bqV4qx5X
 VmquKp56cduLRTnRyuG9OySDGKAc.4wxh5gc7j7YGrlal2LmgWwzsalkV.uPhvsIWaQeHDU1.MJV
 Vxtneq3GA79kC.1Kj68iErW_tfeA1QIQwEnzWkcEct4JHAbo05Kx196JvQWqqBUovaXI0LTnyGyi
 7P_wMlGOh_KZhPKQLVQrO4j6z8jsm6yfnIZxv3.cnZIeep7wjmoOUTCHp7fFg6fBGnacas0JzGN4
 9wQakICKAVGyEvd0._Iucm1YTWOLmN976w7M6sz67aimbhJBnzmMzMXuDcDZF8Ew1dRFP7BzsqvY
 jDA9l15EB3S5_mysZtclcWOtoi0v7Tzi8IVV1WNKGyj.10xKi9R9bswwoo0qQp8CYL.pOtGCH455
 K4NKfSISFuI0S.Mi0TxmQquciP0i.C9P0tzZQuyDCACFd4hHjOABgHrKTY1LDLFyaVSBMjqk_IFp
 .Ug20RGKFbmRPWX3rZPHB4FJgkNvW07CeViNO.p2EHzqVfS_mbIQHnw4NCy6Vii8tDYdPlJ13GJW
 XrbJDWErhzd8fuYb00usBPb3l0t7zl9YW1GX.tKoK5CFmz8FaKxGrX3dRS.Y.ZA6lEne3ke.iUEZ
 SEPieyf15kz2IQP98O1xwPG7DLjl2xYgRYgeJBq6uzhpF5MVfAsvBmEpuGCOIenkGxSEb6XCogMD
 Ggoa8t7LNwiZIAe7OzW8vd..YHtlmtJveklFtSuppAHMvPfHsE568IWRzWdlTYXoSvm9VwjDh6ql
 CAvpq_KDxsuBMt2HXLU5RIAK3xkxGATlZ.i0x1FDphbVxyqr9YED17dG4V5DO7fzM9oDMmG9nQGo
 4Vz2DLcIqknJXDV_72738ji9FHZOh_9GaStYpjPR2WX6d9K70Q.i_bD_6C.mzjBPvw2Uz3diFTOG
 imLZGunoJON3J7APDHpGSA2XORwUClRag2UGT9YK9HA_dxWzs0RThnLXf1dzywf.duWEjt.N9Gi.
 zz5B_ayEYM8R0ssEmnkruXPv1K1wT2YwMO1b3ykAiLlUwSfrqgaxtncxSb0ZcoWf8D8Kl9kqVzFS
 sVwGchHlVcrc2otEfpogxNNu7g0_GQ5fVaIvO.4iOyBFdkXhGymuOkVFtfb7RS.5syMD2LKeuSTf
 4HPOtwLNWq1HsFMSa_5oE.zxfqn_Vu8UHPTtTQSrWN5ytD6_UIGtVJm9XAHLOzyQI4mdPn0glYV7
 njaxQKZtVYPz8Iic5obRYORKWlqvZunuvUos5AuuvjzL5skh2DeLI5KGGyq5ldH2iv0XhI.2vrrr
 Ea..2bRbh81bN6f0NCeAGm1gkZ_gzpLrprO_G.GlxKxxSqb382.9KTVbD6Muz78SH8kt3.W1GNiw
 00pfC_37dJUo_cA2c0iuUhhK9rWvNuztuGMYaHtmAODhdm8plXQ8IMwOKdqT5Mrr3JDpRtEHNti5
 MwYlVOEgqA5Qg9crpUqnsyKdvcSfHaAIs64cYLcw.lvwBRmL7CrTg4nC7hHeJxZAyrszVZJctpB8
 YuL7CBLjlcal3sSLTjigA8aGE25sxapzJoIWrTn7gam.acA--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 7622abe1-9d40-45df-91ef-ab50f570adf7
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic303.consmr.mail.ne1.yahoo.com with HTTP; Wed, 15 Oct 2025 18:20:02 +0000
Date: Wed, 15 Oct 2025 18:19:58 +0000 (UTC)
From: Alexander Ramirez <lxrmrz732@rocketmail.com>
To: Petr Vorel <pvorel@suse.cz>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Message-ID: <1408527465.3325533.1760552398063@mail.yahoo.com>
In-Reply-To: <20251014160712.GC181869@pevik>
References: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
 <20251013222424.12613-5-lxrmrz732@rocketmail.com>
 <20251014160712.GC181869@pevik>
Subject: Re: [PATCH v2 1/2] drm/nouveau: add missing DCB connector types
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_3325532_265474389.1760552398062"
X-Mailer: WebService/1.1.24562 YMailNoble
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
Reply-To: Alexander Ramirez <lxrmrz732@rocketmail.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

------=_Part_3325532_265474389.1760552398062
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

 Hey Petr,

Thank you for the review! Any thoughts on the cover letter or part 2 of the patch set?
I'm super new to mailing lists (and submissions in general).

Thanks for your time,
Alex   On Tuesday, 14 October 2025 at 12:30:29 GMT-4, Petr Vorel <pvorel@suse.cz> wrote:  
 
 Hi Alex,

> * Add missing DCB connectors in conn.h as per the NVIDIA DCB specification.

> A lot of connector logic was rewritten for Linux v6.5; some display connector types
> went unaccounted-for which caused kernel warnings on devices with the now-unsupported
> DCB connectors. This patch adds all of the DCB connectors as defined by NVIDIA to the
> dcb_connector_type enum to bring back support for these connectors to the new logic.

> Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
> Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
nit: maybe
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry

Thanks for adding the docs as comments!

Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
  
------=_Part_3325532_265474389.1760552398062
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"yahoo-style-wrap" style=3D"font-fami=
ly:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px;"><div id=3D=
"yiv4315141663"><div><div style=3D"font-family:Helvetica Neue, Helvetica, A=
rial, sans-serif;font-size:16px;" class=3D"yiv4315141663ydp11242312yahoo-st=
yle-wrap"><div></div>
        <div dir=3D"ltr">Hey Petr,<br clear=3D"none"><br clear=3D"none">Tha=
nk you for the review! Any thoughts on the cover letter or part 2 of the pa=
tch set?<br clear=3D"none">I'm super new to mailing lists (and submissions =
in general).<br clear=3D"none"><br clear=3D"none">Thanks for your time,<br =
clear=3D"none">Alex</div></div><div id=3D"yiv4315141663yqt31377" class=3D"y=
iv4315141663yqt5368274852"><div id=3D"yiv4315141663yahoo_quoted_0836389664"=
 class=3D"yiv4315141663yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                        On Tuesday, 14 October 2025 at 12:30:29 GMT-4, Petr=
 Vorel &lt;pvorel@suse.cz&gt; wrote:
                    </div>
                    <div><br clear=3D"none"></div>
                    <div><br clear=3D"none"></div>
               =20
               =20
                <div>Hi Alex,<br clear=3D"none"><br clear=3D"none">&gt; * A=
dd missing DCB connectors in conn.h as per the NVIDIA DCB specification.<br=
 clear=3D"none"><br clear=3D"none">&gt; A lot of connector logic was rewrit=
ten for Linux v6.5; some display connector types<br clear=3D"none">&gt; wen=
t unaccounted-for which caused kernel warnings on devices with the now-unsu=
pported<br clear=3D"none">&gt; DCB connectors. This patch adds all of the D=
CB connectors as defined by NVIDIA to the<br clear=3D"none">&gt; dcb_connec=
tor_type enum to bring back support for these connectors to the new logic.<=
br clear=3D"none"><br clear=3D"none">&gt; Fixes: 8b7d92cad953 ("drm/nouveau=
/kms/nv50-: create connectors based on nvkm info")<br clear=3D"none">&gt; L=
ink: <a rel=3D"nofollow noopener noreferrer" shape=3D"rect" target=3D"_blan=
k" href=3D"https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specifica=
tion.html">https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specifica=
tion.html</a><br clear=3D"none">nit: maybe<br clear=3D"none">Link: <a rel=
=3D"nofollow noopener noreferrer" shape=3D"rect" target=3D"_blank" href=3D"=
https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_=
connector_table_entry">https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4=
.0-Specification.html#_connector_table_entry</a><br clear=3D"none"><br clea=
r=3D"none">Thanks for adding the docs as comments!<br clear=3D"none"><br cl=
ear=3D"none">Reviewed-by: Petr Vorel &lt;<a rel=3D"nofollow noopener norefe=
rrer" shape=3D"rect" ymailto=3D"mailto:pvorel@suse.cz" target=3D"_blank" hr=
ef=3D"mailto:pvorel@suse.cz">pvorel@suse.cz</a>&gt;<br clear=3D"none"><br c=
lear=3D"none">Kind regards,<br clear=3D"none">Petr<br clear=3D"none"></div>
            </div>
        </div></div></div></div></div></body></html>
------=_Part_3325532_265474389.1760552398062--
