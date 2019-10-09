Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583412B2BA
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:14:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D742E6E02F;
	Fri, 27 Dec 2019 08:13:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E16E247;
 Wed,  9 Oct 2019 13:15:33 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIBoN-0006s3-B8; Wed, 09 Oct 2019 14:15:27 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIBoM-00019G-PA; Wed, 09 Oct 2019 14:15:26 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Wed,  9 Oct 2019 14:15:25 +0100
Message-Id: <20191009131525.4352-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/falcon: make unexported objects static
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Make the msgqueue_0148cdec_acr_func and msgqueue_0148cdec_func
static to avoid the following sparse warnings:

drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c:230:1: warning: symbol 'msgqueue_0148cdec_acr_func' was not declared. Should it be static?
drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c:241:1: warning: symbol 'msgqueue_0148cdec_func' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
index 9424803b9ef4..dfc0d50f080b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/msgqueue_0148cdec.c
@@ -226,7 +226,7 @@ acr_boot_falcon(struct nvkm_msgqueue *priv, enum nvkm_secboot_falcon falcon)
 	return 0;
 }
 
-const struct nvkm_msgqueue_acr_func
+static const struct nvkm_msgqueue_acr_func
 msgqueue_0148cdec_acr_func = {
 	.boot_falcon = acr_boot_falcon,
 };
@@ -237,7 +237,7 @@ msgqueue_0148cdec_dtor(struct nvkm_msgqueue *queue)
 	kfree(msgqueue_0148cdec(queue));
 }
 
-const struct nvkm_msgqueue_func
+static const struct nvkm_msgqueue_func
 msgqueue_0148cdec_func = {
 	.init_func = &msgqueue_0148cdec_init_func,
 	.acr_func = &msgqueue_0148cdec_acr_func,
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
