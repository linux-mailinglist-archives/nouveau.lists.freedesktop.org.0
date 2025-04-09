Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5DA820CB
	for <lists+nouveau@lfdr.de>; Wed,  9 Apr 2025 11:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152610E03F;
	Wed,  9 Apr 2025 09:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NQjILLio";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCC510E03F
 for <nouveau@lists.freedesktop.org>; Wed,  9 Apr 2025 09:15:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EA2CAA48AB2;
 Wed,  9 Apr 2025 09:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D54C4CEE3;
 Wed,  9 Apr 2025 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744190114;
 bh=ZtSTmmrQf4eBTePGmz/rBiScMQFDVV+Tq3GtHruUWN0=;
 h=From:To:Cc:Subject:Date:From;
 b=NQjILLiogdKVo3228BuoAAfAPb8JdtSdAIQgGkjJmQ0xXN6cW19GP4Nqqwzkz4EbW
 Nm+48PRf+WEzxtvXdcQf6BQNPjewnFQ0hSC9Oua2EQaXzhy8YVBoR4nfntC2LHm5yq
 JhaFytFD6ymboQI5pD+hrEFrYHc2Ye+b8Hr0WIdIlXWFBB8j422DR8NYjDOIOUyFlw
 MaWwQVYErAfZiTnhyM+os556ZsWQpZutxRjvZpY56LiHBs0DudnMcndLdaCugjqvSQ
 B5XzJd5x4/0Z1WbbWe2GUlsvZM0M9W+ESSlWsEFgrCJelBDJw0vGqUD6M04ilXhOY/
 23MB5L1end5/Q==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: lists.freedesktop.org@freedesktop.org,
	nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] drm/nouveau: Remove forgotten TODO
Date: Wed,  9 Apr 2025 11:14:14 +0200
Message-ID: <20250409091413.94102-2-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
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

commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
format") introduced a TODO to nouveau_chan.h, stating that an
unspecified rework would take place in the "near future".

Almost 13 years have passed since this "near future", so it can be
safely assumed that the TODO is not needed anymore. Besides, its content
is useless anyways since it does not specify *what* should have been
done.

Remove the TODO.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 016f668c0bc1..3b73ec91c4ff 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -33,7 +33,6 @@ struct nouveau_channel {
 		u64 addr;
 	} push;
 
-	/* TODO: this will be reworked in the near future */
 	bool accel_done;
 	void *fence;
 	struct {
-- 
2.48.1

