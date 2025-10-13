Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4154BD6A21
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 00:37:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1AD710E0D3;
	Mon, 13 Oct 2025 22:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="E57shRi0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic310-25.consmr.mail.ne1.yahoo.com
 (sonic310-25.consmr.mail.ne1.yahoo.com [66.163.186.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C78210E0D3
 for <nouveau@lists.freedesktop.org>; Mon, 13 Oct 2025 22:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1760395058; bh=0HfDf/Sl+8lEc6G4W7nYh/m62hACpXOoW+uGVV25yXg=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=E57shRi0Kxe+XxB9ZnberEIWvd7h2XBMxSkfV4QAHItkB/HgUN2jjkYXvfeUFHKJjuPWE0HMRS+nt+LZs73kl2UbVh4vPIDo0VkLTJ9hzZd19vz0nMeIawrVIZgJJuV3yr0CHZvpL6XhMcR+NJzNSzVyhPb7zWiS7Mka5UvR0KRZVqWRDVPuSv71QB5ozvxAJzWsuBQRdh+nS6x76SAHExJ7MvSzVitTqDfAnXjRP0ejXEjyd7YRrhkhGSERVrIw06ypRD2zNoR9cxnKR0Cyn77X91zjqOMf/XT8ycvaVAkp1kBSO7MI+Q6MuTcF5EFCzGHuhxORa4Q7MaILWkNRgQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760395058; bh=2dH7HhGz1aAli47ES/XYR1W2N9W5JKBA0vM1JWzP+gs=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=XGMyvZCZCBM8z+6yT0Ww2LQ3Q0mKzcEnm+yCNn2X1LnAzu2Js+oCed4C6C3T+yiDxKvvG/DGqScpj1c2bRC6b2eW7Zl5s7I+PIgyeTwBEbpoFnqG0D+tquULRHjsTpjoD/TZDMXSEVac2/3pIdFvioU8dY/uDdpCSngVk8psVYPbkCoA1XAVIR2urZWEAQ27BqdLZRhmhYTPZnMEnguwduK1430cT83JvDhwmt3P9m9d1BEmp63F4oIlWqO1gZEVGKA3qRR25GHpScTQO/gGJrZ59ptXdOmEfR0cW5CWbCtuQYGbSEuIburjSFGJHJPrsQLhWf7gpxGVo+1oXD7thw==
X-YMail-OSG: FDboi5wVM1lH4GZf3x5zalqe9wy2rs6JVxngdZF4QCsd..C3g3S26SbC0tkgmNB
 T69VJY33eVWHNaY8PA6JvlodDxQgMh8Uq4KkV7BoJwpp6LMxhABv2OECYAL70ab8FjDDroGxlQtH
 a0ERmKT4rIcLST54d60uylA_wO0nHt0B.q9Fn5MdGoNXIyCk1Q1Ym5GvMjvRrPvOmeCcNO5T5nlA
 5QuNbqmR3kpKDRZFP4OsYALEweTa1T9cpOpyFSBPZkn17gMet_zODBiB1WCc3bfwN7KKGg8jX7Rd
 k9x0MBx9nPTx2W.IHGsa0NzOgffXoOk3rPKjNbvgaW49vbOLuL3N.IL8JIJpXtR29H7YFLfTZ91o
 ga_fqZ08BDtQnXxHhtpkpq32Gjx0nsi.O6MLZteteKltU7Cycq0OcnmcnZ.bwqJvjLiNqzzikUGB
 HsHjFCLTxoLeQsaPhXVMU5qEeKpINkx8pa7nhWEM5S30ASnE8cPkN3IhLOlLvYL74mZPJqVFoSW.
 wYxcDBoYgO4.qbx5zRZ4_0YrgDwpoEdwQpzsl6L5PAnEY4BiRUH7znN3zE3W5tEwRRgFzx6FiFF6
 4CtcVdi6Sy2.uZSdmiYWuvGNAOyOkye2Wn2pDstxNTZqppI1o4Jv8jNmGnQBFLYzXfzDpbgNTdrT
 ondOomat_q6_QagWu8vAbEq4rDO89_61Ixt8nxIXeBs0onzDCo_pz9sfXrPFieb0Q0jQNALT1A04
 g3rKcSxzZyoXAL.zZsgpdWF._ajN9TlmUtlyD3SNfOLCYIRSa2AWD9Tbp5Icrvz7yUcxtTw6YxJq
 wPEvo8IMeQ2lyeNb81_a8OLhtBWakZVXms06u3qNZLWwzXheYrs1vtHg8ucGCHJYcwX7Xg_nUnzY
 6oBHJJpdnt2o.ppKo26..dDwchDuBj5D0gZq2F4Hr7r0CTchM_SzPcc7.B_IVhBn2c3g6SpI7P0T
 mXyPXehZhuVoovPzK6YrhaODfwjaAeqlouIhq9Z2_LjgSQHuOXC0NmfpSaVNCiDoNpHkLunY94fX
 .5ENpTU_x4_KFR.Z7nTF5HVm54SA.GKmDvvvzqOD50uH_7EGcoq11Y2dH36JvL0w0wlBzlpEqhOo
 nrM3HmfoPavcf9riuvAOX5CWkVgIbaos4d7W61.yj1Z8URfjpkgJo2NfCRmQ51hCXWxzCOOtCxyO
 K8PFcbM3Ur.T3N0nv0VLNulLBjuWxBSmaKnAxDgrUsmSDKDTmCAWYLUTRnjd7u0Wm_dXNCetEFlp
 xIzXaMjPb3BDNSNNSKUyuh7Vk5mGf2Ih7.2iioNlU8y66Gy9P5NFMxPxPxYYA00PrC0ydWQ768GU
 KSqegeZd7Y.aAI4JfIRO8Ohs9T0dlNyeoc7NunBzKlDZXd6qSeoGND3IA2.UEdOxCLvmFvQJ4.lg
 A1kg9v5n5RrRR2mRY.Iieoo79eRovoBoZ_5JcVSU2lWccCTWf.a6byu0kPKKQAFTLUPBkqP1hOPI
 _aTAr7Uo88vOrQVisvR2rX3PZg8tBV.wORooZxw2235f9Opu3qu61crFRZikE73OmViTfmW4aR.L
 e6Nf4_sbzPR7mBnbWcsm.h.rOD8gbVbbWG6X4cWTPwrnNvGclLLKBocLVSbc87ns6djpgiqTc1Z.
 A42cE.rZNfjpxj4sKwyzV5ztkxwr3u3K.z9CcD0MkL8TN8eLIglbdYSzZe2DSQZ00fhYJ4914WX3
 yeoY2WU_3Nq6im1qQhAQjMaYxCc3bDnzDonpF7dcQysGdMLCGTv5H4ir_X88d9pmdZ2S9nebfmg0
 NQVNo75JJ4CbjzUnCX927qD18hwCdmCUG97ViCildfTmWK8S5lPpFjP_lU7i1_SX6H29o_t9xv5d
 FrdBVgT7h8KsBmTwiItE4EReR.r774eICl9ulJZiM1jjF4m7d5UeBUmwLLqBArsYdRU0zqg.6VqZ
 Hi7wuuguMjk3Jkwoi3qRN2rQtChMolFrlcMzTcK3X1lZGYtf7vxrm12HiXp7eLUgLGm4.Yl4fJZU
 lZSVgIpsajxY7BtNsaJQs0b1W64M6OTA5_q802oPK_AqZ_mLh1n5LqdDIoGEOFsCBE9l3R9jdZz5
 h4tsssoAvwHTBH7.geS1uwsDF8cUTXF.IaHIJuZ3rUsZRBA5aTsTmi_Cd9UyAxJACUXqyP_lmwg4
 At0FMvc_T2GGGGOO3TEj7VWsvC.YyauPd7mTiZemZGbmnl3xPH_uTc_lv6STPn.RptNqUiw_u4.K
 tnGSmO7IAHic9nFktITmlsKsy_5KzzDNmTOlkCZJVD6tHFTUT2czCJ.OwVwBhellL8l742966BJ5
 lcLdivsa3VhWpkZdyisnn3IhbFTNX4CYXSit2ba.wSBY-
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 0392e208-b364-42d8-8965-5b33ecd53d07
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.ne1.yahoo.com with HTTP; Mon, 13 Oct 2025 22:37:38 +0000
Received: by hermes--production-bf1-565465579b-69p8l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ee1871ff4eb270e645c795535edeed4d; 
 Mon, 13 Oct 2025 22:37:36 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH v2 0/2] drm/nouveau: add and implement missing DCB connector
 values
Date: Mon, 13 Oct 2025 18:18:11 -0400
Message-ID: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
References: <20251013222424.12613-3-lxrmrz732.ref@rocketmail.com>
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
[drm/nouveau/nouveau_connector.c] line 1353 that determined connector types using
encoder bits, but they have since been left entirely unhandled after the refactor due to
the aforementioned kernel warning causing that path to never be taken in my testing:

nv_connector->type is generally 0x0 (DCB_CONNECTOR_VGA) in the case of an unknown
connector because the WARN_ON macro in the nvkm_uconn_new function in
[drm/nouveau/nvkm/engine/disp/uconn.c] causes the function to bail out before
a suitable connector value is chosen; it seems like the value is left undefined.

This patch set implements the missing DCB connector values per NVIDIA spec to fix the
root cause of the warning and changes the WARN_ON macro in uconn.c to a printk message
to more gracefully handle unknown connector types.

This version includes better commit messages. My original submission was partially
blocked by a spam filter.

Alex Ramírez (2):
  drm/nouveau: add missing DCB connector types
  drm/nouveau: implement missing DCB connector types; gracefully handle
    unknown connectors

 .../nouveau/include/nvkm/subdev/bios/conn.h   | 84 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 +++++++++++-----
 2 files changed, 116 insertions(+), 41 deletions(-)

-- 
2.51.0

