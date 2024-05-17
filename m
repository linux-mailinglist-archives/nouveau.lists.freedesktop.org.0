Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF02CBAB54
	for <lists+nouveau@lfdr.de>; Sat, 13 Dec 2025 13:42:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F0110EAD7;
	Sat, 13 Dec 2025 12:41:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ktbVIyFr";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1302 seconds by postgrey-1.36 at gabe;
 Fri, 17 May 2024 23:48:03 UTC
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5752F10E197
 for <nouveau@lists.freedesktop.org>; Fri, 17 May 2024 23:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=0u7kgikaSLk5ESRxVAP69RMWkPZcQroGJaOi2Fac3E0=; b=ktbVIyFr59LYhMyF
 huNk9ziHrp5E1T2NhImL1k6eAb2IDhny9GEIZ9d3XH5OSI1GTmPiHY9su17XEhP6dH/5SZjqrVr/F
 8VRNTOZzi94GrGuhzz6ONO6BYlsNqdoqZ3FiMmYv1wMPu9SgFcYNEYnwBSToQ9cLBsWyPUfcC2gfj
 99Ly5tyCC0hMWz1vzQz1WI6wQcIZqCCOA7jnao/pNFZjd7PjvwsQFcu1SqHh7rIxfxO/wrhZK260D
 B6ltUBU80q3NL6XmBWHAmFQpGQRRiOSgzRULeGgZtAz5bA2dZItp76/3vCm2iOcsBNkQbX3tmoeS1
 9+wprLqvXCyjnQykqA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s86xu-001Til-1z;
 Fri, 17 May 2024 23:26:19 +0000
From: linux@treblig.org
To: kherbst@redhat.com,
	lyude@redhat.com
Cc: daniel@ffwll.ch, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/6] drm/nouveau: remove unused struct 'init_exec'
Date: Sat, 18 May 2024 00:26:17 +0100
Message-ID: <20240517232617.230767-1-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 13 Dec 2025 12:40:46 +0000
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'init_exec' is unused since
commit cb75d97e9c77 ("drm/nouveau: implement devinit subdev, and new
init table parser")
Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 79cfab53f80e..8c3c1f1e01c5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -43,11 +43,6 @@
 #define BIOSLOG(sip, fmt, arg...) NV_DEBUG(sip->dev, fmt, ##arg)
 #define LOG_OLD_VALUE(x)
 
-struct init_exec {
-	bool execute;
-	bool repeat;
-};
-
 static bool nv_cksum(const uint8_t *data, unsigned int length)
 {
 	/*
-- 
2.45.1

