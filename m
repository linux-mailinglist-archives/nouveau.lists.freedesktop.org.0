Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 242FBC11B5D
	for <lists+nouveau@lfdr.de>; Mon, 27 Oct 2025 23:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0660310E56F;
	Mon, 27 Oct 2025 22:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="FzKEpYkd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic312-24.consmr.mail.ne1.yahoo.com
 (sonic312-24.consmr.mail.ne1.yahoo.com [66.163.191.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBA310E56F
 for <nouveau@lists.freedesktop.org>; Mon, 27 Oct 2025 22:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1761604251; bh=X+kBOHdnlsxitkZ6Snvq33b14fZdbptOIzF91Gg0wZQ=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=FzKEpYkddvc/TWUcMMsca8Suyn2ILheETY02adnoFMbwvw7QDJDjyfcbx1tpRwIQA+I/GCYfFt5+Cuuvhdz1c/8w6S50ynRpQ33tNq4Ly/3mdbRH1R5vwWhfpAJgVj/uScR5kExj4L4l49ZbWdSGoBJ8Z6RXqtdn0zCbj5iKJ6u36qnyo9/C2kNAv1wQVvePcOAiz5TNcdYoxROE8OHxuT+aKsWeVTilv/ppeWPH8L+iP/cycahE7AZh8ShjKGleU/bCOSI6s4EPwOq2xlZPOLOq6mN/W3VJ3ruazVXuBejnSMI/5k4xYwbL5hiGRUt9XNf3T8XtqDUsw+Fu4zgT6Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1761604251; bh=wtovZh+YJ18lmJuXN4c48cvg/aBOr3ph69I81EJc7f6=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=UmvJXoVYe6kow1XfCgGiMOUrBA0m343QGgPn1Hv0gnEhylcEdbpXS2S30TYZufviKRR7dFSBlpaxiBPbLv6SEd5t4UpqtuZP53LuDV8c66Y2eb4Mkdpzp89lQy0HuVEElwd0Tm1TIw9z1fzrBn5D8G5mP0VWKUQsoyO40s97rsLd69ZJfSUs12GT9t0XgBUxsqPJdcCvBQahivN9Ee2jKWftexVZZUq0fhi9iF9jtbBiwgR8H73jrcWsdfuAjchrpZYjzNsUaNR1e8dxg6hH3JRnEGJrM5n5hj+4KF8XRiT/qXHTCZeV2ufaF1taAHQhfvjUqOuK/ZY2owAbzphNrQ==
X-YMail-OSG: ONa2zzEVM1l3LzMMH4qFOBqaCwdjCUJ8CSJi5ZU1F9oPH4pxuy8u_OAh15k3RBX
 obd0KoWLwUDUYINZzCLf9cJo8h96nUNi4GDwxKCsc4A4low.1Uzuon53.DAiNVjBs9L58j8I0tuC
 bpWEmaWeZ.MoI3c6.Y.mrSSVzJLXRmFFijy0VZ2cdaxmkh5As2uUoYjg1F_65z251GO68RGHc2Qj
 zby1QAKvKKEakTzsqFWGXZCTtcC1Nd8pMsyzI7G83MXVOD7RhFltMfTqZR2f0AQKRfqbMLJJxHO_
 UbHh_SbaK3Jx6eES4AfJYAwOnFTmVUJQ7jvY6S_ZkZPOHQ9gTMEKM8IPXNtgzRexSosEkrpkt1rH
 7AMXsJY4fMrkMPEqL0..OxXyoE_xE_FL6CeGkRdmkblwtqt7HfPN1oht39273uebrOZ5xy3q6pVP
 gN1M1ObRzCbBUHCHL.vINra9pkIWMd6PPofo6aEmPpnFLqxyT_mv4nVXHaC.Dy5IoUxpcG_khRza
 uiLZGNfRy4GKh0JfZVWcWNEwabFnod3OitbawJpg4rE56ZT9tjBAQMUyt_WIoC61Ws9QzrDbOLYo
 r_A_OgSdrhTyJkxIt1YCLnRWsztXqfOSYCmhSHZ2ky2oWDJQquo.P3hmB10OVAACtDktxWfn3bkR
 UlGivV2n5sb44thzrc9hjNbOdWQGsVrCdCh.01BkXV5HhzEbIDJCttYfb.GpcdeyHDLK2iIrqMYr
 rQ.Xlrl_M3q2rlzchpF4u3I08oIXx1G.SI8OeZ77ZHt5.mDHN7SDqnB7cftdhtliUJpdvYbTrtVl
 qW3IpIa.RqJT0dI7coCKiYcII_rcZpg_mLuQHUHpwBGLzyZPQlgpOcPMgYXrLF4FiXthGn9CySyq
 tti5EeP6rQLOvNfnWvjHt76mI._L.IEbSxcNjF1ZXIpIJqYNuzfEpvnaENChOZ0sul.gV8ECs9FA
 doOQy.tg1r3IlND4doLnQtUyOlpTptt1XiVtb1dC3qUUWBs4vsFCKkh.lyUJl6kBSW6Yor6sOITD
 EijU2OLopPkyTbgWNdB0NpItKX0cK4z2rybs.K5DTO.CSpJ8zrUWBeHgU9ruTP3XHqmQiO9dc4Tw
 mXlrdQB4CiPMIiDioRb8ihBQJyfUytr3yrjl8R85HhFoKuusGJ6BexKUB6PUyWee2BNZwmjE6elY
 H8pVx74NAQYF4yDyf8izM33JKcAIDyEKO6Nd.xzE_4lpS19VmPWUZdc9ZlSJzt405hubK_eMV2xy
 mLigJa.40OyLufaylcXD.JAcw3Yez39NNfi1oISvSFK2yrZx9RACaITGNyRhNcud43eAjO5D5aGJ
 YVQqDZTn.XuNF8amvxp8YcL_aY1nZyTz8iinCrVbm4YcguON8OfG8JInlwrovE.uONJkt7YOKoa_
 b4b_Dd1ikax7BZwRgpauECmGI_rTb8ru9DKcZvpp_5ZjB9qMi.niCimmNm8YNmM6v7BNch3ZYJdr
 vX0h3vU1wsDZ39jTVB70XnOUGrpmzgiveFt4bEtGEVy00kDwST6bi57Mc9UUcTJd5c35mwGDINcA
 6.PS1kmm8819uZSSL91iHEuJBEw6gHLCUs4LsXQPnSwVaazMQtnU7CWtjzatt3T.rCNSCYpcYxJp
 4lWZOrqYn_PH3MRvCU3I872Q24jVqsQGEf8x5UGHspiIWlgAU8H3.7goGddBsqfSf73x_jiL0bH1
 G.XlwoCYX2pAvpWlQlZUQHB_.uoNtAVai0iOvcAqCnKnCJz1VTEC832hCtzCetuBi25F_dlBezDx
 KpNRxPtsSSan4rJ4J.8MpcNzuZQMK1eSEzdwV7yBj_8tiubY71mjvD27vOsPjXmvXCcfX_Y7mEPA
 Ky1JwR3Rq53vLvyTPzHs6a.iQYZro.vdrZU5aa4zWXCINOVViv9VPn7NN5MWZh2qNKaDGTYACBSf
 YbQia1lvJU6su449LBEiVugc8fYk.DlgR_dVjDPtKS_u2AO0_nKKftgRi5u6hDLZNp23_ZTh5bVh
 Pco9x1eapqbxV3LTTBKj7vcvc2ZwKoN2exXbMyuWwueqO5yRL4vVzaVyU4Zx1HgzGxDWK6wAnVSr
 EVi51ywaFGTacC4djUv8wOhHxDjpWuxLu51zu9lDzNQ_bJW9GDp17X5_ehT5a.2RD.FoXm.qCf9z
 V.Y2_xxjcKcyrVgY3vchGHxgBNZz5iHGIATkzGMBHAHQTd6QXuFwMkMxb5vMxHBG5E86krnLFhgM
 m5XWYrhA5XqRHnOQaDCkUh5ZnqiiiE4UhjUapkY0_ID6bfAGt6Vk0i9HoeXhYv4.COXX_XIh9ZNu
 cIW0zidZCssd_CvQIrLIOI2dZp.unt0V2njJ3z8lFPQ--
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 1481a2ee-2a60-4430-bc76-4c1a9641a5e1
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ne1.yahoo.com with HTTP; Mon, 27 Oct 2025 22:30:51 +0000
Received: by hermes--production-bf1-748c868fb8-9kg9x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 328c229d3c2a6fd6baa7c259c79aefc2; 
 Mon, 27 Oct 2025 22:30:48 +0000 (UTC)
From: Alex Ramirez <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: lyude@redhat.com, dakr@kernel.org, Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 0/2] drm/nouveau: add and implement missing DCB connector
 values
Date: Mon, 27 Oct 2025 18:24:29 -0400
Message-ID: <20251027222934.13711-2-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20251027222934.13711-2-lxrmrz732.ref@rocketmail.com>
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

uconn.c's handling of display connectors was refactored for Linux v6.5,
causing a regression that issues a warning on boot for GeForce 8600m GT (MacBookPro4,1)
and likely other legacy GPUs.

Several connector types used to be implicitly supported before v6.5 by a branch in
[drm/nouveau/nouveau_connector.c:1353] that determined connector types using encoder
bits, but these connectors have since been left entirely unhandled after the refactor
due to the aforementioned kernel warning causing that branch to never be taken.

nv_connector->type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of an unknown
connector because the WARN_ON macro in [drm/nouveau/nvkm/engine/disp/uconn.c:214]
causes nvkm_uconn_new to bail out before a suitable connector value is chosen;
it *seems* like the value is left undefined.

This patch set implements the missing DCB connector values per NVIDIA spec to fix the
root cause of the warning and changes the WARN_ON macro in uconn.c to a printk message
to more gracefully indicate unknown connector types, as was done pre-v6.5.

v2: Include better commit messages. My original submission was partially
blocked by a spam filter.

v3: Update NVIDIA documentation link according to Petr Vorel's suggestion.

Alex Ramirez (2):
  drm/nouveau: add missing DCB connector types
  drm/nouveau: implement missing DCB connector types; gracefully handle
    unknown connectors

 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
 2 files changed, 116 insertions(+), 41 deletions(-)

-- 
2.51.0

