Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD59710728
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 10:18:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4C110E55E;
	Thu, 25 May 2023 08:18:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic307-53.consmr.mail.ir2.yahoo.com
 (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D7A10E55E
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 08:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.fr; s=s2048;
 t=1685002714; bh=PGqelS34AqAYsN9YNfL/9nx3YEv7uXuEdSU8RgqrJug=;
 h=From:Subject:Date:To:References:From:Subject:Reply-To;
 b=U8vP2/z91WgQm0VJptkgp45OrdIAiKfa+1d0wvBNfCnA7E3sVLYrJOyfD0MGAKrKrvyuc5TwT+AVjiqU604A1XsiFIlslji+QSCBcWdNK/iYvWUj6R//vVjZ7uVkBHIhOacOo/6CWYA2Y2A4ag8cv57qiYQEz8LFB7IOqauLTDRXm9abdqlEwtjbs/JYaD+yr52WX3/nzdQMPGw8r94lTiS3js3vKR7tNcr3OsGiyEbKG/zcse8qIXu/9H+gAw4dH5efT32v8c3zCfyqjlT9aPPY/YpqQL1cxcQA5tPyL66aLuWhyv8kxck6xOb7Mmcl/4mvZ/VJXNVabhzc096AYw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1685002714; bh=MGln3QT0RxciLSh93YAzgn1BkwkFdyn3//RBKA2mxvd=;
 h=X-Sonic-MF:From:Subject:Date:To:From:Subject;
 b=nT6s3mi6Y0oD4OfYLW+ZOfldrJ+H4P0Pz9ZjxQnyY3+z7RSRPaiiBbcLOEysjHMLdodS3RLS/qIqVIrSRvyo4NYw3dSa+B4nAJSRnVTraPFoFAJ3EDB3poJHIIwmASQ+N7IrPkkgeOn6ZiRjP5ZyKYGjDDLUlDo6sSRzKqJ8fcwExOPBTXg6SU2edLlwS6bLAAhYpkGvVYS6srkdb4YnWZOHvHD80MFn8FPnAQm9nrM5+Sfrh1ZyAQkYC6/Lu5iBntVEXLph4e2gKhHHc1QQR46F9/0c9YnDSbMXY0MFKCMX04+veLj0Jov1gRE5+qBsKr9b0uuKGLTaqhBdPQO/bw==
X-YMail-OSG: MP5KGFoVM1n9ivQCCtXDjE3hELpMepTGLOzpW0DCiT6tZPliGweVRu_8WAxcfmE
 q9V3tavQWSeHa4JWANMj363GU4jTwJkMwBkJOyGOPv6MI_L8aqjKeEGouF_oGa2PtbZ6qlD5J3Ca
 Qs9oGYmvEWBUU2nehVTkL8w4s.h.zhm11bZ0Y7W5g39A868wL1LN_twL636AzaHLHP.0_AxNR2i4
 0HY5nBTJ69ufqr5xfBDyseipb0HwrpIWzd5hZKwCYrjSx73y1Qbebe7ML2lAAkkaRn2dUJzKJvxX
 Je0kKn.FYdssu1Y.vPwfqf6Kw.cDUR57HKnp4I18mk3oS73thYBW8RQBKcXD5klgEhZDlzwXBl3g
 7V57frSYwxg1CjADqm7_.PnBcl6RhrnWoNBfnziRyf40_l0L4ibbQY_2lSut9F1N9V9CF5dRSGCu
 8FCiYMVe8R122blEORX9mlBSbDZ2k1iOu3P8K.Qh0mAe3xc6qF63eSHqcwS3SD7mAeZL57vfZYG1
 SGrd4RLqmjdaylnwe_u15dOtIJgBiI4PxaQpCutASCIA3BiRWInxgh.GLL8EYaPGE3hPdgZyFhYi
 8D1e48O.msUTf4SZmBOPmwhLXBlJ1jRamzplTGb7hxUH9Ppzpmu0l327t9DXt09eYphTqDKKk8eB
 4LypwtJKerNQZgtxW7kTyLxKYf6GhXXnKASGoMvtmq6NxlkPeB8Y6hkmeDOuNIwsP0CMSEhfGo1b
 WgcJN90T7BefU9Cei58j_zCgo1yAaah7.WLbw_LNlQPEib72I9cWzllzzHs418vt4d7_AUSUkMtK
 HrQIZy7LIzgKuqEygheVG13zr3BgelXvwiHW0OtcxfgNzdSYxGWvjOuYzmxWPp8hFuVBzEPl4kQi
 UYPdXsKmejJqe_RQox7bVfL5Zgx7v2zv3XS_AhbtpF8dTreCpG8xmMU3BiBMhLXr3od0Rt.QXFK_
 03udmKz2u8h1.Db2Cs9KnaPnlqiFDsRNH8FByusqB5KOmjPmZewV0SIherTBL2Nf19FfVF9UD13O
 OeD64jRpuEO2JhrNhIGv6qz6a_9vsZ0ihIs9FjBuPrbOMxgFLgR2UuwPHQKmr1xvzEuSQi0yYPCi
 qG2XpyvdXUPirlTvNGr6eyYMhAsJQgH_hR7z8b4586CNu8mFYnVrCudfQ0Gdr8H1J5Ne6sEoFht3
 Pm2s2XhDSLyIg39pdRHglfhLzqQoTqF66fEd2OzRBnw5lJmH2XoFjrZMMkL2Ga0VJ6cdWvTkldLE
 PAqozBcsUOr7VI3yi0shkPEtJz.vzHTEeS8wbBHW0DqqzzaPGJZXp6pqwj7GDBqBSHF_caYZkoqB
 QY4RJza3JA95_OxaMf6rR6sebbIJSEAcDWPQxZGVTrQN5Vyr6xm7IqhvTCfR4FCup5osp_bTIgPx
 Kk9zCSMhDacwkTqcvf3zCV_JOJLMngKBxRcgepxoSzKQ_tcWvoUeXaYZxhnUJ0wPuu7qPiBPtJOV
 58tyFfawNXmq6WawBreQa.zm.vQkysTbFuXrdmV4Q5hM5l6WLawiahGZ4.lJdSWGgS.kdUj.Bp0W
 AY6nh6OvyKAjxlQ.2IRf5tKQfcjJ50W.aLzkN1kEpbeXq2Z4PIQNfZkptn.i3CKIVjLujjFBABlV
 M0w3ghJAEa3u23PJgD0wDQKbbiaNFU1QXAwrs.BYkmh6D0jifalVCM_WbTtpb7Ra8furNaqQOcSP
 GZiNleg8VV0zDIw31sbxEuZIBthuD_SFDg8rbmB9cxHnNtv6_SWEveSB2aPbtlXkgjlzl1vSRle.
 JWviaUth54TokfZxdCrSZJjLwQ6ZWL0bPew52u7kr7BnVLGJzhmL0cPpGqfq.1Q5zkgDZXEMMFTL
 3YqPcL0UAUK5fOHe9iYPrpai87KwDDQ2409brslzoiPjn5DfpNuENZTn2j0DoJMsWEt0jWuoV.q2
 Wmr5UtJroVP_Err7_z26gsB9RfMtLSkBp_sFPiOvyaVo3qnUbu4qy4PLlOk23eRd.JeW3sZes1.p
 ce.BipEVUA3nix4Nkkr3c0i2tMZDpSGfKGA1iU0quH.QkWWIuOR0JowVDp_TzdS.vuaq0TsOW24r
 OgAVsy34SHgPwqhAzc_XOXhHxYNxiRz8u1DDrZPNHsZAOkrbu5WY3zCwoAZQKKjXEN5mF09y5IQS
 Vwbf3_gzwcXJFlFXkq7NM.SVZD6E4BcfEuyKYqUEhYaXIbq1yyT6cU0wjj5KUr8EXGm79dCrskkY
 t3NZcfWfQEy4htDw-
X-Sonic-MF: <djod4556@yahoo.fr>
X-Sonic-ID: 43050082-5f35-4332-9a6d-ca4bc43ce47c
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ir2.yahoo.com with HTTP; Thu, 25 May 2023 08:18:34 +0000
Received: by hermes--production-ir2-7867f454fc-mmctx (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID cb21648fbd03db302820c83f262edb83; 
 Thu, 25 May 2023 08:18:30 +0000 (UTC)
From: Damien Dejean <djod4556@yahoo.fr>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Message-Id: <9F91C657-9AF2-45D7-86E5-D2472F1CE0AD@yahoo.fr>
Date: Thu, 25 May 2023 17:18:19 +0900
To: nouveau@lists.freedesktop.org
X-Mailer: Apple Mail (2.3731.500.231)
References: <9F91C657-9AF2-45D7-86E5-D2472F1CE0AD.ref@yahoo.fr>
Subject: [Nouveau] Nouveau with G98: console mixed up
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

Hello nouveau team!

I installed Debian 11 on an old laptop with a Geforce 9300M graphics =
card. The system starts but as soon as the session manager starts, the =
display is black.
If I start in =E2=80=9Crecovery mode=E2=80=9D, ie without display =
manager but only a shell, the console gets completely mixed up. I can =
see something is printed on the screen (I see pixel lines, and even the =
colour of some systems traces), but the pixel lines are not aligned and =
the content is not readable.

I also tried to set nouveau.modeset=3D0 on the kernel command line to =
boot with a console working, I can get a shell but I don=E2=80=99t know =
what else to do to debug the situation.

Do you have any advices on parameters I should give to the driver, or to =
the system to make it works ? Since I can see pixels draw on the screen =
I guess we=E2=80=99re not far from something working but =E2=80=A6

Thanks,
Damien=
