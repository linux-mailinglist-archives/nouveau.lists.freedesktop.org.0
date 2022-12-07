Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C686F6B37
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507A710E3A7;
	Thu,  4 May 2023 12:31:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAA210E163
 for <nouveau@lists.freedesktop.org>; Wed,  7 Dec 2022 01:11:40 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4NRfPj5RfszvLm
 for <nouveau@lists.freedesktop.org>; Wed,  7 Dec 2022 09:11:37 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4NRfPR1YH3z4xD1n
 for <nouveau@lists.freedesktop.org>; Wed,  7 Dec 2022 09:11:23 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxus.zte.com.cn (FangMail) with ESMTPS id 4NRfPM5W7Pz9tyD6
 for <nouveau@lists.freedesktop.org>; Wed,  7 Dec 2022 09:11:19 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NRfPH1mPfz5BNRf;
 Wed,  7 Dec 2022 09:11:15 +0800 (CST)
Received: from szxlzmapp06.zte.com.cn ([10.5.230.252])
 by mse-fl1.zte.com.cn with SMTP id 2B71B7sg055208;
 Wed, 7 Dec 2022 09:11:07 +0800 (+08)
 (envelope-from yang.yang29@zte.com.cn)
Received: from mapi (szxlzmapp02[null]) by mapi (Zmail) with MAPI id mid14;
 Wed, 7 Dec 2022 09:11:08 +0800 (CST)
Date: Wed, 7 Dec 2022 09:11:08 +0800 (CST)
X-Zmail-TransId: 2b04638fe82cffffffffe2d7a552
X-Mailer: Zmail v1.0
Message-ID: <202212070911086649831@zte.com.cn>
Mime-Version: 1.0
From: <yang.yang29@zte.com.cn>
To: <bskeggs@redhat.com>
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 2B71B7sg055208
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID
 638FE848.000 by FangMail milter!
X-FangMail-Envelope: 1670375497/4NRfPj5RfszvLm/638FE848.000/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<yang.yang29@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 638FE848.000/4NRfPj5RfszvLm
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:34 +0000
Subject: [Nouveau] =?utf-8?q?=5BPATCH_linux-next=5D_drm/nouveau/nvkm/core?=
 =?utf-8?q?/firmware=3A_replace_strncpy=28=29_with_strscpy=28=29?=
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yang.yang29@zte.com.cn, daniel@ffwll.ch,
 xu.panda@zte.com.cn
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Xu Panda <xu.panda@zte.com.cn>

The implementation of strscpy() is more robust and safer.
That's now the recommended way to copy NUL terminated strings.

Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
Signed-off-by: Yang Yang <yang.yang29@zte.com>
---
 drivers/gpu/drm/nouveau/nvkm/core/firmware.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
index fcf2a002f6cb..5554f907e0d4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/firmware.c
@@ -79,8 +79,7 @@ nvkm_firmware_get(const struct nvkm_subdev *subdev, const char *fwname, int ver,
 	int i;

 	/* Convert device name to lowercase */
-	strncpy(cname, device->chip->name, sizeof(cname));
-	cname[sizeof(cname) - 1] = '\0';
+	strscpy(cname, device->chip->name, sizeof(cname));
 	i = strlen(cname);
 	while (i) {
 		--i;
-- 
2.15.2
