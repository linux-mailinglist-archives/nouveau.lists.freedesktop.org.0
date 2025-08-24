Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C55CB448D1
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 23:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C87610EAF1;
	Thu,  4 Sep 2025 21:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="h+g9r8ei";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic315-20.consmr.mail.ne1.yahoo.com
 (sonic315-20.consmr.mail.ne1.yahoo.com [66.163.190.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C61810E209
 for <nouveau@lists.freedesktop.org>; Sun, 24 Aug 2025 18:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1756059932; bh=riuMY4w7cvKfr8QnlJhyF/8TF+qHU/ywBh9+rVEu/4U=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=h+g9r8eiyl0d785OI4GFYtwnd5GPg7N8Zq+6z6HTcsnbRydDtmWenh8rFp13sqAUvNpQIt/iP3U2NpwI+EpTcyQZG8Xk56wuhDbLUbz9CAkGJvXOgoOxe2nVimB8kvm5Om4dxRd54Moxj0EMon4nJJlfkaD3Ru5lVHFPh/xazuWq+yU6QbZM/9+D15bproZKVMFRG3gF8KBuNTT9qaMObffm3hsa6Qz0LSoqavfffVvz8TMQGBtI0NBFgHtHtr7xjMimcsgphyJMH3Tw1bpOgxD1QQQ0ea6jsQDcYpaUmu9QcLIaUcPfpGaCRpDjl/ygMQlCsE8+gxGiJ+k1zgY3Iw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1756059932; bh=HflnqLOwIrwod5MpkAIbPL9MTT1R6xpVMKMAhTMn3Wm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=GEqJbG9DNj/+hxvFxt8kqj1CFbuuj+ZqrpHXTQBl62+Md5eOQfz5EpS6Nhf+/Sf0YGVSCEw/6D6Fy0mzrbK8oiL1AqMpCAqqcoOvvrLMudMw+KpgpudURZKBc9JA+z7MF+E0zCbTkm3vHFBzftwOlZEsyWukHk9NDeFl2eW0dvy4TA0rrtTGna9nZ7UzkmG22b4wrWyygyuAz5FDOYmVDPRwAEk09Gav5g6whLs/cNcXFqoDRpqjfGq3Izi2Ib0m4QyaVeEZBqZ5GuX5vjAnoQdra65avZuns8PimuBKTtA4AE1BXZJ05YylvG1KGFdpZkeuzRgWhbsS4Gm1BvANrA==
X-YMail-OSG: kVzDG_AVM1lEDYW.FGytvSohCDx94tb7CluJ.EaaKcvVMf5vLLRfr6B5VrLjxB4
 Fr4wq4Ug7TGzv7gNCIv4_0xlzDskSzcmEEz6kjMyrGkaHGl16X1IGYVygGwFMYcnIZ12pVkXdj8S
 3uKeVtTKUNwG9ftPLhmvvt9QsBWx._rvyglSSVa0ci8iJAzJjRLz1p9yuT9u8mFjHpwCgntHC9oJ
 1bG2gdHXvzpWHyzKS7TdzXaqZWtSDDgQQ5I.bOs4vEE.JeUnGX.3hyQ0k0.r0Pcu3S6nMjz2t1XN
 krVYCKCkLu.Vx_hZAdWYk8CeMGoac9C.xJvvN4G1TItMwcZMkv3Wo5_nXY7_oBSXDe_aL3OFLmih
 YUPPyMGrXjxsBrrbBa2RIUdZreqBg2Lc_PaU7UCG3stCoxE1Rew5a7tQdfyJnRZFeuwpULsRr.Uj
 EhdHfFTma4YBlCp8ozwV35EIlG0PNQYO8qdTYmTAKg8km9kTrDvmilZfxrqm2gKgAJeoCN6lXMnW
 Q.CVKEQ9EypLtqJ35s6oES.4ndEi4.fTp9dRtVwdOJSC3dcvzm8LQUBjjy.hKAAvNGi6rE6dI_kS
 CsUFPDjAaSyiA91L2cRHkLhZxdN1zChu.1hcqU_0Zmu4N2YrXQ7dRmDRdeO8E3KVIuZYeKck9qsy
 HwQKLStsjaC6S.atUj89GuVZAp.hzLSB.IFrQjbtrISyqm3EiB7o0_FDJbSqet9GO0GtylYmP9S7
 V5sAP5hwCRmq0d7D7G91QP4X6aKDCqUS_IZDJLh674c4wIw5zedsiPSFjQMhcDBpNAsyCNzaKybv
 lX5XTGYL24vJMSdCUZ3eo5wTiKfkyeGhB8gcxDMySAqGK0v3IPOSl39EydUaujTFsLU48GORADwD
 SFb6BU_fYb8b8Ak1GV_j56zbqSIL1cOSj5IrLuFCr6TqlHWz1YhFRKb64WLj47AC967ESkNeQvTe
 d9gnavL.PtU6dpc4MGhdOEdCyraU05JuaAXUkbSrBbRK8gvVqmrcNPlNXY2yO.tBZGu_xgZMl5NB
 5JhV7oVLQjDv3Kv9NIXRmhQOT5R2FkL0tvoLzv.fNd3aCOj1I6jbNYDC9D4fMEJlYS5ibY1_1MY2
 EOMEpU8pxAFcqL.YXU9dX39x_LMQRQu0yF29eArXaYKau9H2tGeyB9YPSV8PoT3S_4IjNcGjN00P
 9iSbqGmS_lKLan7PNIBajxyB4iuFqoXkTHmAW_yFjMpeXI.0vHdS_psEJNRA5Su87TBzvAzJBt5J
 CWz9NDN.NJY7Ik.8c2BlrFFYJFft8Z6sysb4.Ob3yOQk8Q0luuhVuk.O5l03whp9PUD0j3vnEfSE
 XSsadnp.S1wi8E1hShv8WtWQDLSkXdO9kG3RPLCOk8QRxXzidlCHoq3yi0ILyNTk4XJ6MsuWnUCO
 SXs3YXmhFGdZH7_jxuUmUdxisucXu9Ye9qf8K90tycocLYyrtm.ECuE5ZbgeRNiB9wJBYAKHZHb4
 Qch37NdUqjvjv0utNvgW9JvjAoZk3sfoXxkk5iigU8o1jWkqyE8m5GcCVjhsDz70NyHCSVApW5jr
 rHskHTguTaCs_rvW0p2GRK0WjaRYLNuaKPk.Lv62Hz9nsV9eCdV0AbJcXiOC7YtG2sMycgyM6WDH
 yhyjc2aDaj3t6tUm1sWI6Vzshifmkgig6yQ2qMQiKNut_MTQQHMtR5qWqSG.haPkPwIwmgJ8Rif0
 MNRkEu1Uj3sLU9zacQd6x70LWA.ZjYmY3ZApe6eWr9kJJ.gjSY6MnTtQAUtm.9ca6QdaTaTjVxX.
 q7uPtoz1b45nk1hhx75LH0b7BWdrzJDHF6WqsPNKq4m4GZpmlCdcEcD1ag4o1xUQBN11fxDT4kVd
 LmarxGyPmspZNI9G_W07f1upGFYK7mhhtWsdXtiISQeixcU_hkqR4NhiqjUbjseQHKtCo_YoKmNz
 jcsJRlzn8vXt2b.A0Tb3a7XEtNMiU0LyRe5yjP3KwzeA3rp8xFVg2sAwQzL8HFwlyfOqTu8SDu8.
 gjhY7HCO.naLxusuYau4MbMYpqxA8Vpmru.Mv_OoyuPPEUNitfIjTNKkBkRDOhee5U4cChBWe.rA
 RKom9N2wZBDwtu9wzkzzgCuoDBr7ez6QnsL5cCpPE_ECn6vSdT5H3FK5_0Y5izTw4QZSlh20jPWV
 KEn4f6RPzajqfkdwz0MAEHhDI2inZys_ll3E5yedwvpqAEOJXL0YWzLZZ62brlQG_CxKJ2MjIksZ
 AQmN80wPTqDhkgz70uLAn.cUKOVvyaIrD5nut7Gjeazqjzf427Yb85pEj74qTIjqY1Nse6UlGcU7
 w2LKXBs.BEs92I7j7UJR38hf_4eF6XFMgyqvP
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: fe19be37-8c48-47b7-8c7b-d5cd093ba0b5
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.ne1.yahoo.com with HTTP; Sun, 24 Aug 2025 18:25:32 +0000
Received: by hermes--production-bf1-689c4795f-hxt8q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b3624d997c049b6cbbd96c0e621a8e66; 
 Sun, 24 Aug 2025 18:25:30 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH 0/2] drm/nouveau: add and implement missing DCB connector
 values
Date: Sun, 24 Aug 2025 14:07:26 -0400
Message-ID: <20250824182520.13655-1-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20250824182520.13655-1-lxrmrz732.ref@rocketmail.com>
X-Mailman-Approved-At: Thu, 04 Sep 2025 21:49:39 +0000
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
causing a regression that issues a warning on boot for 8600m GT (MacBookPro4,1)
and likely other legacy GPUs.

Implement the missing DCB connector values per NVIDIA spec, and change the WARN_ON macro
to a printk message to more gracefully handle unknown connector types without issuing a warning.

Alex Ramírez (2):
  drm/nouveau: add missing DCB connector types
  drm/nouveau: implement missing DCB connector types

 .../nouveau/include/nvkm/subdev/bios/conn.h   | 85 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
 2 files changed, 117 insertions(+), 41 deletions(-)

-- 
2.51.0

