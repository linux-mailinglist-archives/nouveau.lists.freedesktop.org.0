Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8671C6F6B4E
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C4B10E3EB;
	Thu,  4 May 2023 12:31:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 3380 seconds by postgrey-1.36 at gabe;
 Sat, 14 Jan 2023 15:37:17 UTC
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4532410E09B;
 Sat, 14 Jan 2023 15:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1673710631; bh=KogKNHMpUirQdlYHqz97sT5yAlJfrB255+mRF0Ww8bI=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
 Content-Type;
 b=WhKmH88QZuUcXFo3HjMde/zVzqwzEh6WGsCf/7ISc1EGoxqaMOmgrmR+/OnaW4yJ0
 2z5GrkNWKzEImw7QXnC6xHjdZVZIwcK4zFP3j3UGgfVK/C2gS1PnDimqodML6Gx0cS
 R96SWyXIAGPLOITVdczzuqdNBWAu/hPH2Zg6NgrA=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Sat, 14 Jan 2023 16:37:11 +0100 (CET)
X-EA-Auth: HAkDNYaf/Qoz2wAnWHZlY7hQmL3lfRcwGOu8m6pRUI7ykY2CduksijrXj7BPIlfeLG6NIMfyJljLygQ5BUWPXRD0c8d5V8P5
Date: Sat, 14 Jan 2023 21:07:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <Y8LMIWe2vbFTp1rf@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:32 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/gr/gf100-: remove unnecessary
 semicolon
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Remove extra unnecessary semicolon. Issue identified using
semcolon.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..204516891ece 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -420,7 +420,7 @@ gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
 			return ret;
 	} else {
 		ret = nvkm_memory_map(gr->attrib_cb, 0, chan->vmm, chan->attrib_cb,
-				      &args, sizeof(args));;
+				      &args, sizeof(args));
 		if (ret)
 			return ret;
 	}
-- 
2.34.1



