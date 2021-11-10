Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A31FE44C494
	for <lists+nouveau@lfdr.de>; Wed, 10 Nov 2021 16:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62AF56E5C0;
	Wed, 10 Nov 2021 15:43:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 436 seconds by postgrey-1.36 at gabe;
 Wed, 10 Nov 2021 15:43:27 UTC
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net
 [IPv6:2001:888:0:108::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE326E5C0;
 Wed, 10 Nov 2021 15:43:27 +0000 (UTC)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id kpdtmnhYufwDFkpdwmGNJC; Wed, 10 Nov 2021 16:36:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1636558568; bh=NrFAd6gTK1M0/GxNmmd6zm9vZ7aW4ooi+FtTrxaGvEI=;
 h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=lScCajxMsO0j/cIEz+DTLWhy+Vzjao3dlX/r0jGSOLdsVrcFO7OSnmTPzWwu1A8Pa
 sNMG5DzArZILttBvo9rh+wTIo5BzmAkqeZy0hCueRZVbxz6fjDNcu3scwfMsyaOF3A
 Se1JoVnRAtliFUq/j2C5BiiUJngolOY5Cn6hztO0hahqBCKpPU10eQtjjjub0OwIl8
 uIBiWMfaDQ6LG64NMyTpB913CXRFRIPcVnm4tfRwkXXJFWTVoRENIpXy5vNMyz8HVd
 vLIAR5dd10ub7GRJI24YxaCciLY+Rfle0tZhd7zMgRFc9DDSGqCAn4wikLBDKKaC48
 kQrjllzSKmTMQ==
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <3d3bd0f7-c150-2479-9350-35d394ee772d@xs4all.nl>
Date: Wed, 10 Nov 2021 16:36:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfCsL2rJwLZOtW1/b0fOrIzVUm9crw8dPWC1CZb3Py06Fq/Ff7OATUe197uGcZJDu95Qrv+958pobDVxQFpQkB8vd9hsqadVC0oKXfXPYfpmMfhq0DxZl
 R05I8cOeHCt7crHhPGhFCUvrCjqxdN4n97Ei1vEVHCRXSXLr3AlCzTdXSmdbtZn/FXfVO4pqd9xD1HgPV/EfHSeMYQyx/oXTE2qyb638SE7csABSf3ggHF0D
 jgHr5weJje4RWPbgvh7GyypEC5xnQIXevrjwdTCjmXOejN/MMVI2W5NUWpv/b4wD
Subject: [Nouveau] [PATCH] drm/nouveau: hdmigv100.c: fix corrupted HDMI
 Vendor InfoFrame
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

gv100_hdmi_ctrl() writes vendor_infoframe.subpack0_high to 0x6f0110, and
then overwrites it with 0. Just drop the overwrite with 0, that's clearly
a mistake.

Because of this issue the HDMI VIC is 0 instead of 1 in the HDMI Vendor
InfoFrame when transmitting 4kp30.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Fixes: 290ffeafcc1a (drm/nouveau/disp/gv100: initial support)
---
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
index 6e3c450eaace..3ff49344abc7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/hdmigv100.c
@@ -62,7 +62,6 @@ gv100_hdmi_ctrl(struct nvkm_ior *ior, int head, bool enable, u8 max_ac_packet,
 		nvkm_wr32(device, 0x6f0108 + hdmi, vendor_infoframe.header);
 		nvkm_wr32(device, 0x6f010c + hdmi, vendor_infoframe.subpack0_low);
 		nvkm_wr32(device, 0x6f0110 + hdmi, vendor_infoframe.subpack0_high);
-		nvkm_wr32(device, 0x6f0110 + hdmi, 0x00000000);
 		nvkm_wr32(device, 0x6f0114 + hdmi, 0x00000000);
 		nvkm_wr32(device, 0x6f0118 + hdmi, 0x00000000);
 		nvkm_wr32(device, 0x6f011c + hdmi, 0x00000000);

