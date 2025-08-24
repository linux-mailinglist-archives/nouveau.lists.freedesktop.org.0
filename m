Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4875BB448CF
	for <lists+nouveau@lfdr.de>; Thu,  4 Sep 2025 23:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4AE10EAEE;
	Thu,  4 Sep 2025 21:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="Mj0sxzOy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic307-9.consmr.mail.ne1.yahoo.com
 (sonic307-9.consmr.mail.ne1.yahoo.com [66.163.190.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5975B10E209
 for <nouveau@lists.freedesktop.org>; Sun, 24 Aug 2025 18:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1756059935; bh=KWYZZau4oyHdDEJNHslsQqrBv8yqAqCddr9oiNT3h0Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Mj0sxzOyjXGV2jrPFaMqZv9a0jgkDljpTJ+CR6lvbOAO8S8Y3cCOAPQPkohEu6Sw95Kg/0B+3FwCWe0P1kJuvFmmF7F7Hd8MrEW0tZAryJTAJ8si30QiD8lHoQdo4q1Pebbqq12FRY7j+6aPAzXz/Zyprnb/W0ikMagqtcz8YLBDA8vZGNDUYfNHO4UP0TQDXhL9LNFF/YzGFgkDJ1m5NNz2bMA2VwKPCNZGQLBHHNZhAOn0wI9fKnlJJQPivKUXrLxaV4i1cZ6xMp2zLmeAzPOmEddO0PPKEDBMj1VvjzwSGX/R1Yp6OBNVGu2WAMo5MjfbEJ1DlrHOtvwz9DtQzw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1756059935; bh=n5V2FXZsWBXWXO7ORKabjIkBzMlSe46S+qf35xxRapv=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=SacuyQJu1lpy4/k2KzFb07+wUMwWJ0iEr03aCCZ6qstdPZTi3psItsB1trZDJaXZ5TTG9RZhGPAH57pv0VXgzfk5+L4/nqXEkYe/Bj15owOWYmItJTer1OY1erku1ytcIP7fwMUpUDyfGJYo6pnEWmvNLDQ8KjbPcMm0ugDdnIBs934WUFoP+WYbn0dT8ioWeLm1+v6xaAtTr2fNjp49AGBuAZIYatgITyy1P5EIVx5cr+/AVDBrs32XVOrBSqrtfBB0cyEd3Dy4yGlHmcoswyp4nD00YcpxBpFJ+bmLIArO4a0XQnJhnRU94eno4Zna+AkiZv6M3OlXqe/lZXJZ+A==
X-YMail-OSG: x7SVNY0VM1mA9IWEplSnhtBwD.eFmdw6ydSv7fiY5Bh5c3FOgA0lYkCnwRSWc9M
 0SfvHdcLhL48n79gk4Xr.OKK46_cDi93y.L_GVDAdXSyWRHQ7ehqYNE.wHJSZTCYDzzCGvbuKQGm
 pjvqZy_DU2SiCGMSxGnYYW42yen61TU.sxFWQNXb7N1Nlp7kZWNz92867oEh2ooRYS0FjOhTEcHw
 dizUvyqcJnvRQtSiqtc9nyGnzqatx6hK84D3ps45RuFJD3AldY5em5UfY69_fuwcKI07KOu8rV1J
 N8EKRjSVlNAQ_DMD3S.ukYtOOoSBgp76X4l2rjCRiqLX3rlDxPSkCjgihOhe5idnl9neGOuPkNGD
 B7cfzpy4cTG4gnB1JM5puDATTXouPcL6_hLOdakHutr5Ljeg.2d_yYCS_0.GRrrnTqgtGpqr4_Kd
 g2Z6ln8GEdRKFZQRM0d7fHTBTEEJ9A99OGmQ6alZ6.PSEMVM1fDpv6m.VhSbi93MboF84hHnPedQ
 XKZ3R4cJrNyBQbfSrIKLUn13TeuHJAK9TAcEItUgGKdYJetbo4iV8tFtGV1baD.ND9RjN4f4surp
 JQJARKRxT5bYBlB0M7f_E7DucoV9sUDPs8vIH9kGqk2Xyjqxko19wUvzSk6GxFJP2MjrhLkC0O.K
 uN2coXj4INaWOULuxKxFi.RGWlro6IIq6PrgA2nCYl4dvHnugRMPpvP5v5ZaaNutBvPB1LlsPuKg
 7.hxEWXuFSC4S_E_87dmxb.o0UkuzBjp9fMeNcKDJM7f2RBhpW2KQB5hVM8j5PMABSsS_Mc5WP53
 c9U23G1REP18jfPHWoH.HHsAa9JqBVB7v88Sckhy5ojH_6iqUqYQoQjXZXdciyoPOX._yRF3a4CX
 Dsrq.AjbR8uERt5oObvHaJ6tlDHeJ8zhSrMptYxPQbkAz36zt9SqL1z7QITfN_P0QIKg3RH4_Flj
 SEp_JaN3zZmrvuWQL9p33Mo6CaTfbllvJXvzLhIXybm7v1iUo..rfs7gdMpzpPJmvomQ0erv52B6
 tKbim9Xf3nWitkiqBoqkldj_.DzF_sv7Ztxx4xtYkgsZplbfwCi7ahg3nHfLpKXDF0U6Rw2GOs0q
 PZC6K61_GEGf.SKH7lnoW81VzvizbCeZNnHDhPQDaJZ4eygyxQhEdLDiDb11EXEI9LKB4i7rb_8d
 L9dSq9i.sB8.FmRJSg6ZxdwWoAGkuu_JvlkT2x1b_oESPPvgcqlHu_I2CM08LQwpPsY4QPh5Nrqt
 BZrH27eqv0T1ASr7n9gh7Izj7hSVy356n56FBXS93AjXNYbN9l9ub31aXvdP2CjsXipqIrMVU1yx
 UEWkAOoyVo9ziOCWy5dv22Q.apcuk5PekmfzoVqALjpNDA_Yq8lNd0uAutx8Yk6eKbDN0DGkGpiX
 bU_j.HdHA_4k4bg5O_Dxa8GlI2E.XQ.O8GhYWr3wTrw6g_RaJ5_q7AL16WuNS_LQ7RG3VmI9vjYX
 gzrpmkrZokPzPqeNfxiEJxAoCLokbxf0kMM8BJqhdBQOZqJAd.hVT308OoqLF8Wk_Q78GC2ERlX8
 F56jlcZkUncGFDdMgVRIJLXmI2VEfmI67jz5nN3GfhopOfENh5d55fzyxlnaNsuM0oRCgo661QoO
 H7UF6As0SvY4zZHIBPqC0AZFMwCakV.in_JmhHMyttKGLO7b8u_hlpKOMfqqWIRMlO_kdaxo6LsL
 nLKlGTwMggbeA2mWXaEd2_ucUXba8Hj_fwyoueJmmf03c3Rq9HT6ddfsX5tdh_qmvlttG8jFoYDA
 UTVz3eFYhtBNIDKBSQCAp.stV2teHjLkqG1NkiG1TlnhiX9GX3towl2uNcwluTIjRJhMOYsqGS1u
 SB97WT4VxsFQ6d.0_sLrozrqOE8UoojQj5kBcNYUe2oJ74c5FpqMJCsbzNRTi2IIbZGG9.24X5o5
 EL7cHGYQ31VKqDiGAvsr2jESowPV0EpPhXy8VQ6LAaC8BG6ozNrzYTwjKcIggkNixbrbPlMUL1Hq
 _bWEMqotDdiQeDd3ROorhn3qVm5xplOYIZDosgYBnBwmEgJ4Cs1dF_W_MHfu1QzDWkOOcgKjwVfu
 4wb8g0SCcL14o2vA7mTHcy.EIPbInVb9SP5.eMYYJSL4rCrMoZ.BEsnTl5QlGiW9XBZcu7lsiOhG
 bPQoEVrpy.Bn660pPkLksInD024uSCNL1dx0wqdCr3SGQn8tcCQ8ETmDmKEBCpPVoV27lcdS2FWj
 SPoKYExbO6pAaH40kRXAy62J_iaWSbP9x2IkOFqNQxsJ4EZKiAJI2ry6LC8.3S43qBqCwKw0JB35
 rWdgM2oqlxZuIAlBJnVyijHOYJhnx1kIW7u78NV58cAw-
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 38727054-3061-4ed4-a718-09839f4ce1e6
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Sun, 24 Aug 2025 18:25:35 +0000
Received: by hermes--production-bf1-689c4795f-hxt8q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID b3624d997c049b6cbbd96c0e621a8e66; 
 Sun, 24 Aug 2025 18:25:33 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH 2/2] drm/nouveau: implement missing DCB connector types
Date: Sun, 24 Aug 2025 14:07:28 -0400
Message-ID: <20250824182520.13655-3-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250824182520.13655-1-lxrmrz732@rocketmail.com>
References: <20250824182520.13655-1-lxrmrz732@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Implement missing DCB connectors in uconn.c.
Replace kernel WARN_ON macro with printk message to more gracefully signify
an unknown connector was encountered.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html
Signed-off-by: Alex Ramírez <lxrmrz732@rocketmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 ++++++++++++++-----
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..d1fed2beee63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -191,27 +191,60 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	spin_lock(&disp->client.lock);
 	if (!conn->object.func) {
 		switch (conn->info.type) {
-		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
-		case DCB_CONNECTOR_TV_0     :
-		case DCB_CONNECTOR_TV_1     :
-		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
-		case DCB_CONNECTOR_DMS59_0  :
-		case DCB_CONNECTOR_DMS59_1  :
-		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
-		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
-		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
-		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
-		case DCB_CONNECTOR_DMS59_DP0:
-		case DCB_CONNECTOR_DMS59_DP1:
-		case DCB_CONNECTOR_DP       :
-		case DCB_CONNECTOR_mDP      :
-		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
-		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
-		case DCB_CONNECTOR_HDMI_0   :
-		case DCB_CONNECTOR_HDMI_1   :
-		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+		/* VGA */
+		case DCB_CONNECTOR_DVI_A	:
+		case DCB_CONNECTOR_POD_VGA	:
+		case DCB_CONNECTOR_VGA		: args->v0.type = NVIF_CONN_V0_VGA; break;
+
+		/* TV */
+		case DCB_CONNECTOR_TV_0		:
+		case DCB_CONNECTOR_TV_1		:
+		case DCB_CONNECTOR_TV_2		:
+		case DCB_CONNECTOR_TV_SCART	:
+		case DCB_CONNECTOR_TV_SCART_D	:
+		case DCB_CONNECTOR_TV_DTERM	:
+		case DCB_CONNECTOR_POD_TV_3	:
+		case DCB_CONNECTOR_POD_TV_1	:
+		case DCB_CONNECTOR_POD_TV_0	:
+		case DCB_CONNECTOR_TV_3		: args->v0.type = NVIF_CONN_V0_TV; break;
+
+		/* DVI */
+		case DCB_CONNECTOR_DVI_I_TV_1	:
+		case DCB_CONNECTOR_DVI_I_TV_0	:
+		case DCB_CONNECTOR_DVI_I_TV_2	:
+		case DCB_CONNECTOR_DVI_ADC	:
+		case DCB_CONNECTOR_DMS59_0	:
+		case DCB_CONNECTOR_DMS59_1	:
+		case DCB_CONNECTOR_DVI_I	: args->v0.type = NVIF_CONN_V0_DVI_I; break;
+		case DCB_CONNECTOR_TMDS		:
+		case DCB_CONNECTOR_DVI_D	: args->v0.type = NVIF_CONN_V0_DVI_D; break;
+
+		/* LVDS */
+		case DCB_CONNECTOR_LVDS		: args->v0.type = NVIF_CONN_V0_LVDS; break;
+		case DCB_CONNECTOR_LVDS_SPWG	: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+
+		/* DP */
+		case DCB_CONNECTOR_DMS59_DP0	:
+		case DCB_CONNECTOR_DMS59_DP1	:
+		case DCB_CONNECTOR_DP		:
+		case DCB_CONNECTOR_mDP		:
+		case DCB_CONNECTOR_USB_C	: args->v0.type = NVIF_CONN_V0_DP; break;
+		case DCB_CONNECTOR_eDP		: args->v0.type = NVIF_CONN_V0_EDP; break;
+
+		/* HDMI */
+		case DCB_CONNECTOR_HDMI_0	:
+		case DCB_CONNECTOR_HDMI_1	:
+		case DCB_CONNECTOR_HDMI_C	: args->v0.type = NVIF_CONN_V0_HDMI; break;
+
+		/*
+		 * Dock & unused outputs.
+		 * BNC, SPDIF, WFD, and detached LVDS go here.
+		 */
 		default:
-			WARN_ON(1);
+			nvkm_warn(&(disp->engine.subdev),
+				  "unimplemented connector type 0x%02x\n",
+				  conn->info.type);
+			args->v0.type = NVIF_CONN_V0_VGA;
 			ret = -EINVAL;
 			break;
 		}
-- 
2.51.0

