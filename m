Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C44782EE54
	for <lists+nouveau@lfdr.de>; Tue, 16 Jan 2024 12:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D80F10E4E0;
	Tue, 16 Jan 2024 11:47:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052DD10E36C;
 Tue,  9 Jan 2024 06:24:36 +0000 (UTC)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxct.zte.com.cn (FangMail) with ESMTPS id 4T8LW2231tzW80;
 Tue,  9 Jan 2024 14:24:30 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mxde.zte.com.cn (FangMail) with ESMTPS id 4T8LW15MFSz6yMNs;
 Tue,  9 Jan 2024 14:24:29 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mxhk.zte.com.cn (FangMail) with ESMTPS id 4T8LVw5S1Vz4xPYn;
 Tue,  9 Jan 2024 14:24:24 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
 by mse-fl1.zte.com.cn with SMTP id 4096O92i032550;
 Tue, 9 Jan 2024 14:24:09 +0800 (+08)
 (envelope-from yang.guang5@zte.com.cn)
Received: from mapi (xaxapp02[null]) by mapi (Zmail) with MAPI id mid31;
 Tue, 9 Jan 2024 14:24:11 +0800 (CST)
Date: Tue, 9 Jan 2024 14:24:11 +0800 (CST)
X-Zmail-TransId: 2afa659ce68b109-9212b
X-Mailer: Zmail v1.0
Message-ID: <202401091424115185126@zte.com.cn>
Mime-Version: 1.0
From: <yang.guang5@zte.com.cn>
To: <kherbst@redhat.com>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHQgdjJdIGRybS9ub3V2ZWF1L2Rpc3A6IHN3aXRjaCB0byB1c2Uga21lbWR1cCgpIGhlbHBlcg==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 4096O92i032550
X-Fangmail-Gw-Spam-Type: 0
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 659CE69D.000/4T8LW2231tzW80
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:47:28 +0000
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
Cc: daniel@ffwll.ch, cgel.zte@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chen.haonan2@zte.com.cn, bskeggs@redhat.com,
 jiang.xuexin@zte.com.cn, nouveau@lists.freedesktop.org, keescook@chromium.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Chen Haonan <chen.haonan2@zte.com.cn>

Use kmemdup() helper instead of open-coding to
simplify the code.

Signed-off-by: Chen Haonan <chen.haonan2@zte.com.cn>
Reviewed-by: Yang Guang <yang.guang5@zte.com.cn>
---
 drivers/gpu/drm/nouveau/nvif/outp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 5d3190c05250..6daeb7f0b09b 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -452,13 +452,12 @@ nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
 	if (ret)
 		goto done;

-	*pedid = kmalloc(args->size, GFP_KERNEL);
+	*pedid = kmemdup(args->data, args->size, GFP_KERNEL);
 	if (!*pedid) {
 		ret = -ENOMEM;
 		goto done;
 	}

-	memcpy(*pedid, args->data, args->size);
 	ret = args->size;
 done:
 	kfree(args);
-- 
2.25.1
