Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDEE12B2F9
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EC216E1BB;
	Fri, 27 Dec 2019 08:14:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B4966E987;
 Wed,  9 Oct 2019 11:58:58 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iIAcG-0004o4-NP; Wed, 09 Oct 2019 12:58:52 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iIAcG-0004Cy-09; Wed, 09 Oct 2019 12:58:52 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Wed,  9 Oct 2019 12:58:32 +0100
Message-Id: <20191009115832.16130-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:30 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/core/client: make nvkm_uclient_sclass
 static
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
 dri-devel@lists.freedesktop.org, Ben Dooks <ben.dooks@codethink.co.uk>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The nvkm_uclient_sclass object is not used outside the file
it is defined in, so make it static to avoid the following
sparse warning:

drivers/gpu/drm/nouveau/nvkm/core/client.c:64:1: warning: symbol 'nvkm_uclient_sclass' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nvkm/core/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index ac671202919e..0c8c55c73b12 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -60,7 +60,7 @@ nvkm_uclient_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 	return 0;
 }
 
-const struct nvkm_sclass
+static const struct nvkm_sclass
 nvkm_uclient_sclass = {
 	.oclass = NVIF_CLASS_CLIENT,
 	.minver = 0,
-- 
2.23.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
