Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B716CBD6A33
	for <lists+nouveau@lfdr.de>; Tue, 14 Oct 2025 00:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4773410E502;
	Mon, 13 Oct 2025 22:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="Yl+4VohK";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from sonic309-21.consmr.mail.ne1.yahoo.com
 (sonic309-21.consmr.mail.ne1.yahoo.com [66.163.184.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A05410E502
 for <nouveau@lists.freedesktop.org>; Mon, 13 Oct 2025 22:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1760395095; bh=oQGXnG7NG2kpi4BHCEXp37PQGWyIahbV2A27KvAHuqc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Yl+4VohKXRl53sPY6xo2Nhy11jbcJl/LhBp1fOh5GEMLq5Ua4QFvXihDoci4Umg6lMllGQhsSFk1Gn+kY9ctCE2lMhhMGnC4cGMrrQbGRvwHzGs9WN041luO2eiABVn9R+7/iw7EuflplfSxESKdoc70fGDtW6Dtq8m4Qu5hFZ8CBIqphw7xxV7690p0+cSK4aNkN7WpfLYTheLVQ86DMMZN4GZQeQR6avAZWYcJu7Xe9xlQBpVhxHZd5JpCPZdUksaTn7k81wrs5ZyBLyhAHZP1KfNksTspTkGib11MhCDR8rYQ+TR7iC7XLqdoFho7LzeROubZALtLss/MsW2g7w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760395095; bh=hOqtrnhfVcSAKJhxuyvYWhb2toytWW7VrFh4SkeLXjw=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=pXDCt2JWBIC2OC0QGH8HMGC3G5rYELG2Q1/yvmg/tkKyS1OYJv8T6WdC+JZxxYc/2Ve4ef2BFmcNkt0BJ14O3y5NnIBKlABeksFpD5672J6OyU55v4V6EjffmAnPuKJCHjRFUrqDNrCFF+OI/RQAHVTdu5OH4Zsi+My6nsvevpRBJpt3QezBbwkDX+59Rz9kfcfY5+79lz7ZSJKNy8uczpUKYKqGgdGw6xw6vBsM5BH1Z/sK18/LVTe+PPZZOdLikkMadNFq/5bOQt9E3EznBT2b/nL7KqhCtEVj/9EF+Aw3P8S46cCJBXYQBn79+GsyUjnfCCTqeLWVHQwqbDdGuQ==
X-YMail-OSG: TGNpQNkVM1me3jHpVMSR01.I6OwdFcFdkKMZl.k0Bgs3jseMQ77KN2vMT5sF7NA
 r0OM6U5QwBFsEPvwnC6zyOANTzHKvMqxfbfHWnHR9PgImO9vFv0wRmzQof9bKPFWzoiQ_MLAYlVD
 5_8dolP81G9OpKQRqn.GFZgHre0Ox5O6UO04NICtzZzvuGgt8R3tLJ1YUonQdD6BcN.v5p_qQocZ
 c7EdOYO8z8G6Ob5w8MPQEwS1gWbVO9w1noa18pTvELh5YNom9770FtcHr.AseKiadDBCVpR02iEK
 ghMGEYRnAOxRyhwflETH8ginwbUEyiYegRfqsr4EczTzjr6KICF8wBfdRSuj4QGzOn6QKN8oMbMn
 tPLvstB7yy6EVi74yCeU.A_e1Tgb5y3ysgbyg40Q0UqaY9NaPiZQbhOJ9Vl_iH1HRZ3bKzi9wb2U
 iPWd5ffkeCpovUKEVkvP7pmBtTwYwh0D6mJZ9EkWeG2Tj42uSUPkXezJUgeRmw40Nco.8V_FSweS
 r5AOUD0p8Ch42HnLUE3ud5zGvf1ZALzsECMCAbAvyff__sIc._G9SRCndERGHcAf.M1fQPhrdleR
 ouEkapxWf2QQgIeHdO7vZ._YmPI9Ais..P61KT2K.Yp_fGSvtpkT093waVQd88NXr4xcEa9TRQVV
 cmj4ZPvAC9hbB_6Ykbah23q4X5K4l2VSlPsN8jO_KBwELaRliTwYmQO2BKWEwNJ8C2a6lwZNjfDs
 .lmMSv.Z6s.fKZqHYrq41YosU56h4.A1y8izvAP1FRcoTvb_.fsj6X4ssNqJ.wbwoA90.Lz9583.
 BnV.WL.AmSlR0P4VrE6tD5INCPN7tvcPHkpJ_J.T6gHlFldPiESXQXSKF0nHJ1FMyxt1gyIrTn95
 P00oZ4yBbf17P03u9dEmsj0Cy7U_qfx8DV17qHGztLY52w7J_wSbtcE8wOja9ixTVJu9VqVuEliU
 zl5i5sh2qCzkHdVd.qUrQkbKFFbpMeOX1.PWeZ12sRgwKGJ_NfY2Ru5JOr_JUekqSV.30G.V09J8
 e7Z6RmDWeskj8VHpVut2AS3cnd3ENh7zxVv2TVOBwoL9nPv2f3ov_3wzFHN9EqzjLNhIsnMDREth
 YjVf6d1S02x8FkSPZb6o1Ruu6Hxp7VtJlPJYPVcChAMmp3morukHqt19MGYKFmrWSrT14.XLHMq2
 jvH96duSVZfRKma.87JpQ6_X3v47mHRnl9hpyXpAinJmlolQsrm43P5H_XxqbJlZ0yio5OyhuDG0
 MX34OUcUD6iItfiMbXsQ5ZkxY_yzGg7s2ETJwPa2MjNAwpYT1S2S_B9vSLTWuBO4SlFVm6KFyxKi
 QszPNXtlLZh08qKWRXUVJrXsTFfkhIq0M0_z3AWylnH7ZG_.gYFJ4.dK3Sh1ZJZxmIoCj5t0zKHf
 X0J0LeCVu_aSh.XvUOXoMMsRWovhhwL1F4oD1K7eJ9UYbFkP0x6wV.p1RLcNDoN.T_VsDvu4Z5of
 reXfdJz.HcGV41sqvaizvnFdzDdHU9.WDBefTlIh.i7_L2HPtw6NDHBzafp8MlyTHWdV3Gz5x24v
 9tdWEOuSmkld_Xo6.E_SIgVrHyR4r2z3xSrNO9xW5naSZWgMyI7nk8veIEBlHxnkk7fsJclnYoXx
 wecYRVDTbIyqUKauyLx2sLFTI4JHtxk73d0p0npD.qp11wDU6z5W1EhKC__sWc6jzHwPiQvUi4Fy
 bEYL1jKscLIUFL.FUE3AUvuV3D0E4U4QQ6DKZbNTW4tyHkvMPkmdUFXi13ajAmLl6Iz7hEBuI61A
 GLgLsciTGM7ho3BMaAWXF._bto5UycbEJuMWID0PGpSe_d8XJF7SiuH8.f4Aqc8v__UKeGwnkARl
 TP4ED8sMh6xxjzbUaewi7WCUATUL4ExNOD8IxPWiWMYIE92ksliymINA_DjnVGy85r5NZ_XXbNzQ
 z6CDWB2NRD5AwyJi.HuVM7DhY5g9ydclg0gYhYexRwkhR76Haj85Msq1zlGf3n0UWSl7x573g2QI
 vzymVm0xMFTOEyjuU6bNoMNkdV8B_QsXjRBMwTLWhs8S9Z_bGOxm4KrW.c6irM0Sifjqwm78oqN6
 oX1mLwhQsi3cOQFrDzL3ozjN5NbvQVEW8gJ4fpcaSQOLZ9Pe22sBYzwC68_FJvNKpZ.kNdneVPD9
 qrMD81d2.C2BtoSoi6JaEi5mttAShq4cCWA3c2eAGqJlacTD2hjjrq.D6hqSSCTxmqa5Moah4znr
 BkuFM8pqUgDVoUPMA8gHb2NpZtJVnhiwFbTZslV8Ksnh5c9S9QBihv1lPMnfuQ0aS2.qzjfbIN90
 uDmXQOBicWyMjheZzchtU11Rd6_1Wtg.g4GnutoKbYFQw
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: bf860b4e-fd17-47c7-ac70-b44ff2632dbd
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Mon, 13 Oct 2025 22:38:15 +0000
Received: by hermes--production-bf1-565465579b-69p8l (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID ee1871ff4eb270e645c795535edeed4d; 
 Mon, 13 Oct 2025 22:38:12 +0000 (UTC)
From: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
To: nouveau@lists.freedesktop.org
Cc: =?UTF-8?q?Alex=20Ram=C3=ADrez?= <lxrmrz732@rocketmail.com>
Subject: [PATCH v2 2/2] drm/nouveau: implement missing DCB connector types;
 gracefully handle unknown connectors
Date: Mon, 13 Oct 2025 18:18:15 -0400
Message-ID: <20251013222424.12613-7-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
References: <20251013222424.12613-3-lxrmrz732@rocketmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

* Implement missing DCB connectors in uconn.c previously defined in conn.h.
* Replace kernel WARN_ON macro with printk message to more gracefully signify
  an unknown connector was encountered.

With this patch, unknown connectors are explicitly marked with value 0
(DCB_CONNECTOR_VGA) to match the tested current behavior. Although 0xff
(DCB_CONNECTOR_NONE) may be more suitable, I don't want to introduce a breaking change.

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

